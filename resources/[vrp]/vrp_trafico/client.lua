local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
func = Tunnel.getInterface("vrp_trafico")

-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local processo = false
local segundos = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAIS
-----------------------------------------------------------------------------------------------------------------------------------------
local locais = { 	-- MACONHA
---{ ['id'] = 3, ['x'] = 2044.25, 	  ['y'] = -150.25,   ['z'] = 33.66,  ['text'] = "~y~ENROLAR OS BASEADOS  ~r~(4x Maconhas + 4x Seda)", ['perm'] = "helipa.permissao" },
{ ['id'] = 3, ['x'] = 1660.42, 	  ['y'] = -51.18,   ['z'] = 168.32,  ['text'] = "~y~ENROLAR OS BASEADOS  ~r~(16 Maconhas + 8 Seda)", ['perm'] = "helipa.permissao" },
-- COCAÍNA
--{ ['id'] = 6, ['x'] = 1694.09, ['y'] = 75.56, ['z'] = 171.81, 	['text'] = "~y~EMBALAR A COCAÍNA  ~r~(4x Pasta Coca + 4x ZipLock)", ['perm'] = "vidigal.permissao" },
{ ['id'] = 6, ['x'] = 1661.31, ['y'] = -49.53, ['z'] = 168.32, 	['text'] = "~y~EMBALAR A COCAÍNA  ~r~(16 Pasta Coca + 8 ZipLock)", ['perm'] = "helipa.permissao" }, --permissao temporaria para a comunidade da helipa
-- ECSTASY
{ ['id'] = 9, ['x'] = 844.31, ['y'] = -291.78, ['z'] = 73.12,   ['text'] = "~y~REVESTIR COMPRIMIDOS  ~r~(16 Ácido Anf. + 8 Glicerina)", ['perm'] = "zeronze.permissao" },
-- METANFETAMINA
{ ['id'] = 10, ['x'] = 1664.65, ['y'] = -49.79, ['z'] = 168.32,    ['text'] = "~y~PREPARAR METANFETAMINA  ~r~(16 Anfetaminas. + 8 Pipes)", ['perm'] = "helipa.permissao" },
-- LSD
{ ['id'] = 11, ['x'] = 847.3, ['y'] = -291.78, ['z'] = 73.12,    ['text'] = "~y~PREPARAR LSD  ~r~(16 Dietilaminas + 8 Ziplock)", ['perm'] = "zeronze.permissao" },
-- MONTAR ARMAS 1
{ ['id'] = 16, ['x'] = 3590.69, ['y'] = 3685.7, ['z'] = 27.63, ['text'] = "MONTAR UMA ~y~M1911  ~r~(300 Peças de ferro + 1 Projeto M1911)", ['perm'] = "milicia.permissao" }, 		
{ ['id'] = 17, ['x'] = 3587.81, ['y'] = 3687.97, ['z'] = 27.63, ['text'] = "MONTAR UMA ~y~MAG-ODR  ~r~(450 Peças de ferro + 1 Projeto MAG-PDR)", ['perm'] = "milicia.permissao" }, 				 
{ ['id'] = 18, ['x'] = 3580.08, ['y'] = 3693.27, ['z'] = 27.13, ['text'] = "MONTAR UMA ~y~MICROSMG Uzi  ~r~(380 Peças de ferro + 1 Projeto UZI)", ['perm'] = "milicia.permissao" }, 
{ ['id'] = 19, ['x'] = 3589.06, ['y'] = 3680.0, ['z'] = 27.63, ['text'] = "MONTAR UMA ~y~AK-47  ~r~(750 Peças de ferro + 1 Projeto AK-47)", ['perm'] = "milicia.permissao" }, 					 
-- MUNIÇÕES 1
{ ['id'] = 20, ['x'] = 959.99, ['y'] = -107.67, ['z'] = 74.37, ['text'] = "FABRICAR MUNIÇÃO DE ~y~M1911  ~r~(20 Pólvoras + 20 Cápsulas)", ['perm'] = "motoclub.permissao" }, 		 
{ ['id'] = 21, ['x'] = 954.82, ['y'] = -117.81, ['z'] = 75.02, ['text'] = "FABRICAR MUNIÇÃO DE ~y~MAG-ODR  ~r~(120 Pólvoras + 20 Cápsulas)", ['perm'] = "motoclub.permissao" },
{ ['id'] = 22, ['x'] = 956.4, ['y'] = -119.54, ['z'] = 75.02, ['text'] = "FABRICAR MUNIÇÃO DE ~y~Uzi  ~r~(60 Pólvora + 20 Cápsula)", ['perm'] = "motoclub.permissao" },
{ ['id'] = 23, ['x'] = 962.32, ['y'] = -105.38, ['z'] = 74.37, ['text'] = "FABRICAR MUNIÇÃO DE ~y~AK47  ~r~(300 Pólvoras + 20 Cápsulas)", ['perm'] = "motoclub.permissao" },
-- ARMAS 2
--{ ['id'] = 24, ['x'] = 39.10, 	  ['y'] = -2659.25, ['z'] = 12.04, ['text'] = "MONTAR UMA ~y~M1911  ~r~(30x Peças + 1x Projeto M1911)", ['perm'] = "milicia.permissao" }, 					 
--{ ['id'] = 25, ['x'] = 32.34,  	  ['y'] = -2659.40, ['z'] = 12.04, ['text'] = "MONTAR UMA ~y~MAG-ODR  ~r~(45x Peças + 1x Projeto MAG-PDR)", ['perm'] = "milicia.permissao" }, 				 
--{ ['id'] = 26, ['x'] = 36.76,     ['y'] = -2676.24, ['z'] = 12.04, ['text'] = "MONTAR UMA ~y~SHOT. CANO SERRADO  ~r~(45x Peças + 1x Projeto Cano Serrado)", ['perm'] = "milicia.permissao" }, 
--{ ['id'] = 27, ['x'] = 40.47,     ['y'] = -2676.20, ['z'] = 12.04, ['text'] = "MONTAR UMA ~y~AK-47  ~r~(60x Peças + 1x Projeto AK-47)", ['perm'] = "milicia.permissao" }, 					 
--  MUNIÇÕES 2
--{ ['id'] = 28, ['x'] = -2676.39,  ['y'] = 1336.91, ['z'] = 140.88, ['text'] = "FABRICAR MUNIÇÃO DE ~y~M1911  ~r~(20x Pólvora + 12x Cápsula)", ['perm'] = "abutres.permissao" }, 		 
--{ ['id'] = 29, ['x'] = -2675.65,  ['y'] = 1326.26, ['z'] = 140.88, ['text'] = "FABRICAR MUNIÇÃO DE ~y~MAG-ODR  ~r~(20x Pólvora + 20x Cápsula)", ['perm'] = "abutres.permissao" },
--{ ['id'] = 30, ['x'] = -2675.66,  ['y'] = 1330.95, ['z'] = 140.88, ['text'] = "FABRICAR MUNIÇÃO DE ~y~ESCOPETA DE CANO SERRADO  ~r~(20x Pólvora + 20x Cápsula)", ['perm'] = "abutres.permissao" },
--{ ['id'] = 31, ['x'] = -2678.96,  ['y'] = 1328.08, ['z'] = 140.88, ['text'] = "FABRICAR MUNIÇÃO DE ~y~AK47  ~r~(20x Pólvora + 25x Cápsula)", ['perm'] = "abutres.permissao" },

}
-----------------------------------------------------------------------------------------------------------------------------------------
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