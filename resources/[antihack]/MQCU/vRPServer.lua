Tunnel = module("vrp", "lib/Tunnel")
Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP")

Citizen.CreateThread(function()
	ac_webhook_anthack = "https://discordapp.com/api/webhooks/763402382088208404/eX9g_xHmGWJ8oBmX_v_G7b36AUZrLNnwjTQMf33HHABHFSfHCKYWtRT304Gd2tiGeoL9"
	ac_webhook_logprop = "https://discordapp.com/api/webhooks/763402480431923230/UUYRR4qBHw0mzXnUh-dNkeghM6frLxHVo3RV1hE_9jP2shu7CeVrJmJVHPnbGw7KeOYj"	
	function SendWebhookMessage(webhook,message)
		if webhook ~= "none" then
			PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
		end
	end
end)
--1
AddEventHandler("MCU:getUserId", function(source,cb)	
	cb(vRP.getUserId(source))
end)
--2
AddEventHandler("MCU:getUserIdByIdentifier", function(ids,cb)	
	cb(vRP.getUserIdByIdentifier(ids))
end)
--3
AddEventHandler("MCU:isBanned", function(user_id,cb)	
	cb(vRP.isBanned(user_id))
end)
--4
AddEventHandler("MCU:getUserSource", function(user_id,cb)	
	cb(vRP.getUserSource(user_id))
end)
--5
AddEventHandler("MCU:getSData", function(key,cb)		
	cb(vRP.getSData(key))	
end)
--6
AddEventHandler("MCU:setSData", function(key,data)		
	vRP.setSData(key, data)
end)
--7
AddEventHandler("MCU:getGen", function(source,cb)		
	cb(vRPclient.getGen(source))
end)
--8
AddEventHandler("MCU:isHandcuffed", function(source,cb)		
	cb(vRPclient.isHandcuffed(source))
end)
--9
AddEventHandler("MCU:getCustomization", function(source,cb)
	local customization = vRPclient.getCustomization(source)
	cb(customization)
end)
--10
AddEventHandler("MCU:hasPermission", function(user_id,permissao,cb)
	cb(vRP.hasPermission(user_id,permissao))
end)
--11
AddEventHandler("MCU:tryPayment", function(user_id,valor,cb)
	cb(vRP.tryPayment(user_id,valor))
end)
--12
AddEventHandler("MCU:tryFullPayment", function(user_id,valor,cb)
	cb(vRP.tryFullPayment(user_id,valor))
end)
--13
AddEventHandler("MCU:getUData", function(user_id,key,cb)
	cb(vRP.getUData( user_id,key))	
end)

---------------------------------------------------------------------------------------------------
------------------------------            return void              --------------------------------
---------------------------------------------------------------------------------------------------
--1
AddEventHandler("MCU:setUData", function(user_id,key,data)
	 vRP.setUData(user_id,key, data)	
end)
--2
AddEventHandler("MCU:giveMoney", function(user_id,value)
	 vRP.giveMoney(user_id,value,"[MQCU]")
end)
--3
AddEventHandler("MCU:giveBankMoney", function(user_id,value)
	 vRP.giveBankMoney(user_id,value,"[MQCU]")
end)
--4
AddEventHandler("MCU:setCustomization", function(source,index,p1,p2,p3)
	local customization = vRPclient.getCustomization(source)
	customization[index]={p1,p2,p3}
	vRPclient.setCustomization(source,customization)
end)
--5
AddEventHandler("MCU:toggleHandcuff", function(source)
	vRPclient.toggleHandcuff(source)
end)
--6
AddEventHandler("MCU:playAnim", function(source,v1,v2,v3,v4,v5)	
	vRPclient.playAnim(source,v1,{{v2,v3,v4}},v5)
end)
--7
AddEventHandler("MCU:notify", function(source,msg)
	TriggerClientEvent("Notify",source,"importante",msg)
end)
--8

local sistemas = {}
sistemas["[COLETE_HACK]"]=true
sistemas["[ColeteHack]"]=true
sistemas["[OUTROS-CLIENT]"]=true
sistemas["[SPECTADOR]"]=true
sistemas["[WALL]"]=true
sistemas["[Outros]"]=true
sistemas["[EXPLOSAO]"]=true
sistemas["[EXPLOSAO2]"]=true
sistemas["[Monster_Injetado]"]=false
sistemas["[Monster_Injetado2]"]=false
sistemas["[Monster_Injetado3]"]=false
sistemas["[Monster_Diretor]"]=true
sistemas["[PROP]"]=true
sistemas["[NOCLIP]"]=false
sistemas["[GODMOD]"]=false
sistemas["[MODMENU]"]=true
sistemas["OUTROS2"]=false

local banidos = {}
AddEventHandler("MQCU:LixoDetectado", function(user_id,msg,cb)
	if(sistemas[msg]~=nil)then
		if(sistemas[msg]==true)then
			if(banidos[user_id]==nil)then
				banidos[user_id]=true
				local id = user_id
				local source = vRP.getUserSource(user_id)
				local x,y,z = vRPclient.getPosition(source)
				local reason = "ANTI HACK: 	localização:	"..x..","..y..","..z
				vRP.setBanned(id,true)					
				local temp = os.date("%x  %X")
				--vRP.logs("savedata/BANIMENTOS.txt","ANTI HACK	[ID]: "..id.."		"..temp.."[BAN]		[MOTIVO:"..msg.."]	"..reason)
				SendWebhookMessage(ac_webhook_anthack, "ANTI HACK	[ID]: "..id.."		"..temp.."[BAN]		[MOTIVO:"..msg.."]	"..reason)
				local source = vRP.getUserSource(id)
				if source ~= nil then	
					TriggerClientEvent("vrp_sound:source",source,"ban",1.0)
					Citizen.Wait(1000)
					vRP.kick(source,"Vai usar Hack na Casa do Caralho!")					
				end
				cb()
				banidos[user_id]=nil
			end
		else
			local temp = os.date("%x  %X")
			SendWebhookMessage(ac_webhook_logprop, "ANTI HACK     Suspeito	[ID]: "..user_id.."		"..temp.."[BAN]		[MOTIVO:"..msg.."]	")
		end
	else
		SendWebhookMessage(ac_webhook_anthack, "Função não mapeada => "..msg.."          ["..user_id.."]")
	end
end)


local logprop = false
AddEventHandler("MQCU:LogProp", function(msg, flag)    
    if(flag or logprop)then
        SendWebhookMessage(ac_webhook_logprop, msg)
    end
end)


--[[ -- ADICIONAR NO ARQUIVO -> vrp\base.lua
function vRP.getUserIdByIdentifier(ids)
	local rows = vRP.query("vRP/userid_byidentifier",{ identifier = ids})
	if #rows > 0 then
		return rows[1].user_id
	else
		return -1
	end
end
]]


--[[ -- SUBSTITUIR NO ARQUIVO	->	vrp\modules\player_state.lua
local colete = data.colete
SetTimeout(10000,function()
	if data.colete then
		source = vRP.getUserSource(user_id)
		if(source~=nil)then
			vRPclient.setArmour(source,colete)
		end
	end
end)






CODIGO A SUBSTITUIR:
if data.colete then			
	vRPclient.setArmour(source,data.colete)
end
]]


