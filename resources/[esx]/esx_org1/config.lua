Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableLicenses             = true -- enable if you're using esx_license

Config.EnableHandcuffTimer        = false -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 20 * 60000 -- 10 mins

Config.EnableJobBlip              = false -- enable blips for colleagues, requires esx_society

Config.MaxInService               = -1
Config.Locale = 'en'

Config.Org1Stations = {

	LSPD = {


		Cloakrooms = {
			vector3(1394.74, 3613.46, 34.38)
		},

		Armories = {
			vector3(1367.96, 3617.84, 38.30)
		},


		BossActions = {
			vector3(1370.21, 3612.89, 38.30)
		}

	}

}

Config.AuthorizedWeapons = {
	recruit = {
      { weapon = 'WEAPON_COMPACTRIFLE',  price = 6000 },
      { weapon = 'WEAPON_KNUCKLE', price = 700 },
	},
	
	bossthree = {
      { weapon = 'WEAPON_COMPACTRIFLE',  price = 6000 },
      { weapon = 'WEAPON_KNUCKLE', price = 700 },
	},

	bosstwo = {
      { weapon = 'WEAPON_COMPACTRIFLE',  price = 6000 },
      { weapon = 'WEAPON_KNUCKLE', price = 700 },
	},

	boss = {
      { weapon = 'WEAPON_COMPACTRIFLE', price = 6000 },
      { weapon = 'WEAPON_KNUCKLE', price = 700 },
 
	} 
}
