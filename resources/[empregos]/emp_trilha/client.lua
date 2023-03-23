local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPserver = Tunnel.getInterface("vRP")
emP = Tunnel.getInterface("emp_trilha")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = false
local inrace = false
local timerace = 0
local racepoint = 1
local racepos = 0
local CoordenadaX = -387.55
local CoordenadaY = 4902.46
local CoordenadaZ = 192.61

-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local races = {
	[1] = {
		['time'] = 180,
		[1] = { ['x'] = -292.73, ['y'] = 4963.95, ['z'] = 250.49 },
		[2] = { ['x'] = -124.54, ['y'] = 4921.82, ['z'] = 360.24 },
		[3] = { ['x'] = -7.7,    ['y'] = 5013.42, ['z'] = 438.65 },
		[4] = { ['x'] = 99.75,   ['y'] = 5058.58, ['z'] = 484.87 },
		[5] = { ['x'] = 151.14,  ['y'] = 5187.72, ['z'] = 556.29 },
		[6] = { ['x'] = 319.15,  ['y'] = 5400.66, ['z'] = 648.15 },
		[7] = { ['x'] = 498.39,  ['y'] = 5591.14, ['z'] = 794.53 },
	},
	[2] = {
		['time'] = 180,
		[1] = { ['x'] = -292.73, ['y'] = 4963.95, ['z'] = 250.49 },
		[2] = { ['x'] = -124.54, ['y'] = 4921.82, ['z'] = 360.24 },
		[3] = { ['x'] = -7.7, 	 ['y'] = 5013.42, ['z'] = 438.65 },
		[4] = { ['x'] = 99.75, 	 ['y'] = 5058.58, ['z'] = 484.87 },
		[5] = { ['x'] = 151.14,  ['y'] = 5187.72, ['z'] = 556.29 },
		[6] = { ['x'] = 319.15,  ['y'] = 5400.66, ['z'] = 648.15 },
		[7] = { ['x'] = 498.39,  ['y'] = 5591.14, ['z'] = 794.53 },
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- STARTRACES
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if not inrace then
			local ped = PlayerPedId()
			local vehicle = GetVehiclePedIsUsing(ped)
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(CoordenadaX,CoordenadaY,CoordenadaZ)
			local distance = GetDistanceBetweenCoords(CoordenadaX,CoordenadaY,cdz,x,y,z,true)

			if distance <= 30.0 then
				if IsEntityAVehicle(vehicle) and GetVehicleClass(vehicle) ~= 9 and GetPedInVehicleSeat(vehicle,-1) == ped then
					DrawMarker(23,CoordenadaX,CoordenadaY,CoordenadaZ-0.96,0,0,0,0,0,0,10.0,10.0,1.0,255,230,100,50,0,0,0,0)
					if distance <= 5.9 then
						drawTxt("PRESSIONE  ~r~E~w~  PARA ~y~INICIAR A CORRIDA",4,0.5,0.90,0.50,255,255,255,200)
						if IsControlJustPressed(0,38) and emP.checkPermission()	then
							emP.setSearchTimer()
							inrace = true
							racepos = 1
							racepoint = emP.getRacepoint()
							timerace = races[racepoint].time
							PlateIndex = GetVehicleNumberPlateText(vehicle)
							SetVehicleNumberPlateText(vehicle,"CORREDOR")
							CriandoBlip(races,racepoint,racepos)
							end
						end
					end
				end
			end
		end
	end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKPOINTS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if inrace then
			local ped = PlayerPedId()
			local vehicle = GetVehiclePedIsUsing(ped)
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(races[racepoint][racepos].x,races[racepoint][racepos].y,races[racepoint][racepos].z)
			local distance = GetDistanceBetweenCoords(races[racepoint][racepos].x,races[racepoint][racepos].y,cdz,x,y,z,true)

			if distance <= 100.0 then
				if IsEntityAVehicle(vehicle) and GetVehicleClass(vehicle) ~= 9 then
					DrawMarker(1,races[racepoint][racepos].x,races[racepoint][racepos].y,races[racepoint][racepos].z-3,0,0,0,0,0,0,12.0,12.0,8.0,255,255,255,25,0,0,0,0)
					DrawMarker(21,races[racepoint][racepos].x,races[racepoint][racepos].y,races[racepoint][racepos].z+1,0,0,0,0,180.0,130.0,3.0,3.0,2.0,255,0,0,50,1,0,0,1)
					if distance <= 15.1 then
						RemoveBlip(blips)
						if racepos == #races[racepoint] then
							inrace = false
							SetVehicleNumberPlateText(GetPlayersLastVehicle(),PlateIndex)
							PlateIndex = nil
							PlaySoundFrontend(-1,"RACE_PLACED","HUD_AWARDS",false)
						else
							racepos = racepos + 1
							CriandoBlip(races,racepoint,racepos)
						end
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TIMEDRAWN
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if inrace and timerace > 0 and GetVehiclePedIsUsing(PlayerPedId()) then
			drawTxt("RESTAM ~g~"..timerace.." SEGUNDOS ~w~PARA CHEGAR AO DESTINO FINAL DA CORRIDA",4,0.5,0.905,0.45,255,255,255,100)
			drawTxt("VENÇA A CORRIDA E SUPERE SEUS PROPRIOS RECORDES ANTES DO TEMPO ACABAR",4,0.5,0.93,0.38,255,255,255,50)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TIMERACE
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if inrace and timerace > 0 then
			timerace = timerace - 1
			if timerace <= 0 or not IsPedInAnyVehicle(PlayerPedId()) then
				inrace = false
				RemoveBlip(blips)
				SetVehicleNumberPlateText(GetPlayersLastVehicle(),PlateIndex)
				PlateIndex = nil
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end

function CriandoBlip(races,racepoint,racepos)
	blips = AddBlipForCoord(races[racepoint][racepos].x,races[racepoint][racepos].y,races[racepoint][racepos].z)
	SetBlipSprite(blips,1)
	SetBlipColour(blips,1)
	SetBlipScale(blips,0.4)
	SetBlipAsShortRange(blips,false)
	SetBlipRoute(blips,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Corrida Clandestina")
	EndTextCommandSetBlipName(blips)
end