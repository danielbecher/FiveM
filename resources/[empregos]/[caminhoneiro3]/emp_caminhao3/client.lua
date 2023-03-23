local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
emP = Tunnel.getInterface("emp_caminhao3")
vSERVER = Tunnel.getInterface("vrp_garages")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = false
local random = 0
local modules = ""
local servico = false
local servehicle = nil
local CoordenadaX = 1728.47
local CoordenadaY = -1635.29
local CoordenadaZ = 112.51
local CoordenadaX2 = 0.0
local CoordenadaY2 = 0.0
local CoordenadaZ2 = 0.0
-----------------------------------------------------------------------------------------------------------------------------------------
-- gasolina
-----------------------------------------------------------------------------------------------------------------------------------------
local gasolina = {
	[1] = { ['x'] = 814.29, ['y'] = -1021.95, ['z'] = 26.22 }, -- 2,57km
	[2] = { ['x'] = 1179.34, ['y'] = -317.0, ['z'] = 69.18 }, -- 3,32km
	[3] = { ['x'] = 2585.42, ['y'] = 373.89, ['z'] = 108.46 }, --5,52km
	[4] = { ['x'] = 172.77, ['y'] = -1564.31, ['z'] = 29.28 }, -- 1,85km
	[5] = { ['x'] = 1777.54, ['y'] = 3335.71, ['z'] = 41.18 }, -- 6,99km
	[6] = { ['x'] = 242.65, ['y'] = 2603.13, ['z'] = 45.11 }, -- 6,86
	[7] = { ['x'] = 1200.97, ['y'] = 2663.47, ['z'] = 37.82 }, -- 6,67
	[8] = { ['x'] = 2691.2, ['y'] = 3271.41, ['z'] = 55.25 }, -- 6,33
	[9] = { ['x'] = 1691.22, ['y'] = 4917.48, ['z'] = 42.08 }, -- 7,83
	[10] = { ['x'] = 199.74, ['y'] = 6606.97, ['z'] = 31.7 }, -- 11,11
	[11] = { ['x'] = -2554.95, ['y'] = 2346.43, ['z'] = 33.06 }, -- 9,52
	[12] = { ['x'] = -1441.98, ['y'] = -257.05, ['z'] = 46.21 }, -- 5,17
	[13] = { ['x'] = -723.84, ['y'] = -923.81, ['z'] = 19.02 }, -- 4,24
	[14] = { ['x'] = -67.1, ['y'] = -1764.2, ['z'] = 29.26 }, -- 3,32 
	[15] = { ['x'] = 277.23, ['y'] = -1245.93, ['z'] = 29.2 }, -- 3,57
	[16] = { ['x'] = 1198.2, ['y'] = -1397.92, ['z'] = 35.23 }, -- 2,02
	[17] = { ['x'] = -316.22, ['y'] = -1485.16, ['z'] = 30.55 }, -- 3,42
	[18] = { ['x'] = -316.22, ['y'] = -1485.16, ['z'] = 30.55 }, -- 3,42
	[19] = { ['x'] = 52.04, ['y'] = 2781.75, ['z'] = 57.89 }, -- 7,16
	[20] = { ['x'] = 1028.24, ['y'] = 2664.37, ['z'] = 39.56 }, -- 7,38
	[21] = { ['x'] = 2535.71, ['y'] = 2590.5, ['z'] = 37.95 }, --4,98
	[22] = { ['x'] = 1985.63, ['y'] = 3777.24, ['z'] = 32.19 }, -- 6,22
	[23] = { ['x'] = 1704.75, ['y'] = 6419.95, ['z'] = 32.64 }, -- 9,03
	[24] = { ['x'] = -99.01, ['y'] = 6398.91, ['z'] = 31.46 }, -- 11,3
	[25] = { ['x'] = -1789.3, ['y'] = 810.24, ['z'] = 138.52 }, -- 6,53
	[26] = { ['x'] = -2079.18, ['y'] = -304.4, ['z'] = 13.09 }, -- 6,81
	[27] = { ['x'] = -527.35, ['y'] = -1210.55, ['z'] = 18.19 }, --3,99

}
-----------------------------------------------------------------------------------------------------------------------------------------
-- /pack | /entregar
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("cgasolina",function(source,args)
	local ped = PlayerPedId()
	local x,y,z = table.unpack(GetEntityCoords(ped))
	local bowz,cdz = GetGroundZFor_3dCoord(CoordenadaX,CoordenadaY,CoordenadaZ)
	local distance = GetDistanceBetweenCoords(CoordenadaX,CoordenadaY,cdz,x,y,z,true)

	if distance <= 50.1 and not servico then

		--if args[1] == "gasolina" then --elseif args[1] == "gasolina" then
			servico = true
			modules = "gasolina"
			servehicle = -730904777
			random = emP.getTruckpoint(modules)
			CoordenadaX2 = gasolina[random].x
			CoordenadaY2 = gasolina[random].y
			CoordenadaZ2 = gasolina[random].z
			CriandoBlip(CoordenadaX2,CoordenadaY2,CoordenadaZ2)
			TriggerEvent("Notify","importante","Entrega de <b>Gasolina</b> iniciada, pegue o caminhão, a carga e vá até o destino marcado.")

		else
			TriggerEvent("Notify","aviso","<b>Neste local não existem cargas de:</b> gasolina")
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