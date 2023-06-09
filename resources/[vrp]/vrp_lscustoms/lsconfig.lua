local colors = {
	{ name = "Black", colorindex = 0 },
	{ name = "Carbon Black", colorindex = 147 },
	{ name = "Hraphite", colorindex = 1 },
	{ name = "Anhracite Black", colorindex = 11 },
	{ name = "Black Steel", colorindex = 2 },
	{ name = "Dark Steel", colorindex = 3 },
	{ name = "Silver", colorindex = 4 },
	{ name = "Bluish Silver", colorindex = 5 },
	{ name = "Rolled Steel", colorindex = 6 },
	{ name = "Shadow Silver", colorindex = 7 },
	{ name = "Stone Silver", colorindex = 8 },
	{ name = "Midnight Silver", colorindex = 9 },
	{ name = "Cast Iron Silver", colorindex = 10 },
	{ name = "Red", colorindex = 27 },
	{ name = "Torino Red", colorindex = 28 },
	{ name = "Formula Red", colorindex = 29 },
	{ name = "Lava Red", colorindex = 150 },
	{ name = "Blaze Red", colorindex = 30 },
	{ name = "Grace Red", colorindex = 31 },
	{ name = "Garnet Red", colorindex = 32 },
	{ name = "Sunset Red", colorindex = 33 },
	{ name = "Cabernet Red", colorindex = 34 },
	{ name = "Wine Red", colorindex = 143 },
	{ name = "Candy Red", colorindex = 35 },
	{ name = "Hot Pink", colorindex = 135 },
	{ name = "Pfsiter Pink", colorindex = 137 },
	{ name = "Salmon Pink", colorindex = 136 },
	{ name = "Sunrise Orange", colorindex = 36 },
	{ name = "Orange", colorindex = 38 },
	{ name = "Bright Orange", colorindex = 138 },
	{ name = "Gold", colorindex = 99 },
	{ name = "Bronze", colorindex = 90 },
	{ name = "Yellow", colorindex = 88 },
	{ name = "Race Yellow", colorindex = 89 },
	{ name = "Dew Yellow", colorindex = 91 },
	{ name = "Dark Green", colorindex = 49 },
	{ name = "Racing Green", colorindex = 50 },
	{ name = "Sea Green", colorindex = 51 },
	{ name = "Olive Green", colorindex = 52 },
	{ name = "Bright Green", colorindex = 53 },
	{ name = "Gasoline Green", colorindex = 54 },
	{ name = "Lime Green", colorindex = 92 },
	{ name = "Midnight Blue", colorindex = 141 },
	{ name = "Galaxy Blue", colorindex = 61 },
	{ name = "Dark Blue", colorindex = 62 },
	{ name = "Saxon Blue", colorindex = 63 },
	{ name = "Blue", colorindex = 64 },
	{ name = "Mariner Blue", colorindex = 65 },
	{ name = "Harbor Blue", colorindex = 66 },
	{ name = "Diamond Blue", colorindex = 67 },
	{ name = "Surf Blue", colorindex = 68 },
	{ name = "Nautical Blue", colorindex = 69 },
	{ name = "Racing Blue", colorindex = 73 },
	{ name = "Ultra Blue", colorindex = 70 },
	{ name = "Light Blue", colorindex = 74 },
	{ name = "Chocolate Brown", colorindex = 96 },
	{ name = "Bison Brown", colorindex = 101 },
	{ name = "Creeen Brown", colorindex = 95 },
	{ name = "Feltzer Brown", colorindex = 94 },
	{ name = "Maple Brown", colorindex = 97 },
	{ name = "Beechwood Brown", colorindex = 103 },
	{ name = "Sienna Brown", colorindex = 104 },
	{ name = "Saddle Brown", colorindex = 98 },
	{ name = "Moss Brown", colorindex = 100 },
	{ name = "Woodbeech Brown", colorindex = 102 },
	{ name = "Straw Brown", colorindex = 99 },
	{ name = "Sandy Brown", colorindex = 105 },
	{ name = "Bleached Brown", colorindex = 106 },
	{ name = "Schafter Purple", colorindex = 71 },
	{ name = "Spinnaker Purple", colorindex = 72 },
	{ name = "Midnight Purple", colorindex = 142 },
	{ name = "Bright Purple", colorindex = 145 },
	{ name = "Cream", colorindex = 107 },
	{ name = "Ice White", colorindex = 111 },
	{ name = "Frost White", colorindex = 112 }
}

local metalcolors = {
	{ name = "Brushed Steel", colorindex = 117 },
	{ name = "Brushed Black Steel", colorindex = 118 },
	{ name = "Brushed Aluminum", colorindex = 119 },
	{ name = "Pure Gold", colorindex = 158 },
	{ name = "Brushed Gold", colorindex = 159 }
}

