local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
emP = Tunnel.getInterface("emp_caminhao4")
vSERVER = Tunnel.getInterface("vrp_garages")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = false
local random = 0
local modules = ""
local servico = false
local servehicle = nil
local CoordenadaX = 225.47
local CoordenadaY = -2997.36
local CoordenadaZ = 5.86
local CoordenadaX2 = 0.0
local CoordenadaY2 = 0.0
local CoordenadaZ2 = 0.0
-----------------------------------------------------------------------------------------------------------------------------------------
-- diesel
-----------------------------------------------------------------------------------------------------------------------------------------
local diesel = {
	
	[1] = { ['x'] = 2688.85, ['y'] = 1432.6, ['z'] = 24.58 }, -- 6,46
	[2] = { ['x'] = 2949.31, ['y'] = 2746.27, ['z'] = 43.42 }, -- 8,33
	[3] = { ['x'] = 859.39, ['y'] = 2194.73, ['z'] = 52.13 }, -- 10,49
	[4] = { ['x'] = 202.98, ['y'] = 2790.65, ['z'] = 45.66 }, -- 7,05
	[5] = { ['x'] = 347.59, ['y'] = 3417.82, ['z'] = 36.43 }, -- 7,63
	[6] = { ['x'] = 1338.2, ['y'] = 4332.24, ['z'] = 37.86 }, -- 10,24
	[7] = { ['x'] = 2102.13, ['y'] = 4753.53, ['z'] = 41.17 }, -- 9,41
	[8] = { ['x'] = 2905.35, ['y'] = 4381.65, ['z'] = 50.34 }, -- 8,81
	[9] = { ['x'] = 468.3, ['y'] = 6515.07, ['z'] = 29.35 }, -- 11,71
	[10] = { ['x'] = 18.54, ['y'] = 6280.44, ['z'] = 31.25 }, -- 12,83
	[11] = { ['x'] = -511.43, ['y'] = 5261.26, ['z'] = 80.61}, -- 13,91
	[12] = { ['x'] = -2084.9, ['y'] = 3442.71, ['z'] = 31.05 }, -- 9,72
	[13] = { ['x'] = -954.31, ['y'] = -2863.23, ['z'] = 13.96 }, -- 2,95
	[14] = { ['x'] = -1064.12, ['y'] = -2024.99, ['z'] = 13.2 }, -- 3,01
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- /pack | /entregar
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("cdiesel",function(source,args)
	local ped = PlayerPedId()
	local x,y,z = table.unpack(GetEntityCoords(ped))
	local bowz,cdz = GetGroundZFor_3dCoord(CoordenadaX,CoordenadaY,CoordenadaZ)
	local distance = GetDistanceBetweenCoords(CoordenadaX,CoordenadaY,cdz,x,y,z,true)

	if distance <= 50.1 and not servico then

		--if args[1] == "diesel" then --elseif args[1] == "diesel" then
			servico = true
			modules = "diesel"
			servehicle = -730904777
			random = emP.getTruckpoint(modules)
			CoordenadaX2 = diesel[random].x
			CoordenadaY2 = diesel[random].y
			CoordenadaZ2 = diesel[random].z
			CriandoBlip(CoordenadaX2,CoordenadaY2,CoordenadaZ2)
			TriggerEvent("Notify","importante","Entrega de <b>Diesel</b> iniciada, pegue o caminhão, a carga e vá até o destino marcado.")

		else
			TriggerEvent("Notify","aviso","<b>Neste local não existem cargas de:</b> Diesel")
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