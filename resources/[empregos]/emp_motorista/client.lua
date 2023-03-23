local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
emP = Tunnel.getInterface("emp_motorista")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local emservico = false
local bonus = 0

local coordenadas = {
	--{ ['id'] = 1, ['x'] = 453.48, ['y'] = -607.74, ['z'] = 28.57 }, 
	--{ ['id'] = 2, ['x'] = -215.64, ['y'] = 6219.25, ['z'] = 31.5 }, 
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- GERANDO LOCAL DE ENTREGA
-----------------------------------------------------------------------------------------------------------------------------------------
local entregas = {
	[1] = { ['x'] = 309.95, ['y'] = -760.52, ['z'] = 30.09 },
	[2] = { ['x'] = 69.59, ['y'] = -974.80, ['z'] = 30.14 },
	[3] = { ['x'] = -61.32, ['y'] = -720.67, ['z'] = 33.66 },
	[4] = { ['x'] = -171.99, ['y'] = -818.38, ['z'] = 31.2 },
	[5] = { ['x'] = -132.91, ['y'] = -924.84, ['z'] = 29.28 },
	[6] = { ['x'] = -58.22, ['y'] = -950.93, ['z'] = 29.34 },
	[7] = { ['x'] = 95.00, ['y'] = -634.89, ['z'] = 45.02 },
	[8] = { ['x'] = 58.27, ['y'] = -283.32, ['z'] = 48.20 },
	[9] = { ['x'] = 47.74, ['y'] = -160.44, ['z'] = 56.03 },
	[10] = { ['x'] = 323.93, ['y'] = -267.58, ['z'] = 54.71 },
	[11] = { ['x'] = 443.75, ['y'] = 119.16, ['z'] = 100.41 },
	[12] = { ['x'] = 127.54, ['y'] = -196.85, ['z'] = 54.55 },
	[13] = { ['x'] = -524.08, ['y'] = 133.59, ['z'] = 63.91 },
	[14] = { ['x'] = -586.64, ['y'] = 268.39, ['z'] = 83.24 },
	[15] = { ['x'] = -640.38, ['y'] = -163.16, ['z'] = 38.49 },
	[16] = { ['x'] = -597.89, ['y'] = -361.27, ['z'] = 35.77 },
	[17] = { ['x'] = -646.06, ['y'] = -804.09, ['z'] = 25.78 },
	[18] = { ['x'] = -932.63, ['y'] = -1199.67, ['z'] = 5.91 },
	[19] = { ['x'] = -1234.65, ['y'] = -1080.87, ['z'] = 9.12 },
	[20] = { ['x'] = -1373.99, ['y'] = -793.23, ['z'] = 20.09 },
	[21] = { ['x'] = -2011.25, ['y'] = -160.04, ['z'] = 29.40 },
	[22] = { ['x'] = -1090.19, ['y'] = -1408.39, ['z'] = 5.15 },
	[23] = { ['x'] = -1040.82, ['y'] = -1541.12, ['z'] = 5.14 },
	[24] = { ['x'] = -1090.06, ['y'] = -1569.8, ['z'] = 4.38 },
	[25] = { ['x'] = -2981.70, ['y'] = 404.50, ['z'] = 15.75 },
	[26] = { ['x'] = -3101.58, ['y'] = 1112.65, ['z'] = 21.28 },
	[27] = { ['x'] = -2556.10, ['y'] = 2322.01, ['z'] = 33.89 },
	[28] = { ['x'] = -1778.89, ['y'] = -349.76, ['z'] = 45.2 },
	[29] = { ['x'] = -1512.2, ['y'] = -401.07, ['z'] = 39.99 },
	[30] = { ['x'] = -1342.48, ['y'] = -546.7, ['z'] = 30.95 },
	[31] = { ['x'] = -1071.46, ['y'] = -789.51, ['z'] = 19.34 },
	[32] = { ['x'] = -681.83, ['y'] = -961.08, ['z'] = 20.52 },
	[33] = { ['x'] = -546.45, ['y'] = -1023.44, ['z'] = 22.84 },
	[34] = { ['x'] = -73.1, ['y'] = -1091.03, ['z'] = 26.64 },
	[35] = { ['x'] = 180.13, ['y'] = -1038.01, ['z'] = 29.32 },
	[36] = { ['x'] = 424.44, ['y'] = -958.58, ['z'] = 29.33 },
	[37] = { ['x'] = 458.62, ['y'] = -641.09, ['z'] = 28.57 },
-----------------------------------------------------------------------------------------------------------------------------------------
-- COORDS PALETO
-----------------------------------------------------------------------------------------------------------------------------------------
--	[28] = { ['x'] = -153.29, ['y'] = 6212.22, ['z'] = 32.04 }, 
--	[29] = { ['x'] = -18.38, ['y'] = 6507.26, ['z'] = 32.11 }, 
--	[30] = { ['x'] = 750.1, ['y'] = 6492.87, ['z'] = 26.96 }, 
--	[31] = { ['x'] = 1605.67, ['y'] = 6382.96, ['z'] = 28.04 }, 
--	[32] = { ['x'] = 2523.1, ['y'] = 5397.13, ['z'] = 43.79 }, 
--	[33] = { ['x'] = 2417.2, ['y'] = 5146.35, ['z'] = 46.22 }, 
--	[34] = { ['x'] = 2483.1, ['y'] = 4447.83, ['z'] = 34.72 }, 
--	[35] = { ['x'] = 2009.0, ['y'] = 3754.48, ['z'] = 31.68 },
--	[36] = { ['x'] = 1784.69, ['y'] = 3784.43, ['z'] = 34.56 }, 
--	[37] = { ['x'] = 1645.95, ['y'] = 3594.46, ['z'] = 34.77 }, 
--	[38] = { ['x'] = 2028.34, ['y'] = 3086.08, ['z'] = 46.26 }, 
--	[39] = { ['x'] = 1243.86, ['y'] = 2685.01, ['z'] = 36.89 }, 
--	[40] = { ['x'] = 301.27, ['y'] = 2643.21, ['z'] = 43.81 }, 
--	[41] = { ['x'] = -457.07, ['y'] = 2854.16, ['z'] = 34.26 }, 
--	[42] = { ['x'] = -1117.01, ['y'] = 2668.0, ['z'] = 17.46 }, 
--	[43] = { ['x'] = -2220.02, ['y'] = 2304.25, ['z'] = 32.1 }, 
--	[44] = { ['x'] = -2697.39, ['y'] = 2289.02, ['z'] = 18.42 }, 
--	[45] = { ['x'] = -2542.61, ['y'] = 3416.97, ['z'] = 12.56 }, 
--	[46] = { ['x'] = -2208.02, ['y'] = 4298.45, ['z'] = 47.47 }, 
--	[47] = { ['x'] = -1530.62, ['y'] = 4954.68, ['z'] = 61.37 }, 
--	[48] = { ['x'] = -1050.17, ['y'] = 5333.97, ['z'] = 44.0 }, 
--	[49] = { ['x'] = -790.13, ['y'] = 5551.25, ['z'] = 32.34 }, 
--	[50] = { ['x'] = -453.36, ['y'] = 6069.5, ['z'] = 30.66 }, 
--	[51] = { ['x'] = -333.46, ['y'] = 6331.06, ['z'] = 29.42 }, 
--	[52] = { ['x'] = -51.08, ['y'] = 6602.36, ['z'] = 29.08 }, 
--	[53] = { ['x'] = -64.9, ['y'] = 6472.86, ['z'] = 30.68 }, 
--	[54] = { ['x'] = -292.38, ['y'] = 6246.41, ['z'] = 30.71 }, 
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
						drawTxt("PRESSIONE  ~r~E~w~  PARA ~y~INICIAR A ROTA  ~r~URBANA~w~",4,0.5,0.90,0.50,255,255,255,200)
						if IsControlJustPressed(0,38) then
							emservico = true
							if v.id == 2 then
								destino = 38
							else
								destino = 1
							end
							CriandoBlip(entregas,destino)
							TriggerEvent("Notify","sucesso","Você entrou em serviço.")
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
								if IsVehicleModel(GetVehiclePedIsUsing(ped),GetHashKey("greenbird3")) or IsVehicleModel(GetVehiclePedIsUsing(ped),GetHashKey("bus")) or IsVehicleModel(GetVehiclePedIsUsing(ped),GetHashKey("coach")) or IsVehicleModel(GetVehiclePedIsUsing(ped),GetHashKey("airbus")) then
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
				TriggerEvent("Notify","aviso","Você saiu de serviço.")
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
