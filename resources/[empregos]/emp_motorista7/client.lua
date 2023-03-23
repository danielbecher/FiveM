local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
emP = Tunnel.getInterface("emp_motorista7")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local emservico = false
local bonus = 0

local coordenadas = {
	{ ['id'] = 1, ['x'] = 455.0, ['y'] = -608.0, ['z'] = 28.5 }, 
	--{ ['id'] = 2, ['x'] = 1530.17, ['y'] = 3771.62, ['z'] = 34.52 }, 
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PONTOS DE PARADA - LINHA GUARULHOS/ITAQUETA
-----------------------------------------------------------------------------------------------------------------------------------------
local entregas = {
	[1] = { ['x'] = 402.71, ['y'] = -801.87, ['z'] = 29.31 }, 
	[2] = { ['x'] = 395.84, ['y'] = -996.36, ['z'] = 29.42 }, 
	[3] = { ['x'] = 268.31, ['y'] = -1125.39, ['z'] = 29.32 }, 
	[4] = { ['x'] = -40.43, ['y'] = -1129.18, ['z'] = 26.26 }, 
	[5] = { ['x'] = -474.68, ['y'] = -1090.68, ['z'] = 26.6 }, 
	[6] = { ['x'] = -658.51, ['y'] = -1412.09, ['z'] = 10.63 }, 
	[7] = { ['x'] = -885.37, ['y'] = -1737.78, ['z'] = 19.12 }, 
	[8] = { ['x'] = -1098.35, ['y'] = -1991.61, ['z'] = 13.17 }, 
	[9] = { ['x'] = -940.16, ['y'] = -2178.76, ['z'] = 8.94 }, 
	[10] = { ['x'] = -672.44, ['y'] = -2343.78, ['z'] = 12.17 }, 
	[11] = { ['x'] = -417.58, ['y'] = -2159.59, ['z'] = 10.33}, 
	[12] = { ['x'] = -134.28, ['y'] = -2173.51, ['z'] = 10.34 }, 
	[13] = { ['x'] = -156.11, ['y'] = -1913.96, ['z'] = 24.97 }, 
	[14] = { ['x'] = -46.55, ['y'] = -1652.19, ['z'] = 29.28 }, 
	[15] = { ['x'] = -149.47, ['y'] = -1486.57, ['z'] = 33.28 }, 
	[16] = { ['x'] = 35.47, ['y'] = -1376.59, ['z'] = 29.31 }, 
	[17] = { ['x'] = 254.47, ['y'] = -1472.1, ['z'] = 29.37 }, 
	[18] = { ['x'] = 409.88, ['y'] = -1605.1, ['z'] = 29.27 }, 
	[19] = { ['x'] = 311.97, ['y'] = -1791.16, ['z'] = 28.04 }, 
	[20] = { ['x'] = 322.8, ['y'] = -1916.5, ['z'] = 25.43}, 
	[21] = { ['x'] = 569.56, ['y'] = -1866.05, ['z'] = 25.17},
	[22] = { ['x'] = 596.0, ['y'] = -1574.49, ['z'] = 27.67 }, 
	[23] = { ['x'] = 509.78, ['y'] = -1304.17, ['z'] = 29.3},
	[24] = { ['x'] = 259.45, ['y'] = -1217.02, ['z'] = 29.51},		
	[25] = { ['x'] = 459.82, ['y'] = -641.46, ['z'] = 28.55},
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
						drawTxt("PRESSIONE  ~r~E~w~  PARA ~y~INICIAR A ROTA ~r~GUARULHOS/ITAQUERA~w~ ",4,0.5,0.90,0.50,255,255,255,200)
						if IsControlJustPressed(0,38) then
							emservico = true
							if v.id == 2 then
								destino = 26
							else
								destino = 1
							end
							CriandoBlip(entregas,destino)
							TriggerEvent("Notify","sucesso","Você iniciou a linha <b>Guarulhos/Itaquera</b>. Boa viagem!")
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
				TriggerEvent("Notify","aviso","Você encerrou a linha <b>Guarulhos/Itaquera</b>. A SPTrans agradece pelo seu bom trabalho!")
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