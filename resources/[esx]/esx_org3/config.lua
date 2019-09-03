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

Config.Org3Stations = {

	LSPD = {


		Cloakrooms = {
			vector3(239.31, -2016.53, 18.34)
		},

		Armories = {
			vector3(233.92, -2023.35, 19.06)
		},


		BossActions = {
			vector3(240.6, -2021.4, 18.71)
		}

	}

}

Config.AuthorizedWeapons = {
	recruit = {
      -- { weapon = 'WEAPON_SPECIALCARBINE', components = { 0, 2147000000, 2147000000, 800, 1200, 2147000000, 1000, nil }, price = 9000 },
      { weapon = 'WEAPON_SWITCHBLADE', price = 1000 },
	},
	
	maestro1 = {
      -- { weapon = 'WEAPON_SPECIALCARBINE', components = { 0, 2147000000, 2147000000, 800, 1200, 2147000000, 1000, nil }, price = 9000 },
      { weapon = 'WEAPON_SWITCHBLADE', price = 1000 },
	},
	
	maestro2 = {
      -- { weapon = 'WEAPON_SPECIALCARBINE', components = { 0, 2147000000, 2147000000, 800, 1200, 2147000000, 1000, nil }, price = 9000 },
      { weapon = 'WEAPON_SWITCHBLADE', price = 1000 },
	},

	mano = {
      -- { weapon = 'WEAPON_SPECIALCARBINE', components = { 0, 2147000000, 2147000000, 800, 1200, 2147000000, 1000, nil }, price = 9000 },
      { weapon = 'WEAPON_SWITCHBLADE', price = 1000 },

	},

	boss = {
      -- { weapon = 'WEAPON_SPECIALCARBINE', components = { 0, 2147000000, 2147000000, 800, 1200, 2147000000, 1000, nil }, price = 9000 },
      { weapon = 'WEAPON_SWITCHBLADE', price = 1000 },
	} 
}
