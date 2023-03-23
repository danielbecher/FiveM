local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
emP = Tunnel.getInterface("emp_motorista3")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local emservico = false
local bonus = 0

local coordenadas = {
	{ ['id'] = 1, ['x'] = 1530.17, ['y'] = 3771.62, ['z'] = 34.52 }, 
	--{ ['id'] = 2, ['x'] = 1530.17, ['y'] = 3771.62, ['z'] = 34.52 }, 
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PONTOS DE PARADA - ROTA SANDY SHORES - PALETO
-----------------------------------------------------------------------------------------------------------------------------------------
local entregas = {
	[1] = { ['x'] = 1812.55, ['y'] = 3693.89, ['z'] = 35.03}, 
	[2] = { ['x'] = 2015.78, ['y'] = 3793.93, ['z'] = 33.22}, 
	[3] = { ['x'] = 2308.98, ['y'] = 3853.38, ['z'] = 35.59}, 
	[4] = { ['x'] = 2501.83, ['y'] = 4097.1, ['z'] = 39.22}, 
	[5] = { ['x'] = 2688.16, ['y'] = 4341.3, ['z'] = 46.83}, 
	[6] = { ['x'] = 2934.85, ['y'] = 4452.84, ['z'] = 48.4}, 
	[7] = { ['x'] = 2810.59, ['y'] = 4903.59, ['z'] = 37.93}, 
	[8] = { ['x'] = 2604.14, ['y'] = 5297.5, ['z'] = 45.63}, 
	[9] = { ['x'] = 1660.1, ['y'] = 6413.18, ['z'] = 30.55}, 
	[10] = { ['x'] = -211.02, ['y'] = 6197.5, ['z'] = 32.44}, 
	[11] = { ['x'] = 421.28, ['y'] = 6556.9, ['z'] = 28.21}, 
	[12] = { ['x'] = 1490.42, ['y'] = 6422.27, ['z'] = 23.27}, 
	[13] = { ['x'] = 2519.55, ['y'] = 5096.51, ['z'] = 45.09}, 
	[14] = { ['x'] = 2250.59, ['y'] = 5196.2, ['z'] = 61.32}, 
	[15] = { ['x'] = 1917.2, ['y'] = 5147.9, ['z'] = 45.64}, 
	[16] = { ['x'] = 1661.01, ['y'] = 4859.78, ['z'] = 42.89}, 
	[17] = { ['x'] = 1935.88, ['y'] = 4585.7, ['z'] = 39.96},
	[18] = { ['x'] = 2211.08, ['y'] = 4733.72, ['z'] = 41.29}, 
	[19] = { ['x'] = 2477.43, ['y'] = 4468.72, ['z'] = 36.02}, 
	[20] = { ['x'] = 2466.98, ['y'] = 4055.28, ['z'] = 38.51}, 
	[21] = { ['x'] = 1987.51, ['y'] = 3861.29, ['z'] = 33.28}, 
	[22] = { ['x'] = 1497.93, ['y'] = 3753.52, ['z'] = 34.88}, 
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
						drawTxt("PRESSIONE  ~r~E~w~  PARA ~y~INICIAR A ROTA ~r~INTERPRAIAS~w~ ",4,0.5,0.90,0.50,255,255,255,200)
						if IsControlJustPressed(0,38) then
							emservico = true
							if v.id == 2 then
								destino = 25
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