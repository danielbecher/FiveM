local pdl = GetInteriorAtCoords(440.84, -983.14, 30.69)  -- Fix limbo DP
LoadInterior(pdl)


local bennys = GetInteriorAtCoords(-210.29,-1321.87,30.89)
LoadInterior(bennys)

--Citizen.CreateThread(function() -- Hospital Novo
--	RequestIpl("gabz_pillbox_milo_")
--		interiorID = GetInteriorAtCoords(311.2546, -592.4204, 42.32737)
--		if IsValidInterior(interiorID) then
--			RemoveIpl("rc12b_fixed")
--			RemoveIpl("rc12b_destroyed")
--			RemoveIpl("rc12b_default")
--			RemoveIpl("rc12b_hospitalinterior_lod")
--			RemoveIpl("rc12b_hospitalinterior")
--		RefreshInterior(interiorID)
--		end
--	end)

--RequestIpl("gabz_biker_milo_")
--interiorID = GetInteriorAtCoords(994.47870000, -122.99490000, 73.11467000)
--	if IsValidInterior(interiorID) then
--		EnableInteriorProp(interiorID, "walls_02")
--		SetInteriorPropColor(interiorID, "walls_02", 8)
--		EnableInteriorProp(interiorID, "Furnishings_02")
--		SetInteriorPropColor(interiorID, "Furnishings_02", 8)
--		EnableInteriorProp(interiorID, "decorative_02")
--		EnableInteriorProp(interiorID, "mural_03")
--		EnableInteriorProp(interiorID, "lower_walls_default")
--		SetInteriorPropColor(interiorID, "lower_walls_default", 8)
--		EnableInteriorProp(interiorID, "mod_booth")
--		EnableInteriorProp(interiorID, "gun_locker")
--		EnableInteriorProp(interiorID, "cash_small")
--		EnableInteriorProp(interiorID, "id_small")
--		EnableInteriorProp(interiorID, "weed_small")
--		RefreshInterior(interiorID)
--	end

Citizen.CreateThread(function()  -- Fix casa d Franklin
interiorID = GetInteriorAtCoords(3.199463, 529.7808, 169.6262)
	if IsValidInterior(interiorID) then
		EnableInteriorProp(interiorID, "locked")
		RefreshInterior(interiorID)
	end
end)

