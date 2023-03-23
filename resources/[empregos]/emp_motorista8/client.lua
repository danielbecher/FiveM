local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
emP = Tunnel.getInterface("emp_motorista8")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local emservico = false
local bonus = 0

local coordenadas = {
	{ ['id'] = 1, ['x'] = 455.0, ['y'] = -610.0, ['z'] = 28.5 }, 
	--{ ['id'] = 2, ['x'] = 1530.17, ['y'] = 3771.62, ['z'] = 34.52 }, 
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PONTOS DE PARADA - LINHA HELIPA
-----------------------------------------------------------------------------------------------------------------------------------------
local entregas = {
	
	
	
	[1] = { ['x'] = 496.44, ['y'] = -995.17, ['z'] = 27.73 }, 
	[2] = { ['x'] = 272.26, ['y'] = -1187.29, ['z'] = 29.55 }, 
	[3] = { ['x'] = 273.91, ['y'] = -590.54, ['z'] = 43.15 }, 
	[4] = { ['x'] = 403.82, ['y'] = -403.82, ['z'] = 46.75 }, 
	[5] = { ['x'] = 535.72, ['y'] = -112.95, ['z'] = 63.24 }, 
	[6] = { ['x'] = 811.37, ['y'] = -78.39, ['z'] = 80.6 }, 
	[7] = { ['x'] = 982.73, ['y'] = -185.19, ['z'] = 72.32 }, 
	[8] = { ['x'] = 1189.39, ['y'] = -415.82, ['z'] = 67.57 }, 
	[9] = { ['x'] = 1176.79, ['y'] = -659.27, ['z'] = 61.85 }, 
	[10] = { ['x'] = 1153.56, ['y'] = -1012.78, ['z'] = 44.55 }, 
	[11] = { ['x'] = 1238.15, ['y'] = -1246.67, ['z'] = 35.19 }, 
	[12] = { ['x'] = 1261.39, ['y'] = -1476.45, ['z'] = 36.23 }, 
	[13] = { ['x'] = 1367.7, ['y'] = -1667.72, ['z'] = 56.42 }, 
	[14] = { ['x'] = 1406.08, ['y'] = -1932.04, ['z'] = 67.22 }, 
	[15] = { ['x'] = 1296.49, ['y'] = -2020.85, ['z'] = 45.33 }, 
	[16] = { ['x'] = 1052.44, ['y'] = -2156.2, ['z'] = 32.32 }, 
	[17] = { ['x'] = 1027.83, ['y'] = -2427.73, ['z'] = 28.69 }, 
	[18] = { ['x'] = 795.72, ['y'] = -2444.56, ['z'] = 21.63 }, 
	[19] = { ['x'] = 782.99, ['y'] = -2167.8, ['z'] = 29.29 }, 
	[20] = { ['x'] = 839.42, ['y'] = -1789.52, ['z'] = 29.11 }, 
	[21] = { ['x'] = 796.19, ['y'] = -1058.77, ['z'] = 27.42 }, 
	[22] = { ['x'] = 437.46, ['y'] = -1034.95, ['z'] = 30.43 }, 
	[23] = { ['x'] = 459.46, ['y'] = -650.35, ['z'] = 28.16 },
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRABALHAR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if not emservico then
			for _,v in pairs(coordenadas) do
				local ped = PlayerPedId()
				local x,y,z = table.unpack(GetEntityCoords(ped))
				local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
				local distance = GetDistanceBetweenCoords(v.x,v.y,cdz,x,y,z,true)

				if distance <= 10 then
					DrawMarker(21,v.x,v.y,v.z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,255,230,100,100,0,0,0,1)
					if distance <= 1.2 then
						drawTxt("PRESSIONE  ~r~E~w~  PARA ~y~INICIAR A ROTA ~r~BRÁS VIA HELIPA~w~ ",4,0.5,0.90,0.50,255,255,255,200)
						if IsControlJustPressed(0,38) then
							emservico = true
							if v.id == 2 then
								destino = 26
							else
								destino = 1
							end
							CriandoBlip(entregas,destino)
							TriggerEvent("Notify","sucesso","Você iniciou a linha <b>Brás via Helipa</b>. Boa viagem!")
						end
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GERANDO ENTREGA
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		local ped = PlayerPedId()
		if emservico then
			if IsPedInAnyVehicle(ped) then
				local vehicle = GetVehiclePedIsIn(ped)
				local distance = GetDistanceBetweenCoords(GetEntityCoords(ped),entregas[destino].x,entregas[destino].y,entregas[destino].z,true)
				if distance <= 50 then
					DrawMarker(21,entregas[destino].x,entregas[destino].y,entregas[destino].z+0.20,0,0,0,0,180.0,130.0,2.0,2.0,1.5,250,100,50,150,1,0,0,1)
					if distance <= 4 then
						--drawTxt("PRESSIONE  ~b~E~w~  PARA CONTINUAR A ROTA",4,0.5,0.93,0.50,255,255,255,200)
						if GetPedInVehicleSeat(vehicle,-1) == ped then
							if IsControlJustPressed(0,38) then
								if IsVehicleModel(GetVehiclePedIsUsing(ped),GetHashKey("mi4")) or IsVehicleModel(GetVehiclePedIsUsing(ped),GetHashKey("bus")) or IsVehicleModel(GetVehiclePedIsUsing(ped),GetHashKey("coach")) or IsVehicleModel(GetVehiclePedIsUsing(ped),GetHashKey("airbus")) then
									RemoveBlip(blip)
									if destino == 27 then
										emP.checkPayment(50)
										destino = 1
									elseif destino == 54 then
										destino = 28
									else
										emP.checkPayment(50)
										destino = destino + 1
									end
									CriandoBlip(entregas,destino)
								end
							end
						end
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CANCELANDO ENTREGA
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if emservico then
			if IsControlJustPressed(0,168) then
				emservico = false
				RemoveBlip(blip)
				TriggerEvent("Notify","aviso","Você encerrou a linha <b>Brás via Helipa</b>. A SPTrans agradece pelo seu bom trabalho!")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCOES
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

function CriandoBlip(entregas,destino)
	blip = AddBlipForCoord(entregas[destino].x,entregas[destino].y,entregas[destino].z)
	SetBlipSprite(blip,1)
	SetBlipColour(blip,5)
	SetBlipScale(blip,0.4)
	SetBlipAsShortRange(blip,false)
	SetBlipRoute(blip,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Rota de Motorista")
	EndTextCommandSetBlipName(blip)
end