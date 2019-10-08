Config                            = {}
Config.DrawDistance               = 20.0
Config.Locale = 'en'
Config.DeliveryTime = 18000 -- IN SECOUNDS DEFAULT (18000) IS 5 HOURS / 300 MINUTES
Config.TimeBetweenRobberies = 43200
Config.CutOnRobbery = 10 -- IN PERCENTAGE FROM THE TARGET SHOP
Config.RequiredPolices = 3 -- For the robbery
Config.SellValue = 2 -- This is the shops value divided by 2
Config.ChangeNamePrice = 500 -- In $ - how much you can change the shops name for

-- CONFIG ITEMS, DON'T FORGET TO ADD CORRECT NUMBER IN THE BRACKETS
Config.Items = {
    [1] = {label = "Bread",       item = "bread",        price = 2},
    [2] = {label = "Water",      item = "water",       price = 1},
	[3] = {label = "Chocolate",      item = "chocolate",       price = 3},
	[4] = {label = "Sandwich",      item = "sandwich",       price = 3},
	[5] = {label = "Hamburger",      item = "hamburger",       price = 5},
	[6] = {label = "Cupcake",      item = "cupcake",       price = 4},
	[7] = {label = "Chips",      item = "chips",       price = 3},
	[8] = {label = "Cocacola",      item = "cocacola",       price = 2},
	[9] = {label = "Icetea",      item = "icetea",       price = 3},
	[10] = {label = "Coffee",      item = "coffe",       price = 4},
	[11] = {label = "Milk",      item = "milk",       price = 5},
	[12] = {label = "Cigarette",      item = "cigarett",       price = 1},
	[13] = {label = "Lighter",      item = "lighter",       price = 8},
	[14] = {label = "Repair Kit",      item = "repairkit",       price = 350},
	[15] = {label = "Lockpick",      item = "lockpick",       price = 150},
	[16] = {label = "Meat",      item = "meat",       price = 40},
	[17] = {label = "Leather",      item = "leather",       price = 100},
	[18] = {label = "Fish",      item = "fish",       price = 65},
	[19] = {label = "Fish Bait",      item = "fishbait",       price = 5},
	[20] = {label = "Fishing Rod",      item = "fishingrod",       price = 65},
	[21] = {label = "Turtle Bait",      item = "turtlebait",       price = 15},
	[22] = {label = "Binoculars",      item = "binoculars",       price = 200},
	[23] = {label = "Phone",      item = "phone",       price = 250},
  [24] = {label = "Contract",      item = "contract",       price = 1500},
  [25] = {label = "Radio",      item = "radio",       price = 400},
  [26] = {label = "Player Safe (Small)",      item = "playersafeSmall",       price = 7000},
  [27] = {label = "Player Safe (Large)",      item = "playersafeLarge",       price = 23000},
  [28] = {label = "Player Safe (Large)",      item = "playersafeLarge",       price = 23000},
  [29] = {label = "Boombox",      item = "hifi",       price = 750},
  [30] = {label = "Oxygen_Mask",      item = "oxygen_mask",       price = 250},
  [31] = {label = "Car Cleaning Kit",      item = "carcleankit",       price = 50},
  [32] = {label = "Pack of Smokes",      item = "cigaretter",       price = 10},
  [32] = {label = "Snuff Tin",      item = "snusdosa",       price = 5},
  [33] = {label = "Snuff",      item = "snus",       price = 1},
  [34] = {label = "Umbrella",      item = "paraply",       price = 20},
  [35] = {label = "Red Rose",      item = "ros",       price = 4},
  [36] = {label = "Monster Energy",      item = "monster",       price = 10},
  [37] = {label = "Donut",      item = "donut",       price = 2},
  [37] = {label = "Picnic Basket",      item = "picknick",       price = 15},
  [38] = {label = "Pack of Smokes",      item = "cigaretter",       price = 10},
  [38] = {label = "Scooby Snack",      item = "croquettes",       price = 300},
}

Config.Images = {
  [1] = {item = "bread",   src = "img/bread.png"},
  [2] = {item = "water",   src = "img/water.png"},
  [3] = {item = "chocolate",   src = "img/chocolate.png"},
  [4] = {item = "sandwich",   src = "img/sandwich.png"},
  [5] = {item = "hamburger",   src = "img/hamburger.png"},
  [6] = {item = "cupcake",   src = "img/cupcake.png"},
  [7] = {item = "chips",   src = "img/chips.png"},
  [8] = {item = "cocacola",   src = "img/cocacola.png"},
  [9] = {item = "icetea",   src = "img/icetea.png"},
  [10] = {item = "coffe",   src = "img/coffe.png"},
  [11] = {item = "milk",   src = "img/milk.png"},
  [12] = {item = "cigarett",   src = "img/cigarett.png"},
  [13] = {item = "lighter",   src = "img/lighter.png"},
  [14] = {item = "repairkit",   src = "img/repairkit.png"},
  [15] = {item = "lockpick",   src = "img/lockpick.png"},
  [16] = {item = "meat",   src = "img/meat.png"},
  [17] = {item = "leather",   src = "img/leather.png"},
  [18] = {item = "fish",   src = "img/fish.png"},
  [19] = {item = "fishbait",   src = "img/fishbait.png"},
  [20] = {item = "fishingrod",   src = "img/fishingrod.png"},
  [21] = {item = "turtlebait",   src = "img/turtlebait.png"},
  [22] = {item = "binoculars",   src = "img/binoculars.png"},
  [23] = {item = "phone",   src = "img/phone.png"},
  [24] = {item = "contract",   src = "img/contract.png"},
  [25] = {item = "radio",   src = "img/items/radio.png"},
  [26] = {item = "playersafeSmall", src = "img/items/playersafeSmall.png"},
  [27] = {item = "playersafeLarge", src = "img/items/playersafeLarge.png"},
  [28] = {item = "hifi", src = "img/items/hifi.png"},
  [29] = {item = "Oxygen Mask", src = "img/items/oxygen_mask.png"},
  [30] = {item = "Car Cleaning Kit", src = "img/items/carcleankit.png"},
  [31] = {item = "Pack of Smokes", src = "img/items/cigaretter.png"},
}

