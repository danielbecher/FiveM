local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
emP = Tunnel.getInterface("emp_desmanche")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local segundos = 0
local roubando = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAIS 1534.087890625,1703.3936767578,109.71985626221
-----------------------------------------------------------------------------------------------------------------------------------------
local locais = {
	--{ ['x'] = 935.86, ['y'] = -940.81, ['z'] = 39.90, ['perm'] = "mecanico.permissao" },
	--{ ['x'] = -198.93, ['y'] = -1324.25, ['z'] = 31.70, ['perm'] = "speed.permissao" }
	--{ ['x'] = 1534.08, ['y'] = 1703.39, ['z'] = 109.71, ['perm'] = "desmanche.permissao" }
	{ ['x'] = 735.14, ['y'] = -1081.0, ['z'] = 22.17, ['perm'] = "chefe.permissao" } -- Permissão temporária enquanto a mecânica faz RP de Desmanche
	--{ ['x'] = 2340.87, ['y'] = 3050.18, ['z'] = 48.16, ['perm'] = "desmanche.permissao" }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- DESMANCHE
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if not roubando then
			for _,v in pairs(locais) do
				local ped = PlayerPedId()
				local x,y,z = table.unpack(v)
				local distance = GetDistanceBetweenCoords(GetEntityCoords(ped),v.x,v.y,v.z)
				if distance <= 5 and GetPedInVehicleSeat(GetVehiclePedIsUsing(ped),-1) == ped then
					DrawMarker(36,v.x,v.y,v.z-0.96,0,0,0,0,0,0,1.0,1.0,1.0,250,100,50,150,0,0,0,1)
					if distance <= 3.1 and IsControlJustPressed(0,38) then
						if emP.checkVehicle() and emP.checkPermission(v.perm) then
							roubando = true
							segundos = 60
							FreezeEntityPosition(GetVehiclePedIsUsing(ped),true)

							repeat
								Citizen.Wait(10)
							until segundos == 0

							TriggerServerEvent("desmancheVehicles2025")
							roubando = false
						end
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TEXTO
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if roubando then
			if segundos > 0 then
				DisableControlAction(0,75)
				drawTxt("AGUARDE ~g~"..segundos.." SEGUNDOS~w~, ESTAMOS DESATIVANDO O ~y~RASTREADOR ~w~DO VEÍCULO",4,0.5,0.90,0.50,255,255,255,200)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DIMINUINDO O TEMPO
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if roubando then
			if segundos > 0 then
				segundos = segundos - 1
			end
		end
	end
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