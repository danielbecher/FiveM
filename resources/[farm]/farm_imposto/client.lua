local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
emP = Tunnel.getInterface("farm_imposto")
---
-- VARIAVEIS
---
local blips = false
local servico = false
local selecionado = 0
local CoordenadaX = -1051.75
local CoordenadaY = -232.91
local CoordenadaZ = 44.03
local processo = false
local segundos = 0

---
-- RESIDENCIAS
---
local locs = {
	[1] = {  ['x'] = 1985.26,    ['y'] = 3050.68,   ['z'] = 47.22 },
	[2] = {  ['x'] = -560.13,    ['y'] = 287.09,    ['z'] = 82.18 },
	[3] = {  ['x'] = -940.93,    ['y'] = -2954.15,  ['z'] = 13.95 },
	[4] = {  ['x'] =  -419.91,   ['y'] = 267.55,    ['z'] = 83.2 },
	[5] = {  ['x'] =  -371.16,   ['y'] = 277.5,     ['z'] = 86.43 },
	[6] = {  ['x'] =  243.96,    ['y'] = -1492.87,  ['z'] = 29.3 },
	[7] = {  ['x'] =  -1402.86,  ['y'] = -609.65,   ['z'] = 30.32 },
	[8] = {  ['x'] =  1328.19,   ['y'] = -1653.94,  ['z'] = 52.28 },
	[9] = {  ['x'] =  321.35,    ['y'] = 185.84,    ['z'] = 103.59 },
	[10] = { ['x'] =  -1327.59,  ['y'] = -683.47,   ['z'] = 26.47 },
	[11] = { ['x'] =  -1148.99,  ['y'] = -1428.0,   ['z'] = 4.96 },
	[12] = { ['x'] =  -1402.86,  ['y'] = -609.65,   ['z'] = 30.32 },
	[13] = { ['x'] =  340.5,     ['y'] = 179.24,    ['z'] = 103.02 },
	[14] = { ['x'] =  300.21,    ['y'] = 135.52,    ['z'] = 104.12 },
	[15] = { ['x'] =  -1276.14,  ['y'] = -687.83,   ['z'] = 24.65 },
	[16] = { ['x'] =  1865.46,   ['y'] = 3749.17,   ['z'] = 33.05 },
	[17] = { ['x'] =  -294.92,   ['y'] = 6198.4,    ['z'] = 31.51 },
	[18] = { ['x'] =  -629.62,   ['y'] = -229.89,   ['z'] = 38.06 },
	[19] = { ['x'] =  -204.85,   ['y'] = -1341.33,  ['z'] = 30.9 },
	[20] = { ['x'] =  1391.83,   ['y'] = 3606.07,   ['z'] = 38.95 },
	[21] = { ['x'] =  -614.25,   ['y'] = -297.41,   ['z'] = 39.77 },
	[22] = { ['x'] =  -808.47,   ['y'] = -179.55,   ['z'] = 37.57 },
	[23] = { ['x'] =  141.82,    ['y'] = -1705.88,  ['z'] = 29.3 },
	[24] = { ['x'] =  -618.43,   ['y'] = -267.46,   ['z'] = 38.8 },
	[25] = { ['x'] =  -1277.98,  ['y'] = -1119.21,  ['z'] = 7.0 },
	[26] = { ['x'] =  1931.34,   ['y'] = 3735.63,   ['z'] = 32.85 },
	[27] = { ['x'] =  1216.49,   ['y'] = -476.05, 	['z'] = 66.21 },
	[28] = { ['x'] =  -36.64,    ['y'] = -476.05, 	['z'] = 57.08 },
	[29] = { ['x'] =  301.36,    ['y'] = 203.01, 	['z'] = 104.4 },
	[30] = { ['x'] =  -276.23,   ['y'] = 6223.35, 	['z'] = 31.7 },
	[31] = { ['x'] =  -1213.11,  ['y'] = -336.07, 	['z'] = 37.8 },
	[32] = { ['x'] =  -355.34,   ['y'] = -53.2, 	['z'] = 49.05 }, 
	[33] = { ['x'] =  248.05,    ['y'] = 222.98,	['z'] = 106.29 },
	[34] = { ['x'] =  -642.13,   ['y'] = -246.39, 	['z'] = 38.19 },
	[35] = { ['x'] =  309.92,    ['y'] = -282.42, 	['z'] = 54.18 },
	[36] = { ['x'] =  -228.07,   ['y'] = 6334.12, 	['z'] = 32.42 },
	[37] = { ['x'] =  145.43,    ['y'] = -1043.99,  ['z'] = 29.38 },
	[38] = { ['x'] =  -1185.42,  ['y'] = -1412.42,  ['z'] = 4.45 },
	[39] = { ['x'] =  -2958.09,  ['y'] = 479.87,    ['z'] = 15.71 },
	[40] = { ['x'] =  -105.73,   ['y'] = 6470.64,   ['z'] = 31.63 },
	[41] = { ['x'] =  1178.07,   ['y'] = 2711.41,   ['z'] = 38.1 },
	[42] = { ['x'] =  -195.26,	 ['y'] = 6264.86,   ['z'] = 31.49 }, 
	[43] = { ['x'] =  931.91,	 ['y'] = 43.83,     ['z'] = 81.1 }, 
	[44] = { ['x'] =  -237.06,	 ['y'] = 6202.72,   ['z'] = 31.94 },
	[45] = { ['x'] =  -66.49,	 ['y'] = -802.7,    ['z'] = 44.23 },
	[46] = { ['x'] =  -1116.23,  ['y'] = -502.95,   ['z'] = 35.81 }, 
	[47] = { ['x'] =  -601.61,   ['y'] = -347.16,   ['z'] = 35.25 },
	[48] = { ['x'] =  -300.88,   ['y'] = 6256.49,   ['z'] = 31.5 },
	[49] = { ['x'] =  -622.74,   ['y'] = -249.77,   ['z'] = 38.53 } 
}
---
-- TRABALHAR
---
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if not servico then
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(CoordenadaX,CoordenadaY,CoordenadaZ)
			local distance = GetDistanceBetweenCoords(CoordenadaX,CoordenadaY,cdz,x,y,z,true)

			if distance <= 3 then
				DrawMarker(21,CoordenadaX,CoordenadaY,CoordenadaZ-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,255,230,100,100,0,0,0,1)
				if distance <= 1.5 then
					drawTxt("COLETAR INFORMAÇÕES DE ~r~IMPOSTO DE RENDA~w~",4,0.5,0.90,0.50,255,255,255,200)
					--drawTxt("PRESSIONE  ~r~E~w~  PARA ~y~INCIAR A COLETA",4,0.5,0.90,0.50,255,255,255,200)
					if IsControlJustPressed(0,38) and emP.checkPermission() then
						servico = true
						selecionado = math.random(49)
						CriandoBlip(locs,selecionado)
						TriggerEvent("Notify","sucesso","Roube os Impostos de Renda.")
					end
				end
			end
		end
	end
