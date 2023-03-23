local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "vRP")
HUDserver = Tunnel.getInterface("vrp_hud", "vrp_hud")
vRPhud = {}

Tunnel.bindInterface("vrp_hud",vRPhud)
Proxy.addInterface("vrp_hud",vRPhud)


-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local hour = 0
local minute = 0
local segundos = 0
local month = ""
local dayOfMonth = 0
local voice = 2
local voiceDisplay = "<span style='color:green'><img class='microfone' src='img/mic.png'> 3 Metros</span>"
local proximity = 3.0
local CintoSeguranca = false
local ExNoCarro = false
local sBuffer = {}
local vBuffer = {}
local displayValue = true
local gasolina = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- DATA E HORA
-----------------------------------------------------------------------------------------------------------------------------------------
function CalculateTimeToDisplay()
	hour = GetClockHours()
	minute = GetClockMinutes()
	if hour <= 9 then
		hour = "0" .. hour
	end
	if minute <= 9 then
		minute = "0" .. minute
	end
end
function CalculateDateToDisplay()
	month = GetClockMonth()
	dayOfMonth = GetClockDayOfMonth()
	if month == 0 then
		month = "Janeiro"
	elseif month == 1 then
		month = "Fevereiro"
	elseif month == 2 then
		month = "Março"
	elseif month == 3 then
		month = "Abril"
	elseif month == 4 then
		month = "Maio"
	elseif month == 5 then
		month = "Junho"
	elseif month == 6 then
		month = "Julho"
	elseif month == 7 then
		month = "Agosto"
	elseif month == 8 then
		month = "Setembro"
	elseif month == 9 then
		month = "Outubro"
	elseif month == 10 then
		month = "Novembro"
	elseif month == 11 then
		month = "Dezembro"
	end
end
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)	
		CalculateTimeToDisplay()
		CalculateDateToDisplay()
	end
end)
AddEventHandler("playerSpawned",function()
	NetworkSetTalkerProximity(proximity)
end)
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		setVoice()
	end
end)
function setVoice()
	NetworkSetTalkerProximity(proximity)
	NetworkClearVoiceChannel()
