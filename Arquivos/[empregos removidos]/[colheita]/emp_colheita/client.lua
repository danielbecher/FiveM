local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
emP = Tunnel.getInterface("emp_colheita")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = false
local servico = false
local selecionado = 0
local CoordenadaX = 2529.33
local CoordenadaY = 4857.40
local CoordenadaZ = 37.61
-- 2529.33, 4857.40, 37.61 --Novo
-- 751.89, 6458.85, 31.53 --Antigo
-----------------------------------------------------------------------------------------------------------------------------------------
-- RESIDENCIAS
-----------------------------------------------------------------------------------------------------------------------------------------
local locs = {
	[1] = { ['x'] = 2531.70, ['y'] = 4847.36, ['z'] = 36.42 },
	[2] = { ['x'] = 2540.76, ['y'] = 4838.53, ['z'] = 35.31 },
	[3] = { ['x'] = 2550.92, ['y'] = 4829.25, ['z'] = 34.94 },
	[4] = { ['x'] = 2562.16, ['y'] = 4818.79, ['z'] = 34.63 },
	[5] = { ['x'] = 2571.50, ['y'] = 4810.19, ['z'] = 34.00 },
	[6] = { ['x'] = 2579.63, ['y'] = 4797.87, ['z'] = 33.62 },
	[7] = { ['x'] = 2562.73, ['y'] = 4803.43, ['z'] = 33.14 },
	[8] = { ['x'] = 2551.26, ['y'] = 4813.56, ['z'] = 33.60 },
	[9] = { ['x'] = 2538.29, ['y'] = 4825.73, ['z'] = 34.34 },
	[10] = { ['x'] = 2528.48, ['y'] = 4835.12, ['z'] = 35.14 },
	[11] = { ['x'] = 2518.46, ['y'] = 4834.76, ['z'] = 35.35 },
	[12] = { ['x'] = 2522.17, ['y'] = 4824.71, ['z'] = 34.45 },
	[13] = { ['x'] = 2532.37, ['y'] = 4815.08, ['z'] = 34.00 },
	[14] = { ['x'] = 2540.71, ['y'] = 4806.78, ['z'] = 33.74 },
	[15] = { ['x'] = 2548.59, ['y'] = 4799.08, ['z'] = 33.31 },
	[16] = { ['x'] = 2557.05, ['y'] = 4790.85, ['z'] = 32.98 },
	[17] = { ['x'] = 2562.73, ['y'] = 4781.04, ['z'] = 32.94 },
	[18] = { ['x'] = 2554.22, ['y'] = 4782.09, ['z'] = 33.01 },
	[19] = { ['x'] = 2546.50, ['y'] = 4789.36, ['z'] = 33.33 },
	[20] = { ['x'] = 2538.29, ['y'] = 4797.25, ['z'] = 33.56 },
	[21] = { ['x'] = 2531.84, ['y'] = 4803.32, ['z'] = 33.74 },
	[22] = { ['x'] = 2523.07, ['y'] = 4811.47, ['z'] = 34.07 },
	[23] = { ['x'] = 2512.94, ['y'] = 4820.83, ['z'] = 34.43 },
	[24] = { ['x'] = 2509.49, ['y'] = 4816.96, ['z'] = 34.56 },
	[25] = { ['x'] = 2517.99, ['y'] = 4808.71, ['z'] = 34.25 },
	[26] = { ['x'] = 2524.65, ['y'] = 4801.99, ['z'] = 34.11 },
	[27] = { ['x'] = 2532.60, ['y'] = 4794.83, ['z'] = 33.93 },
	[28] = { ['x'] = 2545.61, ['y'] = 4780.52, ['z'] = 33.72 },
	[29] = { ['x'] = 2536.64, ['y'] = 4784.45, ['z'] = 34.14 },
	[30] = { ['x'] = 2529.05, ['y'] = 4791.23, ['z'] = 34.31 },
	[31] = { ['x'] = 2520.25, ['y'] = 4799.92, ['z'] = 34.42 },
	[32] = { ['x'] = 2507.10, ['y'] = 4812.14, ['z'] = 34.76 },
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRABALHAR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if not servico then
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(CoordenadaX,CoordenadaY,CoordenadaZ)
			local distance = GetDistanceBetweenCoords(CoordenadaX,CoordenadaY,cdz,x,y,z,true)
			if distance <= 80 then
				DrawMarker(21,CoordenadaX,CoordenadaY,CoordenadaZ-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,250,100,50,150,1,0,0,1)
				if distance <= 1.2 then
					drawTxt("PRESSIONE  ~r~E~w~  PARA INICIAR A ~y~COLHEITA",4,0.5,0.90,0.50,255,255,255,200)
					if IsControlJustPressed(0,38) then
						servico = true
						selecionado = 1
						CriandoBlip(locs,selecionado)
						TriggerEvent("Notify","sucesso","Você entrou em serviço.")
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SERVIÇO
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if servico then
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(locs[selecionado].x,locs[selecionado].y,locs[selecionado].z)
			local distance = GetDistanceBetweenCoords(locs[selecionado].x,locs[selecionado].y,cdz,x,y,z,true)
			local veh = GetVehiclePedIsIn(PlayerPedId(),false)

			if distance <= 45.0 then
				DrawMarker(21,locs[selecionado].x,locs[selecionado].y,locs[selecionado].z+0.20,0,0,0,0,180.0,130.0,2.0,2.0,1.0,250,100,50,150,1,0,0,1)
				if distance <= 2.5 then
					if IsVehicleModel(GetVehiclePedIsUsing(PlayerPedId()),GetHashKey("tractor2")) then
						SetEntityMaxSpeed(veh,0.45*10-0.45)
						RemoveBlip(blips)
						if selecionado == 32 then
							selecionado = 1
						else
							selecionado = selecionado + 1
						end
						emP.checkPayment()
						CriandoBlip(locs,selecionado)
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CANCELAR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if servico then
			if IsControlJustPressed(0,168) then
				servico = false
				RemoveBlip(blips)
				TriggerEvent("Notify","aviso","Você saiu de serviço.")
			end
		end
	end
end)
------------------------------------------------------------------------------------------------------------------------------------------
-- SEPARAR GRAOS
-----------------------------------------------------------------------------------------------------------------------------------------
local processo = false
local segundos = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAIS
-----------------------------------------------------------------------------------------------------------------------------------------
local locais = {
	{ ['id'] = 1 , ['x'] = 2433.82, ['y'] = 4969.15, ['z'] = 42.34 }, 
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROCESSO --
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if not processo then
			for _,v in pairs(locais) do
				local ped = PlayerPedId()
				local x,y,z = table.unpack(GetEntityCoords(ped))
				local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
				local distance2 = GetDistanceBetweenCoords(v.x,v.y,cdz,x,y,z,true)
				local vehicle = GetPlayersLastVehicle()
				if distance2 <= 20 then
					DrawMarker(21,2433.82,4969.15,42.34-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,255,230,100,100,0,0,0,1)
					if distance2 <= 2 and not andamento then
						drawTxt("PRESSIONE  ~r~E~w~  PARA INICIAR A ~y~DESTILAÇÃO",4,0.5,0.90,0.50,255,255,255,200)
						if IsControlJustPressed(0,38) and emP.checkGraos() and not IsPedInAnyVehicle(ped) --[[and GetEntityModel(vehicle) == -1207771834]] then
							processo = true
							segundos = 5
							vRP._playAnim(true,{{"mini@repair","fixing_a_ped"}},false)
							SetTimeout(4000,function()
							emP.separarGraos()
							end)
						end
					end
				end
			end
		end
		if processo then
			drawTxt("AGUARDE ~g~"..segundos.."~w~ SEGUNDOS ATÉ FINALIZAR A ~y~DESTILAÇÃO",4,0.5,0.90,0.50,255,255,255,200)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TIMERS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if segundos > 0 then
			segundos = segundos - 1
			if segundos == 0 then
				processo = false
				TriggerEvent('cancelando',false)
				ClearPedTasks(PlayerPedId())
				vRP._DeletarObjeto()
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
function CriandoBlip(locs,selecionado)
	blips = AddBlipForCoord(locs[selecionado].x,locs[selecionado].y,locs[selecionado].z)
	SetBlipSprite(blips,1)
	SetBlipColour(blips,5)
	SetBlipScale(blips,0.4)
	SetBlipAsShortRange(blips,false)
	SetBlipRoute(blips,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Colheita")
	EndTextCommandSetBlipName(blips)
end

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