Config = {}

-- Ammo given by default to crafted weapons
Config.WeaponAmmo = 42

Config.Recipes = {

----------- CRAFTABLE ITEMS -----------------
	
	["lockpick"] = { 
		{item = "bobbypin", quantity = 4 }, 
		{item = "rubberband", quantity = 1 },
	},
	
------------ TIER 2 ITEMS -------------------
	
	["metal_fragments"] = { 
		{item = "iron", quantity = 10 }, 
		{item = "copper", quantity = 10 },
	},
	
	["low_grade_fuel"] = { 
		{item = "gazbottle", quantity = 10 }, 
		{item = "animal_fat", quantity = 10 },
		{item = "solvent", quantity = 10 },
	},
	
	["explosive_material"] = { 
		{item = "sulfur", quantity = 10 }, 
		{item = "coal", quantity = 10 },
		{item = "fabric", quantity = 10 },
	},
	
	["detonator"] = { 
		{item = "bobbypin", quantity = 10 }, 
		{item = "metal_fragments", quantity = 10 },
		{item = "cutted_wood", quantity = 10 },
		{item = "jewels", quantity = 1 },
	},
	
	["animal_fat"] = {
		{item = "fish", quantity = 25 },
		{item = "slaughtered_chicken", quantity = 25 },
		
	},
		
	["fish_oil"] = {
		{item = "fish", quantity = 10 },
		{item = "washed_stone", quantity = 10 },
		
	},
	
	["chemical_mix_coke"] = {
		{items = "glue", quantity = 100 },
		{items = "solvent", quantity = 100 },
		{items = "antibiotics", quantity = 100 },
		{items = "clothe", quantity = 100 },
		
	},
	
	["chemical_mix_meth"] = {
		{items = "glue", quantity = 100 },
		{items = "solvent", quantity = 100 },
		{items = "antibiotics", quantity = 100 },
		{items = "packaged_chicken", quantity = 100 },
		
	},
	
	["drug_filler"] = {
		{items = "cutted_wood", quantity = 25 },
		{items = "copper", quantity = 25 },
		{items = "fabric", quantity = 25 },
		
		
	},
	
---------------   TIER 3 ITEMS  ---------------------------
	
	["c4_bank"] = { 
		{item = "low_grade_fuel", quantity = 5 }, 
		{item = "metal_fragments", quantity = 10 },
		{item = "explosive_material", quantity = 1 },
		{item = "detonator", quantity = 1 },
		{item = "empty_propane_tank", quantity = 1 },

	},
	

	
	["meth_ingredients"] = { 
		{item = "animal_fat", quantity = 100 },
		{item = "chemical_mix_meth", quantity = 100 },
		{item = "drug_filler", quantity = 1 },
		{item = "grand_cru", quantity = 1 },

	},


	["coke_ingredients"] = { 
		{item = "animal_fat", quantity = 100 },
		{item = "chemical_mix_coke", quantity = 100 },
		{item = "drug_filler", quantity = 1 },
		{item = "grand_cru", quantity = 1 },

	},


	
	-- Can be a weapon, must follow this format
	--['WEAPON_ASSAULTRIFLE'] = { 
		--{item = "steel", quantity = 4 }, 
	--	{item = "gunpowder", quantity = 2},
	--}
}

-- Enable a shop to access the crafting menu
Config.Shop = {
	useShop = true,
	shopCoordinates = { x=962.5, y=-1585.5, z=29.6 },
	shopName = "Crafting Station",
	shopBlipID = 402,
	zoneSize = { x = 2.5, y = 2.5, z = 1.5 },
	zoneColor = { r = 255, g = 255, b = 0, a = 100 }
}

-- Enable crafting menu through a keyboard shortcut
Config.Keyboard = {
	useKeyboard = false,
	keyCode = 303
}
