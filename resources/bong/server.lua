local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
func = {}
Tunnel.bindInterface("bong",func)

function func.checkbong()
	local source = source
	local user_id = vRP.getUserId(source)
	if vRP.tryGetInventoryItem(user_id,"maconha",10) then
		TriggerClientEvent("Notify",source,"sucesso","Fumando um Bong Pesado.")

		return true
	else
		TriggerClientEvent("Notify",source,"aviso","Precisa de mais erva.")
	end
end