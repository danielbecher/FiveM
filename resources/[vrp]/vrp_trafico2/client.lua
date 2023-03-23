local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
func = Tunnel.getInterface("vrp_trafico2")

-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local processo = false
local segundos = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAIS
-----------------------------------------------------------------------------------------------------------------------------------------
local locais = {

	--MACONHA
	{ ['id'] = 1, ['x'] = 2219.87,    ['y'] = 5577.19,  ['z'] = 53.85,   ['text'] = "COLHER ~y~RAMOS DE MACONHA", ['perm'] = "helipa.permissao" },
	{ ['id'] = 3, ['x'] = 2222.61, ['y'] = 5576.8, ['z'] = 53.82,   ['text'] = "COLETAR ~y~RAMOS DE MACONHA", ['perm'] = "helipa.permissao" },
	
	---{ ['id'] = 3, ['x'] = 2223.4,    ['y'] = 5577.1,  ['z'] = 53.85,   ['text'] = "COLETAR ~y~RAMOS DE MACONHA", ['perm'] = "helipa.permissao" },
	{ ['id'] = 2, ['x'] = 114.18,     ['y'] = 6360.46, ['z'] = 32.30,  ['text'] = "PROCESSAR OS ~y~RAMOS DE MACONHA  ~r~(16x Ramos)", ['perm'] = "helipa.permissao" },
	{ ['id'] = 6, ['x'] = 118.22, ['y'] = 6362.66, ['z'] = 32.3,  ['text'] = "PROCESSAR OS ~y~RAMOS DE MACONHA  ~r~(16x Ramos)", ['perm'] = "helipa.permissao" },
	-- COCAINA	
	{ ['id'] = 4, ['x'] = 356.25,  	  ['y'] = 6466.80,  ['z'] = 30.20,   ['text'] = "COLHER ~y~FOLHA DE COCA", ['perm'] = "helipa.permissao" }, --permissao temporariamente cedida a helipa
	{ ['id'] = 39, ['x'] = 356.57, ['y'] = 6469.25, ['z'] = 30.11,   ['text'] = "COLHER ~y~FOLHA DE COCA", ['perm'] = "helipa.permissao" }, --permissao temporariamente cedida a helipa
	{ ['id'] = 5, ['x'] = 2196.462,	  ['y'] = 5596.51, ['z'] = 53.78,  ['text'] = "FABRICAR ~y~PASTA DE COCA  ~r~(16x Folha de Coca)", ['perm'] = "helipa.permissao" }, --permissao temporariamente cedida à helipa
	-- ECSTASY
	{ ['id'] = 7, ['x'] = -175.05,    ['y'] = 6169.46,  ['z'] = 31.20,   ['text'] = "PEGAR ~y~OCITOCINA SINTÉTICA", ['perm'] = "zeronze.permissao" },
	{ ['id'] = 8, ['x'] = 2856.01,    ['y'] = 4450.12,  ['z'] = 49.00,   ['text'] = "PROCESSAR E PRENSAR ~y~OCITOCINA  ~r~(16x OCitocina Sint.)", ['perm'] = "zeronze.permissao" },
	-- METANFETAMINA
	{ ['id'] = 10, ['x'] = 2331.17,   ['y'] = 3037.42, ['z'] = 48.15, ['text'] = "RETIRAR ~y~ÁCIDO DAS BATERIAS", ['perm'] = "helipa.permissao" },
	{ ['id'] = 11, ['x'] = 1493.14,   ['y'] = 6390.24, ['z'] = 21.25, ['text'] = "~y~PREPARAR ANFETAMINA  ~r~(16x Ácido de Bateria)", ['perm'] = "helipa.permissao" },
	-- LSD
	{ ['id'] = 40, ['x'] = -1108.76, ['y'] = 4952.06, ['z'] = 218.65, ['text'] = "PEGAR ~y~FUNGOS", ['perm'] = "zeronze.permissao" },
	{ ['id'] = 41, ['x'] = -1108.2, ['y'] = 4946.35, ['z'] = 218.65, ['text'] = "~y~PROCESSAR OS FUNGOS  ~r~(8x FUNGOS)", ['perm'] = "zeronze.permissao" },
	--DRIFT KING 
	--{ ['id'] = 15, ['x'] = 84.11,  ['y'] = -1963.97,  ['z'] = 17.83,  ['text'] = "PEGAR ~y~LOCKPICK  ~r~(4000x Dinheiro Sujo)", ['perm'] = "desmanche.permissao" },
	{ ['id'] = 15,['x'] = 727.77, ['y'] = -1066.81, ['z'] = 28.32,  ['text'] = "PRODUZIR ~y~ LOCKPICK  ~r~(3000x Dinheiro Sujo)", ['perm'] = "chefe.permissao" },
	--{ ['id'] = 13, ['x'] = 82.46,  ['y'] = -1966.19,  ['z'] = 17.83,  ['text'] = "PEGAR ~y~ÓXIDO NITROSO  ~r~(3000x Dinheiro Sujo)", ['perm'] = "desmanche.permissao" },
	{ ['id'] = 13, ['x'] = 735.22, ['y'] = -1066.52, ['z'] = 22.17,  ['text'] = "PRODUZIR ~y~ ÓXIDO NITROSO  ~r~(3000x Dinheiro Sujo)", ['perm'] = "chefe.permissao" },
	--{ ['id'] = 14, ['x'] = 80.06,   ['y'] = -1966.27,  ['z'] = 17.83,  ['text'] = "PEGAR ~y~PLACA   ~r~(5000x Dinheiro Sujo)", ['perm'] = "desmanche.permissao" },
	-- COLETE 1
	{ ['id'] = 32, ['x'] = 713.33,    ['y'] = -969.99, ['z'] = 30.39, ['text'] = "COLETAR ~y~LINHA", ['perm'] = "motoclub.permissao" },
	--{ ['id'] = 33, ['x'] = -1870.54,  ['y'] = 2062.06,  ['z'] = 135.43,  ['text'] = "COSTURAR ~y~COLETE  ~r~(8x Linhas)", ['perm'] = "bratva.permissao" },
	{ ['id'] = 33, ['x'] = 952.63, ['y'] = -115.67, ['z'] = 75.02,  ['text'] = "COSTURAR ~y~COLETE  ~r~(8x Linhas)", ['perm'] = "motoclub.permissao" },
	-- COLETE 2
	--{ ['id'] = 34, ['x'] = 9.59, 	  ['y'] = 6506.31, ['z'] = 31.52, ['text'] = "COLETAR ~y~LINHA", ['perm'] = "abutres.permissao" },
	--{ ['id'] = 35, ['x'] = -2679.51,  ['y'] = 1328.08,  ['z'] = 144.25,  ['text'] = "COSTURAR ~y~COLETE  ~r~(8x Linhas)", ['perm'] = "abutres.permissao" },
	-- MECANICO
	{ ['id'] = 36, ['x'] = -199.48,   ['y'] = -1319.82,  ['z'] = 31.08,  ['text'] = "PEGAR ~y~ FERRAMENTA", ['perm'] = "mecanico.permissao" },
	-- ARMAS/MAFIA
	{ ['id'] = 37, ['x'] = 3592.4, ['y'] = 3680.24, ['z'] = 27.63,  ['text'] = "FORJAR ~y~ PEÇAS DE FERRO", ['perm'] = "milicia.permissao" },
	{ ['id'] = 38, ['x'] = 3594.21, ['y'] = 3682.64, ['z'] = 27.85,  ['text'] = "FORJAR ~y~ PEÇAS DE FERRO", ['perm'] = "milicia.permissao" },
	-- LAVAGEM DE DINHEIRO
	{ ['id'] = 50, ['x'] = 255.69, ['y'] = 209.16, ['z'] = 106.29, ['text'] = "~y~VALIDAR O IMPOSTO DE RENDA  ~r~(1 Imposto de Renda Falso)", ['perm'] = "lavagem.permissao" },
	
} 
---------------------------------------------------------------------------------------------------------------------------------------
-- Gambiarra COM Permissão --
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5) --Citizen.Wait(1)
		for k,v in pairs(locais) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
			local distance = GetDistanceBetweenCoords(v.x,v.y,cdz,x,y,z,true)
			if distance <= 1.2 and not processo then
				drawTxt("PRESSIONE  ~r~E~w~  PARA "..v.text,4,0.5,0.90,0.50,255,255,255,200)
				if IsControlJustPressed(0,38) and func.checkPermission(v.perm) then
					if func.checkPayment(v.id) then
						TriggerEvent('cancelando',true)
						processo = true
						segundos = 10
					end
				end
			end
		end
		if processo then
			drawTxt("AGUARDE ~g~"..segundos.."~w~ SEGUNDOS ATÉ ~y~FINALIZAR O PROCESSO",4,0.5,0.90,0.50,255,255,255,200)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONTAGEM --
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if segundos > 0 then
			segundos = segundos - 1
			if segundos == 0 then
				processo = false
				TriggerEvent('cancelando',false)
				ClearPedTasks(PlayerPedId())
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end
