Config = {}
Config.Locale = 'en' -- Localisation

Config.CurrencyPrefix = '$' -- Ex. $ for USD - will be in front of the price
Config.CurrencySuffix = '' -- Ex. DKK for Danish Kroner - will be behind the price, remember a space in the start.

Config.Zones = {
    BikeRental = {
        Enable = true, -- Enable/Disable Bike Rental
        Name = _U('bikerental_blip'), -- Blip Name
        DrawDistance = 10.0, -- DrawDistance lower is better! (controles how fare away you should be before the marker on the ground is drawn)
        MarkerType = 25, -- Marker Type https://forum.fivem.net/t/drawmarker-pictures-for-dev/99136
        ZoneSize = {x = 2.0, y = 2.0, z = 2.0}, -- Zone Size (How large the ring is)
        MarkerColor = {r = 0, g = 255, b = 255}, -- Marker Color RGB
        RentetMarkerColor = {r = 255, g = 0, b = 0}, -- Marker Color when bike is rentet
        BlipSprite = 226, -- Map Marker Icon http://gtaxscripting.blogspot.com/2016/05/gta-v-blips-id-and-image.html
        BlipScale = 0.8, -- Size of Map Marker
        BlipColor = 15, -- Map Marker Color
        EnableBlips = true, -- Enable/Disable Map Markers
        Free = false, -- Controle if bike rental is free
        Multiplier = 5, -- Multiplie the renting price, if bike is not returned (Bike Rental resets on server restart)
        MenuTitle = _U('menu_title_bikerental'), -- Menu Title
        ItemType = 'vehicle', -- Item Type (This one is not used currently, but is intended to be used if script is expanded)
        MenuActions = {
            MenuTrigger = 'bikerental_menu', -- Menu Trigger
            MenuMessage = _U('press_bikerental_menu'), -- Menu Help Text
        },
        Items = { -- Item, label, and price used for the menu
            {item = 'BMX', label = 'BMX Cycle', price = 20},
            {item = 'CRUISER', label = 'Cruiser Cycle', price = 30},
            {item = 'FIXTER', label = 'Racercycle', price = 50},
            {item = 'TRIBIKE', label = 'Triathlon Cycle 1', price = 50},
            {item = 'TRIBIKE2', label = 'Triathlon Cycle 2', price = 50},
            {item = 'TRIBIKE3', label = 'Triathlon Cycle 3', price = 50},
        },
        Pos = { -- Zone positions
           {x = -1262.36,y = -1438.98,z = 3.45},
	{x = 10.22, y = -979.63, z = 28.54},
	{x = -219.73, y = -934.93, z = 28.32},
	{x = 280.96, y = -1210.57, z = 28.33},
	{x = 96.08, y = -773.54, z = 30.55},
    {x = 31.5, y = -165.1, z = 54.58},
	{x = -1107.68, y = -1693.56, z = 3.43},
	{x = 1183.15, y = 2697.48, z = 37.01},
	{x = 1970.36, y = 3738.39, z = 31.32},
	{x = 1655.79, y = 4874.41, z = 41.07},
	{x = 327.89, y = -204.24, z = 54.08}
        }
    },
    
    Basejumping = {
        Enable = true, -- Enable/Disable Basejumping
        Name = _U('basejumping_blip'), -- Blip Name
        DrawDistance = 10.0, -- DrawDistance lower is better! (controles how fare away you should be before the marker on the ground is drawn)
        MarkerType = 25, -- Marker Type https://forum.fivem.net/t/drawmarker-pictures-for-dev/99136
        ZoneSize = {x = 2.0, y = 2.0, z = 2.0}, -- Zone Size (How large the ring is)
        MarkerColor = {r = 255, g = 168, b = 0}, -- Marker Color RGB
        BlipSprite = 94, -- Map Marker Icon http://gtaxscripting.blogspot.com/2016/05/gta-v-blips-id-and-image.html
        BlipScale = 0.8, -- Size of Map Marker
        BlipColor = 81, -- Map Marker Color
        EnableBlips = true, -- Enable/Disable Map Markers
        Free = false, -- Controle if bike rental is free
        MenuTitle = _U('menu_title_basejumping'), -- Menu Title
        ItemType = 'weapon', -- Item Type (Is in use dont change or it will break)
        MenuActions = {
            MenuTrigger = 'basejumping_menu', -- Menu Trigger
            MenuMessage = _U('press_basejumping_menu'), -- Menu Help Text
        },
        Items = { -- Item, label, and price used for the menu
            {item = 'GADGET_PARACHUTE', label = 'Parachute', price = 600},
        },
        Pos = { -- Zone positions
            {x = 451.45, y = 5587.85, z = 780.23},
            {x = -1136.27, y = 4659.88, z = 243.02},
            {x = 1665.17, y = -28.0, z = 195.97},
            {x = -119.97, y = -977.51, z = 303.41},
            {x = -543.86, y = -2226.02, z = 121.44},
        },
        TelePos = { -- Basejump TP locations (used to launch the player for basejumping)
            {x = 446.74, y = 5587.83, z = 791.2, h = 85.5},
            {x = -1146.22, y = 4660.92, z = 243.89, h = 88.5},
            {x = 1659.71, y = -29.39, z = 196.93, h = 103.5},
            {x = -118.81, y = -979.88, z = 304.24, h = 207.5},
            {x = -539.62, y = -2228.61, z = 122.36, h = 237.5},
        }
    }
}
