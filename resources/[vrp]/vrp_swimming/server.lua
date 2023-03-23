local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_swimming")

local webhookmolhado = "https://discordapp.com/api/webhooks/753423794005082183/HWV7En7EedZFwRY5neXnW5vSpcPAdSAm_5j6WCyq47Dp9eU9mXP7w1GjqwynLGnW7wum"
------------------------------------------------------------------------------------------------------------------------------------------
-- ITENS PARA PERDER
------------------------------------------------------------------------------------------------------------------------------------------
itemlist = {
	["encomenda"] = { index = "encomenda", nome = "Encomenda", type="item"},
	["pecadeferro"] = { index = "pecadeferro", nome = "Peças de Ferro", type="item"},
	["sacodelixo"] = { index = "sacodelixo", nome = "Saco de Lixo", type="item"},
	["garrafavazia"] = { index = "garrafavazia", nome = "Garrafa Vazia", type="item"},
	["tora"] = { index = "tora", nome = "Tora de Madeira", type="item"},
	["alianca"] = { index = "alianca", nome = "Aliança", type="item"},
	["bandagem"] = { index = "bandagem", nome = "Bandagem", type="item"},
	["cerveja"] = { index = "cerveja", nome = "Cerveja", type="item"},
	["tequila"] = { index = "tequila", nome = "Tequila", type="item"},
	["vodka"] = { index = "vodka", nome = "Vodka", type="item"},
	["whisky"] = { index = "whisky", nome = "Whisky", type="item"},
	["conhaque"] = { index = "conhaque", nome = "Conhaque", type="item"},
	["absinto"] = { index = "absinto", nome = "Absinto", type="item"},
	["dinheirosujo"] = { index = "dinheirosujo", nome = "Dinheiro Sujo", type="item"},
	["repairkit"] = { index = "repairkit", nome = "Kit de Reparos", type="item"},
	["algemas"] = { index = "algemas", nome = "Algemas", type="item"},
	["capuz"] = { index = "capuz", nome = "Capuz", type="item"},
	["lockpick"] = { index = "lockpick", nome = "Lockpick", type="item"},
	["masterpick"] = { index = "masterpick", nome = "Masterpick", type="item"},
	["militec"] = { index = "militec", nome = "Militec-1", type="item"},
	["carnedecormorao"] = { index = "carnedecormorao", nome = "Carne de Cormorão", type="item"},
	["carnedecorvo"] = { index = "carnedecorvo", nome = "Carne de Corvo", type="item"},
	["carnedeaguia"] = { index = "carnedeaguia", nome = "Carne de Águia", type="item"},
	["carnedecervo"] = { index = "carnedecervo", nome = "Carne de Cervo", type="item"},
	["carnedecoelho"] = { index = "carnedecoelho", nome = "Carne de Coelho", type="item"},
	["carnedecoyote"] = { index = "carnedecoyote", nome = "Carne de Coyote", type="item"},
	["carnedelobo"] = { index = "carnedelobo", nome = "Carne de Lobo", type="item"},
	["carnedepuma"] = { index = "carnedepuma", nome = "Carne de Puma", type="item"},
	["carnedejavali"] = { index = "carnedejavali", nome = "Carne de Javali", type="item"},
	["isca"] = { index = "isca", nome = "Isca", type="item"},
	["dourado"] = { index = "dourado", nome = "Dourado", type="item"},
	["corvina"] = { index = "corvina", nome = "Corvina", type="item"},
	["salmao"] = { index = "salmao", nome = "Salmão", type="item"},
	["pacu"] = { index = "pacu", nome = "Pacu", type="item"},
	["pintado"] = { index = "pintado", nome = "Pintado", type="item"},
	["pirarucu"] = { index = "pirarucu", nome = "Pirarucu", type="item"},
	["tilapia"] = { index = "tilapia", nome = "Tilápia", type="item"},
	["tucunare"] = { index = "tucunare", nome = "Tucunaré", type="item"},
	["energetico"] = { index = "energetico", nome = "Energético", type="item"},
	["mochila"] = { index = "mochila", nome = "Mochila", type="item"},
	["maconha"] = { index = "maconha", nome = "Maconha", type="item"},
	["metanfetamina"] = { index = "metanfetamina", nome = "Metanfetamina", type="item"},
	["cocaina"] = { index = "cocaina", nome = "Cocaina", type="item"},
	["orgao"] = { index = "orgao", nome = "Órgão", type="item"},
	["etiqueta"] = { index = "etiqueta", nome = "Etiqueta", type="item"},

	["relogioroubado"] = { index = "relogioroubado", nome = "Relógio Roubado", type="item"},
	["pulseiraroubada"] = { index = "pulseiraroubada", nome = "Pulseira Roubada", type="item"},
	["anelroubado"] = { index = "anelroubado", nome = "Anel Roubado", type="item"},
	["colarroubado"] = { index = "colarroubado", nome = "Colar Roubado", type="item"},
	["brincoroubado"] = { index = "brincoroubado", nome = "Brinco Roubado", type="item"},
	["carregadorroubado"] = { index = "carregadorroubado", nome = "Carregador Roubado", type="item"},
	["carteiraroubada"] = { index = "carteiraroubada", nome = "Carteira Roubada", type="item"},
	["tabletroubado"] = { index = "tabletroubado", nome = "Tablet Roubado", type="item"},
	["sapatosroubado"] = { index = "sapatosroubado", nome = "Sapatos Roubado", type="item"},
	["maquiagemroubada"] = { index = "maquiagemroubada", nome = "Maquiagem Roubado", type="item"},
	["vibradorroubado"] = { index = "vibradorroubado", nome = "Vibrador Roubado", type="item"},
	["perfumeroubado"] = { index = "perfumeroubado", nome = "Perfume Roubado", type="item"},
	["diamante"] = { index = "diamante", nome = "Min. Diamante", type="item"},
	["ouro"] = { index = "ouro", nome = "Min. Ouro", type="item"},
	["bronze"] = { index = "bronze", nome = "Min. Bronze", type="item"},
	["ferro"] = { index = "ferro", nome = "Min. Ferro", type="item"},
	["rubi"] = { index = "rubi", nome = "Min. Rubi", type="item"},
	
	["diamante2"] = { index = "diamante2", nome = "Diamante", type="item"},
	["potassio"] = { index = "potassio", nome = "Nitrato de Potássio", type="item"},
	["ouro2"] = { index = "ouro2", nome = "Ouro", type="item"},
	["bronze2"] = { index = "bronze2", nome = "Bronze", type="item"},
	["ferro2"] = { index = "ferro2", nome = "Ferro", type="item"},
	["rubi2"] = { index = "rubi2", nome = "Rubi", type="item"},

	["roupas"] = { index = "roupas", nome = "Roupas", type="item"},
	["radio"] = { index = "radio", nome = "Rádio", type="item"},

	["impostoderenda"] = { index = "impostoderenda", nome = "Imposto de Renda", type="item"},
	["impostoderendafalso"] = { index = "impostoderendafalso", nome = "Imposto de Renda Falso", type="item"},
	["lanterna"] = { index = "lanterna", nome = "Lantena", type="item"}
}

