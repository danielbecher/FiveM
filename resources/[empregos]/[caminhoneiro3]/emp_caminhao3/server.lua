local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
emP = {}
Tunnel.bindInterface("emp_caminhao3",emP)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local gasolina = 1
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYLIST -- pagamento em R$800,00 por km rodado
-----------------------------------------------------------------------------------------------------------------------------------------
local paylist = {
	["gasolina"] = {
		[1] = { pay = 2056 },
		[2] = { pay = 2656 },
		[3] = { pay = 4416 },
		[4] = { pay = 1480 },
		[5] = { pay = 5592 },
		[6] = { pay = 5488 },
		[7] = { pay = 5336 },
		[8] = { pay = 5338 },
		[9] = { pay = 5336 },
		[10] = { pay = 8888 },
		[11] = { pay = 7616 },
		[12] = { pay = 4136 },
		[13] = { pay = 3392 },
		[14] = { pay = 2656 },
		[15] = { pay = 2856 },
		[16] = { pay = 1616 },
		[17] = { pay = 2736 },
		[18] = { pay = 2736 },
		[19] = { pay = 5728 },
		[20] = { pay = 5904 },
		[21] = { pay = 3984 },
		[22] = { pay = 4976 },
		[23] = { pay = 7224 },
		[24] = { pay = 9040 },
		[25] = { pay = 5224 },
		[26] = { pay = 5448 },
		[27] = { pay = 3192 }
	},
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKPAYMENT
-----------------------------------------------------------------------------------------------------------------------------------------
function emP.checkPayment(id,mod)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		vRP.giveMoney(user_id,parseInt(paylist[mod][id].pay))
		TriggerClientEvent("vrp_sound:source",source,'coins',0.5)
		TriggerClientEvent("Notify",source,"sucesso","Você recebeu <b>$"..vRP.format(parseInt(paylist[mod][id].pay)).." reais</b>.")
		if mod == "gasolina" then
			local value = vRP.getSData("meta:concessionaria")
			local metas = json.decode(value) or 0
			if metas then
				vRP.setSData("meta:concessionaria",json.encode(parseInt(metas+1)))
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TIMERS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(300000)
		gasolina = math.random(#paylist["gasolina"])
		end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETTRUCKPOINT
-----------------------------------------------------------------------------------------------------------------------------------------
function emP.getTruckpoint(point)
	if point == "gasolina" then
		return parseInt(gasolina)
	end
end