end)
---
-- ENTREGAS
---
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if servico then
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(locs[selecionado].x,locs[selecionado].y,locs[selecionado].z)
			local distance = GetDistanceBetweenCoords(locs[selecionado].x,locs[selecionado].y,cdz,x,y,z,true)
			
			if distance <= 3 then
				DrawMarker(21,locs[selecionado].x,locs[selecionado].y,locs[selecionado].z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,255,230,100,100,0,0,0,1)
				if distance <= 1.2 then
					drawTxt("PRESSIONE  ~r~E~w~  PARA ROUBAR IMPOSTO DE RENDA",4,0.5,0.90,0.50,255,255,255,200)
					if IsControlJustPressed(0,38) and emP.checkPermission() and not IsPedInAnyVehicle(ped) then
						if emP.checkPayment() then
							TriggerEvent('cancelando',true)
							RemoveBlip(blips)
							backentrega = selecionado
							processo = true
							segundos = 10
							vRP._playAnim(false,{{"oddjobs@shop_robbery@rob_till","loop"}},true)
							vRP._playAnim(false,{{"anim@heists@ornate_bank@grab_cash_heels","grab"}},true)
							TriggerEvent("progress",9000,"ROUBANDO IMPOSTO")
							while true do
								if backentrega == selecionado then
									selecionado = math.random(49)
								else
									break
								end
								Citizen.Wait(1)
							end
							CriandoBlip(locs,selecionado)
						end
					end
				end
			end
		end
	end
end)
---
-- CANCELAR
---
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
---
-- TIMERS
---
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if segundos > 0 then
			segundos = segundos - 1
			if segundos == 0 then
				processo = false
				TriggerEvent('cancelando',false)
				ClearPedTasks(PlayerPedId())
			end
		end
	end
end)
---
-- FUNÇÕES
---
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

function CriandoBlip(locs,selecionado)
	blips = AddBlipForCoord(locs[selecionado].x,locs[selecionado].y,locs[selecionado].z)
	SetBlipSprite(blips,1)
	SetBlipColour(blips,5)
	SetBlipScale(blips,0.4)
	SetBlipAsShortRange(blips,false)
	SetBlipRoute(blips,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Coletar Peças de Armas")
	EndTextCommandSetBlipName(blips)
end