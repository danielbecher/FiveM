local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
func = {}
Tunnel.bindInterface("carteiro_entregas",func)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local quantidade = {}
function func.Quantidade()
	local source = source
	if quantidade[source] == nil then
	   quantidade[source] = math.random(5,8)	
	end
	   TriggerClientEvent("quantidade-encomenda",source,parseInt(quantidade[source]))
end

function func.checkPayment()
	func.Quantidade()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.tryGetInventoryItem(user_id,"encomenda",quantidade[source]) then
			randmoney = (math.random(55,65)*quantidade[source])
	        vRP.giveMoney(user_id,parseInt(randmoney))
	        TriggerClientEvent("vrp_sound:source",source,'coins',0.5)
	        TriggerClientEvent("Notify",source,"sucesso","Você recebeu <b>$"..vRP.format(parseInt(randmoney)).." reais</b>.")
			quantidade[source] = nil
			func.Quantidade()
			return true
		else
			TriggerClientEvent("Notify",source,"negado","Você precisa de <b>"..quantidade[source].."x Encomendas</b>.")
		end
	end
end