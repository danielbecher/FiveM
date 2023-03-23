local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")

siS = {}
Tunnel.bindInterface("vrp_cftv",siS)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[ FUNÇÃO ]-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function siS.Permissao()
	local source = source
	local user_id = vRP.getUserId(source)

	if vRP.hasPermission(user_id,"pcivil.permissao") or vRP.hasPermission(user_id,"admin.permissao") then
		return true
	else

	end
end
