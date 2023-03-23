local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
emP = Tunnel.getInterface("emp_taxiaereo")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = nil
local selecionado = 0
local emservico = false
local CoordenadaX = 2122.35
local CoordenadaY = 4784.71
local CoordenadaZ =  40.98
local passageiro = nil
local lastpassageiro = nil
local checkped = true
local timers = 0
local payment = 1 --10
-- 896.48, -177.45, 74.70
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCALIDADES
-----------------------------------------------------------------------------------------------------------------------------------------
local locs = {
	[1] = { ['x'] = 1737.35, ['y'] = 3292.19, ['z'] = 41.16, ['xp'] = 1745.71, ['yp'] = 3299.34, ['zp'] = 41.23, ['h'] = 252.0},
	[2] = { ['x'] = -1135.46, ['y'] = -2931.91, ['z'] = 13.95,['xp'] = -1126.51, ['yp'] = -2942.24, ['zp'] = 13.95, ['h'] = 252.0 },
	--[4] = { ['x'] = -1277.13, ['y'] = -3372.01, ['z'] = 13.95,['xp'] = -1294.77, ['yp'] = -3363.21, ['zp'] = 13.95, ['h'] = 252.0 },
	--[5] = { ['x'] = -1380.30, ['y'] = -2570.37, ['z'] = 13.95,['xp'] = -1393.93, ['yp'] = -2601.02, ['zp'] = 13.95, ['h'] = 252.0 },
	--[3] = { ['x'] = -1989.77, ['y'] = 3063.09, ['z'] = 32.82,['xp'] = -1981.58, ['yp'] = 3044.69, ['zp'] = 32.82, ['h'] = 252.0 },
	[3] = { ['x'] = -2136.23, ['y'] = 3259.80, ['z'] = 32.82,['xp'] = -2163.42, ['yp'] = 3244.16, ['zp'] = 32.82, ['h'] = 252.0 },
}