-----------------------------------------------------------------------------------------------------
-- Favela Barragem ----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()

	-- lafa2k favela grátis (otimização da favela da barragem criada pelo oldbob)
	RequestIpl("lafa2k_int_favela_gratis_01")
	RequestIpl("lafa2k_int_favela_gratis_02")
	RequestIpl("lafa2k_int_favela_gratis_03")
	RequestIpl("lafa2k_int_favela_gratis_04")
	RequestIpl("lafa2k_int_favela_gratis_05")
	RequestIpl("lafa2k_int_favela_gratis_06")
	RequestIpl("lafa2k_int_favela_gratis_07")
	RequestIpl("lafa2k_int_favela_gratis_08")
	RequestIpl("lafa2k_int_favela_gratis_09")
	RequestIpl("lafa2k_int_favela_gratis_10")
	RequestIpl("lafa2k_int_favela_gratis_11")
	RequestIpl("lafa2k_int_favela_gratis_12")
	RequestIpl("lafa2k_int_favela_gratis_13")
	RequestIpl("lafa2k_int_favela_gratis_14")
	RequestIpl("lafa2k_int_favela_gratis_15")
	RequestIpl("lafa2k_int_favela_gratis_16")
	RequestIpl("lafa2k_int_favela_gratis_17")
	RequestIpl("lafa2k_int_favela_gratis_18")
	RequestIpl("lafa2k_int_favela_gratis_19")
	RequestIpl("lafa2k_int_favela_gratis_20")
	RequestIpl("lafa2k_int_favela_gratis_21")
	RequestIpl("lafa2k_int_favela_gratis_22")
	RequestIpl("lafa2k_int_favela_gratis_23")
	RequestIpl("lafa2k_int_favela_gratis_24")
	RequestIpl("lafa2k_int_favela_gratis_25")
	RequestIpl("lafa2k_int_favela_gratis_26")
	RequestIpl("lafa2k_int_favela_gratis_27")
	RequestIpl("lafa2k_int_favela_gratis_28")
	RequestIpl("lafa2k_int_favela_gratis_29")
	RequestIpl("lafa2k_int_favela_gratis_30")
	RequestIpl("lafa2k_int_favela_gratis_31")
	RequestIpl("lafa2k_int_favela_gratis_32")
	RequestIpl("lafa2k_int_favela_gratis_33")
	RequestIpl("lafa2k_int_favela_gratis_34")
	RequestIpl("lafa2k_int_favela_gratis_35")
	RequestIpl("lafa2k_int_favela_gratis_36")
	RequestIpl("lafa2k_int_favela_gratis_37")
	RequestIpl("lafa2k_int_favela_gratis_38")
	RequestIpl("lafa2k_int_favela_gratis_39")
	RequestIpl("lafa2k_int_favela_gratis_40")
	RequestIpl("lafa2k_int_favela_gratis_41")
	RequestIpl("lafa2k_int_favela_gratis_42")
	RequestIpl("lafa2k_int_favela_gratis_43")
	RequestIpl("lafa2k_int_favela_gratis_44")
	RequestIpl("lafa2k_int_favela_gratis_45")
	RequestIpl("lafa2k_int_favela_gratis_46")
	RequestIpl("lafa2k_int_favela_gratis_47")
	RequestIpl("lafa2k_int_favela_gratis_48")
	RequestIpl("lafa2k_int_favela_gratis_49")
	RequestIpl("lafa2k_int_favela_gratis_50")
	RequestIpl("lafa2k_int_favela_gratis_51")
	RequestIpl("lafa2k_int_favela_gratis_52")
	RequestIpl("lafa2k_int_favela_gratis_53")
	RequestIpl("lafa2k_int_favela_gratis_54")
	RequestIpl("lafa2k_int_favela_gratis_55")
	RequestIpl("lafa2k_int_favela_gratis_56")
	RequestIpl("lafa2k_int_favela_gratis_57")
	RequestIpl("lafa2k_int_favela_gratis_58")
	RequestIpl("lafa2k_int_favela_gratis_59")
	RequestIpl("lafa2k_int_favela_gratis_60")
	RequestIpl("lafa2k_int_favela_gratis_61")
	RequestIpl("lafa2k_int_favela_gratis_62")
	RequestIpl("lafa2k_int_favela_gratis_63")
	RequestIpl("lafa2k_int_favela_gratis_64")
	RequestIpl("lafa2k_int_favela_gratis_65")
	RequestIpl("lafa2k_int_favela_gratis_66")
	RequestIpl("lafa2k_int_favela_gratis_67")
	RequestIpl("lafa2k_int_favela_gratis_68")
	RequestIpl("lafa2k_int_favela_gratis_69")
	RequestIpl("lafa2k_int_favela_gratis_70")
	RequestIpl("lafa2k_int_favela_gratis_71")
	RequestIpl("lafa2k_int_favela_gratis_72")
	RequestIpl("lafa2k_int_favela_gratis_73")
	RequestIpl("lafa2k_int_favela_gratis_74")
	RequestIpl("lafa2k_int_favela_gratis_75")
	RequestIpl("lafa2k_int_favela_gratis_76")
	RequestIpl("lafa2k_int_favela_gratis_77")
	RequestIpl("lafa2k_int_favela_gratis_78")
	RequestIpl("lafa2k_int_favela_gratis_79")
	RequestIpl("lafa2k_int_favela_gratis_80")
	RequestIpl("lafa2k_int_favela_gratis_81")
	RequestIpl("lafa2k_int_favela_gratis_82")
	RequestIpl("lafa2k_int_favela_gratis_83")
	RequestIpl("lafa2k_int_favela_gratis_84")
	RequestIpl("lafa2k_int_favela_gratis_85")
	RequestIpl("lafa2k_int_favela_gratis_86")
	RequestIpl("lafa2k_int_favela_gratis_87")
	RequestIpl("lafa2k_int_favela_gratis_88")
	RequestIpl("lafa2k_int_favela_gratis_89")
	RequestIpl("lafa2k_int_favela_gratis_90")
	RequestIpl("lafa2k_int_favela_gratis_91")
	RequestIpl("lafa2k_int_favela_gratis_92")
	RequestIpl("lafa2k_int_favela_gratis_93")
	RequestIpl("lafa2k_int_favela_gratis_94")
	RequestIpl("lafa2k_int_favela_gratis_95")
	RequestIpl("lafa2k_int_favela_gratis_96")
	RequestIpl("lafa2k_int_favela_gratis_97")
	RequestIpl("lafa2k_int_favela_gratis_98")
	RequestIpl("lafa2k_int_favela_gratis_99")
	RequestIpl("lafa2k_int_favela_gratis_100")
	RequestIpl("lafa2k_int_favela_gratis_101")
	RequestIpl("lafa2k_int_favela_gratis_102")
	RequestIpl("lafa2k_int_favela_gratis_103")
	RequestIpl("lafa2k_int_favela_gratis_104")
	RequestIpl("lafa2k_int_favela_gratis_105")
	RequestIpl("lafa2k_int_favela_gratis_106")
	RequestIpl("lafa2k_int_favela_gratis_107")
	RequestIpl("lafa2k_int_favela_gratis_108")
	RequestIpl("lafa2k_int_favela_gratis_109")
	RequestIpl("lafa2k_int_favela_gratis_110")
	RequestIpl("lafa2k_int_favela_gratis_01d")
	RequestIpl("lafa2k_int_favela_gratis_02d")
	RequestIpl("lafa2k_int_favela_gratis_03d")
	RequestIpl("lafa2k_int_favela_gratis_04d")
	RequestIpl("lafa2k_int_favela_gratis_05d")
	RequestIpl("lafa2k_int_favela_gratis_06d")
	RequestIpl("lafa2k_int_favela_gratis_07d")
	RequestIpl("lafa2k_int_favela_gratis_08d")
	RequestIpl("lafa2k_int_favela_gratis_09d")
	RequestIpl("lafa2k_int_favela_gratis_10d")
	RequestIpl("lafa2k_int_favela_gratis_11d")
	RequestIpl("lafa2k_int_favela_gratis_12d")
	RequestIpl("lafa2k_int_favela_gratis_13d")
	RequestIpl("lafa2k_int_favela_gratis_14d")
	RequestIpl("lafa2k_int_favela_gratis_15d")
	RequestIpl("lafa2k_int_favela_gratis_16d")
	RequestIpl("lafa2k_int_favela_gratis_17d")
	RequestIpl("lafa2k_int_favela_gratis_18d")
	RequestIpl("lafa2k_int_favela_gratis_19d")
	RequestIpl("lafa2k_int_favela_gratis_20d")
	RequestIpl("lafa2k_int_favela_gratis_21d")
	RequestIpl("lafa2k_int_favela_gratis_22d")
	RequestIpl("lafa2k_int_favela_gratis_23d")
	RequestIpl("lafa2k_int_favela_gratis_24d")
	RequestIpl("lafa2k_int_favela_gratis_25d")
	RequestIpl("lafa2k_int_favela_gratis_26d")
	RequestIpl("lafa2k_int_favela_gratis_27d")
	RequestIpl("lafa2k_int_favela_gratis_28d")
	RequestIpl("lafa2k_int_favela_gratis_29d")
	RequestIpl("lafa2k_int_favela_gratis_30d")
	RequestIpl("lafa2k_int_favela_gratis_31d")
	RequestIpl("lafa2k_int_favela_gratis_32d")
	RequestIpl("lafa2k_int_favela_gratis_33d")
	RequestIpl("lafa2k_int_favela_gratis_34d")
	RequestIpl("lafa2k_int_favela_gratis_35d")
	RequestIpl("lafa2k_int_favela_gratis_36d")
	RequestIpl("lafa2k_int_favela_gratis_37d")
	RequestIpl("lafa2k_int_favela_gratis_38d")
	RequestIpl("lafa2k_int_favela_gratis_39d")
	RequestIpl("lafa2k_int_favela_gratis_40d")
	RequestIpl("lafa2k_int_favela_gratis_41d")
	RequestIpl("lafa2k_int_favela_gratis_42d")
	RequestIpl("lafa2k_int_favela_gratis_43d")
	RequestIpl("lafa2k_int_favela_gratis_44d")
	RequestIpl("lafa2k_int_favela_gratis_45d")
	-- lafa2k favela grátis (otimização da favela da barragem criada pelo oldbob)
