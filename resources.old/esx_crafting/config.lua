Crafting = {}
-- You can configure locations here
Crafting.Locations = {
    [1] = {x = 176.05, y = -1000.14, z = -99.00}, --wORKSHOP
    [2] = {x = 1175.433, y = 2635.81, z = 37.755}, --SandyGarage
    [3] = {x = -1154.895, y = -2022.624, z = 13.176}, --LsCustomsAirport
	[4] = {x = -341.16, y = -140.86, z = 39.03}, --Docs
	[5] = {x = -198.90, y = -1315.19, z = 31.09}, --Bennys
	[6] = {x = -25.65, y = -1424.46, z = 30.69}, --Franklins Garage
	[7] = {x = 101.36, y = 6616.40, z = 32.44}, --Something
	[8] = {x = 544.16, y = -173.01, z = 54.48}, --AutoExotic
	[9] = {x = 455.84, y = -553.91, z = 28.50}, --NearHospital
	[10] = {x = 737.76, y = -1077.97, z = 22.17}, --PayNSprayWarrant
	[11] = {x = 672.16, y = -718.02, z = 29.99}, --RailHouse
	[12] = {x = -40.50, y = -1088.22, z = 26.42}, --PDM
}
--[[
    You can add or remove if you want, be sure to use the right format like this:
    ["item_name"] = {
        label = "Item Label",
        needs = {
            ["item_to_use_name"] = {label = "Item Use Label", count = 1}, 
            ["item_to_use_name2"] = {label = "Item Use Label", count = 2},
        },
        threshold = 0,
    },

    #! 
        Threshold level is a level that gets saved (in the database) by crafting, if you craft succefully you gain points, if you fail you lose points.
        The threshold level can be changed to your liking.
    #!

    Also if you don't have the items below make sure to remove it and create your own version.
]]--
Crafting.Items = {
    ["lockpick"] = {
        label = "Lockpick",
        needs = {
            ["bobbypin"] = {label = "Bobbypin", count = 4},
            ["rubberband"] = {label = "Rubberband", count = 1},
        },
        threshold = 0,
    },
   
    ["metal_fragments"] = {
        label = "Metal Fragments",
        needs = {
            ["iron"] = {label = "Iron", count = 10},
            ["copper"] = {label = "Copper", count = 10},
        },
        threshold = 0,
    },
    ["low_grade_fuel"] = {
        label = "Low Grade Fuel",
        needs = {
            ["gazbottle"] = {label = "Gas Bottle", count = 10},
            ["animal_fat"] = {label = "Animal Fat", count = 10},
            ["solvent"] = {label = "Solvent", count = 10},
          
        },
        threshold = 0,
    },
    ["explosive_material"] = {
        label = "Explosive Material",
        needs = {
            ["sulfur"] = {label = "Sulfur", count = 10},
            ["coal"] = {label = "Coal", count = 10},
            ["fabric"] = {label = "Fabric", count = 10},
           
        },
        threshold = 0,
    },
    ["detonator"] = {
        label = "Detonator",
        needs = {
            ["bobbypin"] = {label = "Bobbypin", count = 10},
            ["metal_fragments"] = {label = "Metal Fragm.", count = 10},
            ["cutted_wood"] = {label = "Cut Wood", count = 10},
            
        },
        threshold = 0,
    },
    ["animal_fat"] = {
        label = "Animal Fat",
        needs = {
            ["fish"] = {label = "Fish", count = 10},
            ["slaughtered_chicken"] = {label = "Slaught. Chicken", count = 10},
            
        },
        threshold = 0,
    },
    ["fish_oil"] = {
        label = "Fish Oil",
        needs = {
            ["fish"] = {label = "Fish", count = 10},
            ["washed_stone"] = {label = "Washed Stone", count = 10},
    
        },
        threshold = 0,
    },
	 ["c4_bank"] = {
        label = "C4",
        needs = {
            ["low_grade_fuel"] = {label = "Low Grade Fuel", count = 7},
            ["metal_fragments"] = {label = "Metal Frags.", count = 20},
			["explosive_material"] = {label = "Expl. Mats.", count = 5},
			["detonator"] = {label = "Detonator", count = 1},
			["empty_propane_tank"] = {label = "Empt Prop Tank", count = 1},
           
        },
        threshold = 0,
    },
}