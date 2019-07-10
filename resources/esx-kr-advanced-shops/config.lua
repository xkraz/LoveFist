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
    [1] = {label = "Water",       item = "water",        price = 5},
    [2] = {label = "Bread",      item = "bread",       price = 5},
}

Config.Images = {
  [1] = {item = "water",   src = "img/bottle.png"},
  [2] = {item = "bread",   src = "img/burger.png"},
}

Config.Zones = {

  ShopCenter = {
    Pos   = {x = 6.09,   y = -708.89,  z = 44.97, number = 'center'},
  },
  Shop1 = {
    Pos   = {},
  },
  Shop2 = {
    Pos = {},
  },
  Shop3 = {
    Pos = {},
  },
  Shop4 = {
    Pos = {},
  },
  Shop5 = {
    Pos = {},
  },
  Shop6 = {
    Pos = {},
  },
  Shop7 = {
    Pos = {},
  },
  Shop8 = {
    Pos = {},
  },
  Shop9 = {
    Pos = {},
  },
  Shop10 = {
    Pos = {},
  },
  Shop11 = {
    Pos = {},
  },
  Shop12 = {
    Pos = {},
  },
  Shop13 = {
    Pos = {},
  },
  Shop14 = {
    Pos = {},
  },
  Shop15 = {
    Pos = {x = 25.88,   y = -1347.1, z = 28.5, number = 15},
  },
  Shop16 = {
    Pos = {x = -1393.409, y = -606.624,  z = 29.319, number = 16},
  },
  Shop17 = {
    Pos = {},
  },
  Shop18 = {
    Pos = {},
  },
  Shop19 = {
    Pos = {},
  },
  Shop20 = {
    Pos = {},
  },
  Robbery1 = {
    Pos   = {},
  },
  Robbery2 = {
    Pos   = {},
  },
  Robbery3 = {
    Pos   = {},
  },
  Robbery4 = {
    Pos   = {},
  },
  Robbery5 = {
    Pos   = {},
  },
  Robbery6 = {
    Pos   = {},
  },
  Robbery7 = {
    Pos   = {},
  },
  Robbery8 = {
    Pos   = {},
  },
  Robbery9 = {
    Pos   = {},
  },
  Robbery10 = {
    Pos   = {},
  },
  Robbery11 = {
    Pos   = {},
  },
  Robbery12 = {
    Pos   = {},
  },
  Robbery13 = {
    Pos   = {},
  },
  Robbery14 = {
    Pos   = {},
  },
  Robbery15 = {
    Pos   = {x = 28.48, y = -1339.94, z = 28.5, number = 115, red = true},
  },
  Robbery16 = {
    Pos   = {x = -1384.41, y = -628.71, z = 29.82, number = 116, red = true},
  },
  Robbery17 = {
    Pos   = {},
  },
  Robbery18= {
    Pos   = {},
  },
  Robbery19 = {
    Pos   = {},
  },
  Robbery20= {
    Pos   = {},
  },
}