end
Citizen.CreateThread(function()
    local currSpeed = 0.0
    local cruiseSpeed = 999.0
    local cruiseIsOn = false
    local seatbeltIsOn = false
	while true do
		Citizen.Wait(10)
		ped = PlayerPedId()
		health = (GetEntityHealth(ped)-100)/300*100
		armor = GetPedArmour(ped)
		local x,y,z = table.unpack(GetEntityCoords(ped,false))
		local street = GetStreetNameFromHashKey(GetStreetNameAtCoord(x,y,z))
		if IsControlJustPressed(1,212) and GetEntityHealth(ped) > 100 then
			if proximity == 3.0 then
				voiceDisplay = "<span style='color:orange'><img class='microfone' src='img/mic2.png'> 5 Metros</span>"
				proximity = 10.0
			elseif proximity == 10.0 then
				voiceDisplay = "<span style='color:red'><img class='microfone' src='img/mic3.png'>10 Metros</span>"
				proximity = 25.0
			elseif proximity == 25.0 then
				voiceDisplay = "<span style='color:green'><img class='microfone' src='img/mic.png'> 3 Metros</span>"
				proximity = 3.0
			end
		 	setVoice()
		end
		-- print(NetworkGetTalkerProximity())
		HideHudComponentThisFrame( 1 ) -- Wanted Stars
		HideHudComponentThisFrame( 2 ) -- Weapon Icon
		HideHudComponentThisFrame( 3 ) -- Cash
		HideHudComponentThisFrame( 4 ) -- MP Cash
		HideHudComponentThisFrame( 6 ) -- Vehicle Name
		HideHudComponentThisFrame( 7 ) -- Area Name
		HideHudComponentThisFrame( 8 ) -- Vehicle Class      
		HideHudComponentThisFrame( 9 ) -- Street Name
		HideHudComponentThisFrame( 13 ) -- Cash Change
		HideHudComponentThisFrame( 17 ) -- Save Game  
		HideHudComponentThisFrame( 20 ) -- Weapon Stats 
		if IsPedInAnyVehicle(ped) then
			inCar  = true
			PedCar = GetVehiclePedIsIn(ped)
			speed = math.ceil(GetEntitySpeed(PedCar) * 3.6)
			rpm = GetVehicleCurrentRpm(PedCar)
			nsei,baixo,alto = GetVehicleLightsState(PedCar)
			if baixo == 1 and alto == 0 then
				farol = 1
			elseif  alto == 1 then
				farol = 2
			else
				farol = 0
			end
			-- print(farol)
			if GetEntitySpeed(PedCar) == 0 and GetVehicleCurrentGear(PedCar) == 0  then
				marcha = "P"
			elseif GetEntitySpeed(PedCar) ~= 0 and GetVehicleCurrentGear(PedCar) == 0  then
				marcha = "R"
			else
				marcha = GetVehicleCurrentGear(PedCar)
			end
		 	gasolina = GetVehicleFuelLevel(PedCar)
			VehIndicatorLight = GetVehicleIndicatorLights(PedCar)
			if(VehIndicatorLight == 0) then
				piscaEsquerdo = false
				piscaDireito = false
			elseif(VehIndicatorLight == 1) then
				piscaEsquerdo = true
				piscaDireito = false
			elseif(VehIndicatorLight == 2) then
				piscaEsquerdo = false
				piscaDireito = true
			elseif(VehIndicatorLight == 3) then
				piscaEsquerdo = true
				piscaDireito = true
			end
			DisplayRadar(true)
			-- cruise
	        if (GetPedInVehicleSeat(PedCar, -1) == ped) then
	            if IsControlJustReleased(0, 137) then
	                cruiseIsOn = not cruiseIsOn
	                cruiseSpeed = GetEntitySpeed(PedCar)
	            end
	            local maxSpeed = cruiseIsOn and cruiseSpeed or GetVehicleHandlingFloat(PedCar,"CHandlingData","fInitialDriveMaxFlatVel")
	            SetEntityMaxSpeed(PedCar, maxSpeed)
	        else
	            cruiseIsOn = false
	        end			
		else	
			inCar  = false
			PedCar = 0
			speed = 0
			rpm = 0
			marcha = 0
			cruiseIsOn = false
			VehIndicatorLight = 0
			DisplayRadar(false)
		end
		SendNUIMessage({
			incar = inCar,
			speed = speed,
			rpm = rpm,
			gear = marcha,
			heal = health,
			armor = armor,
			dia = dayOfMonth,
			mes = month,
			hora = hour,
			minuto = minute,
			voz = voiceDisplay,
			piscaEsquerdo = piscaEsquerdo,
			piscaDireito = piscaDireito,
			gas = gasolina,
			cinto = CintoSeguranca,
			farol = farol,
			cruise = cruiseIsOn,
		 	display = displayValue,
		 	rua = street
		});
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CINTO DE SEGURANÇA
-----------------------------------------------------------------------------------------------------------------------------------------
IsCar = function(veh)
	local vc = GetVehicleClass(veh)
	return (vc >= 0 and vc <= 7) or (vc >= 9 and vc <= 12) or (vc >= 17 and vc <= 20)
end	

Fwv = function (entity)
	local hr = GetEntityHeading(entity) + 90.0
	if hr < 0.0 then
		hr = 360.0 + hr
	end
	hr = hr * 0.0174533
	return { x = math.cos(hr) * 2.0, y = math.sin(hr) * 2.0 }
end

local segundos = 0
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local ped = PlayerPedId()
		local car = GetVehiclePedIsIn(ped)

		if car ~= 0 and (ExNoCarro or IsCar(car)) then
			ExNoCarro = true
			if CintoSeguranca then
				DisableControlAction(0,75)
			end

			sBuffer[2] = sBuffer[1]
			sBuffer[1] = GetEntitySpeed(car)

			if sBuffer[2] ~= nil and not CintoSeguranca and GetEntitySpeedVector(car,true).y > 1.0 and sBuffer[1] > 10.25 and (sBuffer[2] - sBuffer[1]) > (sBuffer[1] * 0.255) then
				local co = GetEntityCoords(ped)
				local fw = Fwv(ped)
				SetEntityHealth(ped,GetEntityHealth(ped)-150)
				SetEntityCoords(ped,co.x+fw.x,co.y+fw.y,co.z-0.47,true,true,true)
				SetEntityVelocity(ped,vBuffer[2].x,vBuffer[2].y,vBuffer[2].z)
				segundos = 20
			end

			vBuffer[2] = vBuffer[1]
			vBuffer[1] = GetEntityVelocity(car)

			if IsControlJustReleased(1,47) then
				TriggerEvent("cancelando",true)
				if CintoSeguranca then
					TriggerEvent("vrp_sound:source",'unbelt',0.5)
					SetTimeout(2000,function()
						CintoSeguranca = false
						TriggerEvent("cancelando",false)
					end)
				else
					TriggerEvent("vrp_sound:source",'belt',0.5)
					SetTimeout(3000,function()
						CintoSeguranca = true
						TriggerEvent("cancelando",false)
					end)
				end
			end
		elseif ExNoCarro then
			ExNoCarro = false
			CintoSeguranca = false
			sBuffer[1],sBuffer[2] = 0.0,0.0
		end
	end
end)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- setas Sound
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(300)
		if VehIndicatorLight == 1 or VehIndicatorLight == 2 or VehIndicatorLight == 3 then
			TriggerEvent('vrp_sound:source','setas1', 0.9)
			Citizen.Wait(300)
			TriggerEvent('vrp_sound:source','setas2', 0.9)
		end
	end
