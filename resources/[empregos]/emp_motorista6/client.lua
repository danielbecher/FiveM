local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
emP = Tunnel.getInterface("emp_motorista6")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local emservico = false
local bonus = 0

local coordenadas = {
	{ ['id'] = 1, ['x'] = 455.0, ['y'] = -606.0, ['z'] = 28.50 }, 
	--{ ['id'] = 2, ['x'] = 1530.17, ['y'] = 3771.62, ['z'] = 34.52 }, 
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PONTOS DE PARADA - LINHA BAIXADA SANTISTA
-----------------------------------------------------------------------------------------------------------------------------------------
local entregas = {
	[1] = { ['x'] = 78.13, ['y'] = -609.45, ['z'] = 31.32 }, 
	[2] = { ['x'] = -71.25, ['y'] = -716.57, ['z'] = 33.97 }, 
	[3] = { ['x'] = -340.7, ['y'] = -649.38, ['z'] = 32.2 }, 
	[4] = { ['x'] = -688.22, ['y'] = -648.73, ['z'] = 31.2 }, 
	[5] = { ['x'] = -1018.06, ['y'] = -699.25, ['z'] = 21.05 }, 
	[6] = { ['x'] = -1201.37, ['y'] = -602.19, ['z'] = 26.81 }, 
	[7] = { ['x'] = -1443.8, ['y'] = -588.29, ['z'] = 30.81 }, 
	[8] = { ['x'] = -1498.8, ['y'] = -719.71, ['z'] = 26.71 }, 
	[9] = { ['x'] = -1323.24, ['y'] = -874.28, ['z'] = 14.62 }, 
	[10] = { ['x'] = -1234.42, ['y'] = -1122.41, ['z'] = 7.94 }, 
	[11] = { ['x'] = -1284.46, ['y'] = -1231.98, ['z'] = 4.46}, 
	[12] = { ['x'] = -1213.63, ['y'] = -1406.11, ['z'] = 4.15 }, 
	[13] = { ['x'] = -1081.11, ['y'] = -1596.38, ['z'] = 4.41}, 
	[14] = { ['x'] = -1002.21, ['y'] = -1592.14, ['z'] = 5.12}, 
	[15] = { ['x'] = -1082.36, ['y'] = -1411.58, ['z'] = 5.08}, 
	[16] = { ['x'] = -941.76, ['y'] = -1231.45, ['z'] = 5.26}, 
	[17] = { ['x'] = -821.19, ['y'] = -1159.98, ['z'] = 7.62}, 
	[18] = { ['x'] = -629.11, ['y'] = -984.68, ['z'] = 21.27}, 
	[19] = { ['x'] = -548.56, ['y'] = -845.87, ['z'] = 28.47}, 
	[20] = { ['x'] = -329.17, ['y'] = -861.58, ['z'] = 31.64}, 
	[21] = { ['x'] = -74.08, ['y'] = -946.65, ['z'] = 28.95},
	[22] = { ['x'] = 259.45, ['y'] = -1217.02, ['z'] = 29.51}, 
	[23] = { ['x'] = 222.8, ['y'] = -1088.28, ['z'] = 29.04}, 
	[24] = { ['x'] = 410.39, ['y'] = -760.02, ['z'] = 28.96}, 
	[25] = { ['x'] = 461.52, ['y'] = -626.89, ['z'] = 28.29}, 

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
						drawTxt("PRESSIONE  ~r~E~w~  PARA ~y~INICIAR A ROTA ~r~BAIXADA SANTISTA~w~ ",4,0.5,0.90,0.50,255,255,255,200)
						if IsControlJustPressed(0,38) then
							emservico = true
							if v.id == 2 then
								destino = 26
							else
								destino = 1
							end
							CriandoBlip(entregas,destino)
							TriggerEvent("Notify","sucesso","Você iniciou a linha <b>Baixada Santista</b>. Boa viagem!")
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
				TriggerEvent("Notify","aviso","Você encerrou a linha <b>Baixada Santista</b>. A SPTrans agradece pelo seu bom trabalho!")
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