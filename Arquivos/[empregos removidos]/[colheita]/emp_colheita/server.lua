local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
emP = {}
Tunnel.bindInterface("emp_colheita",emP)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS COLHEITA
-----------------------------------------------------------------------------------------------------------------------------------------
function emP.checkPayment()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        randgraos = math.random(4,7)
        if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("batata") <= vRP.getInventoryMaxWeight(user_id) then
            vRP.giveInventoryItem(user_id,"batata",parseInt(randgraos))
            TriggerClientEvent("Notify",source,"sucesso","Você recebeu <b>"..randgraos.."</b> Batatas.")
        else
            TriggerClientEvent("Notify",source,"negado","<b>Mochila</b> cheia.")
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS SEPARAR GRAOS
-----------------------------------------------------------------------------------------------------------------------------------------
function emP.checkGraos()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.getInventoryItemAmount(user_id,"batata") >= 3 then
			return true 
		else
			TriggerClientEvent("Notify",source,"negado","<b>Batatas</b> insuficientes.") 
			return false
		end
	end
end

function emP.separarGraos()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.tryGetInventoryItem(user_id,"batata",6) then
            rgraos = math.random(2,2)
            vRP.giveInventoryItem(user_id,"vodka",parseInt(rgraos))
            TriggerClientEvent("Notify",source,"sucesso","Você recebeu <b>"..rgraos.."</b> Vodkas.")
        end
    end
end