-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
emP = Tunnel.getInterface("nav_caminhao2")
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION
-----------------------------------------------------------------------------------------------------------------------------------------
local menuactive = false
function ToggleActionMenu()
	menuactive = not menuactive
	if menuactive then
		SetNuiFocus(true,true)
		SendNUIMessage({ showmenu = true })
	else
		SetNuiFocus(false)
		SendNUIMessage({ hidemenu = true })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUTTON
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("ButtonClick",function(data,cb)
	if data == "madeira-01" then
		spawnVehicle("trailerlogs",-597.74,5307.47,70.22,280)
		TriggerEvent("Notify","sucesso","Carga de <b>Madeiras</b> liberada.")
	elseif data == "madeira-02" then
		spawnVehicle("trailerlogs",-587.65,5304.76,70.22,280)
		TriggerEvent("Notify","sucesso","Carga de <b>Madeiras</b> liberada.")
	elseif data == "fechar" then
		ToggleActionMenu()
	end
end)

function spawnVehicle(name,x,y,z,h)
	local mhash = GetHashKey(name)
	while not HasModelLoaded(mhash) do
		RequestModel(mhash)
		Citizen.Wait(10)
	end

	if HasModelLoaded(mhash) then
		local nveh = CreateVehicle(mhash,x,y,z,h+0.5,100,1594,true,false)
		local netveh = VehToNet(nveh)
		local id = NetworkGetNetworkIdFromEntity(nveh)

		NetworkRegisterEntityAsNetworked(nveh)
		while not NetworkGetEntityIsNetworked(nveh) do
			NetworkRegisterEntityAsNetworked(nveh)
			Citizen.Wait(1)
		end

		if NetworkDoesNetworkIdExist(netveh) then
			SetEntitySomething(nveh,true)
			if NetworkGetEntityIsNetworked(nveh) then
				SetNetworkIdExistsOnAllMachines(netveh,true)
			end
		end

		SetNetworkIdCanMigrate(id,true)
		SetVehicleNumberPlateText(NetToVeh(netveh),"CAMINHAO")
		Citizen.InvokeNative(0xAD738C3085FE7E11,NetToVeh(netveh),true,true)
		SetVehicleHasBeenOwnedByPlayer(NetToVeh(netveh),true)
		SetVehicleNeedsToBeHotwired(NetToVeh(netveh),false)
		SetModelAsNoLongerNeeded(mhash)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAIS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	SetNuiFocus(false,false)
	while true do
		Citizen.Wait(1)
		local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),-582.02,5300.67,70.25,true)
		if distance <= 10 then
			DrawMarker(21,-581.62,5301.51,70.25-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,255,230,100,100,0,0,0,1)
			if distance <= 2 then
				drawTxt("PRESSIONE  ~r~E~w~ PARA O ~y~INICIAR O SERVIÇO",4,0.5,0.90,0.50,255,255,255,200)
				if IsControlJustPressed(0,38) then
					ToggleActionMenu()
				end
			end
		end
	end
end)

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