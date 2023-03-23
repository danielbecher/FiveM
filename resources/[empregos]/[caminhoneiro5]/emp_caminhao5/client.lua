local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
emP = Tunnel.getInterface("emp_caminhao5")
vSERVER = Tunnel.getInterface("vrp_garages")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = false
local random = 0
local modules = ""
local servico = false
local servehicle = nil
local CoordenadaX = 464.54
local CoordenadaY = -2996.42
local CoordenadaZ = 6.05
local CoordenadaX2 = 0.0
local CoordenadaY2 = 0.0
local CoordenadaZ2 = 0.0
-----------------------------------------------------------------------------------------------------------------------------------------
-- importados
-----------------------------------------------------------------------------------------------------------------------------------------
local importados = {
	[1] = { ['x'] = 843.9, ['y'] = -1951.55, ['z'] = 28.95 }, -- 2,03
	[2] = { ['x'] = 868.32, ['y'] = -1657.12, ['z'] = 30.32 }, -- 2,07
	[3] = { ['x'] = 902.92, ['y'] = -1541.79, ['z'] = 30.5 }, -- 2,05 
	[4] = { ['x'] = 713.02, ['y'] = -1375.42, ['z'] = 26.23 }, -- 2,30
	[5] = { ['x'] = 915.87, ['y'] = -1234.17, ['z'] = 25.52 }, -- 2,37 
	[6] = { ['x'] = -1029.29, ['y'] = -2219.94, ['z'] = 8.99 }, -- 3,53
	[7] = { ['x'] = -1059.94, ['y'] = -2014.42, ['z'] = 13.17 }, -- 3,73
	[8] = { ['x'] = -839.82, ['y'] = -2669.1, ['z'] = 13.82 }, -- 3,39 
	[9] = { ['x'] = -390.46, ['y'] = -2282.88, ['z'] = 7.61 }, -- 2,68
	[10] = { ['x'] = 92.67, ['y'] = -2205.97, ['z'] = 6.04 }, -- 1,59 
	[11] = { ['x'] = 533.87, ['y'] = -1977.77, ['z'] = 24.8 }, -- 1,55 
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- /pack | /entregar
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("cimportados",function(source,args)
	if emP.checkPermission() then
	local ped = PlayerPedId()
	local x,y,z = table.unpack(GetEntityCoords(ped))
	local bowz,cdz = GetGroundZFor_3dCoord(CoordenadaX,CoordenadaY,CoordenadaZ)
	local distance = GetDistanceBetweenCoords(CoordenadaX,CoordenadaY,cdz,x,y,z,true)

	if distance <= 50.1 and not servico then

		--if args[1] == "importados" then --elseif args[1] == "importados" then
			servico = true
			modules = "importados"
			servehicle = -2140210194
			random = emP.getTruckpoint(modules)
			CoordenadaX2 = importados[random].x
			CoordenadaY2 = importados[random].y
			CoordenadaZ2 = importados[random].z
			CriandoBlip(CoordenadaX2,CoordenadaY2,CoordenadaZ2)
			TriggerEvent("Notify","importante","Entrega de <b>Importados</b> iniciada, pegue o caminhão, a carga e vá até o destino marcado.")

		else
			TriggerEvent("Notify","aviso","<b>Neste local não existem cargas de:</b> Importados")
		end
	else
		TriggerEvent("Notify","aviso","<b>Você não tem permissão para trabalhar neste emprego. Procure o Sindicato dos Caminhoneiros!")
	end
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