Config.Zones = {

  ShopCenter = {
    Pos   = {x = 6.09,   y = -708.89,  z = 44.97, number = 'center'},
  },
  Shop1 = {
    Pos   = {x = 374.11,   y = 325.58,  z = 102.57, number = 1},
  },
  Shop2 = {
    Pos = {x = 2558.458,  y = 383.282,  z = 107.622, number = 2},
  },
  Shop3 = {
    Pos = {x = -3039.939, y = 586.954,  z = 6.908, number = 3},
  },
  Shop4 = {
    Pos = {x = -1488.553, y = -380.107,  z = 39.163, number = 4},
  },
  Shop5 = {
    Pos = {x = 1393.562,  y = 3605.684,  z = 33.980, number = 5},
  },
  Shop6 = {
    Pos = {x = -2969.243, y = 391.910,   z = 14.043, number = 6},
  },
  Shop7 = {
    Pos = {x = 2679.916,  y = 3281.671, z = 54.241, number = 7},
  },
  Shop8 = {
    Pos = {x = -48.61,   y = -1757.46, z = 28.42, number = 8},
  },
  Shop9 = {
    Pos = {x = 1163.24,   y = -323.79, z = 68.21, number = 9},
  },
  Shop10 = {
    Pos = {x = -707.87,  y = -914.62,  z = 18.22, number = 10},
  },
  Shop11 = {
    Pos = {x = -1821.523, y = 793.518,   z = 137.118, number = 11},
  },
  Shop12 = {
    Pos = {x = 1699.388,  y = 4925.404,  z = 41.063, number = 12},
  },
  Shop13 = {
    Pos = {x = 1962.464,  y = 3741.672, z = 31.343, number = 13},
  },
  Shop14 = {
    Pos = {x = 1136.808,  y = -983.281,  z = 45.415, number = 14},
  },
  Shop15 = {
    Pos = {x = 26.88,   y = -1348.1, z = 28.5, number = 15},
  },
  Shop16 = {
    Pos = {x = -1394.409, y = -607.624,  z = 29.319, number = 16},
  },
  Shop17 = {
    Pos = {x = 548.431,   y = 2672.710, z = 41.156, number = 17},
  },
  Shop18 = {
    Pos = {x = -3242.927, y = 1002.462, z = 11.830, number = 18},
  },
  Shop19 = {
    Pos = {x = 1167.024,  y = 2709.930,  z = 37.157, number = 19},
  },
  Shop20 = {
    Pos = {x = 1730.216,  y = 6415.131, z = 34.037, number = 20}
  },
  Robbery1 = {
    Pos   = {x = 379.19, y = 332.08, z = 102.57, number = 101, red = true},
  },
  Robbery2 = {
    Pos   = {x = 2550.15, y = 385.37, z = 107.62, number = 102, red = true},
  },
  Robbery3 = {
    Pos   = {x = -3047.08, y = 586.37, z = 6.91, number = 103, red = true},
  },
  Robbery4 = {
    Pos   = {x = -1480.09, y = -373.35, z = 38.16, number = 104, red = true},
  },
  Robbery5 = {
    Pos   = {x = 1391.45, y = 3608.82, z = 34.98, number = 105, red = true},
  },
  Robbery6 = {
    Pos   = {x = -2959.15, y = 388.54, z = 13.04, number = 106, red = true},
  },
  Robbery7 = {
    Pos   = {x = 2673.59, y = 3286.2, z = 54.24, number = 107, red = true},
  },
  Robbery8 = {
    Pos   = {x = -43.7, y = -1750.58, z = 28.42, number = 108, red = true},
  },
  Robbery9 = {
    Pos   = {x = 1161.15, y = -315.73, z = 68.21, number = 109, red = true},
  },
  Robbery10 = {
    Pos   = {x = -708.29, y = -905.99, z = 18.22, number = 110, red = true},
  },
  Robbery11 = {
    Pos   = {x = -1827.32, y = 798.78, z = 137.16, number = 111, red = true},
  },
  Robbery12 = {
    Pos   = {x = 1705.41, y = 4920.56, z = 41.06, number = 112, red = true},
  },
  Robbery13 = {
    Pos   = { x = 1959.04, y = 3747.93, z = 31.34, number = 113, red = true},
  },
  Robbery14 = {
    Pos   = {x = 1126.83, y = -982.6, z = 44.42, number = 114, red = true},
  },
  Robbery15 = {
    Pos   = {x = 28.48, y = -1339.94, z = 28.5, number = 115, red = true},
  },
  Robbery16 = {
    Pos   = {x = -1384.41, y = -628.71, z = 29.82, number = 116, red = true},
  },
  Robbery17 = {
    Pos   = {x = 546.86, y = 2663.71, z = 41.16, number = 117, red = true},
  },
  Robbery18= {
    Pos   = {x = -3249.3, y = 1004.54, z = 11.83, number = 118, red = true},
  },
  Robbery19 = {
    Pos   = {x = 1166.89, y = 2718.14, z = 36.16, number = 119, red = true},
  },
  Robbery20= {
    Pos   = {x = 1734.88, y = 6419.83, z = 34.04, number = 120, red = true},
  },
}