local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
emP = Tunnel.getInterface("emp_hospital")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local macas = {
	{ ['x'] = 308.85, ['y'] = -581.63, ['z'] = 43.28, ['x2'] = 307.65, ['y2'] = -581.80, ['z2'] = 44.20, ['h'] = 165.0 },
	{ ['x'] = 312.19, ['y'] = -582.86, ['z'] = 43.28, ['x2'] = 310.91, ['y2'] = -583.00, ['z2'] = 44.20, ['h'] = 165.0 },
	{ ['x'] = 315.56, ['y'] = -584.12, ['z'] = 43.28, ['x2'] = 314.27, ['y2'] = -584.39, ['z2'] = 44.20, ['h'] = 165.0 },
	{ ['x'] = 318.67, ['y'] = -585.39, ['z'] = 43.28, ['x2'] = 317.62, ['y2'] = -585.63, ['z2'] = 44.20, ['h'] = 165.0 },
	{ ['x'] = 321.98, ['y'] = -586.34, ['z'] = 43.28, ['x2'] = 322.57, ['y2'] = -587.52, ['z2'] = 44.21, ['h'] = 165.0 },
	{ ['x'] = 322.95, ['y'] = -582.87, ['z'] = 43.28, ['x2'] = 324.18, ['y2'] = -582.53, ['z2'] = 44.20, ['h'] = 330.0 },
	{ ['x'] = 318.44, ['y'] = -580.72, ['z'] = 43.28, ['x2'] = 319.43, ['y2'] = -580.70, ['z2'] = 44.20, ['h'] = 330.0 },
	{ ['x'] = 314.77, ['y'] = -579.44, ['z'] = 43.28, ['x2'] = 313.94, ['y2'] = -578.66, ['z2'] = 44.20, ['h'] = 330.0 },
	{ ['x'] = 310.25, ['y'] = -577.99, ['z'] = 43.28, ['x2'] = 309.27, ['y2'] = -577.04, ['z2'] = 44.20, ['h'] = 330.0 },
	{ ['x'] = 360.94, ['y'] = -582.09,['z'] = 43.28, ['x2'] = 361.32, ['y2'] = -581.36, ['z2'] = 43.00, ['h'] = 248.40 },
	--[[{ ['x'] = 359.63, ['y'] = -585.27,['z'] = 43.28, ['x2'] = 359.52, ['y2'] = -586.04, ['z2'] = 43.00, ['h'] = 248.40 },
	{ ['x'] = 366.12, ['y'] = -582.40,['z'] = 43.28, ['x2'] = 366.51, ['y2'] = -581.70, ['z2'] = 43.00, ['h'] = 248.40 },
	{ ['x'] = 365.09, ['y'] = -584.94,['z'] = 43.28, ['x2'] = 364.91, ['y2'] = -585.80, ['z2'] = 43.00, ['h'] = 248.40 },
	{ ['x'] = 364.13, ['y'] = -588.15,['z'] = 43.28, ['x2'] = 363.71, ['y2'] = -589.18, ['z2'] = 43.00, ['h'] = 248.40 },
	{ ['x'] = 354.00, ['y'] = -600.92,['z'] = 43.28, ['x2'] = 354.45, ['y2'] = -600.23, ['z2'] = 43.00, ['h'] = 248.40 }
	--[[{ ['x'] = 347.97, ['y'] = -579.19,['z'] = 43.88, ['x2'] = 348.48, ['y2'] = -579.59, ['z2'] = 43.00, ['h'] = 336.45 },
	{ ['x'] = 336.35, ['y'] = -575.07,['z'] = 43.28, ['x2'] = 337.05, ['y2'] = -575.00, ['z2'] = 43.00, ['h'] = 336.45 },
	{ ['x'] = 326.26, ['y'] = -570.82,['z'] = 43.28, ['x2'] = 326.65, ['y2'] = -570.89, ['z2'] = 43.00, ['h'] = 336.45 },
	{ ['x'] = 320.33, ['y'] = -568.24,['z'] = 43.28, ['x2'] = 321.05, ['y2'] = -568.25, ['z2'] = 43.00, ['h'] = 336.45 },
	{ ['x'] = 314.54, ['y'] = -566.18,['z'] = 43.28, ['x2'] = 315.57, ['y2'] = -566.18, ['z2'] = 43.00, ['h'] = 336.45 },
	{ ['x'] = 439.24, ['y'] = -976.56,['z'] = 26.66, ['x2'] = 438.25, ['y2'] = -976.25, ['z2'] = 27.00, ['h'] = 350.0 }]]
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- DEITANDO
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		for k,v in pairs(macas) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
			local distance = GetDistanceBetweenCoords(v.x,v.y,cdz,x,y,z,true)
			if distance <= 1.1 then
				drawTxt("~r~E~w~  DEITAR    ~g~G~w~  TRATAMENTO",4,0.5,0.90,0.50,255,255,255,200)
				if IsControlJustPressed(0,38) then
					SetEntityCoords(ped,v.x2,v.y2,v.z2)
					SetEntityHeading(ped,v.h)
					vRP._playAnim(false,{{"amb@world_human_sunbathe@female@back@idle_a","idle_a"}},true)
				end
				if IsControlJustPressed(0,47) then
					if emP.checkServices() then
						TriggerEvent('tratamento-macas')
						TriggerEvent('resetDiagnostic')
						TriggerEvent('resetWarfarina')
						SetEntityCoords(ped,v.x2,v.y2,v.z2)
						SetEntityHeading(ped,v.h)
						vRP._playAnim(false,{{"amb@world_human_sunbathe@female@back@idle_a","idle_a"}},true)
					else
						TriggerEvent("Notify","aviso","Existem paramédicos em serviço.")
					end
				end
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

RegisterNetEvent('tratamento-macas')
AddEventHandler('tratamento-macas',function()
	TriggerEvent("cancelando",true)
	repeat
		SetEntityHealth(PlayerPedId(),GetEntityHealth(PlayerPedId())+1)
		Citizen.Wait(250)
	until GetEntityHealth(PlayerPedId()) >= 400 or GetEntityHealth(PlayerPedId()) <= 100
		if emP.checkPayment() then
			TriggerEvent("Notify","sucesso","Você pagou R$1.500")
		end
	TriggerEvent("Notify","importante","Tratamento concluido.")
	TriggerEvent("cancelando",false)
end)