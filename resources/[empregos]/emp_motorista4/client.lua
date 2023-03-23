local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
emP = Tunnel.getInterface("emp_motorista4")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local emservico = false
local bonus = 0

local coordenadas = {
	{ ['id'] = 1, ['x'] = 455.0, ['y'] = -602.0, ['z'] = 28.5 }, 
	--{ ['id'] = 2, ['x'] = 1530.17, ['y'] = 3771.62, ['z'] = 34.52 }, 
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PONTOS DE PARADA - LINHA PRAÇA DA SÉ
-----------------------------------------------------------------------------------------------------------------------------------------
local entregas = {

	[1] = { ['x'] = 496.44, ['y'] = -995.17, ['z'] = 27.73 }, 
	[2] = { ['x'] = 272.26, ['y'] = -1187.29, ['z'] = 29.55 }, 
	[3] = { ['x'] = 250.21, ['y'] = -833.89, ['z'] = 29.76 }, 
	[4] = { ['x'] = 273.06, ['y'] = -589.21, ['z'] = 43.26 }, 
	[5] = { ['x'] = 390.3, ['y'] = -204.32, ['z'] = 58.52 }, 
	[6] = { ['x'] = 553.09, ['y'] = 176.6, ['z'] = 100.38 }, 
	[7] = { ['x'] = 324.64, ['y'] = 327.4, ['z'] = 105.35 }, 
	[8] = { ['x'] = 160.28, ['y'] = 93.94, ['z'] = 87.81 }, 
	[9] = { ['x'] = 80.37, ['y'] = -127.43, ['z'] = 55.9 }, 
	[10] = { ['x'] = -96.23, ['y'] = -607.76, ['z'] = 36.25 }, 
	[11] = { ['x'] = -341.24, ['y'] = -648.94, ['z'] = 32.17 }, 
	[12] = { ['x'] = -623.41, ['y'] = -610.0, ['z'] = 33.25}, 
	[13] = { ['x'] = -481.32, ['y'] = -386.98, ['z'] = 34.18}, 
	[14] = { ['x'] = -268.04, ['y'] = -207.14, ['z'] = 38.28}, 
	[15] = { ['x'] = -131.2, ['y'] = -103.86, ['z'] = 56.11}, 
	[16] = { ['x'] = 130.83, ['y'] = -198.11, ['z'] = 54.52}, 
	[17] = { ['x'] = 308.98, ['y'] = -262.65, ['z'] = 53.99}, 
	[18] = { ['x'] = 232.1, ['y'] = -855.81, ['z'] = 29.92},
	[19] = { ['x'] = 462.95, ['y'] = -621.89, ['z'] = 28.59}, 
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
						drawTxt("PRESSIONE  ~r~E~w~  PARA ~y~INICIAR A ROTA ~r~PRAÇA DA SÉ~w~ ",4,0.5,0.90,0.50,255,255,255,200)
						if IsControlJustPressed(0,38) then
							emservico = true
							if v.id == 2 then
								destino = 20
							else
								destino = 1
							end
							CriandoBlip(entregas,destino)
							TriggerEvent("Notify","sucesso","Você iniciou a linha <b>Praça da Sé</b>. Boa viagem!")
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
				TriggerEvent("Notify","aviso","Você encerrou a linha <b>Praça da Sé</b>. A SPTrans agradece pelo seu trabalho!")
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