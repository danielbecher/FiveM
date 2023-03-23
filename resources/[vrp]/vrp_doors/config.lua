local cfg = {}

cfg.list = {
	[1] = { text = true, hash = 631614199, ['x'] = 461.86, ['y'] = -993.68, ['z'] = 24.91, lock = true, perm = "portadp.permissao" }, -- Celas
	[2] = { text = true, hash = 631614199, ['x'] = 461.84, ['y'] = -998.37, ['z'] = 24.91, lock = true, perm = "portadp.permissao" }, -- Celas
	[3] = { text = true, hash = 631614199, ['x'] = 461.83, ['y'] = -1002.08, ['z'] = 24.91, lock = true, perm = "portadp.permissao" }, -- Celas
	[4] = { text = true, hash = 2271212864, ['x'] = 468.29, ['y'] = -1014.15, ['z'] = 26.38, lock = true, perm = "portadp.permissao", other = 5 },
	[5] = { text = true, hash = 2271212864, ['x'] = 468.96, ['y'] = -1014.09, ['z'] = 26.38, lock = true, perm = "portadp.permissao", other = 4 },
	[6] = { text = true, hash = 185711165, ['x'] = 445.37, ['y'] = -989.77, ['z'] = 30.68, lock = true, perm = "portadp.permissao", other = 7 },
	[7] = { text = true, hash = 185711165, ['x'] = 444.07, ['y'] = -989.77, ['z'] = 30.68, lock = true, perm = "portadp.permissao", other = 6 },
	[8] = { text = true, hash = 749848321, ['x'] = 453.07, ['y'] = -982.68, ['z'] = 30.68, lock = true, perm = "portadp.permissao" }, -- Arsenal PM
	[9] = { text = true, hash = 3261965677, ['x'] = 428.09, ['y'] = -979.45, ['z'] = 26.82, lock = true, perm = "portadp.permissao" },
	[10] = { text = true, hash = 3261965677, ['x'] = 431.99, ['y'] = -979.45, ['z'] = 26.82, lock = true, perm = "portadp.permissao" },
	[11] = { text = true, hash = 3261965677, ['x'] = 436.03, ['y'] = -979.45, ['z'] = 26.82, lock = true, perm = "portadp.permissao" },
	[12] = { text = true, hash = 3261965677, ['x'] = 468.50, ['y'] = -997.90, ['z'] = 24.92, lock = true, perm = "portadp.permissao" },
	[13] = { text = true, hash = 3261965677, ['x'] = 471.40, ['y'] = -997.90, ['z'] = 24.92, lock = true, perm = "portadp.permissao" },
	[14] = { text = true, hash = 3261965677, ['x'] = 474.25, ['y'] = -997.90, ['z'] = 24.92, lock = true, perm = "portadp.permissao" },
	[15] = { text = true, hash = 3261965677, ['x'] = 477.10, ['y'] = -997.90, ['z'] = 24.92, lock = true, perm = "portadp.permissao" },
	[16] = { text = true, hash = 3261965677, ['x'] = 480.00, ['y'] = -997.90, ['z'] = 24.92, lock = true, perm = "portadp.permissao" },
	[17] = { text = true, hash = 1557126584, ['x'] = 450.05, ['y'] = -986.75, ['z'] = 30.68, lock = true, perm = "portadp.permissao" },
	[18] = { text = true, hash = 520341586, ['x'] = -14.12, ['y'] = -1441.47, ['z'] = 31.10, lock = true, perm = "admin.permissao" }, -- Casinha do Franklin
	[19] = { text = true, hash = 3687927243, ['x'] = -1150.05, ['y'] = -1521.69, ['z'] = 10.62, lock = true, perm = "admin.permissao" }, -- Casinha Praia do Trevor
	[20] = { text = true, hash = 486670049, ['x'] = -106.93, ['y'] = -8.45, ['z'] = 70.52, lock = true, perm = "admin.permissao" }, -- Apartamentozinho Dahora
	[21] = { text = true, hash = 308207762, ['x'] = 8.22, ['y'] = 539.46, ['z'] = 176.02, lock = true, perm = "admin.permissao" }, -- Mansão do Franklin
	[22] = { text = true, hash = 159994461, ['x'] = -816.94, ['y'] = 178.13, ['z'] = 72.22, lock = true, permn = "admin.permissao", other = 22 },
    [23] = { text = true, hash = -1686014385, ['x'] = -564.20, ['y'] = 276.59, ['z'] = 72.22, lock = true, perm = "admin.permissao", other = 21 },  --Michael
    [24] = { text = true, hash = 132154435, ['x'] = 1973.54, ['y'] = 3815.41, ['z'] = 33.42, lock = true, perm = "admin.permissao" }, -- Trailer Trevor
	[25] = { text = true, hash = 2264746914, ['x'] = -1002.85, ['y'] = -477.84, ['z'] = 50.02, lock = true, perm = "yakuza.permissao" }, -- Escritório do Prefeito/Lavagem
	--[26] = { text = false, hash = 1282049587, ['x'] = 3568.52, ['y'] = 3693.98, ['z'] = 28.12, lock = true, perm = "humane.permissao", other = 27 },
	--[27] = { text = false, hash = 3873258242, ['x'] = 3568.74, ['y'] = 3695.23, ['z'] = 28.12, lock = true, perm = "humane.permissao", other = 26 },
	--[28] = { text = false, hash = 1282049587, ['x'] = 3597.23, ['y'] = 3689.92, ['z'] = 28.83, lock = true, perm = "humane.permissao", other = 29 },
	--[29] = { text = false, hash = 3873258242, ['x'] = 3597.7, ['y'] = 3689.61, ['z'] = 28.83, lock = true, perm = "humane.permissao", other = 28 },
--	[30] = { text = false, hash = 1388116908, ['x'] = 552.33, ['y'] = -3118.09, ['z'] = 18.76, lock = true, perm = "italianos.permissao" },
	--[31] = { text = false, hash = 1388116908, ['x'] = 585.92, ['y'] = -3118.13, ['z'] = 18.76, lock = true, perm = "italianos.permissao" },
    --[32] = { text = false, hash = 1335311341, ['x'] = 1187.96, ['y'] = 2644.97, ['z'] = 38.40, lock = true, perm = "corleone.permissao" },
	[33] = { text = true, hash = 190770132, ['x'] = 981.93, ['y'] = -102.54, ['z'] = 74.85, lock = true, perm = "motoclub.permissao" },
	[34] = { text = true, hash = -1116041313, ['x'] = 127.95, ['y'] = -1298.50, ['z'] = 29.41, lock = true, perm = "vanilla.permissao", others = 35 },
	[35] = { text = true, hash = 668467214, ['x'] = 96.09, ['y'] =  -1284.85, ['z'] = 29.43, lock = true, perm = "vanilla.permissao", others = 34 },
	[36] = { text = true, hash = 2739859149, ['x'] = -1607.47, ['y'] = -3006.47, ['z'] = -75.2, lock = true, perm = "bratva.permissao" },
	[37] = { text = true, hash = 2305201762, ['x'] = -1607.44, ['y'] = -3006.47, ['z'] = -79.0, lock = true, perm = "bratva.permissao" },
	[38] = { text = true, hash = 3652358431, ['x'] = -2065.00, ['y'] = -456.33,  ['z'] = 16.43, lock = true, perm = "pmerj.permissao" },
	[39] = { text = true, hash = 3652358431, ['x'] = -2061.24, ['y'] =-459.16,   ['z'] = 16.43, lock = true, perm = "pmerj.permissao" },
	--[40] = { text = true, hash = -991486064, x = 84.66, y = -1959.76, z = 21.12, lock = true, perm = "desmanche.permissao" },
	--[41] = { text = true, hash = -1163592260, x = 75.639, y = -1969.70, z = 21.12, lock = true, perm = "desmanche.permissao" },
	--[42] = { text = true, hash = -1563799200, x = 74.70, y = -1966.69, z = 21.12, lock = true, perm = "desmanche.permissao" }
	
	
	-- Portas Celas Embaixo da DP
	--[13] = { text = true, hash = 3261965677, ['x'] = 476.8, ['y'] = -996.46, ['z'] = 24.92, lock = true, perm = "portadp.permissao" },
	--[14] = { text = true, hash = 3261965677, ['x'] = 481.08, ['y'] = -996.44, ['z'] = 24.92, lock = true, perm = "portadp.permissao" },
	--[15] = { text = true, hash = 3261965677, ['x'] = 476.02, ['y'] = -1003.52, ['z'] = 24.92, lock = true, perm = "portadp.permissao" },
	--[16] = { text = true, hash = 3261965677, ['x'] = 467.45, ['y'] = -1003.53, ['z'] = 24.92, lock = true, perm = "portadp.permissao" },
	--[17] = { text = true, hash = 3775898501, ['x'] = -453.49, ['y'] = 6011.35, ['z'] = 31.72, lock = true, perm = "portadp.permissao" },
	--[18] = { text = true, hash = 452874391, ['x'] = -451.63, ['y'] = 6006.86, ['z'] = 31.79, lock = true, perm = "portadp.permissao" },
	--[19] = { text = true, hash = 452874391, ['x'] = -446.45, ['y'] = 6001.66, ['z'] = 31.72, lock = true, perm = "portadp.permissao" },
	--[20] = { text = true, hash = 3283274690, ['x'] = -436.75, ['y'] = 5991.93, ['z'] = 31.72, lock = true, perm = "portadp.permissao" },
	--[21] = { text = true, hash = 631614199, ['x'] = -431.98, ['y'] = 6000.44, ['z'] = 31.72, lock = true, perm = "portadp.permissao" },
	--[22] = { text = true, hash = 631614199, ['x'] = -428.85, ['y'] = 5997.38, ['z'] = 31.72, lock = true, perm = "portadp.permissao" },
	--[23] = { text = true, hash = 3342610948, ['x'] = -441.78, ['y'] = 6004.28, ['z'] = 31.72, lock = true, perm = "portadp.permissao" },
	--[24] = { text = true, hash = 3342610948, ['x'] = -438.45, ['y'] = 6007.65, ['z'] = 31.72, lock = true, perm = "portadp.permissao" },
	--[25] = { text = false, hash = 749848321, ['x'] = 452.71, ['y'] = -982.58, ['z'] = 30.68, lock = false, perm = "admin.permissao" },
	[40] = { text = true, hash = -147325430, ['x'] = 97.62, ['y'] = 6328.11, ['z'] = 31.37, lock = true, perm = "helipa.permissao" },
	[40] = { text = true, hash = -147325430, ['x'] = -1096.35, ['y'] = 4949.4, ['z'] = 218.36, lock = true, perm = "zeronze.permissao" },
	
	--[41] = { text = true, hash = -147325430, ['x'] = -1097.06, ['y'] = 4949.30, ['z'] = 218.64, lock = true, perm = "milicia.permissao" },
	--[42] = { text = true, hash = -147325430, ['x'] = 1484.20, ['y'] = 6392.29, ['z'] = 23.45, lock = true, perm = "families.permissao" },
	--[45] = { text = true, hash = 1901183774, ['x'] = -2667.61, ['y'] = 1325.91, ['z'] = 147.44, lock = true, perm = "mafia.permissao" },
	--[46] = { text = true, hash = -147325430, ['x'] = -2667.38, ['y'] = 1330.10, ['z'] = 147.44, lock = true, perm = "mafia.permissao" },
	--[47] = { text = true, hash = 827574885, ['x'] = -873.98, ['y'] = -1460.24, ['z'] = 7.52, lock = true, perm = "lifeinvader.permissao", other = 48 },
	--[48] = { text = true, hash = -725970636, ['x'] = -873.73, ['y'] = -1460.78, ['z'] = 7.52, lock = true, perm = "lifeinvader.permissao", other = 47 },
	--[49] = { text = true, hash = 272205552, ['x'] = -879.48, ['y'] = -1445.04, ['z'] = 7.52, lock = true, perm = "lifeinvader.permissao", other = 50 },
	--[50] = { text = true, hash = 1888438146, ['x'] = -879.62, ['y'] = -1444.52, ['z'] = 7.52, lock = true, perm = "lifeinvader.permissao", other = 49 },
	--[51] = { text = true, hash = 272205552, ['x'] = -875.88, ['y'] = -1454.74, ['z'] = 7.52, lock = true, perm = "lifeinvader.permissao", other = 52 },
	--[52] = { text = true, hash = 1888438146, ['x'] = -876.03, ['y'] = -1454.22, ['z'] = 7.52, lock = true, perm = "lifeinvader.permissao", other = 51 },
	--[53] = { text = true, hash = 116180164, ['x'] = -1162.64, ['y'] = -1716.85, ['z'] = 11.8, lock = true, perm = "conce.permissao", other = 54 },
	--[54] = { text = true, hash = 3879044438, ['x'] = -1162.36, ['y'] = -1717.28, ['z'] = 11.8, lock = true, perm = "conce.permissao", other = 53 },
	[61] = { text = true, hash = 1335311341, ['x'] = 959.01, ['y'] = -121.41, ['z'] = 75.09, lock = true, perm = "motoclub.permissao" },
	--[62] = { text = true, hash = -292728657, ['x'] = -949.22, ['y'] = -1475.31, ['z'] = 6.8, lock = true, perm = "lifeinvader.permissao", other = 63 },
	--[63] = { text = true, hash = -1653461382, ['x'] = -948.87, ['y'] = -1476.78, ['z'] = 6.8, lock = true, perm = "lifeinvader.permissao", other = 62},
	--[64] = { text = false, hash = 1504256620, ['x'] = -1002.85, ['y'] = -477.84, ['z'] = 50.02, lock = true, perm = "admin.permissao",  other = 66 },
	--[65] = { text = false, hash = 262671971, ['x'] = -1002.85, ['y'] = -477.84, ['z'] = 50.02, lock = true, perm = "admin.permissao",  other = 65 },
	--[66] = { text = false, hash = 262671971, ['x'] = -1002.85, ['y'] = -477.84, ['z'] = 50.02, lock = true, perm = "admin.permissao"},
	--[67] = { text = true, hash = -1249591818, ['x'] = -2652.87, ['y'] = 1326.35, ['z'] = 147.45, lock = true, perm = "mafia.permissao" },
	[68] = { text = true, hash = -1563640173, ['x'] = -1500.78, ['y'] = 103.61, ['z'] = 55.68, lock = true, perm = "admin.permissao" },
	[69] = { text = true, hash = -1563640173, ['x'] = -1522.0, ['y'] = 143.38, ['z'] = 55.66, lock = true, perm = "admin.permissao" },
	[70] = { text = true, hash = 1033441082, ['x'] = -1537.02, ['y'] = 130.74, ['z'] = 57.38, lock = true, perm = "admin.permissao" },
	--[69] = { text = true, hash = 1099436502, ['x'] = -592.44, ['y'] = -1630.9, ['z'] = 26.99, lock = true, perm = "flanela.permissao", others = 70 },
	--[70] = { text = true, hash = -1627599682, ['x'] = -592.32, ['y'] = -1629.6, ['z'] = 26.99, lock = true, perm = "flanela.permissao", others = 69 },
	--[71] = { text = true, hash = -1627599682, ['x'] = -592.32, ['y'] = -1629.6, ['z'] = 26.99, lock = true, perm = "instrutor.permissao", others = 72 },
	--[72] = { text = true, hash = -1627599682, ['x'] = -592.32, ['y'] = -1629.6, ['z'] = 26.99, lock = true, perm = "instrutor.permissao", others = 71 },
}

return cfg