-----------------------------------------------------------------------------------------------------------------------------------------
-- PEDLIST
-----------------------------------------------------------------------------------------------------------------------------------------
local pedlist = {
	[1] = { ['model'] = "ig_abigail", ['hash'] = 0x400AEC41 },
	[2] = { ['model'] = "a_m_o_acult_02", ['hash'] = 0x4BA14CCA },
	[3] = { ['model'] = "a_m_m_afriamer_01", ['hash'] = 0xD172497E },
	[4] = { ['model'] = "ig_mp_agent14", ['hash'] = 0xFBF98469 },
	[5] = { ['model'] = "u_m_m_aldinapoli", ['hash'] = 0xF0EC56E2 },
	[6] = { ['model'] = "ig_amandatownley", ['hash'] = 0x6D1E15F7 },
	[7] = { ['model'] = "ig_andreas", ['hash'] = 0x47E4EEA0 },
	[8] = { ['model'] = "csb_anita", ['hash'] = 0x0703F106 },
	[9] = { ['model'] = "u_m_y_antonb", ['hash'] = 0xCF623A2C },
	[10] = { ['model'] = "g_m_y_armgoon_02", ['hash'] = 0xC54E878A },
	--[11] = { ['model'] = "ig_ashley", ['hash'] = 0x7EF440DB },
	--[12] = { ['model'] = "s_m_m_autoshop_01", ['hash'] = 0x040EABE3 },
	--[13] = { ['model'] = "g_m_y_ballaeast_01", ['hash'] = 0xF42EE883 },
	--[14] = { ['model'] = "g_m_y_ballaorig_01", ['hash'] = 0x231AF63F },
	--[15] = { ['model'] = "s_m_y_barman_01", ['hash'] = 0xE5A11106 },
	--[16] = { ['model'] = "u_m_y_baygor", ['hash'] = 0x5244247D },
	--[17] = { ['model'] = "a_m_o_beach_01", ['hash'] = 0x8427D398 },
	--[18] = { ['model'] = "a_m_y_beachvesp_01", ['hash'] = 0x7E0961B8 },
	--[19] = { ['model'] = "ig_bestmen", ['hash'] = 0x5746CD96 },
	--[20] = { ['model'] = "a_f_y_bevhills_01", ['hash'] = 0x445AC854 },
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRABALHAR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if not emservico then
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(CoordenadaX,CoordenadaY,CoordenadaZ)
			local distance = GetDistanceBetweenCoords(CoordenadaX,CoordenadaY,cdz,x,y,z,true)

			if distance <= 20 then
				DrawMarker(21,CoordenadaX,CoordenadaY,CoordenadaZ-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,255,230,100,100,0,0,0,1)
				if distance <= 2 then
					drawTxt("PRESSIONE  ~r~E~w~  PARA INICIAR O ~y~EXPEDIENTE",4,0.5,0.90,0.50,255,255,255,200)
					if IsControlJustPressed(0,38) then
						--emP.addGroup()
						emservico = true
						selecionado = math.random(#locs)
						CriandoBlip(locs,selecionado)
						TriggerEvent("Notify","sucesso","Você entrou em serviço.")
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PASSAGEIRO
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if emservico then
			local ped = PlayerPedId()
			local vehicle = GetVehiclePedIsUsing(ped)
			--local vehiclespeed = GetEntitySpeed(vehicle)*2.236936
			local vehiclespeed = GetEntitySpeed(vehicle)*3.605936
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(locs[selecionado].x,locs[selecionado].y,locs[selecionado].z)
			local distance = GetDistanceBetweenCoords(locs[selecionado].x,locs[selecionado].y,cdz,x,y,z,true)

			if distance <= 50.0 and IsVehicleModel(vehicle,GetHashKey("velum2")) then
				DrawMarker(21,locs[selecionado].x,locs[selecionado].y,locs[selecionado].z+0.20,0,0,0,0,180.0,130.0,2.0,2.0,1.0,255,230,100,100,1,0,0,1)
				if distance <= 2.5 then
					if IsControlJustPressed(0,38) --[[and emP.checkPermission() and (GetEntityHeading(ped) >= locs[selecionado].h-20.0 and GetEntityHeading(ped) <= locs[selecionado].h+20.0)]] then
						RemoveBlip(blips)
						FreezeEntityPosition(vehicle,true)
						if DoesEntityExist(passageiro) then
							emP.checkPayment(payment)
							Citizen.Wait(3000)
							TaskLeaveVehicle(passageiro,vehicle,262144)
							TaskWanderStandard(passageiro,10.0,10)
							Citizen.Wait(1100)
							SetVehicleDoorShut(vehicle,3,0)
							Citizen.Wait(1000)
						end

						if checkped then
							local pmodel = math.random(#pedlist)
							modelRequest(pedlist[pmodel].model)

							passageiro = CreatePed(4,pedlist[pmodel].hash,locs[selecionado].xp,locs[selecionado].yp,locs[selecionado].zp,3374176,true,false)
							SetEntityInvincible(passageiro,true)
							TaskEnterVehicle(passageiro,vehicle,-1,2,1.0,1,0)
							checkped = false
							payment = 1 --10
							lastpassageiro = passageiro
						else
							passageiro = nil
							checkped = true
							FreezeEntityPosition(vehicle,false)
						end

						lselecionado = selecionado
						while true do
							if lselecionado == selecionado then
								selecionado = math.random(#locs)
							else
								break
							end
							Citizen.Wait(1)
						end

						CriandoBlip(locs,selecionado)

						if DoesEntityExist(passageiro) then
							while true do
								Citizen.Wait(1)
								local x2,y2,z2 = table.unpack(GetEntityCoords(passageiro))
								if not IsPedSittingInVehicle(passageiro,vehicle) then
									DrawMarker(21,x2,y2,z2+1.3,0,0,0,0,180.0,130.0,0.6,0.8,0.5,250,100,50,150,1,0,0,1)
								end
								if IsPedSittingInVehicle(passageiro,vehicle) then
									FreezeEntityPosition(vehicle,false)
									break
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
-- TIMERS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if emservico then
			if timers > 0 then
				timers = timers - 1
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVENPCS
-----------------------------------------------------------------------------------------------------------------------------------------
function removePeds()
	SetTimeout(20000,function()
		if emservico and lastpassageiro and passageiro == nil then
			TriggerServerEvent("trydeleteped",PedToNet(lastpassageiro))
		end
	end)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CANCELAR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if emservico then
			local vehicle = GetVehiclePedIsIn(PlayerPedId())
			if IsControlJustPressed(0,168) then
				RemoveBlip(blips)
				if DoesEntityExist(passageiro) then
					TaskLeaveVehicle(passageiro,vehicle,262144)
					TaskWanderStandard(passageiro,10.0,10)
					Citizen.Wait(1100)
					SetVehicleDoorShut(vehicle,3,0)
					FreezeEntityPosition(vehicle,false)					
				end
				blips = nil
				selecionado = 0
				passageiro = nil
				checkped = true
				emservico = false
				emP.removeGroup()
				TriggerEvent("Notify","aviso","Você saiu de serviço.")
			end
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- TAXIMETRO
-----------------------------------------------------------------------------------------------------------------------------------------
function openGui()
	SendNUIMessage({openMeter = true})
  end
  
  function closeGui()
	SendNUIMessage({openMeter = false})
	meterOpen = false
  end
  
  Citizen.CreateThread(function()
	while true do
	  Citizen.Wait(1000)
	  local ped = PlayerPedId()
	  local veh = GetVehiclePedIsIn(ped, false)
	  if NoTaxi() and GetPedInVehicleSeat(veh, -1) ~= ped then
		local ped = PlayerPedId()
		local veh = GetVehiclePedIsIn(ped, false)
		TriggerEvent('taxi:updatebandeira', veh)
		openGui()
		meterOpen = true
	  end
	  if meterActive and GetPedInVehicleSeat(veh, -1) == ped then
		local _bandeira = DecorGetFloat(veh, "bandeiras")
		local _kilometros = DecorGetFloat(veh, "kilometros")
		local _Custobandeira = DecorGetFloat(veh, "Custobandeira")
  
		if _Custobandeira ~= 0 then
		  DecorSetFloat(veh, "bandeiras", _bandeira + _Custobandeira)
		else
		  DecorSetFloat(veh, "bandeiras", _bandeira + Custobandeira)
		end
		DecorSetFloat(veh, "kilometros", _kilometros + round(GetEntitySpeed(veh) * 0.000621371, 5))
		TriggerEvent('taxi:updatebandeira', veh)
	  end
	  if NoTaxi() and not GetPedInVehicleSeat(veh, -1) == ped then
		TriggerEvent('taxi:updatebandeira', veh)
	  end
	end
  end)
  
  if TaxiGuiAtivo then
	Citizen.CreateThread(function()
	  while true do
		Citizen.Wait(5)
		if(NoTaxi()) then
		  inTaxi = true
		  local ped = PlayerPedId()
		  local veh = GetVehiclePedIsIn(ped, false)
		  if(NoTaxi() and GetPedInVehicleSeat(veh, -1) == ped) then
			if IsControlJustReleased(0,170) --[[and emP.checkPermission()]] then -- F3
			  TriggerEvent('taxi:toggleDisplay')
			  Citizen.Wait(100)
			end
			if IsControlJustReleased(0,288) --[[and emP.checkPermission()]] then -- F1
			  TriggerEvent('taxi:toggleHire')
			  Citizen.Wait(100)
			end
			if IsControlJustReleased(0,289) --[[and emP.checkPermission()]] then -- F2
			  TriggerEvent('taxi:resetMeter')
			  Citizen.Wait(100)
			end
		  end
		else
		  if(meterOpen) then
			closeGui()
		  end
		  meterOpen = false
		end
	  end
	end)
  end
  
  function round(num, numDecimalPlaces)
	local mult = 5^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
  end
  
  --Métodos de retorno de chamada NUI
  RegisterNUICallback('close', function(data, cb)
	closeGui()
	cb('ok')
  end)
  
  RegisterNetEvent('taxi:toggleDisplay')
  AddEventHandler('taxi:toggleDisplay', function()
	local ped = PlayerPedId()
	local veh = GetVehiclePedIsIn(ped, false)
	if(NoTaxi() and GetPedInVehicleSeat(veh, -1) == ped) then
	  if meterOpen then
		closeGui()
		meterOpen = false
	  else
		local _bandeira = DecorGetFloat(veh, "bandeiras")
		if _bandeira < CustoBase then
		  DecorSetFloat(veh, "bandeiras", CustoBase)
		end
		TriggerEvent('taxi:updatebandeira', veh)
		openGui()
		meterOpen = true
	  end
	end
  end)
  
  RegisterNetEvent('taxi:toggleHire')
  AddEventHandler('taxi:toggleHire', function()
	local ped = PlayerPedId()
	local veh = GetVehiclePedIsIn(ped, false)
	if(NoTaxi() and GetPedInVehicleSeat(veh, -1) == ped) then
	  if meterActive then
		SendNUIMessage({meterActive = false})
		meterActive = false
		DecorSetBool(veh, "meteractive", false)
	  else
		SendNUIMessage({meterActive = true})
		meterActive = true
		DecorSetBool(veh, "meteractive", true)
	  end
	end
  end)
  
  RegisterNetEvent('taxi:resetMeter')
  AddEventHandler('taxi:resetMeter', function()
	local ped = PlayerPedId()
	local veh = GetVehiclePedIsIn(ped, false)
	if(NoTaxi() and GetPedInVehicleSeat(veh, -1) == ped) then
	  local _bandeira = DecorGetFloat(veh, "bandeiras")
	  local _kilometros = DecorGetFloat(veh, "kilometros")
	  DecorSetFloat(veh, "CustoBase", CustoBase)
	  DecorSetFloat(veh, "custoporKm", custoporKm)
	  DecorSetFloat(veh, "Custobandeira", Custobandeira)
	  DecorSetFloat(veh, "bandeiras", DecorGetFloat(veh, "CustoBase"))
	  DecorSetFloat(veh, "kilometros", 0.0)
	  TriggerEvent('taxi:updatebandeira', veh)
	end
  end)
  
  function IsInVehicle()
	local ply = PlayerPedId()
	if IsPedSittingInAnyVehicle(ply) then
	  return true
	else
	  return false
	end
  end
  
  function NoTaxi()
	local ped = PlayerPedId()
	local veh = GetVehiclePedIsIn(ped, false)
	local model = GetEntityModel(veh)
	local displaytext = GetDisplayNameFromVehicleModel(model)
	local name = GetLabelText(displaytext)
	if (name == "Táxi") then
	  return true
	else
	  return false
	end
  end
  
  function ReturnVehicle()
	local ped = PlayerPedId()
	local veh = GetVehiclePedIsIn(ped, false)
	local model = GetEntityModel(veh)
	local displaytext = GetDisplayNameFromVehicleModel(model)
	local name = GetLabelText(displaytext)
  end
  
  function IsNearPlayer(player)
	local ply = PlayerPedId()
	local plyCoords = GetEntityCoords(ply, 0)
	local ply2 = GetPlayerPed(GetPlayerFromServerId(player))
	local ply2Coords = GetEntityCoords(ply2, 0)
	local distance = GetDistanceBetweenCoords(ply2Coords["x"], ply2Coords["y"], ply2Coords["z"],  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
	if(distance <= 5) then
	  return true
	end
  end
  
  RegisterNetEvent('taxi:updatebandeira')
  AddEventHandler('taxi:updatebandeira', function(veh)
	local id = PlayerId()
	local playerName = GetPlayerName(id)
	local _bandeira = DecorGetFloat(veh, "bandeiras")
	local _kilometros = DecorGetFloat(veh, "kilometros")
	local Custobandeira = _bandeira + (_kilometros * DecorGetFloat(veh, "custoporKm"))
  
  
	SendNUIMessage({
	  updateBalance = true,
	  balance = string.format("%.2f", Custobandeira),
	  player = string.format("%.2f", _kilometros),
	  meterActive = DecorGetBool(veh, "meteractive")
	})
  end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
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

function modelRequest(model)
	RequestModel(GetHashKey(model))
	while not HasModelLoaded(GetHashKey(model)) do
		Citizen.Wait(10)
	end
end

function CriandoBlip(locs,selecionado)
	blips = AddBlipForCoord(locs[selecionado].x,locs[selecionado].y,locs[selecionado].z)
	SetBlipSprite(blips,1)
	SetBlipColour(blips,5)
	SetBlipScale(blips,0.4)
	SetBlipAsShortRange(blips,false)
	SetBlipRoute(blips,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Rota de Taxi Aéreo")
	EndTextCommandSetBlipName(blips)
end