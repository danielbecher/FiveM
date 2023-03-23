-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
-----------------------------------------------------------------------------------------------------------------------------------------
src = {}
Tunnel.bindInterface("nav_hospital",src)
vCLIENT = Tunnel.getInterface("nav_hospital")
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMEDIOS
-----------------------------------------------------------------------------------------------------------------------------------------
local remedios = {
	["dorflex"] = { ['price'] = 0 },
	["cicatricure"] = { ['price'] = 0 },
	["dipiroca"] = { ['price'] = 0 },
	["nocucedin"] = { ['price'] = 0 },
	["paracetanal"] = { ['price'] = 0 },
	["decupramim"] = { ['price'] = 0 },
	["buscopau"] = { ['price'] = 0 },
	["navagina"] = { ['price'] = 0 },
	["analdor"] = { ['price'] = 0 },
	["sefodex"] = { ['price'] = 0 },
	["nokusin"] = { ['price'] = 0 },
	["glicoanal"] = { ['price'] = 0 },
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CURATIVOS
-----------------------------------------------------------------------------------------------------------------------------------------
local curativos = {
	--["bandagem"] = { ['price'] = 1000 },
	["xerelto"] = { ['price'] = 500 },
	["coumadin"] = { ['price'] = 500 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMEDIOSLIST
-----------------------------------------------------------------------------------------------------------------------------------------
function src.remediosList()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local itemlist = {}
		for k,v in pairs(remedios) do
			table.insert(itemlist,{ index = k, name = vRP.itemNameList(k), price = parseInt(v.price) })
		end
		return itemlist
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- VESTUARIOLIST
-----------------------------------------------------------------------------------------------------------------------------------------
function src.curativosList()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local itemlist = {}
		for k,v in pairs(curativos) do
			table.insert(itemlist,{ index = k, name = vRP.itemNameList(k), price = parseInt(v.price) })
		end
		return itemlist
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPBUY
-----------------------------------------------------------------------------------------------------------------------------------------
function src.shopBuy(index,price,amount)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(index)*parseInt(amount) <= vRP.getInventoryMaxWeight(user_id) then
			if vRP.getPremium(user_id) then
				if vRP.tryFullPayment(user_id,parseInt(price*amount)*0.95) then
					vRP.giveInventoryItem(user_id,index,parseInt(amount))
					TriggerClientEvent("Notify",source,"sucesso","Comprou <b>"..vRP.format(parseInt(amount)).."x "..vRP.itemNameList(index).."</b> por <b>R$"..vRP.format(parseInt((price*amount)*0.95)).." reais</b>.",8000)
				else
					TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.",8000)
				end
			else
				if vRP.tryFullPayment(user_id,parseInt(price*amount)) then
					vRP.giveInventoryItem(user_id,index,parseInt(amount))
					TriggerClientEvent("Notify",source,"sucesso","Comprou <b>"..vRP.format(parseInt(amount)).."x "..vRP.itemNameList(index).."</b> por <b>$"..vRP.format(parseInt(price*amount)).." reais</b>.",8000)
				else
					TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.",8000)
				end
			end
		else
			TriggerClientEvent("Notify",source,"negado","<b>Mochila</b> cheia.",8000)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKSEARCH
-----------------------------------------------------------------------------------------------------------------------------------------
function src.checkPermission()
  local source = source
  local user_id = vRP.getUserId(source)
  return vRP.hasPermission(user_id,"paramedico.permissao")
end