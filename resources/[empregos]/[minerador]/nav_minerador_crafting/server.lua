local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- ARRAY
-----------------------------------------------------------------------------------------------------------------------------------------
local valores = {
	["bronze"] = { venda = 390 }, --185  --520
	["ferro"] = { venda = 450 }, --200  --460
	["ouro"] = { venda = 420 }, --170   --480
	["rubi"] = { venda = 435 }, --175   --500
	["esmeralda"] = { venda = 360 }, --190   --530
	["safira"] = { venda = 390 }, --150   --440
	["diamante"] = { venda = 360 }, --200  --580
	["topazio"] = { venda = 300 }, --170   --480
	["ametista"] = { venda = 390 }  --190  --530
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CRAFTING
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("minerador-crafting")
AddEventHandler("minerador-crafting",function(item)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.tryGetInventoryItem(user_id,item,3) then
			vRP.giveInventoryItem(user_id,item.."2",1)
			TriggerClientEvent("Notify",source,"sucesso","Forjou <b>3x "..vRP.itemNameList(item).."</b> em <b>1x "..vRP.itemNameList(item.."2").."</b>.")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VENDER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("minerador-vender")
AddEventHandler("minerador-vender",function(item)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.tryGetInventoryItem(user_id,item.."2",1) then
			TriggerClientEvent("Notify",source,"sucesso","Vendeu <b>1x "..vRP.itemNameList(item.."2").."</b> por <b>$"..parseInt(valores[item].venda).." dólares</b>.")
			vRP.giveMoney(user_id,valores[item].venda)
		end
	end
end)