local itemsjogarfora = {}
for linux, b in pairs(itemlist) do
    table.insert(itemsjogarfora, linux)
end
------------------------------------------------------------------------------------------------------------------------------------------
-- VERIFICAR SE TEM OS ITENS
------------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent('vrp_swimming:VerificarItems')
AddEventHandler('vrp_swimming:VerificarItems', function()
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	for c, d in pairs(itemsjogarfora) do 
		local amount = vRP.getInventoryItemAmount(user_id,d)
		if user_id then
			if amount > 0 then
				vRP.tryGetInventoryItem(user_id,d,amount,false)
				TriggerClientEvent("Notify",source,"negado","Você se molhou e perdeu os seus bens!")
				SendWebhookMessage(webhookmolhado,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[ITENS PERDIDOS]: "..d.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			end
		end
	end
end)
------------------------------------------------------------------------------------------------------------------------------------------
-- VERIFICAR SE TEM O DINHEIRO
------------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("vrp_swimming:VerificarDinheiro")
AddEventHandler("vrp_swimming:VerificarDinheiro", function()
	local source = source
	local user_id = vRP.getUserId(source)
	local amount = vRP.getMoney(user_id)
	if user_id then
		if amount > 0 then
			vRP.setMoney(user_id,0)
			TriggerClientEvent("Notify",source,"negado","Você se molhou e perdeu seu dinheiro!")
			SendWebhookMessage(webhookre,"```prolog\n[ID]: "..user_id.." "..identity_user.name.." "..identity_user.firstname.." \n[DINHEIRO PERDIDO]: "..amount.. os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)