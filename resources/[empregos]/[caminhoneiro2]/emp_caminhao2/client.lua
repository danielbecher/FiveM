local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
emP = Tunnel.getInterface("emp_caminhao2")
vSERVER = Tunnel.getInterface("vrp_garages")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = false
local random = 0
local modules = ""
local servico = false
local servehicle = nil
local CoordenadaX = -582.2
local CoordenadaY = 5317.74
local CoordenadaZ = 70.33
local CoordenadaX2 = 0.0
local CoordenadaY2 = 0.0
local CoordenadaZ2 = 0.0
-----------------------------------------------------------------------------------------------------------------------------------------
-- madeira
-----------------------------------------------------------------------------------------------------------------------------------------
local madeira = {
	[1] = { ['x'] = -148.35, ['y'] = -1039.01, ['z'] = 27.28 }, -- 10,00
	[2] = { ['x'] = 2701.74, ['y'] = 3450.62, ['z'] = 55.79 }, -- 6,99
	[3] = { ['x'] = 1203.52, ['y'] = -1309.33, ['z'] = 35.22 }, -- 11,83
	[4] = { ['x'] = 147.63, ['y'] = -2190.3, ['z'] = 6.0 }, -- 10,10
	[5] = { ['x'] = 3800.04, ['y'] = 4461.64, ['z'] = 4.96 }, -- 6,77
	[6] = { ['x'] = 1162.09, ['y'] = 2113.17, ['z'] = 55.68 }, -- 4,95
	[7] = { ['x'] = 1521.08, ['y'] = 1704.43, ['z'] = 110.12 }, -- 5,42
	[8] = { ['x'] = 353.78, ['y'] = 4444.14, ['z'] = 62.94 } -- 1,77
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- /pack | /entregar
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("cmadeira",function(source,args)
	local ped = PlayerPedId()
	local x,y,z = table.unpack(GetEntityCoords(ped))
	local bowz,cdz = GetGroundZFor_3dCoord(CoordenadaX,CoordenadaY,CoordenadaZ)
	local distance = GetDistanceBetweenCoords(CoordenadaX,CoordenadaY,cdz,x,y,z,true)

	if distance <= 50.1 and not servico then

		--if args[1] == "madeira" then --elseif args[1] == "madeira" then
			servico = true
			modules = "madeira"
			servehicle = 2016027501
			random = emP.getTruckpoint(modules)
			CoordenadaX2 = madeira[random].x
			CoordenadaY2 = madeira[random].y
			CoordenadaZ2 = madeira[random].z
			CriandoBlip(CoordenadaX2,CoordenadaY2,CoordenadaZ2)
			TriggerEvent("Notify","importante","Entrega de <b>Madeiras</b> iniciada, pegue o caminhão, a carga e vá até o destino marcado.")

		else
			TriggerEvent("Notify","aviso","<b>Neste local não existem cargas de:</b> madeira")
		end
	--end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ENTREGA
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if servico then
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(CoordenadaX2,CoordenadaY2,CoordenadaZ2)
			local distance = GetDistanceBetweenCoords(CoordenadaX2,CoordenadaY2,cdz,x,y,z,true)

			if distance <= 100.0 then
				DrawMarker(23,CoordenadaX2,CoordenadaY2,CoordenadaZ2-0.96,0,0,0,0,0,0,10.0,10.0,1.0,0,95,140,50,0,0,0,0)
				if distance <= 5.9 then
					if IsControlJustPressed(0,38) then
						local vehicle = getVehicleInDirection(GetEntityCoords(PlayerPedId()),GetOffsetFromEntityInWorldCoords(PlayerPedId(),0.0,5.0,0.0))
						if GetEntityModel(vehicle) == servehicle then
							emP.checkPayment(random,modules,parseInt(GetVehicleBodyHealth(GetPlayersLastVehicle())))
							TriggerServerEvent("trydeleteveh",VehToNet(vehicle))
							Citizen.Wait(1000)
							if DoesEntityExist(vehicle) then
								TriggerServerEvent("trydeleteveh",VehToNet(vehicle))
							end
							RemoveBlip(blips)
							servico = false
						end
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CANCELAR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if servico then
			if IsControlJustPressed(0,168) then
			RemoveBlip(blips)
			servico = false
			blips = nil
			passageiro = nil
			servehicle = false
				TriggerEvent("Notify","aviso","Você saiu de serviço.")
			end
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
function getVehicleInDirection(coordsfrom,coordsto)
local handle = CastRayPointToPoint(coordsfrom.x,coordsfrom.y,coordsfrom.z,coordsto.x,coordsto.y,coordsto.z,10,PlayerPedId(),false)
local a,b,c,d,vehicle = GetRaycastResult(handle)
return vehicle
end

function CriandoBlip(x,y,z)
blips = AddBlipForCoord(x,y,z)
SetBlipSprite(blips,1)
SetBlipColour(blips,5)
SetBlipScale(blips,0.4)
SetBlipAsShortRange(blips,false)
SetBlipRoute(blips,true)
BeginTextCommandSetBlipName("STRING")
AddTextComponentString("Entrega de Carga")
EndTextCommandSetBlipName(blips)
end