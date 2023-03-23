local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
emP = Tunnel.getInterface("emp_motorista9")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local emservico = false
local bonus = 0

local coordenadas = {
	{ ['id'] = 1, ['x'] = 455.0, ['y'] = -612.0, ['z'] = 28.50 }, 
	--{ ['id'] = 2, ['x'] = 1530.17, ['y'] = 3771.62, ['z'] = 34.52 }, 
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PONTOS DE PARADA - LINHA HIGIENÓPOLIS
-----------------------------------------------------------------------------------------------------------------------------------------
local entregas = {
	[1] = { ['x'] = 310.79, ['y'] = -759.9, ['z'] = 29.38 }, 
	[2] = { ['x'] = 272.26, ['y'] = -1187.29, ['z'] = 29.55 }, 
	[3] = { ['x'] = 273.32, ['y'] = -590.37, ['z'] = 43.25 }, 
	[4] = { ['x'] = 388.69, ['y'] = -207.17, ['z'] = 58.1 }, 
	[5] = { ['x'] = 543.84, ['y'] = 151.76, ['z'] = 98.95 }, 
	[6] = { ['x'] = 343.84, ['y'] = 393.56, ['z'] = 115.79 }, 
	[7] = { ['x'] = 15.69, ['y'] = 370.67, ['z'] = 112.34 }, 
	[8] = { ['x'] = -264.49, ['y'] = 405.54, ['z'] = 109.93 }, 
	[9] = { ['x'] = -410.8, ['y'] = 355.51, ['z'] = 107.91 }, 
	[10] = { ['x'] = -600.3, ['y'] = 509.37, ['z'] = 106.65 }, 
	[11] = { ['x'] = -827.2, ['y'] = 442.33, ['z'] = 88.4 }, 
	[12] = { ['x'] = -998.76, ['y'] = 406.46, ['z'] = 73.18 }, 
	[13] = { ['x'] = -1202.65, ['y'] = 408.8, ['z'] = 74.75 }, 
	[14] = { ['x'] = -1421.89, ['y'] = 334.68, ['z'] = 62.56 }, 
	[15] = { ['x'] = -1574.81, ['y'] = 173.35, ['z'] = 58.34 }, 
	[16] = { ['x'] = -1808.72, ['y'] = 115.23, ['z'] = 74.42 }, 
	[17] = { ['x'] = -1948.75, ['y'] = 288.18, ['z'] = 87.34 }, 
	[18] = { ['x'] = -1808.31, ['y'] = 484.45, ['z'] = 133.71 }, 
	[19] = { ['x'] = -1578.43, ['y'] = 454.76, ['z'] = 108.37 }, 
	[20] = { ['x'] = -1459.18, ['y'] = 521.74, ['z'] = 118.05 }, 
	[21] = { ['x'] = -1323.48, ['y'] = 625.27, ['z'] = 136.24 }, 
	[22] = { ['x'] = -1157.16, ['y'] = 754.39, ['z'] = 155.66 },
	[23] = { ['x'] = -805.06, ['y'] = 821.03, ['z'] = 203.29 }, 
	[24] = { ['x'] = -645.06, ['y'] = 984.66, ['z'] = 239.33 }, 
	[25] = { ['x'] = -276.62, ['y'] = 1051.79, ['z'] = 235.44 }, 
	[26] = { ['x'] = 260.77, ['y'] = 969.62, ['z'] = 210.61 }, 
	[27] = { ['x'] = 270.6, ['y'] = 627.29, ['z'] = 155.57 }, 
	[28] = { ['x'] = 263.61, ['y'] = 362.27, ['z'] = 105.94 }, 
	[29] = { ['x'] = 81.13, ['y'] = -119.9, ['z'] = 56.27 }, 
	[30] = { ['x'] = 458.09, ['y'] = -656.22, ['z'] = 27.8 }, 
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
						drawTxt("PRESSIONE  ~r~E~w~  PARA ~y~INICIAR A ROTA ~r~HIGIENÓPOLIS/ITAIM BIBI~w~ ",4,0.5,0.90,0.50,255,255,255,200)
						if IsControlJustPressed(0,38) then
							emservico = true
							if v.id == 2 then
								destino = 31
							else
								destino = 1
							end
							CriandoBlip(entregas,destino)
							TriggerEvent("Notify","sucesso","Você iniciou a linha <b>Higienópolis/Itaim Bibi</b>. Boa viagem!")
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
									if destino == 31 then
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
				TriggerEvent("Notify","aviso","Você encerrou a linha <b>Higienópolis/Itaim Bibi</b>. A SPTrans agradece pelo seu bom trabalho!")
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