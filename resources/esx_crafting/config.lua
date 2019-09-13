Crafting = {}
-- You can configure locations here
Crafting.Locations = {
    [1] = {x = 1015.003, y = -3158.878, z = -38.907},
    [2] = {x = 1175.433, y = 2635.81, z = 37.755},
    [3] = {x = -1154.895, y = -2022.624, z = 13.176},
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