Config = {} -- DON'T TOUCH

Config.DrawDistance       = 100.0 -- Change the distance before you can see the marker. Less is better performance.
Config.EnableBlips        = true -- Set to false to disable blips.
Config.MarkerType         = 27    -- Change to -1 to disable marker.
Config.MarkerColor        = { r = 255, g = 0, b = 0 } -- Change the marker color.

Config.Locale             = 'en' -- Change the language. Currently available (en or fr).
Config.CooldownMinutes    = 5 -- Minutes between chopping.

Config.CallCops           = true -- Set to true if you want cops to be alerted when chopping is in progress
Config.CallCopsPercent    = 45 -- (min1) if 1 then cops will be called every time=100%, 2=50%, 3=33%, 4=25%, 5=20%.
Config.CopsRequired       = 1

Config.NPCEnable          = true -- Set to false to disable NPC Ped at shop location.
Config.NPCHash			      = 68070371 --Hash of the npc ped. Change only if you know what you are doing.
Config.NPCShop	          = { x = -55.42, y = 6392.8, z = 30.5, h = 46.0 } -- Location of the shop For the npc.
Config.ChopShop           = { x = 972.14, y = -1842.74, z = 30.88}

Config.GiveBlack          = true -- Wanna use Blackmoney?

-- Change the time it takes to open door then to break them.
-- Time in Seconde. 1000 = 1 seconde
Config.DoorOpenFrontLeftTime      = 500
Config.DoorBrokenFrontLeftTime    = 500
Config.DoorOpenFrontRightTime     = 500
Config.DoorBrokenFrontRightTime   = 500
Config.DoorOpenRearLeftTime       = 500
Config.DoorBrokenRearLeftTime     = 500
Config.DoorOpenRearRightTime      = 500
Config.DoorBrokenRearRightTime    = 500
Config.DoorOpenHoodTime           = 500
Config.DoorBrokenHoodTime         = 500
Config.DoorOpenTrunkTime          = 500
Config.DoorBrokenTrunkTime        = 500
Config.DeletingVehicleTime        = 500

Config.Zones = {
    Chopshop = {coords = vector3(972.14, -1842.74, 31.28), name = _U('map_blip'), color = 49, sprite = 225, radius = 50.0, Pos = { x = Config.ChopShop.x, y = Config.ChopShop.y, z = Config.ChopShop.z}, Size  = { x = 5.0, y = 5.0, z = 0.5 }, },
    Shop = {coords = vector3(-55.42, 6392.8, 30.5), name = _U('map_blip_shop'), color = 50, sprite = 120, radius = 25.0, Pos = { x = -55.42, y = 6392.8, z = 30.5}, Size  = { x = 3.0, y = 3.0, z = 1.0 }, },
}

Config.Items = {
    "battery",
    "lowradio",
    "stockrim",
    "airbag",
    "highradio",
    "highrim"
}

Config.Itemsprice = {
  battery = 20,
    lowradio = 30,
    highradio = 50,
    stockrim = 50,
    highrim = 80,
    airbag = 50
}
