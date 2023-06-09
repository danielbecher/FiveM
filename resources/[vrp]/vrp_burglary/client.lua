-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
-----------------------------------------------------------------------------------------------------------------------------------------
src = {}
Tunnel.bindInterface("vrp_burglary",src)
vSERVER = Tunnel.getInterface("vrp_burglary")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local roubando = false
local cofre = false
local vault = nil
local list = {}
local homeName = ""
-----------------------------------------------------------------------------------------------------------------------------------------
-- ARRAY
-----------------------------------------------------------------------------------------------------------------------------------------
local houses = {
	['LS05'] = {
		['enter'] = { ['x'] = 1409.93, ['y'] = 1147.38, ['z'] = 114.33, ['h'] = 90.0 },
		['exit'] = { ['x'] = 1408.57, ['y'] = 1147.27, ['z'] = 114.33 },
		['vault'] = { ['x'] = 1400.42, ['y'] = 1152.94, ['z'] = 114.33, ['h'] = 270.0 },
		['locs'] = {	
			{ ['id'] = 1, ['x'] = 1399.99, ['y'] = 1139.69, ['z'] = 114.33 },
			{ ['id'] = 2, ['x'] = 1403.61, ['y'] = 1144.61, ['z'] = 114.33 },
			{ ['id'] = 3, ['x'] = 1396.81, ['y'] = 1139.54, ['z'] = 114.33 },
			{ ['id'] = 4, ['x'] = 1402.22, ['y'] = 1135.08, ['z'] = 114.33 },
			{ ['id'] = 5, ['x'] = 1401.85, ['y'] = 1132.28, ['z'] = 114.33 },
			{ ['id'] = 6, ['x'] = 1402.51, ['y'] = 1129.09, ['z'] = 114.33 },
			{ ['id'] = 7, ['x'] = 1399.82, ['y'] = 1132.08, ['z'] = 114.33 },
			{ ['id'] = 8, ['x'] = 1394.93, ['y'] = 1135.10, ['z'] = 114.33 },
			{ ['id'] = 9, ['x'] = 1396.73, ['y'] = 1129.48, ['z'] = 114.33 },
			{ ['id'] = 10, ['x'] = 1400.28, ['y'] = 1165.41, ['z'] = 114.33 },
			{ ['id'] = 11, ['x'] = 1399.22, ['y'] = 1161.17, ['z'] = 114.33 },
			{ ['id'] = 12, ['x'] = 1394.56, ['y'] = 1149.96, ['z'] = 114.33 },
			{ ['id'] = 13, ['x'] = 1395.55, ['y'] = 1145.31, ['z'] = 114.33 },
			{ ['id'] = 14, ['x'] = 1392.15, ['y'] = 1144.64, ['z'] = 114.33 },
			{ ['id'] = 15, ['x'] = 1404.00, ['y'] = 1150.28, ['z'] = 114.33 }
		}
	},
	['Farfetch'] = {
		['enter'] = { ['x'] = -106.98, ['y'] = -8.44, ['z'] = 74.51, ['h'] = 100.0 },
		['exit'] = { ['x'] = -107.67, ['y'] = -8.22, ['z'] = 70.51 },
		['vault'] = { ['x'] = -110.54, ['y'] = -14.62, ['z'] = 70.51, ['h'] = 163.0 },
		['locs'] = {
			{ ['id'] = 1, ['x'] = -113.58, ['y'] = -12.35, ['z'] = 70.51 },
			{ ['id'] = 2, ['x'] = -109.10, ['y'] = -10.04, ['z'] = 70.51 },
			{ ['id'] = 3, ['x'] = -112.17, ['y'] = -7.84, ['z'] = 70.51 },
			{ ['id'] = 4, ['x'] = -110.87, ['y'] = -6.42, ['z'] = 70.51 },
			{ ['id'] = 5, ['x'] = -113.00, ['y'] = -10.22, ['z'] = 70.51 }
		}
	},
	['Slowpoke'] = {
		['enter'] = { ['x'] = 1355.22, ['y'] = -531.16, ['z'] = 73.9, ['h'] = 160.55 },
		['exit'] = { ['x'] = 1351.12, ['y'] = -548.75, ['z'] = 67.84 },
		['vault'] = { ['x'] = 1357.13, ['y'] = -529.94, ['z'] = 67.84, ['h'] = 158.18 },
		['locs'] = {
			{ ['id'] = 1, ['x'] = 1355.11, ['y'] = -538.31, ['z'] = 67.84 },
			{ ['id'] = 2, ['x'] = 1348.13, ['y'] = -537.12, ['z'] = 67.84 },
			{ ['id'] = 3, ['x'] = 1352.14, ['y'] = -531.17, ['z'] = 67.84 },
			{ ['id'] = 4, ['x'] = 1356.59, ['y'] = -532.57, ['z'] = 67.84 },
			{ ['id'] = 5, ['x'] = 1361.6, ['y'] = -537.91, ['z'] = 67.84 },
			{ ['id'] = 6, ['x'] = 1363.12, ['y'] = -532.81, ['z'] = 67.84 },
			{ ['id'] = 7, ['x'] = 1360.6, ['y'] = -533.12, ['z'] = 67.84 },
			{ ['id'] = 8, ['x'] = 1359.02, ['y'] = -531.76, ['z'] = 67.84 },
			{ ['id'] = 9, ['x'] = 1360.32, ['y'] = -537.79, ['z'] = 67.84 },
			{ ['id'] = 10, ['x'] = 1349.33, ['y'] = -531.56, ['z'] = 67.84 }
		}
	},
	['Tentacool'] = {
		['enter'] = { ['x'] = 1295.82, ['y'] = -590.41, ['z'] = 71.73, ['h'] = 340.0 },
		['exit'] = { ['x'] = 1296.08, ['y'] = -596.39, ['z'] = 67.84 },
		['vault'] = { ['x'] = 1302.26, ['y'] = -577.62, ['z'] = 67.84, ['h'] = 158.88 },
		['locs'] = {		
			{ ['id'] = 1,['x'] = 1300.2, ['y'] = -586.22, ['z'] = 67.84 },
			{ ['id'] = 2, ['x'] = 1293.28, ['y'] = -585.04, ['z'] = 67.84 },
			{ ['id'] = 3, ['x'] = 1294.62, ['y'] = -579.24, ['z'] = 67.84 },
			{ ['id'] = 4, ['x'] = 1297.35, ['y'] = -579.04, ['z'] = 67.84 },
			{ ['id'] = 5, ['x'] = 1301.88, ['y'] = -580.6, ['z'] = 67.84 },
			{ ['id'] = 6, ['x'] = 1305.53, ['y'] = -586.01, ['z'] = 67.84 },
			{ ['id'] = 7, ['x'] = 1306.7, ['y'] = -586.02, ['z'] = 67.84 },
			{ ['id'] = 8, ['x'] = 1308.27, ['y'] = -580.93, ['z'] = 67.84 },
			{ ['id'] = 9, ['x'] = 1305.82, ['y'] = -581.19, ['z'] = 67.84 },
			{ ['id'] = 10, ['x'] = 1304.32, ['y'] = -579.78, ['z'] = 67.84 }
		}
	},
	['Clefable'] = {
		['enter'] = { ['x'] = -1150.83, ['y'] = -1519.34, ['z'] = 4.35, ['h'] = 305.0 },
		['exit'] = { ['x'] = -1151.01, ['y'] = -1520.27, ['z'] = 10.63 },
		['vault'] = { ['x'] = -1158.39, ['y'] = -1524.74, ['z'] = 10.64, ['h'] = 309.50 },
		['locs'] = {
			{ ['id'] = 1, ['x'] = -1152.25, ['y'] = -1519.05, ['z'] = 10.63 },
			{ ['id'] = 2, ['x'] = -1148.39, ['y'] = -1518.96, ['z'] = 10.64 },
			{ ['id'] = 3, ['x'] = -1146.83, ['y'] = -1516.09, ['z'] = 10.63 },
			{ ['id'] = 4, ['x'] = -1145.39, ['y'] = -1514.45, ['z'] = 10.63 },
			{ ['id'] = 5, ['x'] = -1150.88, ['y'] = -1513.48, ['z'] = 10.63 },
			{ ['id'] = 6, ['x'] = -1149.53, ['y'] = -1513.04, ['z'] = 10.63 },
			{ ['id'] = 7, ['x'] = -1158.23, ['y'] = -1518.16, ['z'] = 10.63 },
			{ ['id'] = 8, ['x'] = -1155.25, ['y'] = -1523.97, ['z'] = 10.63 },
			{ ['id'] = 9, ['x'] = -1161.13, ['y'] = -1520.52, ['z'] = 10.63 }
		}
	},
	['Magneton'] = {
		['enter'] = { ['x'] = -19.49, ['y'] = -1430.52, ['z'] = 31.09, ['h'] = 270.0 },
		['exit'] = { ['x'] = -14.52, ['y'] = -1427.62, ['z'] = 31.10 },
		['vault'] = { ['x'] = -16.00, ['y'] = -1430.40, ['z'] = 31.10, ['h'] = 85.0 },
		['locs'] = {
			{ ['id'] = 1, ['x'] = -11.87, ['y'] = -1428.06, ['z'] = 31.10 },
			{ ['id'] = 2, ['x'] = -10.20, ['y'] = -1430.33, ['z'] = 31.10 },
			{ ['id'] = 3, ['x'] = -12.48, ['y'] = -1435.12, ['z'] = 31.10 },
			{ ['id'] = 4, ['x'] = -8.83, ['y'] = -1439.06, ['z'] = 31.10 },
			{ ['id'] = 5, ['x'] = -9.40, ['y'] = -1441.43, ['z'] = 31.10 },
			{ ['id'] = 6, ['x'] = -12.47, ['y'] = -1436.97, ['z'] = 31.10 },
			{ ['id'] = 7, ['x'] = -18.43, ['y'] = -1438.66, ['z'] = 31.10 },
			{ ['id'] = 8, ['x'] = -17.72, ['y'] = -1440.74, ['z'] = 31.10 },
			{ ['id'] = 9, ['x'] = -18.25, ['y'] = -1436.83, ['z'] = 31.10 },
			{ ['id'] = 10, ['x'] = -18.19, ['y'] = -1432.19, ['z'] = 31.10 },
			{ ['id'] = 11, ['x'] = -16.70, ['y'] = -1434.86, ['z'] = 31.10 }
		}
	},
	--[[['Paras'] = {
		['enter'] = { ['x'] = -86.30, ['y'] = 6373.77, ['z'] = 31.49, ['h'] = 145.0 },
		['exit'] = { ['x'] = -87.94, ['y'] = 6361.64, ['z'] = 15.99 },
		['vault'] = { ['x'] = -92.58, ['y'] = 6367.81, ['z'] = 16.00, ['h'] = 50.0 },
		['locs'] = {
			{ ['id'] = 1, ['x'] = -87.16, ['y'] = 6364.87, ['z'] = 16.00 },
			{ ['id'] = 2, ['x'] = -90.28, ['y'] = 6363.90, ['z'] = 16.00 },
			{ ['id'] = 3, ['x'] = -92.20, ['y'] = 6366.51, ['z'] = 16.00 },
			{ ['id'] = 4, ['x'] = -91.18, ['y'] = 6368.68, ['z'] = 16.00 },
			{ ['id'] = 5, ['x'] = -89.12, ['y'] = 6367.05, ['z'] = 16.00 }
		}
	},]]
	['Meowth'] = {
		['enter'] = { ['x'] = -96.70, ['y'] = 6324.12, ['z'] = 31.57, ['h'] = 130.0 },
		['exit'] = { ['x'] = -108.03, ['y'] = 6341.11, ['z'] = 16.00 },
		['vault'] = { ['x'] = -109.57, ['y'] = 6342.08, ['z'] = 16.01, ['h'] = 315.53 },
		['locs'] = {
			{ ['id'] = 1, ['x'] = -107.19, ['y'] = 6344.32, ['z'] = 16.00 },
			{ ['id'] = 2, ['x'] = -110.55, ['y'] = 6343.38, ['z'] = 16.00 },
			{ ['id'] = 3, ['x'] = -112.33, ['y'] = 6345.88, ['z'] = 16.00 },
			{ ['id'] = 4, ['x'] = -111.27, ['y'] = 6348.14, ['z'] = 16.00 },
			{ ['id'] = 5, ['x'] = -109.27, ['y'] = 6346.41, ['z'] = 16.00 }
		}
	},
	['Magnemite'] = {
		['enter'] = { ['x'] = 1309.07, ['y'] = -511.60, ['z'] = 71.46, ['h'] = 162.0 },
		['exit'] = { ['x'] = 1306.55, ['y'] = -529.75, ['z'] = 67.84 },
		['vault'] = { ['x'] = 1311.51, ['y'] = -510.24, ['z'] = 67.84, ['h'] = 161.82 },
		['locs'] = {
			{ ['id'] = 1, ['x'] = 1310.18, ['y'] = -519.03, ['z'] = 67.84 },
			{ ['id'] = 2, ['x'] = 1303.0, ['y'] = -518.29, ['z'] = 67.84 },
			{ ['id'] = 3, ['x'] = 1303.95, ['y'] = -512.45, ['z'] = 67.84 },
			{ ['id'] = 4, ['x'] = 1306.87, ['y'] = -511.98, ['z'] = 67.84 },
			{ ['id'] = 5, ['x'] = 1311.36, ['y'] = -513.39, ['z'] = 67.84 },
			{ ['id'] = 6, ['x'] = 1315.34, ['y'] = -518.4, ['z'] = 67.84 },
			{ ['id'] = 7, ['x'] = 1316.55, ['y'] = -518.37, ['z'] = 67.84 },
			{ ['id'] = 8, ['x'] = 1317.61, ['y'] = -513.14, ['z'] = 67.84 },
			{ ['id'] = 9, ['x'] = 1315.33, ['y'] = -513.66, ['z'] = 67.84 },
			{ ['id'] = 10, ['x'] = 1313.68, ['y'] = -512.37, ['z'] = 67.84 }
		}
	},
	['Slowbro'] = {
		['enter'] = { ['x'] = 1335.76, ['y'] = -522.03, ['z'] = 72.25, ['h'] = 162.82 },
		['exit'] = { ['x'] = 1329.2, ['y'] = -541.36, ['z'] = 67.84 },
		['vault'] = { ['x'] = 1333.91, ['y'] = -522.06, ['z'] = 67.84, ['h'] = 163.67 },
		['locs'] = {
			{ ['id'] = 1, ['x'] = 1332.49, ['y'] = -530.75, ['z'] = 67.84 },
			{ ['id'] = 2, ['x'] = 1325.46, ['y'] = -530.17, ['z'] = 67.84 },
			{ ['id'] = 3, ['x'] = 1326.31, ['y'] = -524.36, ['z'] = 67.84 },
			{ ['id'] = 4, ['x'] = 1329.17, ['y'] = -523.79, ['z'] = 67.84 },
			{ ['id'] = 5, ['x'] = 1333.71, ['y'] = -525.01, ['z'] = 67.84 },
			{ ['id'] = 6, ['x'] = 1337.8, ['y'] = -530.15, ['z'] = 67.84 },
			{ ['id'] = 7, ['x'] = 1338.99, ['y'] = -530.08, ['z'] = 67.84 },
			{ ['id'] = 8, ['x'] = 1340.16, ['y'] = -524.91, ['z'] = 67.84 },
			{ ['id'] = 9, ['x'] = 1337.68, ['y'] = -525.39, ['z'] = 67.84 },
			{ ['id'] = 10, ['x'] = 1336.11, ['y'] = -524.02, ['z'] = 67.84 }
		}
	},
	['Rapidash'] = {
		['enter'] = { ['x'] = 1380.61, ['y'] = -542.56, ['z'] = 74.49, ['h'] = 160.0 },
		['exit'] = { ['x'] = 1370.88, ['y'] = -561.11, ['z'] = 67.84 },
		['vault'] = { ['x'] = 1376.65, ['y'] = -542.16, ['z'] = 67.84, ['h'] = 158.43 },
		['locs'] = {
			{ ['id'] = 1, ['x'] = 1374.8, ['y'] = -550.84, ['z'] = 67.84 },
			{ ['id'] = 2, ['x'] = 1367.74, ['y'] = -549.76, ['z'] = 67.84 },
			{ ['id'] = 3, ['x'] = 1368.95, ['y'] = -544.04, ['z'] = 67.84 },
			{ ['id'] = 4, ['x'] = 1371.74, ['y'] = -543.8, ['z'] = 67.84 },
			{ ['id'] = 5, ['x'] = 1376.3, ['y'] = -545.04, ['z'] = 67.84 },
			{ ['id'] = 6, ['x'] = 1379.99, ['y'] = -550.41, ['z'] = 67.84 },
			{ ['id'] = 7, ['x'] = 1381.29, ['y'] = -550.38, ['z'] = 67.84 },
			{ ['id'] = 8, ['x'] = 1382.67, ['y'] = -545.36, ['z'] = 67.84 },
			{ ['id'] = 9, ['x'] = 1380.18, ['y'] = -545.73, ['z'] = 67.84 },
			{ ['id'] = 10, ['x'] = 1378.67, ['y'] = -544.32, ['z'] = 67.84 }
		}
	},
	['Ponyta'] = {
		['enter'] = { ['x'] = 1404.56, ['y'] = -563.13, ['z'] = 74.49, ['h'] = 110.0 },
		['exit'] = { ['x'] = 1386.81, ['y'] = -573.77, ['z'] = 67.84 },
		['vault'] = { ['x'] = 1403.98, ['y'] = -563.77, ['z'] = 67.84, ['h'] = 117.16 },
		['locs'] = {
			{ ['id'] = 1, ['x'] = 1396.63, ['y'] = -568.82, ['z'] = 67.84 },
			{ ['id'] = 2, ['x'] = 1392.25, ['y'] = -563.37, ['z'] = 67.84 },
			{ ['id'] = 3, ['x'] = 1397.01, ['y'] = -559.89, ['z'] = 67.84 },
			{ ['id'] = 4, ['x'] = 1399.46, ['y'] = -561.49, ['z'] = 67.84 },
			{ ['id'] = 5, ['x'] = 1401.67, ['y'] = -565.67, ['z'] = 67.84 },
			{ ['id'] = 6, ['x'] = 1400.86, ['y'] = -572.15, ['z'] = 67.84 },
			{ ['id'] = 7, ['x'] = 1401.86, ['y'] = -572.87, ['z'] = 67.84 },
			{ ['id'] = 8, ['x'] = 1406.23, ['y'] = -570.13, ['z'] = 67.84 },
			{ ['id'] = 9, ['x'] = 1404.22, ['y'] = -568.77, ['z'] = 67.84 },
			{ ['id'] = 10, ['x'] = 1403.95, ['y'] = -566.7, ['z'] = 67.84 }
		}
	},
	['Golem'] = {
		['enter'] = { ['x'] = 1399.38, ['y'] = -603.85, ['z'] = 74.48, ['h'] = 48.0 },
		['exit'] = { ['x'] = 1381.65, ['y'] = -593.64, ['z'] = 67.84 },
		['vault'] = { ['x'] = 1398.62, ['y'] = -604.31, ['z'] = 67.84, ['h'] = 53.83 },
		['locs'] = {
			{ ['id'] = 1, ['x'] = 1390.76, ['y'] = -600.2, ['z'] = 67.84 },
			{ ['id'] = 2, ['x'] = 1393.59, ['y'] = -593.74, ['z'] = 67.84 },
			{ ['id'] = 3, ['x'] = 1398.89, ['y'] = -596.43, ['z'] = 67.84 },
			{ ['id'] = 4, ['x'] = 1398.34, ['y'] = -599.16, ['z'] = 67.84 },
			{ ['id'] = 5, ['x'] = 1395.81, ['y'] = -603.25, ['z'] = 67.84 },
			{ ['id'] = 6, ['x'] = 1389.69, ['y'] = -605.5, ['z'] = 67.84 },
			{ ['id'] = 7, ['x'] = 1389.44, ['y'] = -606.65, ['z'] = 67.84 },
			{ ['id'] = 8, ['x'] = 1394.02, ['y'] = -609.35, ['z'] = 67.84 },
			{ ['id'] = 9, ['x'] = 1394.34, ['y'] = -606.9, ['z'] = 67.84 },
			{ ['id'] = 10, ['x'] = 1396.02, ['y'] = -605.79, ['z'] = 67.84 }
		}
	},
	['Graveler'] = {
		['enter'] = { ['x'] = 1366.95, ['y'] = -623.29, ['z'] = 74.71, ['h'] = 0.2 },
		['exit'] = { ['x'] = 1367.09, ['y'] = -626.54, ['z'] = 67.84 },
		['vault'] = { ['x'] = 1365.12, ['y'] = -606.57, ['z'] = 67.84, ['h'] = 183.47 },
		['locs'] = {
			{ ['id'] = 1, ['x'] = 1366.69, ['y'] = -615.23, ['z'] = 67.84 },
			{ ['id'] = 2, ['x'] = 1359.87, ['y'] = -617.05, ['z'] = 67.84 },
			{ ['id'] = 3, ['x'] = 1358.81, ['y'] = -611.24, ['z'] = 67.84 },
			{ ['id'] = 4, ['x'] = 1361.24, ['y'] = -609.91, ['z'] = 67.84 },
			{ ['id'] = 5, ['x'] = 1366.02, ['y'] = -609.31, ['z'] = 67.84 },
			{ ['id'] = 6, ['x'] = 1371.52, ['y'] = -612.92, ['z'] = 67.84 },
			{ ['id'] = 7, ['x'] = 1372.6, ['y'] = -612.45, ['z'] = 67.84 },
			{ ['id'] = 8, ['x'] = 1371.94, ['y'] = -607.11, ['z'] = 67.84 },
			{ ['id'] = 9, ['x'] = 1369.8, ['y'] = -608.4, ['z'] = 67.84 },
			{ ['id'] = 10, ['x'] = 1367.88, ['y'] = -607.77, ['z'] = 67.84 }
		}
	},
	['Geodude'] = {
		['enter'] = { ['x'] = 1330.83, ['y'] = -608.30, ['z'] = 74.50, ['h'] = 322.0 },
		['exit'] = { ['x'] = 1330.62, ['y'] = -615.82, ['z'] = 67.84 },
		['vault'] = { ['x'] = 1340.94, ['y'] = -598.71, ['z'] = 67.84, ['h'] = 148.52 },
		['locs'] = {
			{ ['id'] = 1, ['x'] = 1337.01, ['y'] = -606.67, ['z'] = 67.84 },
			{ ['id'] = 2, ['x'] = 1330.5, ['y'] = -603.97, ['z'] = 67.84 },
			{ ['id'] = 3, ['x'] = 1333.06, ['y'] = -598.59, ['z'] = 67.84 },
			{ ['id'] = 4, ['x'] = 1335.82, ['y'] = -599.07, ['z'] = 67.84 },
			{ ['id'] = 5, ['x'] = 1339.9, ['y'] = -601.46, ['z'] = 67.84 },
			{ ['id'] = 6, ['x'] = 1342.24, ['y'] = -607.5, ['z'] = 67.84 },
			{ ['id'] = 7, ['x'] = 1343.45, ['y'] = -607.72, ['z'] = 67.84 },
			{ ['id'] = 8, ['x'] = 1346.2, ['y'] = -603.32, ['z'] = 67.84},
			{ ['id'] = 9, ['x'] = 1343.63, ['y'] = -602.89, ['z'] = 67.84 },
			{ ['id'] = 10, ['x'] = 1342.48, ['y'] = -601.18, ['z'] = 67.84 }
		}
	},
	['Tentacruel'] = {
		['enter'] = { ['x'] = 1316.20, ['y'] = -598.24, ['z'] = 73.24, ['h'] = 333.0 },
		['exit'] = { ['x'] = 1314.55, ['y'] = -601.4, ['z'] = 67.84 },
		['vault'] = { ['x'] = 1320.81, ['y'] = -582.46, ['z'] = 67.84, ['h'] = 155.94 },
		['locs'] = {
			{ ['id'] = 1, ['x'] = 1318.74, ['y'] = -590.98, ['z'] = 67.84 },
			{ ['id'] = 2, ['x'] = 1311.76, ['y'] = -589.91, ['z'] = 67.84 },
			{ ['id'] = 3, ['x'] = 1313.04, ['y'] = -584.21, ['z'] = 67.84 },
			{ ['id'] = 4, ['x'] = 1315.87, ['y'] = -583.99, ['z'] = 67.84 },
			{ ['id'] = 5, ['x'] = 1320.41, ['y'] = -585.33, ['z'] = 67.84 },
			{ ['id'] = 6, ['x'] = 1324.08, ['y'] = -590.82, ['z'] = 67.84 },
			{ ['id'] = 7, ['x'] = 1325.28, ['y'] = -590.76, ['z'] = 67.84 },
			{ ['id'] = 8, ['x'] = 1326.81, ['y'] = -585.82, ['z'] = 67.84 },
			{ ['id'] = 9, ['x'] = 1324.34, ['y'] = -586.06, ['z'] = 67.84 },
			{ ['id'] = 10, ['x'] = 1322.79, ['y'] = -584.69, ['z'] = 67.84 }
		}
	},
	['KR27'] = {
		['enter'] = { ['x'] = -42.86, ['y'] = -1859.26, ['z'] = 26.19, ['h'] = 324.79 },
		['exit'] = { ['x'] = -37.13, ['y'] = -1843.92, ['z'] = 17.32 },
		['vault'] = { ['x'] = -34.43, ['y'] = -1850.57, ['z'] = 19.32, ['h'] = 50.13 },
		['locs'] = {
			{ ['id'] = 1, ['x'] = -37.5, ['y'] = -1849.12, ['z'] = 19.32 },
			{ ['id'] = 2, ['x'] = -41.83, ['y'] = -1850.08, ['z'] = 19.32 },
			{ ['id'] = 3, ['x'] = -43.54, ['y'] = -1852.14, ['z'] = 19.32 },
			{ ['id'] = 4, ['x'] = -42.82, ['y'] = -1854.41, ['z'] = 19.32 },
			{ ['id'] = 5, ['x'] = -41.51, ['y'] = -1855.6, ['z'] = 19.32 },
			{ ['id'] = 6, ['x'] = -37.51, ['y'] = -1858.46, ['z'] = 19.32 }
		}
	},
	['KR26'] = {
		['enter'] = { ['x'] = -29.15, ['y'] = -1869.29, ['z'] = 25.33, ['h'] = 51.86 },
		['exit'] = { ['x'] = -24.89, ['y'] = -1853.4, ['z'] = 17.22 },
		['vault'] = { ['x'] = -22.28, ['y'] = -1860.39, ['z'] = 19.22, ['h'] = 54.69 },
		['locs'] = {
			{ ['id'] = 1, ['x'] = -29.79, ['y'] = -1859.72, ['z'] = 19.22 },
			{ ['id'] = 2, ['x'] = -31.51, ['y'] = -1861.87, ['z'] = 19.22 },
			{ ['id'] = 3, ['x'] = -30.69, ['y'] = -1864.18, ['z'] = 19.22 },
			{ ['id'] = 4, ['x'] = -29.41, ['y'] = -1865.55, ['z'] = 19.22 },
			{ ['id'] = 5, ['x'] = -25.46, ['y'] = -1868.25, ['z'] = 19.22 },
			{ ['id'] = 6, ['x'] = -25.27, ['y'] = -1858.83, ['z'] = 19.22 }
		}
	},
	['KR03'] = {
		['enter'] = { ['x'] = 16.32, ['y'] = -1906.71, ['z'] = 22.96, ['h'] = 319.96 },
		['exit'] = { ['x'] = 22.58, ['y'] = -1894.77, ['z'] = 16.99 },
		['vault'] = { ['x'] = 13.14, ['y'] = -1898.53, ['z'] = 16.99, ['h'] = 318.51 },
		['locs'] = {
			{ ['id'] = 1, ['x'] = 12.1, ['y'] = -1900.54, ['z'] = 16.99 },
			{ ['id'] = 2, ['x'] = 17.93, ['y'] = -1904.28, ['z'] = 16.99 },
			{ ['id'] = 3, ['x'] = 20.52, ['y'] = -1900.69, ['z'] = 16.99 },
			{ ['id'] = 4, ['x'] = 20.03, ['y'] = -1903.69, ['z'] = 16.99 },
			{ ['id'] = 5, ['x'] = 24.37, ['y'] = -1898.96, ['z'] = 16.99 },
			{ ['id'] = 6, ['x'] = 24.89, ['y'] = -1896.39, ['z'] = 16.99 },
			{ ['id'] = 7, ['x'] = 18.87, ['y'] = -1896.15, ['z'] = 16.99 },
			{ ['id'] = 8, ['x'] = 18.45, ['y'] = -1891.27, ['z'] = 16.99 }
		}
	},
	['KR31'] = {
		['enter'] = { ['x'] = 167.32, ['y'] = -1915.57, ['z'] = 21.36, ['h'] = 230.01 },
		['exit'] = { ['x'] = 183.82, ['y'] = -1921.39, ['z'] = 12.84 },
		['vault'] = { ['x'] = 176.9, ['y'] = -1924.3, ['z'] = 14.84, ['h'] = 325.55 },
		['locs'] = {
			{ ['id'] = 1, ['x'] = 177.41, ['y'] = -1916.61, ['z'] = 14.84 },
			{ ['id'] = 2, ['x'] = 175.19, ['y'] = -1915.05, ['z'] = 14.84 },
			{ ['id'] = 3, ['x'] = 172.82, ['y'] = -1915.93, ['z'] = 14.84 },
			{ ['id'] = 4, ['x'] = 171.48, ['y'] = -1917.3, ['z'] = 14.84 },
			{ ['id'] = 5, ['x'] = 169.08, ['y'] = -1921.37, ['z'] = 14.84 },
			{ ['id'] = 6, ['x'] = 178.25, ['y'] = -1921.24, ['z'] = 14.84 }
		}
	},
	['KR05'] = {
		['enter'] = { ['x'] = 92.53, ['y'] = -1891.00, ['z'] = 24.31, ['h'] = 320.74 },
		['exit'] = { ['x'] = 102.33, ['y'] = -1886.24, ['z'] = 18.08 },
		['vault'] = { ['x'] = 93.13, ['y'] = -1890.07, ['z'] = 18.08, ['h'] = 322.32 },
		['locs'] = {
			{ ['id'] = 1, ['x'] = 91.9, ['y'] = -1892.06, ['z'] = 18.07 },
			{ ['id'] = 2, ['x'] = 97.9, ['y'] = -1895.68, ['z'] = 18.08 },
			{ ['id'] = 3, ['x'] = 100.42, ['y'] = -1891.93, ['z'] = 18.08 },
			{ ['id'] = 4, ['x'] = 99.98, ['y'] = -1895.15, ['z'] = 18.08 },
			{ ['id'] = 5, ['x'] = 104.36, ['y'] = -1890.3, ['z'] = 18.08 },
			{ ['id'] = 6, ['x'] = 104.69, ['y'] = -1887.61, ['z'] = 18.08 },
			{ ['id'] = 7, ['x'] = 98.68, ['y'] = -1887.88, ['z'] = 18.08 },
			{ ['id'] = 8, ['x'] = 98.31, ['y'] = -1882.42, ['z'] = 18.08 }
		}
	},
	['LX01'] = {
		['enter'] = { ['x'] = -855.76, ['y'] = -33.64, ['z'] = 44.15, ['h'] = 209.76 },
		['exit'] = { ['x'] = -849.45, ['y'] = -12.87, ['z'] = 34.01 },
		['vault'] = { ['x'] = -844.22, ['y'] = -20.2, ['z'] = 34.01, ['h'] = 92.32 },
		['locs'] = {
			{ ['id'] = 1, ['x'] = -843.29, ['y'] = -26.08, ['z'] = 32.61 },
			{ ['id'] = 2, ['x'] = -843.01, ['y'] = -39.64, ['z'] = 32.61 },
			{ ['id'] = 3, ['x'] = -859.01, ['y'] = -36.54, ['z'] = 32.61 },
			{ ['id'] = 4, ['x'] = -857.82, ['y'] = -28.32, ['z'] = 32.61 },
			{ ['id'] = 5, ['x'] = -853.99, ['y'] = -34.88, ['z'] = 27.8 },
			{ ['id'] = 6, ['x'] = -852.65, ['y'] = -32.12, ['z'] = 27.8 },
			{ ['id'] = 7, ['x'] = -849.87, ['y'] = -35.24, ['z'] = 27.8 },
			{ ['id'] = 8, ['x'] = -847.08, ['y'] = -32.01, ['z'] = 27.8 },
			{ ['id'] = 9, ['x'] = -849.96, ['y'] = -25.65, ['z'] = 27.8 },
			{ ['id'] = 10, ['x'] = -848.59, ['y'] = -21.19, ['z'] = 34.02 },
			{ ['id'] = 11, ['x'] = -844.83, ['y'] = -22.45, ['z'] = 34.02 },
			{ ['id'] = 12, ['x'] = -845.73, ['y'] = -16.69, ['z'] = 34.01 }
		}
	},
	['FH17'] = {
		['enter'] = { ['x'] = -1037.31, ['y'] = 443.34, ['z'] = 73.06, ['h'] = 184.13 },
		['exit'] = { ['x'] = -1034.93, ['y'] = 429.75, ['z'] = 67.64 },
		['vault'] = { ['x'] = -1044.92, ['y'] = 450.78, ['z'] = 67.04, ['h'] = 194.57 },
		['locs'] = {
			{ ['id'] = 1, ['x'] = -1053.98, ['y'] = 441.48, ['z'] = 67.04 },
			{ ['id'] = 2, ['x'] = -1052.4, ['y'] = 429.32, ['z'] = 66.84 },
			{ ['id'] = 3, ['x'] = -1049.57, ['y'] = 431.2, ['z'] = 66.87 },
			{ ['id'] = 4, ['x'] = -1048.52, ['y'] = 425.58, ['z'] = 66.84 },
			{ ['id'] = 5, ['x'] = -1044.74, ['y'] = 434.44, ['z'] = 67.04 },
			{ ['id'] = 6, ['x'] = -1043.88, ['y'] = 422.83, ['z'] = 66.47 },
			{ ['id'] = 7, ['x'] = -1040.5, ['y'] = 422.71, ['z'] = 66.44 },
			{ ['id'] = 8, ['x'] = -1044.64, ['y'] = 418.28, ['z'] = 66.44 },
			{ ['id'] = 9, ['x'] = -1035.06, ['y'] = 420.07, ['z'] = 66.44 },
			{ ['id'] = 10, ['x'] = -1038.49, ['y'] = 415.46, ['z'] = 66.44 },
			{ ['id'] = 11, ['x'] = -1043.36, ['y'] = 446.79, ['z'] = 67.04 },
			{ ['id'] = 12, ['x'] = -1042.78, ['y'] = 450.65, ['z'] = 67.04 },
			{ ['id'] = 13, ['x'] = -1048.34, ['y'] = 449.52, ['z'] = 67.04}
		}
	},
	['FH66'] = {
		['enter'] = { ['x'] = -1105.2, ['y'] = 430.08, ['z'] = 75.89, ['h'] = 265.17 },
		['exit'] = { ['x'] = -1108.62, ['y'] = 433.71, ['z'] = 61.37 },
		['vault'] = { ['x'] = -1105.62, ['y'] = 410.71, ['z'] = 60.77, ['h'] = 357.27 },
		['locs'] = {
			{ ['id'] = 1, ['x'] = -1107.49, ['y'] = 411.5, ['z'] = 60.77 },
			{ ['id'] = 2, ['x'] = -1105.74, ['y'] = 415.18, ['z'] = 60.77 },
			{ ['id'] = 3, ['x'] = -1101.84, ['y'] = 410.93, ['z'] = 60.77 },
			{ ['id'] = 4, ['x'] = -1093.64, ['y'] = 416.83, ['z'] = 60.77 },
			{ ['id'] = 5, ['x'] = -1091.9, ['y'] = 428.91, ['z'] = 60.57 },
			{ ['id'] = 6, ['x'] = -1094.97, ['y'] = 427.89, ['z'] = 60.61 },
			{ ['id'] = 7, ['x'] = -1094.32, ['y'] = 433.66, ['z'] = 60.57 },
			{ ['id'] = 8, ['x'] = -1100.67, ['y'] = 426.89, ['z'] = 60.77 },
			{ ['id'] = 9, ['x'] = -1097.91, ['y'] = 437.56, ['z'] = 60.21 },
			{ ['id'] = 10, ['x'] = -1101.11, ['y'] = 438.88, ['z'] = 60.17 },
			{ ['id'] = 11, ['x'] = -1095.78, ['y'] = 441.97, ['z'] = 60.17 },
			{ ['id'] = 12, ['x'] = -1105.88, ['y'] = 441.0, ['z'] = 60.17 }, 
			{ ['id'] = 13, ['x'] = -1100.86, ['y'] = 446.22, ['z'] = 60.17 }
		}
	},
	['LX58'] = {
		['enter'] = { ['x'] = 99.53, ['y'] = 550.02, ['z'] = 181.5, ['h'] = 15.94 },
		['exit'] = { ['x'] = 71.26, ['y'] = 555.5, ['z'] = 168.01 }, 
		['vault'] = { ['x'] = 78.58, ['y'] = 561.36, ['z'] = 168.01, ['h'] = 188.36 },
		['locs'] = {
			{ ['id'] = 1, ['x'] = 80.5, ['y'] = 560.88, ['z'] = 168.02 }, 
			{ ['id'] = 2, ['x'] = 79.3, ['y'] = 556.78, ['z'] = 168.02 }, 
			{ ['id'] = 3, ['x'] = 74.88, ['y'] = 559.42, ['z'] = 168.01 }, 
			{ ['id'] = 4, ['x'] = 87.29, ['y'] = 548.06, ['z'] = 166.61 }, 
			{ ['id'] = 5, ['x'] = 95.48, ['y'] = 547.29, ['z'] = 166.61 },
			{ ['id'] = 6, ['x'] = 98.13, ['y'] = 563.49, ['z'] = 166.61 }, 
			{ ['id'] = 7, ['x'] = 83.66, ['y'] = 562.46, ['z'] = 166.61 }, 
			{ ['id'] = 8, ['x'] = 93.66, ['y'] = 548.82, ['z'] = 161.8 }, 
			{ ['id'] = 9, ['x'] = 93.53, ['y'] = 553.66, ['z'] = 161.8 }, 
			{ ['id'] = 10, ['x'] = 93.56, ['y'] = 559.01, ['z'] = 161.8 }, 
			{ ['id'] = 11, ['x'] = 90.82, ['y'] = 556.15, ['z'] = 161.8 }, 
			{ ['id'] = 12, ['x'] = 83.81, ['y'] = 555.7, ['z'] = 161.8 }
		}
	},
	['FH90'] = {
		['enter'] = { ['x'] = -1144.99, ['y'] = 798.29, ['z'] = 167.41, ['h'] = 233.91 },
		['exit'] = { ['x'] = -1141.75, ['y'] = 793.4, ['z'] = 156.02 },
		['vault'] = { ['x'] = -1120.35, ['y'] = 784.05, ['z'] = 155.42, ['h'] = 55.83 },
		['locs'] = {
			{ ['id'] = 1, ['x'] = -1122.08, ['y'] = 782.66, ['z'] = 155.42 },
			{ ['id'] = 2, ['x'] = -1124.45, ['y'] = 786.02, ['z'] = 155.42 }, 
			{ ['id'] = 3, ['x'] = -1118.71, ['y'] = 787.23, ['z'] = 155.42 }, 
			{ ['id'] = 4, ['x'] = -1119.46, ['y'] = 797.08, ['z'] = 155.42 }, 
			{ ['id'] = 5, ['x'] = -1128.83, ['y'] = 805.08, ['z'] = 155.22 }, 
			{ ['id'] = 6, ['x'] = -1129.6, ['y'] = 802.0, ['z'] = 155.25 }, 
			{ ['id'] = 7, ['x'] = -1134.16, ['y'] = 805.5, ['z'] = 155.22 }, 
			{ ['id'] = 8, ['x'] = -1131.8, ['y'] = 796.63, ['z'] = 155.42 }, 
			{ ['id'] = 9, ['x'] = -1139.51, ['y'] = 804.39, ['z'] = 154.85 }, 
			{ ['id'] = 10, ['x'] = -1141.97, ['y'] = 808.59, ['z'] = 154.82 }, 
			{ ['id'] = 11, ['x'] = -1142.01, ['y'] = 802.32, ['z'] = 154.82 }, 
			{ ['id'] = 12, ['x'] = -1148.34, ['y'] = 806.56, ['z'] = 154.82 }, 
			{ ['id'] = 13, ['x'] = -1146.56, ['y'] = 799.37, ['z'] = 154.82 }
		}
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- INICIOANDO O ROUBO
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		local ped = PlayerPedId()
		local x,y,z = table.unpack(GetEntityCoords(ped))
		for k,v in pairs(houses) do
			if not roubando then
				local distance = Vdist(x,y,z,v["enter"].x,v["enter"].y,v["enter"].z)
				if distance <= 5.0 then
					DrawText3Ds(v["enter"].x,v["enter"].y,v["enter"].z,"PRESSIONE ~g~E~w~ INVADIR")
					if IsControlJustPressed(0,38) and distance <= 1.2 and vSERVER.checkTimers(k) and vSERVER.checkPermission() then
						TriggerEvent("progress",10000,"invadindo")
						vRP._playAnim(false,{{"mini@safe_cracking","idle_base"},{"amb@prop_human_parking_meter@male@base","base"}},false)
						SetEntityHeading(ped,v["enter"].h)
						SetTimeout(10000,function()
							vRP._stopAnim(false)
							DoScreenFadeOut(1000)
							SetTimeout(2000,function()
								DoScreenFadeIn(1000)
								SetEntityCoords(ped,v['exit'].x,v['exit'].y,v['exit'].z-1)
								roubando = true
								homeName = k
								if math.random(100) >= 50 then
									cofre = true
									vault = CreateObject(GetHashKey("prop_ld_int_safe_01"),v['vault'].x,v['vault'].y,v['vault'].z,true,false,false)
									PlaceObjectOnGroundProperly(vault)
									FreezeEntityPosition(vault,true)
									SetEntityHeading(vault,v['vault'].h)
								end
							end)
						end)
					end
				end
			else
				if v["exit"] then
					local _,homeZ = GetGroundZFor_3dCoord(v["exit"].x,v["exit"].y,v["exit"].z)
					local distance = Vdist(x,y,z,v["exit"].x,v["exit"].y,homeZ)
					if distance <= 5.0 then
						DrawText3Ds(v["exit"].x,v["exit"].y,v["exit"].z,"PRESSIONE ~g~E~w~ EVADIR")
						if IsControlJustPressed(0,38) and distance <= 1.2 then
							DoScreenFadeOut(1000)
							SetTimeout(2000,function()
								DoScreenFadeIn(1000)
								roubando = false
								list = {}
								SetEntityCoords(ped,v["enter"].x,v["enter"].y,v["enter"].z-1)
								if DoesEntityExist(vault) then
									TriggerServerEvent("trydeleteobj",ObjToNet(vault))
									cofre = false
									vault = nil
								end
							end)
						end
					end
				end
				if roubando then
					RequestAnimSet("move_ped_crouched")
					RequestAnimSet("move_ped_crouched_strafing")
					SetPedMovementClipset(ped,"move_ped_crouched",0.25)
					SetPedStrafeClipset(ped,"move_ped_crouched_strafing")
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROBBERY
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
       	Citizen.Wait(5)
       	if roubando then
       		local ped = PlayerPedId()
       		local x,y,z = table.unpack(GetEntityCoords(ped))
       		for k,v in pairs(houses[homeName]['locs']) do
       			local distance = Vdist(x,y,z,v.x,v.y,v.z)
       			if distance <= 5.0 and list[v.id] == nil then
       				DrawText3Ds(v.x,v.y,v.z,"PRESSIONE ~g~E~w~ PARA VASCULHAR")
       				if IsControlJustPressed(0,38) and distance <= 1.2 then
       					list[v.id] = true
       					FreezeEntityPosition(ped,true)
       					TriggerEvent("cancelando",true)
       					TriggerEvent("progress",8000,"vasculhando")
       					SetTimeout(8000,function()
       						vSERVER.paymentRobbery(homeName)
       						FreezeEntityPosition(ped,false)
       						TriggerEvent("cancelando",false)
   						end)
   					end
   				end
   			end
   		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROBBERY VAULT
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if cofre then
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local distance = Vdist(x,y,z,houses[homeName]['vault'].x,houses[homeName]['vault'].y,houses[homeName]['vault'].z)
			if distance <= 5.0 then
				DrawText3Ds(houses[homeName]['vault'].x,houses[homeName]['vault'].y,houses[homeName]['vault'].z,"PRESSIONE ~g~E~w~ PARA VASCULHAR O COFRE")
				if IsControlJustPressed(0,38) and distance <= 0.8 then
					TriggerEvent("mhacking:show")
					TriggerEvent("mhacking:start",4,30,mycb)
				end
			end
		else
			if DoesEntityExist(vault) then
				TriggerServerEvent("trydeleteobj",ObjToNet(vault))
				vault = nil
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
-----------------------------------------------------------------------------------------------------------------------------------------
function DrawText3Ds(x,y,z,text)
	local onScreen,_x,_y = World3dToScreen2d(x,y,z)

	SetTextFont(4)
	SetTextScale(0.35,0.35)
	SetTextColour(255,255,255,150)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
	local factor = (string.len(text))/370
	DrawRect(_x,_y+0.0125,0.01+factor,0.03,0,0,0,80)
end

function mycb(success,timeremaining)
	TriggerEvent('mhacking:hide')
	cofre = false
	if success then
		vSERVER.paymentVault(homeName)
	end
end