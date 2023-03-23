local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_strip")

RegisterServerEvent("vrp_strip:paga")
AddEventHandler("vrp_strip:paga", function()
	local source = source
	local user_id = vRP.getUserId({source})
    local preco = math.random(200,300)
  	if vRP.tryPayment({user_id,preco}) then
  		TriggerClientEvent("chatMessage", source, "[STRIP]", {255, 0, 0}, "Voce pagou " .. preco .. "reais pelo show de strip.")
  	else
  		TriggerClientEvent("chatMessage", source, "[STRIP]", {255, 0, 0}, "Voce nao possui dinheiro suficiente.")
  	end
end)