local mattecolors = {
	{ name = "Black", colorindex = 12 },
	{ name = "Gray", colorindex = 13 },
	{ name = "Light Gray", colorindex = 14 },
	{ name = "Ice White", colorindex = 131 },
	{ name = "Blue", colorindex = 83 },
	{ name = "Dark Blue", colorindex = 82 },
	{ name = "Midnight Blue", colorindex = 84 },
	{ name = "Midnight Purple", colorindex = 149 },
	{ name = "Schafter Purple", colorindex = 148 },
	{ name = "Red", colorindex = 39 },
	{ name = "Dark Red", colorindex = 40 },
	{ name = "Orange", colorindex = 41 },
	{ name = "Yellow", colorindex = 42 },
	{ name = "Lime Green", colorindex = 55 },
	{ name = "Green", colorindex = 128 },
	{ name = "Frost Green", colorindex = 151 },
	{ name = "Foliage Green", colorindex = 155 },
	{ name = "Olive Darb", colorindex = 152 },
	{ name = "Dark Earth", colorindex = 153 },
	{ name = "Desert Tan", colorindex = 154 }
}

LSC_Config = {}
LSC_Config.prices = {}
LSC_Config.prices = {
	windowtint = {
		{ name = "Pure Black", tint = 1, price = 1500 },
		{ name = "Darksmoke", tint = 2, price = 1500 },
		{ name = "Lightsmoke", tint = 3, price = 1500 },
		{ name = "Limo", tint = 4, price = 1500 },
		{ name = "Green", tint = 5, price = 1500 },
	},
	chrome = {
		colors = {
			{ name = "Chrome", colorindex = 120 }
		},
		price = 3200
	},
	classic = {
		colors = colors,
		price = 3200
	},
	matte = {
		colors = mattecolors,
		price = 3200
	},
	metallic = {
		colors = colors,
		price = 3200
	},
	metal = {
		colors = metalcolors,
		price = 3200
	},
	chrome2 = {
		colors = {
			{ name = "Chrome", colorindex = 120 }
		},
		price = 1200
	},
	classic2 = {
		colors = colors,
		price = 1200
	},
	matte2 = {
		colors = mattecolors,
		price = 1200
	},
	metallic2 = {
		colors = colors,
		price = 1200
	},
	metal2 = {
		colors = metalcolors,
		price = 1200
	},
	neonlayout = {
		{ name = "Front,Back and Sides", price = 1200 }
	},
	neoncolor = {
		{ name = "White", neon = {255,255,255}, price = 1500 },
		{ name = "Blue", neon = {0,0,255}, price = 1500 },
		{ name = "Electric Blue", neon = {0,150,255}, price = 1500 },
		{ name = "Mint Green", neon = {50,255,155}, price = 1500 },
		{ name = "Lime Green", neon = {0,255,0}, price = 1500 },
		{ name = "Yellow", neon = {255,255,0}, price = 1500 },
		{ name = "Golden Shower", neon = {204,204,0}, price = 1500 },
		{ name = "Orange", neon = {255,128,0}, price = 1500 },
		{ name = "Red", neon = {255,0,0}, price = 1500 },
		{ name = "Pony Pink", neon = {255,102,255}, price = 1500 },
		{ name = "Hot Pink",neon = {255,0,255}, price = 1500 },
		{ name = "Purple", neon = {153,0,153}, price = 1500 },
		{ name = "Brown", neon = {139,69,19}, price = 1500 }
	},
	plates = {
		{ name = "Blue on White 1", plateindex = 0, price = 300 },
		{ name = "Blue On White 2", plateindex = 3, price = 300 },
		{ name = "Blue On White 3", plateindex = 4, price = 300 },
		{ name = "Yellow on Blue", plateindex = 2, price = 300 },
		{ name = "Yellow on Black", plateindex = 1, price = 300 }
	},
	wheelaccessories = {
		{ name = "Stock Tires", price = 900 },
		{ name = "Custom Tires", price = 1500 },
		--{ name = "Bulletproof Tires", price = 10000 },
		{ name = "White Tire Smoke", smokecolor = {254,254,254}, price = 1000 },
		{ name = "Black Tire Smoke", smokecolor = {1,1,1}, price = 1000 },
		{ name = "BLue Tire Smoke", smokecolor = {0,150,255}, price = 1000 },
		{ name = "Yellow Tire Smoke", smokecolor = {255,255,50}, price = 1000 },
		{ name = "Orange Tire Smoke", smokecolor = {255,153,51}, price = 1000 },
		{ name = "Red Tire Smoke", smokecolor = {255,10,10}, price = 1000 },
		{ name = "Green Tire Smoke", smokecolor = {10,255,10}, price = 1000 },
		{ name = "Purple Tire Smoke", smokecolor = {153,10,153}, price = 1000 },
		{ name = "Pink Tire Smoke", smokecolor = {255,102,178}, price = 1000 },
		{ name = "Gray Tire Smoke",smokecolor = {128,128,128}, price = 1000 }
	},
	wheelcolor = {
		colors = colors,
		price = 700
	},
	frontwheel = {
		{ name = "Stock", wtype = 6, mod = -1, price = 1200 },
		{ name = "Speedway", wtype = 6, mod = 0, price = 1500 },
		{ name = "Streetspecial", wtype = 6, mod = 1, price = 1500 },
		{ name = "Racer", wtype = 6, mod = 2, price = 1500 },
		{ name = "Trackstar", wtype = 6, mod = 3, price = 1500 },
		{ name = "Overlord", wtype = 6, mod = 4, price = 1500 },
		{ name = "Trident", wtype = 6, mod = 5, price = 1500 },
		{ name = "Triplethreat", wtype = 6, mod = 6, price = 1500 },
		{ name = "Stilleto", wtype = 6, mod = 7, price = 1500 },
		{ name = "Wires", wtype = 6, mod = 8, price = 1500 },
		{ name = "Bobber", wtype = 6, mod = 9, price = 1500 },
		{ name = "Solidus", wtype = 6, mod = 10, price = 1500 },
		{ name = "Iceshield", wtype = 6, mod = 11, price = 1500 },
		{ name = "Loops", wtype = 6, mod = 12, price = 1500 }
	},
	backwheel = {
		{ name = "Stock", wtype = 6, mod = -1, price = 1200 },
		{ name = "Speedway", wtype = 6, mod = 0, price = 1500 },
		{ name = "Streetspecial", wtype = 6, mod = 1, price = 1500 },
		{ name = "Racer", wtype = 6, mod = 2, price = 1500 },
		{ name = "Trackstar", wtype = 6, mod = 3, price = 1500 },
		{ name = "Overlord", wtype = 6, mod = 4, price = 1500 },
		{ name = "Trident", wtype = 6, mod = 5, price = 1500 },
		{ name = "Triplethreat", wtype = 6, mod = 6, price = 1500 },
		{ name = "Stilleto", wtype = 6, mod = 7, price = 1500 },
		{ name = "Wires", wtype = 6, mod = 8, price = 1500 },
		{ name = "Bobber", wtype = 6, mod = 9, price = 1500 },
		{ name = "Solidus", wtype = 6, mod = 10, price = 1500 },
		{ name = "Iceshield", wtype = 6, mod = 11, price = 1500 },
		{ name = "Loops", wtype = 6, mod = 12, price = 1500 }
	},
	sportwheels = {
		{ name = "Stock", wtype = 0, mod = -1, price = 1200 },
		{ name = "Inferno", wtype = 0, mod = 0, price = 4000 },
		{ name = "Deepfive", wtype = 0, mod = 1, price = 4000 },
		{ name = "Lozspeed", wtype = 0, mod = 2, price = 4000 },
		{ name = "Diamondcut", wtype = 0, mod = 3, price = 4000 },
		{ name = "Chrono", wtype = 0, mod = 4, price = 4000 },
		{ name = "Feroccirr", wtype = 0, mod = 5, price = 4000 },
		{ name = "Fiftynine", wtype = 0, mod = 6, price = 4000 },
		{ name = "Mercie", wtype = 0, mod = 7, price = 4000 },
		{ name = "Syntheticz", wtype = 0, mod = 8, price = 4000 },
		{ name = "Organictyped", wtype = 0, mod = 9, price = 4000 },
		{ name = "Endov1", wtype = 0, mod = 10, price = 4000 },
		{ name = "Duper7", wtype = 0, mod = 11, price = 4000 },
		{ name = "Uzer", wtype = 0, mod = 12, price = 4000 },
		{ name = "Groundride", wtype = 0, mod = 13, price = 4000 },
		{ name = "Spacer", wtype = 0, mod = 14, price = 4000 },
		{ name = "Venum", wtype = 0, mod = 15, price = 4000 },
		{ name = "Cosmo", wtype = 0, mod = 16, price = 4000 },
		{ name = "Dashvip", wtype = 0, mod = 17, price = 4000 },
		{ name = "Icekid", wtype = 0, mod = 18, price = 4000 },
		{ name = "Ruffeld", wtype = 0, mod = 19, price = 4000 },
		{ name = "Wangenmaster", wtype = 0, mod = 20, price = 4000 },
		{ name = "Superfive", wtype = 0, mod = 21, price = 4000 },
		{ name = "Endov2", wtype = 0, mod = 22, price = 4000 },
		{ name = "Slitsix", wtype = 0, mod = 23, price = 4000 }
	},
	suvwheels = {
		{ name = "Stock", wtype = 3, mod = -1, price = 1200 },
		{ name = "Enercy", wtype = 3, mod = 0, price = 4000 },
		{ name = "Benefactor", wtype = 3, mod = 1, price = 4000 },
		{ name = "Cosmo", wtype = 3, mod = 2, price = 4000 },
		{ name = "Bippu", wtype = 3, mod = 3, price = 4000 },
		{ name = "Royalsix", wtype = 3, mod = 4, price = 4000 },
		{ name = "Fagorme", wtype = 3, mod = 5, price = 4000 },
		{ name = "Deluxe", wtype = 3, mod = 6, price = 4000 },
		{ name = "Icedout", wtype = 3, mod = 7, price = 4000 },
		{ name = "Cognscenti", wtype = 3, mod = 8, price = 4000 },
		{ name = "Lozspeedten", wtype = 3, mod = 9, price = 4000 },
		{ name = "Supernova", wtype = 3, mod = 10, price = 4000 },
		{ name = "Obeyrs", wtype = 3, mod = 11, price = 4000 },
		{ name = "Lozspeedballer", wtype = 3, mod = 12, price = 4000 },
		{ name = "Extra vaganzo", wtype = 3, mod = 13, price = 4000 },
		{ name = "Splitsix", wtype = 3, mod = 14, price = 4000 },
		{ name = "Empowered", wtype = 3, mod = 15, price = 4000 },
		{ name = "Sunrise", wtype = 3, mod = 16, price = 4000 },
		{ name = "Dashvip", wtype = 3, mod = 17, price = 4000 },
		{ name = "Cutter", wtype = 3, mod = 18, price = 4000 }
	},
	offroadwheels = {
		{ name = "Stock", wtype = 4, mod = -1, price = 1200 },
		{ name = "Raider", wtype = 4, mod = 0, price = 4000 },
		{ name = "Mudslinger", wtype = 4, modtype = 23, wtype = 4, mod = 1, price = 4000 },
		{ name = "Nevis", wtype = 4, mod = 2, price = 4000 },
		{ name = "Cairngorm", wtype = 4, mod = 3, price = 4000 },
		{ name = "Amazon", wtype = 4, mod = 4, price = 4000 },
		{ name = "Challenger", wtype = 4, mod = 5, price = 4000 },
		{ name = "Dunebasher", wtype = 4, mod = 6, price = 4000 },
		{ name = "Fivestar", wtype = 4, mod = 7, price = 4000 },
		{ name = "Rockcrawler", wtype = 4, mod = 8, price = 4000 },
		{ name = "Milspecsteelie", wtype = 4, mod = 9, price = 4000 },
	},
	tunerwheels = {
		{ name = "Stock", wtype = 5, mod = -1, price = 1200 },
		{ name = "Cosmo", wtype = 5, mod = 0, price = 4000 },
		{ name = "Supermesh", wtype = 5, mod = 1, price = 4000 },
		{ name = "Outsider", wtype = 5, mod = 2, price = 4000 },
		{ name = "Rollas", wtype = 5, mod = 3, price = 4000 },
		{ name = "Driffmeister", wtype = 5, mod = 4, price = 4000 },
		{ name = "Slicer", wtype = 5, mod = 5, price = 4000 },
		{ name = "Elquatro", wtype = 5, mod = 6, price = 4000 },
		{ name = "Dubbed", wtype = 5, mod = 7, price = 4000 },
		{ name = "Fivestar", wtype = 5, mod = 8, price = 4000 },
		{ name = "Slideways", wtype = 5, mod = 9, price = 4000 },
		{ name = "Apex", wtype = 5, mod = 10, price = 4000 },
		{ name = "Stancedeg", wtype = 5, mod = 11, price = 4000 },
		{ name = "Countersteer", wtype = 5, mod = 12, price = 4000 },
		{ name = "Endov1", wtype = 5, mod = 13, price = 4000 },
		{ name = "Endov2dish", wtype = 5, mod = 14, price = 4000 },
		{ name = "Guppez", wtype = 5, mod = 15, price = 4000 },
		{ name = "Chokadori", wtype = 5, mod = 16, price = 4000 },
		{ name = "Chicane", wtype = 5, mod = 17, price = 4000 },
		{ name = "Saisoku", wtype = 5, mod = 18, price = 4000 },
		{ name = "Dishedeight", wtype = 5, mod = 19, price = 4000 },
		{ name = "Fujiwara", wtype = 5, mod = 20, price = 4000 },
		{ name = "Zokusha", wtype = 5, mod = 21, price = 4000 },
		{ name = "Battlevill", wtype = 5, mod = 22, price = 4000 },
		{ name = "Rallymaster", wtype = 5, mod = 23, price = 4000 }
	},
	importwheels = {
		{ name = "Stock", wtype = 0, mod = -1, price = 1200 },
		{ name = "Import 1", wtype = 0, mod = 50, price = 4000 },
		{ name = "Import 2", wtype = 0, mod = 51, price = 4000 },
		{ name = "Import 3", wtype = 0, mod = 52, price = 4000 },
		{ name = "Import 4", wtype = 0, mod = 53, price = 4000 },
		{ name = "Import 5", wtype = 0, mod = 54, price = 4000 },
		{ name = "Import 6", wtype = 0, mod = 55, price = 4000 },
		{ name = "Import 7", wtype = 0, mod = 56, price = 4000 },
		{ name = "Import 8", wtype = 0, mod = 57, price = 4000 },
		{ name = "Import 9", wtype = 0, mod = 58, price = 4000 },
		{ name = "Import 10", wtype = 0, mod = 59, price = 4000 },
		{ name = "Import 11", wtype = 0, mod = 60, price = 4000 },
		{ name = "Import 12", wtype = 0, mod = 61, price = 4000 },
		{ name = "Import 13", wtype = 0, mod = 62, price = 4000 },
		{ name = "Import 14", wtype = 0, mod = 63, price = 4000 },
		{ name = "Import 15", wtype = 0, mod = 64, price = 4000 },
		{ name = "Import 16", wtype = 0, mod = 65, price = 4000 },
		{ name = "Import 17", wtype = 0, mod = 66, price = 4000 },
		{ name = "Import 18", wtype = 0, mod = 67, price = 4000 },
		{ name = "Import 19", wtype = 0, mod = 68, price = 4000 },
		{ name = "Import 20", wtype = 0, mod = 69, price = 4000 },
		{ name = "Import 21", wtype = 0, mod = 70, price = 4000 },
		{ name = "Import 22", wtype = 0, mod = 71, price = 4000 },
		{ name = "Import 23", wtype = 0, mod = 72, price = 4000 },
		{ name = "Import 24", wtype = 0, mod = 73, price = 4000 },
		{ name = "Import 25", wtype = 0, mod = 74, price = 4000 },
		{ name = "Import 26", wtype = 0, mod = 75, price = 4000 },
		{ name = "Import 27", wtype = 0, mod = 76, price = 4000 },
		{ name = "Import 28", wtype = 0, mod = 77, price = 4000 },
		{ name = "Import 29", wtype = 0, mod = 78, price = 4000 },
		{ name = "Import 30", wtype = 0, mod = 79, price = 4000 },
		{ name = "Import 31", wtype = 0, mod = 80, price = 4000 },
		{ name = "Import 32", wtype = 0, mod = 81, price = 4000 },
		{ name = "Import 33", wtype = 0, mod = 82, price = 4000 },
		{ name = "Import 34", wtype = 0, mod = 83, price = 4000 },
		{ name = "Import 35", wtype = 0, mod = 84, price = 4000 },
		{ name = "Import 36", wtype = 0, mod = 85, price = 4000 },
		{ name = "Import 37", wtype = 0, mod = 86, price = 4000 },
		{ name = "Import 38", wtype = 0, mod = 87, price = 4000 },
		{ name = "Import 39", wtype = 0, mod = 88, price = 4000 },
		{ name = "Import 40", wtype = 0, mod = 89, price = 4000 },
		{ name = "Import 41", wtype = 0, mod = 90, price = 4000 },
		{ name = "Import 42", wtype = 0, mod = 91, price = 4000 },
		{ name = "Import 43", wtype = 0, mod = 92, price = 4000 },
		{ name = "Import 44", wtype = 0, mod = 93, price = 4000 },
		{ name = "Import 45", wtype = 0, mod = 94, price = 4000 },
		{ name = "Import 46", wtype = 0, mod = 95, price = 4000 },
		{ name = "Import 47", wtype = 0, mod = 96, price = 4000 },
		{ name = "Import 48", wtype = 0, mod = 97, price = 4000 },
		{ name = "Import 49", wtype = 0, mod = 98, price = 4000 },
		{ name = "Import 50", wtype = 0, mod = 99, price = 4000 },
		{ name = "Import 51", wtype = 0, mod = 100, price = 4000 },
		{ name = "Import 52", wtype = 0, mod = 101, price = 4000 },
		{ name = "Import 53", wtype = 0, mod = 102, price = 4000 },
		{ name = "Import 54", wtype = 0, mod = 103, price = 4000 },
		{ name = "Import 55", wtype = 0, mod = 104, price = 4000 },
		{ name = "Import 56", wtype = 0, mod = 105, price = 4000 },
		{ name = "Import 57", wtype = 0, mod = 106, price = 4000 },
		{ name = "Import 58", wtype = 0, mod = 107, price = 4000 },
		{ name = "Import 59", wtype = 0, mod = 108, price = 4000 },
		{ name = "Import 60", wtype = 0, mod = 109, price = 4000 },
		{ name = "Import 61", wtype = 0, mod = 110, price = 4000 },
		{ name = "Import 62", wtype = 0, mod = 111, price = 4000 },
		{ name = "Import 63", wtype = 0, mod = 112, price = 4000 },
		{ name = "Import 64", wtype = 0, mod = 113, price = 4000 },
		{ name = "Import 65", wtype = 0, mod = 114, price = 4000 },
		{ name = "Import 66", wtype = 0, mod = 115, price = 4000 },
		{ name = "Import 67", wtype = 0, mod = 116, price = 4000 },
		{ name = "Import 68", wtype = 0, mod = 117, price = 4000 },
		{ name = "Import 69", wtype = 0, mod = 118, price = 4000 },
		{ name = "Import 70", wtype = 0, mod = 119, price = 4000 },
		{ name = "Import 71", wtype = 0, mod = 120, price = 4000 },
		{ name = "Import 72", wtype = 0, mod = 121, price = 4000 },
		{ name = "Import 73", wtype = 0, mod = 122, price = 4000 },
		{ name = "Import 74", wtype = 0, mod = 123, price = 4000 },
		{ name = "Import 75", wtype = 0, mod = 124, price = 4000 },
		{ name = "Import 76", wtype = 0, mod = 125, price = 4000 },
		{ name = "Import 77", wtype = 0, mod = 126, price = 4000 },
		{ name = "Import 78", wtype = 0, mod = 127, price = 4000 },
		{ name = "Import 79", wtype = 0, mod = 128, price = 4000 },
		{ name = "Import 80", wtype = 0, mod = 129, price = 4000 },
		{ name = "Import 81", wtype = 0, mod = 130, price = 4000 },
		{ name = "Import 82", wtype = 0, mod = 131, price = 4000 },
		{ name = "Import 83", wtype = 0, mod = 132, price = 4000 },
		{ name = "Import 84", wtype = 0, mod = 133, price = 4000 },
		{ name = "Import 85", wtype = 0, mod = 134, price = 4000 },
		{ name = "Import 86", wtype = 0, mod = 135, price = 4000 },
		{ name = "Import 87", wtype = 0, mod = 136, price = 4000 },
		{ name = "Import 88", wtype = 0, mod = 137, price = 4000 },
		{ name = "Import 89", wtype = 0, mod = 138, price = 4000 },		
		{ name = "Import 90", wtype = 0, mod = 139, price = 4000 },
		{ name = "Import 91", wtype = 0, mod = 140, price = 4000 },
		{ name = "Import 92", wtype = 0, mod = 141, price = 4000 },
		{ name = "Import 93", wtype = 0, mod = 142, price = 4000 },
		{ name = "Import 94", wtype = 0, mod = 143, price = 4000 },
		{ name = "Import 95", wtype = 0, mod = 144, price = 4000 },
		{ name = "Import 96", wtype = 0, mod = 145, price = 4000 },
		{ name = "Import 97", wtype = 0, mod = 146, price = 4000 },
		{ name = "Import 98", wtype = 0, mod = 147, price = 4000 },
		{ name = "Import 99", wtype = 0, mod = 148, price = 4000 },
		{ name = "Import 100", wtype = 0, mod = 149, price = 4000 },
		{ name = "Import 101", wtype = 0, mod = 150, price = 4000 },
		{ name = "Import 102", wtype = 0, mod = 151, price = 4000 },
		{ name = "Import 103", wtype = 0, mod = 152, price = 4000 },
		{ name = "Import 104", wtype = 0, mod = 153, price = 4000 },
		{ name = "Import 105", wtype = 0, mod = 154, price = 4000 },
		{ name = "Import 106", wtype = 0, mod = 155, price = 4000 },
		{ name = "Import 107", wtype = 0, mod = 156, price = 4000 },
		{ name = "Import 108", wtype = 0, mod = 157, price = 4000 },
		{ name = "Import 109", wtype = 0, mod = 158, price = 4000 },
		{ name = "Import 110", wtype = 0, mod = 159, price = 4000 },
		{ name = "Import 111", wtype = 0, mod = 160, price = 4000 },
		{ name = "Import 112", wtype = 0, mod = 161, price = 4000 },
		{ name = "Import 113", wtype = 0, mod = 162, price = 4000 },
	},
	highendwheels = {
		{ name = "Stock", wtype = 7, mod = -1, price = 1200 },
		{ name = "Shadow", wtype = 7, mod = 0, price = 4000 },
		{ name = "Hyper", wtype = 7, mod = 1, price = 4000 },
		{ name = "Blade", wtype = 7, mod = 2, price = 4000 },
		{ name = "Diamond", wtype = 7, mod = 3, price = 4000 },
		{ name = "Supagee", wtype = 7, mod = 4, price = 4000 },
		{ name = "Chromaticz", wtype = 7, mod = 5, price = 4000 },
		{ name = "Merciechlip", wtype = 7, mod = 6, price = 4000 },
		{ name = "Obeyrs", wtype = 7, mod = 7, price = 4000 },
		{ name = "Gtchrome", wtype = 7, mod = 8, price = 4000 },
		{ name = "Cheetahr", wtype = 7, mod = 9, price = 4000 },
		{ name = "Solar", wtype = 7, mod = 10, price = 4000 },
		{ name = "Splitten", wtype = 7, mod = 11, price = 4000 },
		{ name = "Dashvip", wtype = 7, mod = 12, price = 4000 },
		{ name = "Lozspeedten", wtype = 7, mod = 13, price = 4000 },
		{ name = "Carboninferno", wtype = 7, mod = 14, price = 4000 },
		{ name = "Carbonshadow", wtype = 7, mod = 15, price = 4000 },
		{ name = "Carbonz", wtype = 7, mod = 16, price = 4000 },
		{ name = "Carbonsolar", wtype = 7, mod = 17, price = 4000 },
		{ name = "Carboncheetahr", wtype = 7, mod = 18, price = 4000 },
		{ name = "Carbonsracer", wtype = 7, mod = 19, price = 4000 }
	},
	lowriderwheels = {
		{ name = "Stock", wtype = 2, mod = -1, price = 1200 },
		{ name = "Flare", wtype = 2, mod = 0, price = 4000 },
		{ name = "Wired", wtype = 2, mod = 1, price = 4000 },
		{ name = "Triplegolds", wtype = 2, mod = 2, price = 4000 },
		{ name = "Bigworm", wtype = 2, mod = 3, price = 4000 },
		{ name = "Sevenfives", wtype = 2, mod = 4, price = 4000 },
		{ name = "Splitsix", wtype = 2, mod = 5, price = 4000 },
		{ name = "Freshmesh", wtype = 2, mod = 6, price = 4000 },
		{ name = "Leadsled", wtype = 2, mod = 7, price = 4000 },
		{ name = "Turbine", wtype = 2, mod = 8, price = 4000 },
		{ name = "Superfin", wtype = 2, mod = 9, price = 4000 },
		{ name = "Classicrod", wtype = 2, mod = 10, price = 4000 },
		{ name = "Dollar", wtype = 2, mod = 11, price = 4000 },
		{ name = "Dukes", wtype = 2, mod = 12, price = 4000 },
		{ name = "Lowfive", wtype = 2, mod = 13, price = 4000 },
		{ name = "Gooch", wtype = 2, mod = 14, price = 4000 }
	},
	musclewheels = {
		{ name = "Stock", wtype = 1, mod = -1, price = 1200 },
		{ name = "Classicfive", wtype = 1, mod = 0, price = 4000 },
		{ name = "Dukes", wtype = 1, mod = 1, price = 4000 },
		{ name = "Musclefreak", wtype = 1, mod = 2, price = 4000 },
		{ name = "Kracka", wtype = 1, mod = 3, price = 4000 },
		{ name = "Azrea", wtype = 1, mod = 4, price = 4000 },
		{ name = "Mecha", wtype = 1, mod = 5, price = 4000 },
		{ name = "Blacktop", wtype = 1, mod = 6, price = 4000 },
		{ name = "Dragspl", wtype = 1, mod = 7, price = 4000 },
		{ name = "Revolver", wtype = 1, mod = 8, price = 4000 },
		{ name = "Classicrod", wtype = 1, mod = 9, price = 4000 },
		{ name = "Spooner", wtype = 1, mod = 10, price = 4000 },
		{ name = "Fivestar", wtype = 1, mod = 11, price = 4000 },
		{ name = "Oldschool", wtype = 1, mod = 12, price = 4000 },
		{ name = "Eljefe", wtype = 1, mod = 13, price = 4000 },
		{ name = "Dodman", wtype = 1, mod = 14, price = 4000 },
		{ name = "Sixgun", wtype = 1, mod = 15, price = 4000 },
		{ name = "Mercenary", wtype = 1, mod = 16, price = 4000 }
	},
	trim = {
		colors = colors,
		price = 1700
	},
	mods = {
		[48] = {
			startprice = 1700,
			increaseby = 0
		},
		[46] = {
			startprice = 1700,
			increaseby = 0
		},
		[45] = {
			startprice = 1700,
			increaseby = 0
		},
		[44] = {
			startprice = 1700,
			increaseby = 0
		},
		[43] = {
			startprice = 1700,
			increaseby = 0
		},
		[42] = {
			startprice = 1700,
			increaseby = 0
		},
		[41] = {
			startprice = 1700,
			increaseby = 0
		},
		[40] = {
			startprice = 1700,
			increaseby = 0
		},
		[39] = {
			startprice = 1700,
			increaseby = 0
		},
		[38] = {
			startprice = 1700,
			increaseby = 0
		},
		[37] = {
			startprice = 1700,
			increaseby = 0
		},
		[36] = {
			startprice = 1700,
			increaseby = 0
		},
		[35] = {
			startprice = 1700,
			increaseby = 0
		},
		[34] = {
			startprice = 1700,
			increaseby = 0
		},
		[33] = {
			startprice = 1700,
			increaseby = 0
		},
		[32] = {
			startprice = 1700,
			increaseby = 0
		},
		[31] = {
			startprice = 1700,
			increaseby = 0
		},
		[30] = {
			startprice = 1700,
			increaseby = 0
		},
		[29] = {
			startprice = 1700,
			increaseby = 0
		},
		[28] = {
			startprice = 1700,
			increaseby = 0
		},
		[27] = {
			startprice = 1700,
			increaseby = 0
		},
		[26] = {
			startprice = 1700,
			increaseby = 0
		},
		[25] = {
			startprice = 1700,
			increaseby = 0
		},
		[22] = {
			{ name = "Stock", mod = 0, price = 600 },
			{ name = "Xenon", mod = 1, price = 1500 }
		},
		[18] = {
			{ name = "None", mod = 0, price = 1200 },
			{ name = "Turbo", mod = 1, price = 10000 }
		},
		[16] = {
			{ name = "Resistência 20%", modtype = 16, mod = 0, price = 2500 },
			{ name = "Resistência 40%", modtype = 16, mod = 1, price = 5000 },
			{ name = "Resistência 60%", modtype = 16, mod = 2, price = 7500 },
			{ name = "Resistência 80%", modtype = 16, mod = 3, price = 15000 },
			{ name = "Resistência 100%", modtype = 16, mod = 4, price = 20000 }
		},
		[15] = {
			{ name = "Lowered Suspension", mod = 0, price = 5000 },
			{ name = "Street Suspension", mod = 1, price = 7500 },
			{ name = "Sport Suspension", mod = 2, price = 10000 },
			{ name = "Race Suspension", mod = 3, price = 15000 }
		},
		[14] = {
			{ name = "Truck Horn", mod = 0, price = 1000 },
			{ name = "Police Horn", mod = 1, price = 1000 },
			{ name = "Clown Horn", mod = 2, price = 1000 },
			{ name = "Musical Horn 1", mod = 3, price = 1000 },
			{ name = "Musical Horn 2", mod = 4, price = 1000 },
			{ name = "Musical Horn 3", mod = 5, price = 1000 },
			{ name = "Musical Horn 4", mod = 6, price = 1000 },
			{ name = "Musical Horn 5", mod = 7, price = 1000 },
			{ name = "Sad Trombone", mod = 8, price = 1000 },
			{ name = "Classical Horn 1", mod = 9, price = 1000 },
			{ name = "Classical Horn 2", mod = 10, price = 1000 },
			{ name = "Classical Horn 3", mod = 11, price = 1000 },
			{ name = "Classical Horn 4", mod = 12, price = 1000 },
			{ name = "Classical Horn 5", mod = 13, price = 1000 },
			{ name = "Classical Horn 6", mod = 14, price = 1000 },
			{ name = "Classical Horn 7", mod = 15, price = 1000 },
			{ name = "Scale Do", mod = 16, price = 1000 },
			{ name = "Scale Re", mod = 17, price = 1000 },
			{ name = "Scale Mi", mod = 18, price = 1000 },
			{ name = "Scale Fa", mod = 19, price = 1000 },
			{ name = "Scale Sol", mod = 20, price = 1000 },
			{ name = "Scale La", mod = 21, price = 1000 },
			{ name = "Scale Ti", mod = 22, price = 1000 },
			{ name = "Scale Do (High)", mod = 23, price = 1000 },
			{ name = "Jazz Horn 1", mod = 24, price = 1000 },
			{ name = "Jazz Horn 2", mod = 25, price = 1000 },
			{ name = "Jazz Horn 3", mod = 26, price = 1000 },
			{ name = "Jazz Horn Loop", mod = 27, price = 1000 },
			{ name = "Star Spangled Banner 1", mod = 28, price = 1000 },
			{ name = "Star Spangled Banner 2", mod = 29, price = 1000 },
			{ name = "Star Spangled Banner 3", mod = 30, price = 1000 },
			{ name = "Star Spangled Banner 4", mod = 31, price = 1000 },
			{ name = "Classical Horn Loop 1", mod = 32, price = 1000 },
			{ name = "Classical Horn 8", mod = 33, price = 1000 },
			{ name = "Classical Horn Loop 2", mod = 34, price = 1000 },
			{ name = "Halloween Loop 1", mod = 38, price = 1000 },
			{ name = "Halloween Loop 2", mod = 40, price = 1000 },
			{ name = "San Andreas Loop", mod = 42, price = 1000 },
			{ name = "Liberty City Loop", mod = 44, price = 1000 },
			{ name = "Festive Loop 1", mod = 46, price = 1000 },
			{ name = "Festive Loop 2", mod = 47, price = 1000 },
			{ name = "Festive Loop 3", mod = 48, price = 1000 }
		},
		[13] = {
			{ name = "Street Transmission", mod = 0, price = 8000 },
			{ name = "Sports Transmission", mod = 1, price = 12000 },
			{ name = "Race Transmission", mod = 2, price = 17000 }
		},
		[12] = {
			{ name = "Street Brakes", mod = 0, price = 8000 },
			{ name = "Sport Brakes", mod = 1, price = 12000 },
			{ name = "Race Brakes", mod = 2, price = 17000 }
		},
		[11] = {
			{ name = "Street Engine", mod = 0, price = 10000 },
			{ name = "Sports Engine", mod = 1, price = 18000 },
			{ name = "Race Engine", mod = 2, price = 22000 },
			{ name = "Top Engine", mod = 3, price = 25000 }
		},
		[10] = {
			startprice = 1000,
			increaseby = 0
		},
		[8] = {
			startprice = 1000,
			increaseby = 0
		},
		[7] = {
			startprice = 1000,
			increaseby = 0
		},
		[6] = {
			startprice = 1000,
			increaseby = 0
		},
		[5] = {
			startprice = 1000,
			increaseby = 0
		},
		[4] = {
			startprice = 1000,
			increaseby = 0
		},
		[3] = {
			startprice = 1000,
			increaseby = 0
		},
		[2] = {
			startprice = 1000,
			increaseby = 0
		},
		[1] = {
			startprice = 1000,
			increaseby = 0
		},
		[0] = {
			startprice = 1000,
			increaseby = 0
		}
	}
}

LSC_Config.ModelBlacklist = {
	--"police"
}

LSC_Config.lock = true
LSC_Config.oldenter = true

LSC_Config.menu = {
	controls = {
		menu_up = 27,
		menu_down = 173,
		menu_left = 174,
		menu_right = 175,
		menu_select = 201,
		menu_back = 177
	},
	position = "left",
	theme = "light",
	maxbuttons = 10,
	width = 0.24,
	height = 0.36
}