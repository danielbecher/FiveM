local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
emP = Tunnel.getInterface("emp_motorista2")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local emservico = false
local bonus = 0

local coordenadas = {
	{ ['id'] = 1, ['x'] = 1528.5, ['y'] = 3770.25, ['z'] = 34.52 },
	--{ ['id'] = 2, ['x'] = 1530.17, ['y'] = 3771.62, ['z'] = 34.52 }, 
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PONTOS DE PARADA - CIRCULAR SANDY SHORES
-----------------------------------------------------------------------------------------------------------------------------------------
local entregas = {
	[1] = { ['x'] = 1287.05, ['y'] = 3648.99, ['z'] = 34.23 },
	[2] = { ['x'] = 1085.6, ['y'] = 3632.47, ['z'] = 34.66 },
	[3] = { ['x'] = 914.55, ['y'] = 3637.93, ['z'] = 33.44 },
	[4] = { ['x'] = 464.52, ['y'] = 3589.75, ['z'] = 34.28 },
	[5] = { ['x'] = 303.6, ['y'] = 3429.15, ['z'] = 37.8 },
	[6] = { ['x'] = 82.76, ['y'] = 3605.08, ['z'] = 40.67 },
	[7] = { ['x'] = 214.67, ['y'] = 3088.78, ['z'] = 43.26 },
	[8] = { ['x'] = 350.22, ['y'] = 2649.73, ['z'] = 45.74 },
	[9] = { ['x'] = 547.43, ['y'] = 2684.66, ['z'] = 43.26 },
	[10] = { ['x'] = 1034.14, ['y'] = 2682.52, ['z'] = 40.29 },
	[11] = { ['x'] = 1499.71, ['y'] = 2737.34, ['z'] = 38.75 },
	[12] = { ['x'] = 2056.33, ['y'] = 3027.95, ['z'] = 46.61 },
	[13] = { ['x'] = 1813.4, ['y'] = 3318.12, ['z'] = 43.16 },
	[14] = { ['x'] = 1726.33, ['y'] = 3581.63, ['z'] = 36.27 },
	[15] = { ['x'] = 1868.04, ['y'] = 3663.23, ['z'] = 34.79 },
	[16] = { ['x'] = 1997.65, ['y'] = 3736.78, ['z'] = 33.35 },
	[17] = { ['x'] = 1934.79, ['y'] = 3876.64, ['z'] = 33.23 },
	[18] = { ['x'] = 1712.95, ['y'] = 3748.82, ['z'] = 34.74 },
	[19] = { ['x'] = 1502.74, ['y'] = 3753.14, ['z'] = 34.97 },

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
						drawTxt("PRESSIONE  ~r~E~w~  PARA ~y~INCIAR A ROTA ~r~CIRCULAR SANDY SHORES~w~",4,0.5,0.90,0.50,255,255,255,200)
						if IsControlJustPressed(0,38) then
							emservico = true
							if v.id == 2 then
								destino = 6
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
									if destino == 19 then
										emP.checkPayment(50)
										destino = 1
									elseif destino == 54 then
										destino = 1
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