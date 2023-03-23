local cfg = {}

cfg.groups = {
	["Admin"] = {
		"admin.permissao",
		"polpar.permissao",
		"ticket.permissao",
		"mod.permissao",
		"player.blips",
		"player.spec",
		"player.noclip",
		"player.secret",
		"player.wall"
	},
	["Mod"] = {
		"mod.permissao",
		"polpar.permissao",
		"ticket.permissao",
		"player.blips",
		"player.spec",
		"player.noclip",
		"player.secret",
		"player.wall"
	},
	["Suporte"] = {
		_config = {
			title = "Suporte",
			gtype = "suporte"
		},
		"suporte.permissao",
		"ticket.permissao",
		"player.blips",
		"player.spec",
		"player.noclip",
		"player.secret"
	},
	["Blips"] = {
		"blips.permissao"
	},
	["Juiz"] = {
		_config = {
			title = "Juiz",
			gtype = "job"
		},
		"juiz.permissao",
		"sem.permissao"
	},
	["Advogado"] = {
		_config = {
			title = "Advogado",
			gtype = "job"
		},
		"advogado.permissao",
		"sem.permissao"
	},
	-----------------------------------------------------
	-- Recruta
	["Recruta"] = {
		_config = {
			title = "Recruta",
			gtype = "job"
		},
		"policia.permissao",
		"pmerj.permissao",
		"player.blips",
		"polpar.permissao",
		"portadp.permissao",
		"recruta.servico",
		"recruta.arsenal",
		"pgeral.permissao",
		"sem.permissao"
	},
	["PaisanaRecruta"] = {
		_config = {
			title = "Recruta Folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"recruta.folga",
		"player.blips",
		"sem.permissao"
	},
	-- Soldado
	["Soldado"] = {
		_config = {
			title = "Soldado",
			gtype = "job"
		},
		"policia.permissao",
		"pmerj.permissao",
		"polpar.permissao",
		"soldesarg.arsenal",
		"portadp.permissao",
		"player.blips",
		"soldado.servico",
		"pgeral.permissao",
		"sem.permissao"
	},
	["PaisanaSoldado"] = {
		_config = {
			title = "Soldado Folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"soldado.folga",
		"player.blips",
		"sem.permissao"
	},
	-- Sargento
	["Sargento"] = {
		_config = {
			title = "Sargento",
			gtype = "job"
		},
		"policia.permissao",
		"pmerj.permissao",
		"polpar.permissao",
		"player.blips",
		"portadp.permissao",
		"soldesarg.arsenal",
		"sargento.servico",
		"pgeral.permissao",
		"sem.permissao"
	},
	["PaisanaSargento"] = {
		_config = {
			title = "Sargento Folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"sargento.folga",
		"player.blips",
		"sem.permissao"
	},
	-- Tenete
	["Tenente"] = {
		_config = {
			title = "Tenente",
			gtype = "job"
		},
		"policia.permissao",
		"pmerj.permissao",
		"polpar.permissao",
		"player.blips",
		"portadp.permissao",
		"tenenteecoronel.arsenal",
		"tenente.servico",
		"pgeral.permissao",
		"sem.permissao"
	},
	["PaisanaTenente"] = {
		_config = {
			title = "Tenente Folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"tenente.folga",
		"player.blips",
		"sem.permissao"
	},
	-- Capitão
	["Capitao"] = {
		_config = {
			title = "Capitão",
			gtype = "job"
		},
		"policia.permissao",
		"pmerj.permissao",
		"polpar.permissao",
		"portadp.permissao",
		"capitaoecoronel.arsenal",
		"capitao.servico",
		"player.blips",
		"pgeral.permissao",
		"sem.permissao"
	},
	["PaisanaCapitao"] = {
		_config = {
			title = "Capitão Folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"capitao.folga",
		"player.blips",
		"sem.permissao"
	},
	-- Ten. Coronel
	["TenCoronel"] = {
		_config = {
			title = "Ten. Coronel",
			gtype = "job"
		},
		"policia.permissao",
		"pmerj.permissao",
		"polpar.permissao",
		"player.blips",
		"portadp.permissao",
		"tencoronelecoronel.arsenal",
		"tencoronel.servico",
		"pgeral.permissao",
		"sem.permissao"
	},
	["PaisanaTenCoronel"] = {
		_config = {
			title = "T. Cel. Folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"tencoronel.folga",
		"player.blips",
		"sem.permissao"
	},
	-- Coronel
	["Coronel"] = {
		_config = {
			title = "Coronel",
			gtype = "job"
		},
		"policia.permissao",
		"polpar.permissao",
		"player.blips",
		"pmerj.permissao",
		"portadp.permissao",
		"tenenteecoronel.arsenal",
		"coronel.servico",
		"pgeral.permissao",
		"sem.permissao"
	},
	["PaisanaCoronel"] = {
		_config = {
			title = "Coronel Folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"coronel.folga",
		"player.blips",
		"sem.permissao"
	},
	-- Pode usar o /add  para recrutar policiais
	["LiderPolicia"] = {
		_config = {
			title = "LiderPolicia",
			gtype = "lider"
		},
		"liderpolicia.permissao",
		"polpar.permissao",
		"portadp.permissao",
		"sem.permissao"
	},
	-----------------------------------------------------
	-- Polícia Civil ------------------------------------
	-----------------------------------------------------
	["delgeral"] = {
		_config = {
			title = "Sub/Delegado Geral",
			gtype = "job"
		},
		"policia.permissao",
		"del.permissao",
		"polpar.permissao",
		"portadp.permissao",
		"pgeral.permissao",
		"player.blips",
		"pcivil.permissao",
		"sem.permissao"
	},
	["delgeralfolga"] = {
		_config = {
			title = "Sub/Delegado Folga",
			gtype = "job"
		},
		"paisanacivil.permissao",
		"delp.permissao",
		"player.blips",
		"sem.permissao"
	},
	["delesp"] = {
		_config = {
			title = "Delegado Especializado",
			gtype = "job"
		},
		"policia.permissao",
		"delesp.permissao",
		"polpar.permissao",
		"pgeral.permissao",
		"player.blips",
		"portadp.permissao",
		"pcivil.permissao",
		"sem.permissao"
	},
	["delespfolga"] = {
		_config = {
			title = "Delegado Folga",
			gtype = "job"
		},
		"paisanacivil.permissao",
		"delp2.permissao",
		"player.blips",
		"sem.permissao"
	},
	["invchf"] = {
		_config = {
			title = "Investigador Chefe",
			gtype = "job"
		},
		"policia.permissao",
		"polpar.permissao",
		"invchf.permissao",
		"pgeral.permissao",
		"player.blips",
		"portadp.permissao",
		"pcivil.permissao",
		"sem.permissao"
	},
	["invfolga"] = {
		_config = {
			title = "Investigador Folga",
			gtype = "job"
		},
		"paisanacivil.permissao",
		"invchfolga.permissao",
		"player.blips",
		"sem.permissao"
	},
	["agente3"] = {
		_config = {
			title = "Agente Classe 3",
			gtype = "job"
		},
		"policia.permissao",
		"ag3.permissao",
		"polpar.permissao",
		"portadp.permissao",
		"player.blips",
		"pgeral.permissao",
		"pcivil.permissao",
		"sem.permissao"
	},
	["agente3folga"] = {
		_config = {
			title = "Agente Folga",
			gtype = "job"
		},
		"paisanacivil.permissao",
		"ag3f.permissao",
		"player.blips",
		"sem.permissao"
	},
	["agente2"] = {
		_config = {
			title = "Agente Classe 2",
			gtype = "job"
		},
		"policia.permissao",
		"ag2.permissao",
		"polpar.permissao",
		"portadp.permissao",
		"pgeral.permissao",
		"player.blips",
		"pcivil.permissao",
		"sem.permissao"
	},
	["agente2folga"] = {
		_config = {
			title = "Agente Folga",
			gtype = "job"
		},
		"paisanacivil.permissao",
		"ag2f.permissao",
		"player.blips",
		"sem.permissao"
	},
	["agente1"] = {
		_config = {
			title = "Agente Classe 1",
			gtype = "job"
		},
		"policia.permissao",
		"ag1.permissao",
		"polpar.permissao",
		"pgeral.permissao",
		"player.blips",
		"portadp.permissao",
		"pcivil.permissao",
		"sem.permissao"
	},
	["agente1folga"] = {
		_config = {
			title = "Agente Folga",
			gtype = "job"
		},
		"paisanacivil.permissao",
		"player.blips",
		"ag1f.permissao",
		"sem.permissao"
	},
	-----------------------------------------------------
	-- HOSPITAL  ---------------------------------------
	-----------------------------------------------------
	["Enfermeiro"] = {
		_config = {
			title = "Enfermeiro",
			gtype = "job"
		},
		"paramedico.permissao",
		"enfermeiro.servico",
		"polpar.permissao",
		"sem.permissao"
	}, 
	["PaisanaEnfermeiro"] = {
		_config = {
			title = "Enfermeiro Folga",
			gtype = "job"
		},
		"paisanaenfermeiro.permissao",
		"enfermeiro.folga",
		"sem.permissao"
	},
	-- Paramédico
	["Paramedico"] = {
		_config = {
			title = "Paramédico",
			gtype = "job"
		},
		"paramedico.permissao",
		"paramedico.servico",
		"polpar.permissao",
		"sem.permissao"
	}, 
	["PaisanaParamedico"] = {
		_config = {
			title = "Paramédico Folga",
			gtype = "job"
		},
		"paisanaparamedico.permissao",
		"paramedico.folga",
		"sem.permissao"
	},
	-- Médico
	["Medico"] = {
		_config = {
			title = "Médico",
			gtype = "job"
		},
		"paramedico.permissao",
		"medico.servico",
		"polpar.permissao",
		"sem.permissao"
	}, 
	["PaisanaMedico"] = {
		_config = {
			title = "Médico Folga",
			gtype = "job"
		},
		"paisanamedico.permissao",
		"medico.folga",
		"sem.permissao"
	},
	-- Diretor
	["Diretor"] = {
		_config = {
			title = "Diretor",
			gtype = "job"
		},
		"paramedico.permissao",
		"diretor.servico",
		"polpar.permissao",
		"sem.permissao"
	}, 
	["PaisanaDiretor"] = {
		_config = {
			title = "Diretor Folga",
			gtype = "job"
		},
		"diretor.folga",
		"sem.permissao"
	},
	-----------------------------------------------------
	------- MECÂNICA ------------------------------------
	-----------------------------------------------------
	["Chefe"] = {
		_config = {
			title = "Chefe Bennys",
			gtype = "job"
		},
		"chefe.permissao",
		"chefe.servico",
		"mecanico.permissao",
		"ls.permissao",
		"reparo.permissao",
		"callmec.permissao",
		"sem.permissao"
	},
	["Mecanico"] = {
		_config = {
			title = "Mecânico Bennys",
			gtype = "job"
		},
		"mecanico.permissao",
		"mecanico.servico",
		"ls.permissao",
		"reparo.permissao",
		"callmec.permissao",
		"sem.permissao"
	},
	["Ajudante"] = {
		_config = {
			title = "Ajudante Bennys",
			gtype = "job"
		},
		"ajudante.permissao",
		"ajudante.servico",
		"mecanico.permissao",
		"ls.permissao",
		"reparo.permissao",
		"callmec.permissao",
		"sem.permissao"
	},
	["PaisanaMecanico"] = {
		_config = {
			title = "Bennys Folga",
			gtype = "job"
		},
		"mecanico.folga"
	},
	["PaisanaChefe"] = {
		_config = {
			title = "Chefe Folga",
			gtype = "job"
		},
		"chefe.folga"
	},
	["PaisanaAjudante"] = {
		_config = {
			title = "Ajudante Folga",
			gtype = "job"
		},
		"ajudante.folga"
	},
	-----------------------------------------------------
	-- DK -----------------------------------------------
	-----------------------------------------------------
	["DK"] = {
		_config = {
			title = "Drift Kings",
			gtype = "job"
		},
		"desmanche.permissao",
		"sem.permissao"
	},
	-----------------------------------------------------
	-- VANILLA-------------------------------------------
	-----------------------------------------------------
	["Vanilla"] = {
		_config = {
			title = "Vanilla",
			gtype = "job"
		},
		"vanilla.permissao",
		"lavagem.permissao",
		"sem.permissao"
	},
	-----------------------------------------------------
	-- VIPS ---------------------------------------------
	-----------------------------------------------------
	["Bronze"] = {
		_config = {
			title = "Bronze",
			gtype = "vip"
		},
		"bronze.permissao"
	},
	["Prata"] = {
		_config = {
			title = "Prata",
			gtype = "vip"
		},
		"prata.permissao"
	},
	["Ouro"] = {
		_config = {
			title = "Ouro",
			gtype = "vip"
		},
		"ouro.permissao",
		"barcos.permissao",
		"mochila.permissao"
	},
	["Platina"] = {
		_config = {
			title = "Platina",
			gtype = "vip"
		},
		"barcos.permissao",
		"heli.permissao",
		"platina.permissao",
		"mochila.permissao"
	},
	["Diamante"] = {
		_config = {
			title = "Diamante",
			gtype = "vip"
		},
		"barcos.permissao",
		"heli.permissao",
		"diamante.permissao",
		"mochila.permissao"
	},
	["Helipa"] = { --Maconha
		_config = {
			title = "Helipa",
			gtype = "job"
		},
		"helipa.permissao",
		"ilegal.permissao"
	},
	["Zeronze"] = { --Maconha
		_config = {
			title = "Zeronze",
			gtype = "job"
		},
		"zeronze.permissao",
		"ilegal.permissao"
	},
	["Vidigal"] = { --Cocaína
		_config = {
			title = "Vidigal",
			gtype = "job"
		},
		"vidigal.permissao",
		"ilegal.permissao"
	},
	["Mare"] = { --Ecstasy
		_config = {
			title = "Maré",
			gtype = "job"
		},
		"mare.permissao",
		"ilegal.permissao"
	},
	["Kennedy"] = { --Metanfetamina
		_config = {
			title = "Vila Kennedy",
			gtype = "job"
		},
		"kennedy.permissao",
		"ilegal.permissao"
	},
	["Motoclub"] = {
		_config = {
			title = "Motoclub",
			gtype = "job"
		},
		"motoclub.permissao",
		"municao.permissao",
		"ilegal.permissao"
	},
	["Abutres"] = { --Munição
		_config = {
			title = "Abutres",
			gtype = "job"
		},
		"abutres.permissao",
		"ilegal.permissao"
	},
	["Bratva"] = {
		_config = {
			title = "Bratva",
			gtype = "job"
		},
		"bratva.permissao",
		"municao.permissao",
		"ilegal.permissao"
	},
	["Yakuza"] = {
		_config = {
			title = "Yakuza",
			gtype = "job"
		},
		"yakuza.permissao",
		"lavagem.permissao",
		"ilegal.permissao"
	},
	["Italianos"] = {
		_config = {
			title = "Máfia Italiana",
			gtype = "job"
		},
		"milicia.permissao",
		"player.blips",
		"ilegal.permissao"
	},
	["Italianos2"] = {
		_config = {
			title = "Máfia Italiana 2",
			gtype = "job"
		},
		"milicia.permissao",
		"player.blips",
		"ilegal.permissao"
	},
	["Italianos3"] = {
		_config = {
			title = "Máfia Italiana 3",
			gtype = "job"
		},
		"milicia.permissao",
		"player.blips",
		"ilegal.permissao"
	},
	["Italianos3"] = {
		_config = {
			title = "Máfia Italiana 4",
			"player.blips",
			gtype = "job"
		},
		"milicia.permissao",
		"ilegal.permissao"
	},
	--[[["Fazendeiro"] = {
		_config = {
			title = "Fazendeiro",
			gtype = "job"
		},
		"buscape.permissao"
	},]]
}

cfg.users = {
	[1] = { "Admin" }
}

cfg.selectors = {

}

return cfg