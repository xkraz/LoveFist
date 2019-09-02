Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerColor                = { r = 120, g = 120, b = 240 }
Config.EnableOwnedVehicles        = true
Config.ResellPercentage           = 75

Config.Locale = 'en'

Config.LicenseEnable = true -- Require people to own a Aircraft License when buying Vehicles? Requires esx_license
Config.LicensePrice  = 25000000

-- looks like this: 'LLL NNN'
-- The maximum plate length is 8 chars (including spaces & symbols), don't go past it!
Config.PlateLetters  = 3
Config.PlateNumbers  = 3
Config.PlateUseSpace = true

Config.Zones = {

	ShopEntering = { -- Marker for Accessing Shop
		Pos   = { x = -936.77, y = -3033.16, z = 12.44 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Type  = 1
	},

}