end)

--[[Citizen.CreateThread(function() --MCANTIGO
RequestIpl("lafa2k_bkr_biker_dlc_int_02")
interiorID = GetInteriorAtCoords(889.67889404297,-2102.9304199219,30.761777877808)
	if IsValidInterior(interiorID) then
		EnableInteriorProp(interiorID, "walls_01")
		EnableInteriorProp(interiorID, "lower_walls_default")
		EnableInteriorProp(interiorID, "furnishings_02")
		EnableInteriorProp(interiorID, "mural_03")
		EnableInteriorProp(interiorID, "decorative_02")
		EnableInteriorProp(interiorID, "gun_locker")
		EnableInteriorProp(interiorID, "mod_booth")
		EnableInteriorProp(interiorID, "meth_small")
		EnableInteriorProp(interiorID, "meth_medium")
		EnableInteriorProp(interiorID, "meth_large")
		EnableInteriorProp(interiorID, "cash_small")
		EnableInteriorProp(interiorID, "cash_medium")
		EnableInteriorProp(interiorID, "cash_large")
		EnableInteriorProp(interiorID, "weed_small")
		EnableInteriorProp(interiorID, "weed_medium")
		EnableInteriorProp(interiorID, "weed_large")
		EnableInteriorProp(interiorID, "coke_small")
		EnableInteriorProp(interiorID, "coke_medium")
		EnableInteriorProp(interiorID, "coke_large")
		EnableInteriorProp(interiorID, "counterfeit_small")
		EnableInteriorProp(interiorID, "counterfeit_medium")
		EnableInteriorProp(interiorID, "counterfeit_large")
		EnableInteriorProp(interiorID, "id_small")
		EnableInteriorProp(interiorID, "id_medium")
		EnableInteriorProp(interiorID, "id_large")
		SetInteriorPropColor(interiorID, "walls_01", 8)
		SetInteriorPropColor(interiorID, "lower_walls_default", 8)
		RefreshInterior(interiorID)
	end]]

interiorID = GetInteriorAtCoords(96.47223, 6347.784,30.48238) -- lab maconha
	if IsValidInterior(interiorID) then
		EnableInteriorProp(interiorID, "weed_hosea")
		EnableInteriorProp(interiorID, "weed_hoseb")
		EnableInteriorProp(interiorID, "weed_hosec")
		EnableInteriorProp(interiorID, "weed_hosed")
		EnableInteriorProp(interiorID, "weed_hosee")
		EnableInteriorProp(interiorID, "weed_hosef")
		EnableInteriorProp(interiorID, "weed_hoseg")
		EnableInteriorProp(interiorID, "weed_hoseh")
		EnableInteriorProp(interiorID, "weed_hosei")
		EnableInteriorProp(interiorID, "weed_growtha_stage3")
		EnableInteriorProp(interiorID, "weed_growthb_stage3")
		EnableInteriorProp(interiorID, "weed_growthc_stage3")
		EnableInteriorProp(interiorID, "weed_growthd_stage3")
		EnableInteriorProp(interiorID, "weed_growthe_stage3")
		EnableInteriorProp(interiorID, "weed_growthf_stage3")
		EnableInteriorProp(interiorID, "weed_growthg_stage3")
		EnableInteriorProp(interiorID, "weed_growthh_stage3")
		EnableInteriorProp(interiorID, "weed_growthi_stage3")
		EnableInteriorProp(interiorID, "light_growtha_stage33_upgrade")
		EnableInteriorProp(interiorID, "light_growthb_stage33_upgrade")
		EnableInteriorProp(interiorID, "light_growthc_stage33_upgrade")
		EnableInteriorProp(interiorID, "light_growthd_stage33_upgrade")
		EnableInteriorProp(interiorID, "light_growthe_stage33_upgrade")
		EnableInteriorProp(interiorID, "light_growthf_stage33_upgrade")
		EnableInteriorProp(interiorID, "light_growthg_stage33_upgrade")
		EnableInteriorProp(interiorID, "light_growthh_stage33_upgrade")
		EnableInteriorProp(interiorID, "light_growthi_stage33_upgrade")
		EnableInteriorProp(interiorID, "weed_upgrade_equip")
		EnableInteriorProp(interiorID, "weed_drying")
		EnableInteriorProp(interiorID, "weed_security_upgrade")
		EnableInteriorProp(interiorID, "weed_production")
		EnableInteriorProp(interiorID, "weed_set_up")
		EnableInteriorProp(interiorID, "weed_chairs")
		RefreshInterior(interiorID)	
	end

--[[interiorID = GetInteriorAtCoords(24.54136000, -1400.42700000,29.12644000) -- LAVAGEM AUTOMATICA
	if IsValidInterior(interiorID) then
		EnableInteriorProp(interiorID, "weed_upgrade_equip")
		EnableInteriorProp(interiorID, "counterfeit_security")
		EnableInteriorProp(interiorID, "counterfeit_cashpile100a")
		EnableInteriorProp(interiorID, "counterfeit_cashpile20a")
		EnableInteriorProp(interiorID, "counterfeit_cashpile10a")
		EnableInteriorProp(interiorID, "counterfeit_cashpile100b")
		EnableInteriorProp(interiorID, "counterfeit_cashpile100c")
		EnableInteriorProp(interiorID, "counterfeit_cashpile100d")
		EnableInteriorProp(interiorID, "counterfeit_cashpile20b")
		EnableInteriorProp(interiorID, "counterfeit_cashpile20c")
		EnableInteriorProp(interiorID, "counterfeit_cashpile20d")
		EnableInteriorProp(interiorID, "counterfeit_cashpile10b")
		EnableInteriorProp(interiorID, "counterfeit_cashpile10c")
		EnableInteriorProp(interiorID, "counterfeit_cashpile10d")
		EnableInteriorProp(interiorID, "counterfeit_setup")
		EnableInteriorProp(interiorID, "counterfeit_upgrade_equip")
		EnableInteriorProp(interiorID, "dryera_on")
		EnableInteriorProp(interiorID, "dryerb_on")
		EnableInteriorProp(interiorID, "dryerc_on")
		EnableInteriorProp(interiorID, "dryerd_on")
		EnableInteriorProp(interiorID, "money_cutter")
		EnableInteriorProp(interiorID, "special_chairs")
		RefreshInterior(interiorID)
	end]]

interiorID = GetInteriorAtCoords(1497.75100000, 6393.09000000,21.78359000) -- METANFETAMINA
	if IsValidInterior(interiorID) then
		EnableInteriorProp(interiorID, "meth_lab_upgrade")
		EnableInteriorProp(interiorID, "meth_lab_production")
		EnableInteriorProp(interiorID, "meth_lab_security_high")
		EnableInteriorProp(interiorID, "meth_lab_setup")
		EnableInteriorProp(interiorID, "counterfeit_standard_equip")
		RefreshInterior(interiorID)
	end

interiorID = GetInteriorAtCoords(-1103.1722412109,4951.3447265625,234.8638) -- largados e pelados, coca porém está sendo usado para LSD
	if IsValidInterior(interiorID) then
		EnableInteriorProp(interiorID, "coke_cut_01")
		EnableInteriorProp(interiorID, "coke_cut_02")
		EnableInteriorProp(interiorID, "coke_cut_03")
		EnableInteriorProp(interiorID, "coke_cut_04")
		EnableInteriorProp(interiorID, "coke_cut_05")
		EnableInteriorProp(interiorID, "set_up")
		EnableInteriorProp(interiorID, "security_high")
		EnableInteriorProp(interiorID, "production_upgrade")
		EnableInteriorProp(interiorID, "equipment_upgrade")
		RefreshInterior(interiorID)
	end

interiorID = GetInteriorAtCoords(2845.278,4441.969,47.50344) -- ecstasy
	if IsValidInterior(interiorID) then
		RefreshInterior(interiorID)
	end	

--[[RequestIpl("imp_impexp_interior_placement_interior_1_impexp")
interiorID = GetInteriorAtCoords(941.10520000,-971.67590000,39.39997000)
	if IsValidInterior(interiorID) then
		EnableInteriorProp(interiorID, "branded_style_set")
		EnableInteriorProp(interiorID, "car_floor_hatch")
		EnableInteriorProp(interiorID, "door_blocker")
		RefreshInterior(interiorID)
	end		
end)]]