end)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- VOIP CIRCLE
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local playerNamesDist = 3
local key_holding = false
Citizen.CreateThread(function()
    while true do
        for _, id in ipairs(GetActivePlayers()) do
    	local takeaway = 0.95
            if (GetPlayerPed( id ) ~= PlayerPedId()) then
                ped = GetPlayerPed( id )
                x1, y1, z1 = table.unpack( GetEntityCoords( PlayerPedId(), true ) )
                x2, y2, z2 = table.unpack( GetEntityCoords( GetPlayerPed( id ), true ) )
                distance = math.floor(GetDistanceBetweenCoords(x1,  y1,  z1,  x2,  y2,  z2,  true))
                if (distance < NetworkGetTalkerProximity(GetPlayerPed(id))) and GetPlayerPed(id) ~= PlayerPedId() then
                    if NetworkIsPlayerTalking(id) and IsEntityVisible(GetPlayerPed(id)) then
                      DrawMarker(25, x2,y2,z2 - takeaway, 0, 0, 0, 0, 0, 0, 0.7, 0.7, 10.3,255, 255, 255, 100, 0, 0, 2, 0, 0, 0, 0)
                    end
                end 
            end
            if NetworkIsPlayerTalking(PlayerId()) then
            	x1, y1, z1 = table.unpack( GetEntityCoords( PlayerPedId(), true ) )
            	local mic = NetworkGetTalkerProximity(PlayerPedId())
				DrawMarker(1, x1, y1, z1 - takeaway, 0, 0, 0, 0, 0, 0, mic, mic, 0.5 ,120, 150, 255, 30, 0, 0, 2, 0, 0, 0, 0)
			end
        end
        Citizen.Wait(5)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- Oculta o hud quando pausa
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
  while true do
      Citizen.Wait(100)
      if IsPauseMenuActive() then
         displayValue = false
      else
         displayValue = true
      end
  end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- Marncar DANO
-----------------------------------------------------------------------------------------------------------------------------------------
local hurt = false
Citizen.CreateThread(function()
    while true do
        Wait(50)
        if GetEntityHealth(PlayerPedId()) <= 30 then
            setHurt()
        elseif hurt and GetEntityHealth(PlayerPedId()) > 160 then
            setNotHurt()
        end
    end
end)

function setHurt()
    hurt = true
    RequestAnimSet("move_m@injured")
    SetPedMovementClipset(PlayerPedId(), "move_m@injured", true)
end

function setNotHurt()
    hurt = false
    ResetPedMovementClipset(PlayerPedId())
    ResetPedWeaponMovementClipset(PlayerPedId())
    ResetPedStrafeClipset(PlayerPedId())
end
-----------------------------------------------------------------------------------------------------------------------------------------
--Dano do soco / Cacetete
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_UNARMED"), 0.1) 
    	Wait(0)
    	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_NIGHTSTICK"), 0.1) 
    	Wait(0)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- AGACHAR
-----------------------------------------------------------------------------------------------------------------------------------------
local agachar = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local ped = PlayerPedId()
		DisableControlAction(0,36,true)
		if not IsPedInAnyVehicle(ped) then
			RequestAnimSet("move_ped_crouched")
			RequestAnimSet("move_ped_crouched_strafing")
			if IsDisabledControlJustPressed(0,36) then
				if agachar then
					ResetPedMovementClipset(ped,0.25)
					ResetPedStrafeClipset(ped)
					agachar = false
				else
					SetPedMovementClipset(ped,"move_ped_crouched",0.25)
					SetPedStrafeClipset(ped,"move_ped_crouched_strafing")
					agachar = true
				end
			end
		end
	end
end)