local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
emP = Tunnel.getInterface("emp_motorista5")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local emservico = false
local bonus = 0

local coordenadas = {
	{ ['id'] = 1, ['x'] = 455.0, ['y'] = -604.0, ['z'] = 28.5 }, 
	--{ ['id'] = 2, ['x'] = 1530.17, ['y'] = 3771.62, ['z'] = 34.52 }, 
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PONTOS DE PARADA - LINHA PARQUE VILA LOBOS
-----------------------------------------------------------------------------------------------------------------------------------------
local entregas = {

	[1] = { ['x'] = 118.23, ['y'] = -568.79, ['z'] = 31.65 }, 
	[2] = { ['x'] = 1.38, ['y'] = -395.81, ['z'] = 39.52 }, 
	[3] = { ['x'] = -40.87, ['y'] = -244.49, ['z'] = 45.91 }, 
	[4] = { ['x'] = -224.09, ['y'] = 55.75, ['z'] = 63.36 }, 
	[5] = { ['x'] = -368.95, ['y'] = 250.64, ['z'] = 84.3 }, 
	[6] = { ['x'] = -595.32, ['y'] = 269.68, ['z'] = 82.24 }, 
	[7] = { ['x'] = -652.44, ['y'] = 157.05, ['z'] = 58.7 }, 
	[8] = { ['x'] = -449.74, ['y'] = 122.52, ['z'] = 64.54 }, 
	[9] = { ['x'] = -500.86, ['y'] = 20.8, ['z'] = 44.85 }, 
	[10] = { ['x'] = -692.22, ['y'] = -6.23, ['z'] = 38.26 }, 
	[11] = { ['x'] = -927.94, ['y'] = -125.55, ['z'] = 37.68 }, 
	[12] = { ['x'] = -1153.42, ['y'] = -120.94, ['z'] = 39.37 }, 
	[13] = { ['x'] = -1514.08, ['y'] = -125.68, ['z'] = 52.46 }, 
	[14] = { ['x'] = -1724.36, ['y'] = -346.64, ['z'] = 47.15 }, 
	[15] = { ['x'] = -2015.66, ['y'] = -160.54, ['z'] = 28.31 }, 
	[16] = { ['x'] = -1948.38, ['y'] = -430.88, ['z'] = 18.67 }, 
	[17] = { ['x'] = -1541.32, ['y'] = -504.77, ['z'] = 35.63 }, 
	[18] = { ['x'] = -1238.94, ['y'] = -326.78, ['z'] = 37.33 }, 
	[19] = { ['x'] = -932.54, ['y'] = -259.56, ['z'] = 39.78 }, 
	[20] = { ['x'] = -760.88, ['y'] = -343.96, ['z'] = 36.13 }, 
	[21] = { ['x'] = -581.38, ['y'] = -245.48, ['z'] = 35.98 }, 
	[22] = { ['x'] = -598.64, ['y'] = -64.21, ['z'] = 41.74 }, 
	[23] = { ['x'] = -488.53, ['y'] = -195.71, ['z'] = 37.17 }, 
	[24] = { ['x'] = -31.86, ['y'] = -268.01, ['z'] = 46.43 }, 
	[25] = { ['x'] = -59.99, ['y'] = -498.35, ['z'] = 40.44 }, 
	[26] = { ['x'] = 259.45, ['y'] = -1217.02, ['z'] = 29.51 }, 
	[27] = { ['x'] = 289.37, ['y'] = -888.34, ['z'] = 28.8 }, 
	[28] = { ['x'] = 460.34, ['y'] = -625.97, ['z'] = 28.59 }, 

	--[[1] = { ['x'] = -27.64, ['y'] = -268.92, ['z'] = 46.6 }, 
	[2] = { ['x'] = 194.28, ['y'] = -593.05, ['z'] = 29.54 }, 
	[3] = { ['x'] = -12.61, ['y'] = -431.58, ['z'] = 39.96 }, 
	[4] = { ['x'] = -41.68, ['y'] = -243.87, ['z'] = 45.87 }, 
	[5] = { ['x'] = -223.52, ['y'] = 57.97, ['z'] = 63.85 }, 
	[6] = { ['x'] = -371.79, ['y'] = 250.21, ['z'] = 84.2 }, 
	[7] = { ['x'] = -595.28, ['y'] = 269.59, ['z'] = 82.25 }, 
	[8] = { ['x'] = -652.48, ['y'] = 157.7, ['z'] = 58.82 }, 
	[9] = { ['x'] = -449.3, ['y'] = 121.33, ['z'] = 64.51 }, 
	[10] = { ['x'] = -454.53, ['y'] = 18.04, ['z'] = 45.75 }, 
	[11] = { ['x'] = -752.41, ['y'] = -33.59, ['z'] = 37.78 }, 
	[12] = { ['x'] = -936.44, ['y'] = -129.56, ['z'] = 37.67 }, 
	[13] = { ['x'] = -1150.44, ['y'] = -122.9, ['z'] = 39.33 }, 
	[14] = { ['x'] = -1514.46, ['y'] = -126.36, ['z'] = 52.49}, 
	[15] = { ['x'] = -1725.71, ['y'] = -346.75, ['z'] = 47.11}, 
	[16] = { ['x'] = -2016.73, ['y'] = -160.1, ['z'] = 28.22}, 
	[17] = { ['x'] = -1947.75, ['y'] = -430.95, ['z'] = 18.73}, 
	[18] = { ['x'] = -1541.21, ['y'] = -504.54, ['z'] = 35.63}, 
	[19] = { ['x'] = -1237.67, ['y'] = -326.45, ['z'] = 37.34}, 
	[20] = { ['x'] = -942.26, ['y'] = -255.39, ['z'] = 39.02}, 
	[21] = { ['x'] = -759.76, ['y'] = -345.31, ['z'] = 36.05}, 
	[22] = { ['x'] = -581.51, ['y'] = -245.28, ['z'] = 35.99}, 
	[23] = { ['x'] = -597.5, ['y'] = -64.49, ['z'] = 41.75}, 
	[24] = { ['x'] = 464.29, ['y'] = -616.37, ['z'] = 28.59},]]
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
						drawTxt("PRESSIONE  ~r~E~w~  PARA ~y~INICIAR A ROTA ~r~PARQUE VILA LOBOS~w~ ",4,0.5,0.90,0.50,255,255,255,200)
						if IsControlJustPressed(0,38) then
							emservico = true
							if v.id == 2 then
								destino = 29
							else
								destino = 1
							end
							CriandoBlip(entregas,destino)
							TriggerEvent("Notify","sucesso","Você iniciou a linha <b>Parque Vila Lobos</b>. Boa viagem!")
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
				TriggerEvent("Notify","aviso","Você encerrou a linha <b>Parque Vila Lobos</b>. A SPTrans agradece pelo seu bom trabalho!")
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