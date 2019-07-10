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

Config.EnableJobBlip              = true -- enable blips for colleagues, requires esx_society

Config.MaxInService               = -1
Config.Locale = 'en'

Config.DeaStations = {

	LSPD = {

		Blip = {
			Coords  = vector3(3536.88, 3664.04, 28.12),
			Sprite  = 499,
			Display = 4,
			Scale   = 1.2,
			Colour  = 29
		},


		Cloakrooms = {
			vector3(3540.9, 3667.6, 28.12)
		},

		Armories = {
			vector3(3607.0, 3739.4, 28.69)
		},

		Vehicles = {
			{
				Spawner = vector3(3593, 3661, 33.4),
				InsideShop = vector3(228.5, -993.5, -99.5),
				SpawnPoints = {
					{ coords = vector3(3576, 3663, 34), heading = 70.0, radius = 6.0 },
				}
			},

			{
				Spawner = vector3(473.3, -1018.8, 28.0),
				InsideShop = vector3(228.5, -993.5, -99.0),
				SpawnPoints = {
					{ coords = vector3(473.3, -1018.8, 28.0), heading = 276.1, radius = 6.0 },
					{ coords = vector3(484.1, -1023.1, 27.5), heading = 302.5, radius = 6.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(3643.92, 3757.45, 28.52),
				InsideShop = vector3(3631.86, 3764.39, 28.52),
				SpawnPoints = {
					{ coords = vector3(3631.86, 3764.39, 28.52), heading = 92.6, radius = 10.0 }
				}
			}
		},

		BossActions = {
			vector3(3536, 3659, 28)
		}

	}

}

Config.AuthorizedWeapons = {
	recruit = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_PISTOL', components = { 0, 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, 0, 0,   nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_SNIPERRIFLE', components = { 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_KNIFE', price = 0 },
	},

	officer = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_PISTOL', components = { 0, 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, 0, 0,   nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_SNIPERRIFLE', components = { 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_KNIFE', price = 0 },
	},
	officertwo = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_PISTOL', components = { 0, 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, 0, 0,   nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_SNIPERRIFLE', components = { 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_KNIFE', price = 0 },
	},
	
	airunit = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_PISTOL', components = { 0, 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, 0, 0,   nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_SNIPERRIFLE', components = { 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_KNIFE', price = 0 },
	},
	
	recruiter = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_PISTOL', components = { 0, 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, 0, 0,   nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_SNIPERRIFLE', components = { 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_KNIFE', price = 0 },
	},
	
	corporal = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_PISTOL', components = { 0, 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, 0, 0,   nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_SNIPERRIFLE', components = { 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_KNIFE', price = 0 },
	},
	
	sergeant = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_PISTOL', components = { 0, 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, 0, 0,   nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_SNIPERRIFLE', components = { 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_KNIFE', price = 0 },
	},
	
	mastersergeant = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_PISTOL', components = { 0, 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, 0, 0,   nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_SNIPERRIFLE', components = { 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_KNIFE', price = 0 },
	},

	intendent = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_PISTOL', components = { 0, 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, 0, 0,   nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_SNIPERRIFLE', components = { 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_KNIFE', price = 0 },
	},

	lieutenant = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_PISTOL', components = { 0, 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, 0, 0,   nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_SNIPERRIFLE', components = { 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_KNIFE', price = 0 },
	},
	
	captain = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_PISTOL', components = { 0, 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, 0, 0,   nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_SNIPERRIFLE', components = { 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_KNIFE', price = 0 },
	},
	
	bossthree = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_PISTOL', components = { 0, 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, 0, 0,   nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_SNIPERRIFLE', components = { 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_KNIFE', price = 0 },
	},

	bosstwo = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_PISTOL', components = { 0, 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, 0, 0,   nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_SNIPERRIFLE', components = { 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_KNIFE', price = 0 },
	},

	boss = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_PISTOL', components = { 0, 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, 0, 0,   nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_SNIPERRIFLE', components = { 0, 0, 0,  nil }, price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_KNIFE', price = 0 },
	}
}

Config.AuthorizedVehicles = {
	Shared = {
		
		
		
		
	},

	recruit = {
		{ model = 'cap89', label = '89 Caprice', price = 0 },
		{ model = 'police', label = 'Police Cruiser', price = 0 },
		{ model = 'police2', label = 'Police Charger', price = 0 },
		{ model = 'police3', label = 'Police Interceptor', price = 0 },
		{ model = 'police5', label = 'County Sheriff', price = 0 },
		{ model = 'hwaycar', label = 'HWY Patrol', price = 0 },
		{ model = 'hwaycar2', label = 'HWY Charger', price = 0 },
		{ model = 'hwaycar3', label = 'HWY SUV', price = 0 },
		{ model = 'pbus', label = 'Police Prison Bus', price = 0 },
		{ model = 'policeb', label = 'Police Bike', price = 0 },
		{ model = 'policet', label = 'Police Transporter', price = 0 },
		{ model = 'police4', label = 'Police Undercover', price = 0 },
		{ model = 'psubby16', label = 'Unmarked SUV', price = 0 },
		{ model = 'polschafter3', label = 'Unmarked Schafter', price = 0 },
		{ model = 'fbi', label = 'Unmarked Charger', price = 0 },
		{ model = 'fbi5', label = 'Unmarked GTR', price = 0 },
		{ model = 'pyosemite', label = 'Unmarked Pyosemite', price = 0 },
		{ model = 'contendred', label = 'Unmarked Tacoma', price = 0 },
		{ model = 'fbi2', label = 'Unmarked SUV', price = 0 },

	},
	
	officer = {
		{ model = 'cap89', label = '89 Caprice', price = 0 },
		{ model = 'police', label = 'Police Cruiser', price = 0 },
		{ model = 'police2', label = 'Police Charger', price = 0 },
		{ model = 'police3', label = 'Police Interceptor', price = 0 },
		{ model = 'police5', label = 'County Sheriff', price = 0 },
		{ model = 'hwaycar', label = 'HWY Patrol', price = 0 },
		{ model = 'hwaycar2', label = 'HWY Charger', price = 0 },
		{ model = 'hwaycar3', label = 'HWY SUV', price = 0 },
		{ model = 'pbus', label = 'Police Prison Bus', price = 0 },
		{ model = 'policeb', label = 'Police Bike', price = 0 },
		{ model = 'policet', label = 'Police Transporter', price = 0 },
		{ model = 'police4', label = 'Police Undercover', price = 0 },
		{ model = 'psubby16', label = 'Unmarked SUV', price = 0 },
		{ model = 'polschafter3', label = 'Unmarked Schafter', price = 0 },
		{ model = 'fbi', label = 'Unmarked Charger', price = 0 },
		{ model = 'fbi5', label = 'Unmarked GTR', price = 0 },
		{ model = 'pyosemite', label = 'Unmarked Pyosemite', price = 0 },
		{ model = 'contendred', label = 'Unmarked Tacoma', price = 0 },
		{ model = 'fbi2', label = 'Unmarked SUV', price = 0 },

},
	
	officertwo = {
		{ model = 'cap89', label = '89 Caprice', price = 0 },
		{ model = 'police', label = 'Police Cruiser', price = 0 },
		{ model = 'police2', label = 'Police Charger', price = 0 },
		{ model = 'police3', label = 'Police Interceptor', price = 0 },
		{ model = 'police5', label = 'County Sheriff', price = 0 },
		{ model = 'hwaycar', label = 'HWY Patrol', price = 0 },
		{ model = 'hwaycar2', label = 'HWY Charger', price = 0 },
		{ model = 'hwaycar3', label = 'HWY SUV', price = 0 },
		{ model = 'pbus', label = 'Police Prison Bus', price = 0 },
		{ model = 'policeb', label = 'Police Bike', price = 0 },
		{ model = 'policet', label = 'Police Transporter', price = 0 },
		{ model = 'police4', label = 'Police Undercover', price = 0 },
		{ model = 'psubby16', label = 'Unmarked SUV', price = 0 },
		{ model = 'polschafter3', label = 'Unmarked Schafter', price = 0 },
		{ model = 'fbi', label = 'Unmarked Charger', price = 0 },
		{ model = 'fbi5', label = 'Unmarked GTR', price = 0 },
		{ model = 'pyosemite', label = 'Unmarked Pyosemite', price = 0 },
		{ model = 'contendred', label = 'Unmarked Tacoma', price = 0 },
		{ model = 'fbi2', label = 'Unmarked SUV', price = 0 },
		
},
	
	airunit = {
		{ model = 'cap89', label = '89 Caprice', price = 0 },
		{ model = 'police', label = 'Police Cruiser', price = 0 },
		{ model = 'police2', label = 'Police Charger', price = 0 },
		{ model = 'police3', label = 'Police Interceptor', price = 0 },
		{ model = 'police5', label = 'County Sheriff', price = 0 },
		{ model = 'hwaycar', label = 'HWY Patrol', price = 0 },
		{ model = 'hwaycar2', label = 'HWY Charger', price = 0 },
		{ model = 'hwaycar3', label = 'HWY SUV', price = 0 },
		{ model = 'pbus', label = 'Police Prison Bus', price = 0 },
		{ model = 'policeb', label = 'Police Bike', price = 0 },
		{ model = 'policet', label = 'Police Transporter', price = 0 },
		{ model = 'police4', label = 'Police Undercover', price = 0 },
		{ model = 'psubby16', label = 'Unmarked SUV', price = 0 },
		{ model = 'polschafter3', label = 'Unmarked Schafter', price = 0 },
		{ model = 'fbi', label = 'Unmarked Charger', price = 0 },
		{ model = 'fbi5', label = 'Unmarked GTR', price = 0 },
		{ model = 'pyosemite', label = 'Unmarked Pyosemite', price = 0 },
		{ model = 'contendred', label = 'Unmarked Tacoma', price = 0 },
		{ model = 'fbi2', label = 'Unmarked SUV', price = 0 },
},
	
	recruiter = {
		{ model = 'cap89', label = '89 Caprice', price = 0 },
		{ model = 'police', label = 'Police Cruiser', price = 0 },
		{ model = 'police2', label = 'Police Charger', price = 0 },
		{ model = 'police3', label = 'Police Interceptor', price = 0 },
		{ model = 'police5', label = 'County Sheriff', price = 0 },
		{ model = 'hwaycar', label = 'HWY Patrol', price = 0 },
		{ model = 'hwaycar2', label = 'HWY Charger', price = 0 },
		{ model = 'hwaycar3', label = 'HWY SUV', price = 0 },
		{ model = 'pbus', label = 'Police Prison Bus', price = 0 },
		{ model = 'policeb', label = 'Police Bike', price = 0 },
		{ model = 'policet', label = 'Police Transporter', price = 0 },
		{ model = 'police4', label = 'Police Undercover', price = 0 },
		{ model = 'psubby16', label = 'Unmarked SUV', price = 0 },
		{ model = 'polschafter3', label = 'Unmarked Schafter', price = 0 },
		{ model = 'fbi', label = 'Unmarked Charger', price = 0 },
		{ model = 'fbi5', label = 'Unmarked GTR', price = 0 },
		{ model = 'pyosemite', label = 'Unmarked Pyosemite', price = 0 },
		{ model = 'contendred', label = 'Unmarked Tacoma', price = 0 },
		{ model = 'fbi2', label = 'Unmarked SUV', price = 0 },
},
	
	corporal = {
		{ model = 'cap89', label = '89 Caprice', price = 0 },
		{ model = 'police', label = 'Police Cruiser', price = 0 },
		{ model = 'police2', label = 'Police Charger', price = 0 },
		{ model = 'police3', label = 'Police Interceptor', price = 0 },
		{ model = 'police5', label = 'County Sheriff', price = 0 },
		{ model = 'hwaycar', label = 'HWY Patrol', price = 0 },
		{ model = 'hwaycar2', label = 'HWY Charger', price = 0 },
		{ model = 'hwaycar3', label = 'HWY SUV', price = 0 },
		{ model = 'pbus', label = 'Police Prison Bus', price = 0 },
		{ model = 'policeb', label = 'Police Bike', price = 0 },
		{ model = 'policet', label = 'Police Transporter', price = 0 },
		{ model = 'police4', label = 'Police Undercover', price = 0 },
		{ model = 'psubby16', label = 'Unmarked SUV', price = 0 },
		{ model = 'polschafter3', label = 'Unmarked Schafter', price = 0 },
		{ model = 'fbi', label = 'Unmarked Charger', price = 0 },
		{ model = 'fbi5', label = 'Unmarked GTR', price = 0 },
		{ model = 'pyosemite', label = 'Unmarked Pyosemite', price = 0 },
		{ model = 'contendred', label = 'Unmarked Tacoma', price = 0 },
		{ model = 'fbi2', label = 'Unmarked SUV', price = 0 },
},
	
	sergeant = {
		{ model = 'cap89', label = '89 Caprice', price = 0 },
		{ model = 'police', label = 'Police Cruiser', price = 0 },
		{ model = 'police2', label = 'Police Charger', price = 0 },
		{ model = 'police3', label = 'Police Interceptor', price = 0 },
		{ model = 'police5', label = 'County Sheriff', price = 0 },
		{ model = 'hwaycar', label = 'HWY Patrol', price = 0 },
		{ model = 'hwaycar2', label = 'HWY Charger', price = 0 },
		{ model = 'hwaycar3', label = 'HWY SUV', price = 0 },
		{ model = 'pbus', label = 'Police Prison Bus', price = 0 },
		{ model = 'policeb', label = 'Police Bike', price = 0 },
		{ model = 'policet', label = 'Police Transporter', price = 0 },
		{ model = 'police4', label = 'Police Undercover', price = 0 },
		{ model = 'psubby16', label = 'Unmarked SUV', price = 0 },
		{ model = 'polschafter3', label = 'Unmarked Schafter', price = 0 },
		{ model = 'fbi', label = 'Unmarked Charger', price = 0 },
		{ model = 'fbi5', label = 'Unmarked GTR', price = 0 },
		{ model = 'pyosemite', label = 'Unmarked Pyosemite', price = 0 },
		{ model = 'contendred', label = 'Unmarked Tacoma', price = 0 },
		{ model = 'fbi2', label = 'Unmarked SUV', price = 0 },
},
	
	mastersergeant = {
		{ model = 'cap89', label = '89 Caprice', price = 0 },
		{ model = 'police', label = 'Police Cruiser', price = 0 },
		{ model = 'police2', label = 'Police Charger', price = 0 },
		{ model = 'police3', label = 'Police Interceptor', price = 0 },
		{ model = 'police5', label = 'County Sheriff', price = 0 },
		{ model = 'hwaycar', label = 'HWY Patrol', price = 0 },
		{ model = 'hwaycar2', label = 'HWY Charger', price = 0 },
		{ model = 'hwaycar3', label = 'HWY SUV', price = 0 },
		{ model = 'pbus', label = 'Police Prison Bus', price = 0 },
		{ model = 'policeb', label = 'Police Bike', price = 0 },
		{ model = 'policet', label = 'Police Transporter', price = 0 },
		{ model = 'police4', label = 'Police Undercover', price = 0 },
		{ model = 'psubby16', label = 'Unmarked SUV', price = 0 },
		{ model = 'polschafter3', label = 'Unmarked Schafter', price = 0 },
		{ model = 'fbi', label = 'Unmarked Charger', price = 0 },
		{ model = 'fbi5', label = 'Unmarked GTR', price = 0 },
		{ model = 'pyosemite', label = 'Unmarked Pyosemite', price = 0 },
		{ model = 'contendred', label = 'Unmarked Tacoma', price = 0 },
		{ model = 'fbi2', label = 'Unmarked SUV', price = 0 },
},

	intendent = {
		{ model = 'cap89', label = '89 Caprice', price = 0 },
		{ model = 'police', label = 'Police Cruiser', price = 0 },
		{ model = 'police2', label = 'Police Charger', price = 0 },
		{ model = 'police3', label = 'Police Interceptor', price = 0 },
		{ model = 'police5', label = 'County Sheriff', price = 0 },
		{ model = 'hwaycar', label = 'HWY Patrol', price = 0 },
		{ model = 'hwaycar2', label = 'HWY Charger', price = 0 },
		{ model = 'hwaycar3', label = 'HWY SUV', price = 0 },
		{ model = 'pbus', label = 'Police Prison Bus', price = 0 },
		{ model = 'policeb', label = 'Police Bike', price = 0 },
		{ model = 'policet', label = 'Police Transporter', price = 0 },
		{ model = 'police4', label = 'Police Undercover', price = 0 },
		{ model = 'psubby16', label = 'Unmarked SUV', price = 0 },
		{ model = 'polschafter3', label = 'Unmarked Schafter', price = 0 },
		{ model = 'fbi', label = 'Unmarked Charger', price = 0 },
		{ model = 'fbi5', label = 'Unmarked GTR', price = 0 },
		{ model = 'pyosemite', label = 'Unmarked Pyosemite', price = 0 },
		{ model = 'contendred', label = 'Unmarked Tacoma', price = 0 },
		{ model = 'fbi2', label = 'Unmarked SUV', price = 0 },
	

	},

	lieutenant = {
		{ model = 'cap89', label = '89 Caprice', price = 0 },
		{ model = 'police', label = 'Police Cruiser', price = 0 },
		{ model = 'police2', label = 'Police Charger', price = 0 },
		{ model = 'police3', label = 'Police Interceptor', price = 0 },
		{ model = 'police5', label = 'County Sheriff', price = 0 },
		{ model = 'hwaycar', label = 'HWY Patrol', price = 0 },
		{ model = 'hwaycar2', label = 'HWY Charger', price = 0 },
		{ model = 'hwaycar3', label = 'HWY SUV', price = 0 },
		{ model = 'pbus', label = 'Police Prison Bus', price = 0 },
		{ model = 'policeb', label = 'Police Bike', price = 0 },
		{ model = 'policet', label = 'Police Transporter', price = 0 },
		{ model = 'police4', label = 'Police Undercover', price = 0 },
		{ model = 'psubby16', label = 'Unmarked SUV', price = 0 },
		{ model = 'polschafter3', label = 'Unmarked Schafter', price = 0 },
		{ model = 'fbi', label = 'Unmarked Charger', price = 0 },
		{ model = 'fbi5', label = 'Unmarked GTR', price = 0 },
		{ model = 'pyosemite', label = 'Unmarked Pyosemite', price = 0 },
		{ model = 'contendred', label = 'Unmarked Tacoma', price = 0 },
		{ model = 'fbi2', label = 'Unmarked SUV', price = 0 },
	},
	
	captain = {
		{ model = 'cap89', label = '89 Caprice', price = 0 },
		{ model = 'police', label = 'Police Cruiser', price = 0 },
		{ model = 'police2', label = 'Police Charger', price = 0 },
		{ model = 'police3', label = 'Police Interceptor', price = 0 },
		{ model = 'police5', label = 'County Sheriff', price = 0 },
		{ model = 'hwaycar', label = 'HWY Patrol', price = 0 },
		{ model = 'hwaycar2', label = 'HWY Charger', price = 0 },
		{ model = 'hwaycar3', label = 'HWY SUV', price = 0 },
		{ model = 'pbus', label = 'Police Prison Bus', price = 0 },
		{ model = 'policeb', label = 'Police Bike', price = 0 },
		{ model = 'policet', label = 'Police Transporter', price = 0 },
		{ model = 'police4', label = 'Police Undercover', price = 0 },
		{ model = 'psubby16', label = 'Unmarked SUV', price = 0 },
		{ model = 'polschafter3', label = 'Unmarked Schafter', price = 0 },
		{ model = 'fbi', label = 'Unmarked Charger', price = 0 },
		{ model = 'fbi5', label = 'Unmarked GTR', price = 0 },
		{ model = 'pyosemite', label = 'Unmarked Pyosemite', price = 0 },
		{ model = 'contendred', label = 'Unmarked Tacoma', price = 0 },
		{ model = 'fbi2', label = 'Unmarked SUV', price = 0 },
	},
	
	bossthree = {
		{ model = 'cap89', label = '89 Caprice', price = 0 },
		{ model = 'police', label = 'Police Cruiser', price = 0 },
		{ model = 'police2', label = 'Police Charger', price = 0 },
		{ model = 'police3', label = 'Police Interceptor', price = 0 },
		{ model = 'police5', label = 'County Sheriff', price = 0 },
		{ model = 'hwaycar', label = 'HWY Patrol', price = 0 },
		{ model = 'hwaycar2', label = 'HWY Charger', price = 0 },
		{ model = 'hwaycar3', label = 'HWY SUV', price = 0 },
		{ model = 'pbus', label = 'Police Prison Bus', price = 0 },
		{ model = 'policeb', label = 'Police Bike', price = 0 },
		{ model = 'policet', label = 'Police Transporter', price = 0 },
		{ model = 'police4', label = 'Police Undercover', price = 0 },
		{ model = 'psubby16', label = 'Unmarked SUV', price = 0 },
		{ model = 'polschafter3', label = 'Unmarked Schafter', price = 0 },
		{ model = 'fbi', label = 'Unmarked Charger', price = 0 },
		{ model = 'fbi5', label = 'Unmarked GTR', price = 0 },
		{ model = 'pyosemite', label = 'Unmarked Pyosemite', price = 0 },
		{ model = 'contendred', label = 'Unmarked Tacoma', price = 0 },
		{ model = 'fbi2', label = 'Unmarked SUV', price = 0 },
		
	},

	bosstwo = {
		{ model = 'cap89', label = '89 Caprice', price = 0 },
		{ model = 'police', label = 'Police Cruiser', price = 0 },
		{ model = 'police2', label = 'Police Charger', price = 0 },
		{ model = 'police3', label = 'Police Interceptor', price = 0 },
		{ model = 'police5', label = 'County Sheriff', price = 0 },
		{ model = 'hwaycar', label = 'HWY Patrol', price = 0 },
		{ model = 'hwaycar2', label = 'HWY Charger', price = 0 },
		{ model = 'hwaycar3', label = 'HWY SUV', price = 0 },
		{ model = 'pbus', label = 'Police Prison Bus', price = 0 },
		{ model = 'policeb', label = 'Police Bike', price = 0 },
		{ model = 'policet', label = 'Police Transporter', price = 0 },
		{ model = 'police4', label = 'Police Undercover', price = 0 },
		{ model = 'psubby16', label = 'Unmarked SUV', price = 0 },
		{ model = 'polschafter3', label = 'Unmarked Schafter', price = 0 },
		{ model = 'fbi', label = 'Unmarked Charger', price = 0 },
		{ model = 'fbi5', label = 'Unmarked GTR', price = 0 },
		{ model = 'pyosemite', label = 'Unmarked Pyosemite', price = 0 },
		{ model = 'contendred', label = 'Unmarked Tacoma', price = 0 },
		{ model = 'fbi2', label = 'Unmarked SUV', price = 0 },

	},

	boss = {
		{ model = 'cap89', label = '89 Caprice', price = 0 },
		{ model = 'police', label = 'Police Cruiser', price = 0 },
		{ model = 'police2', label = 'Police Charger', price = 0 },
		{ model = 'police3', label = 'Police Interceptor', price = 0 },
		{ model = 'police5', label = 'County Sheriff', price = 0 },
		{ model = 'hwaycar', label = 'HWY Patrol', price = 0 },
		{ model = 'hwaycar2', label = 'HWY Charger', price = 0 },
		{ model = 'hwaycar3', label = 'HWY SUV', price = 0 },
		{ model = 'pbus', label = 'Police Prison Bus', price = 0 },
		{ model = 'policeb', label = 'Police Bike', price = 0 },
		{ model = 'policet', label = 'Police Transporter', price = 0 },
		{ model = 'police4', label = 'Police Undercover', price = 0 },
		{ model = 'psubby16', label = 'Unmarked SUV', price = 0 },
		{ model = 'polschafter3', label = 'Unmarked Schafter', price = 0 },
		{ model = 'fbi', label = 'Unmarked Charger', price = 0 },
		{ model = 'fbi5', label = 'Unmarked GTR', price = 0 },
		{ model = 'pyosemite', label = 'Unmarked Pyosemite', price = 0 },
		{ model = 'contendred', label = 'Unmarked Tacoma', price = 0 },
		{ model = 'fbi2', label = 'Unmarked SUV', price = 0 },
		
	}
}

Config.AuthorizedHelicopters = {
	recruit = {
		{ model = 'polmav', label = 'DEA Maverick', livery = 0, price = 0 },
		{ model = 'frogger', label = 'DEA FROGGER', livery = 0, price = 0 }
	},
	officer = {
		{ model = 'polmav', label = 'DEA Maverick', livery = 0, price = 0 },
		{ model = 'frogger', label = 'DEA FROGGER', livery = 0, price = 0 }
	},
	officertwo = {
		{ model = 'polmav', label = 'DEA Maverick', livery = 0, price = 0 },
		{ model = 'frogger', label = 'DEA FROGGER', livery = 0, price = 0 }
	},
	airunit = {
		{ model = 'polmav', label = 'DEA Maverick', livery = 0, price = 0 },
		{ model = 'frogger', label = 'DEA FROGGER', livery = 0, price = 0 }
	},
	
	recruiter = {
		{ model = 'polmav', label = 'DEA Maverick', livery = 0, price = 0 },
		{ model = 'frogger', label = 'DEA FROGGER', livery = 0, price = 0 }
},
	
	corporal = {
		{ model = 'polmav', label = 'DEA Maverick', livery = 0, price = 0 },
		{ model = 'frogger', label = 'DEA FROGGER', livery = 0, price = 0 }
},
	
	sergeant = {
		{ model = 'polmav', label = 'DEA Maverick', livery = 0, price = 0 },
		{ model = 'frogger', label = 'DEA FROGGER', livery = 0, price = 0 }
},
	
	mastersergeant = {
		{ model = 'polmav', label = 'DEA Maverick', livery = 0, price = 0 },
		{ model = 'frogger', label = 'DEA FROGGER', livery = 0, price = 0 }
},

	lieutenant = {
		{ model = 'polmav', label = 'DEA Maverick', livery = 0, price = 0 },
		{ model = 'frogger', label = 'DEA FROGGER', livery = 0, price = 0 }
	},
	
	captain = {
		{ model = 'polmav', label = 'DEA Maverick', livery = 0, price = 0 },
		{ model = 'frogger', label = 'DEA FROGGER', livery = 0, price = 0 }
	},
	
	bossthree = {
		{ model = 'polmav', label = 'DEA Maverick', livery = 0, price = 0 },
		{ model = 'frogger', label = 'DEA FROGGER', livery = 0, price = 0 }
	},

	bosstwo = {
		{ model = 'polmav', label = 'DEA Maverick', livery = 0, price = 0 },
		{ model = 'frogger', label = 'DEA FROGGER', livery = 0, price = 0 }
	},

	boss = {
		{ model = 'polmav', label = 'DEA Maverick', livery = 0, price = 0 },
		{ model = 'frogger', label = 'DEA FROGGER', livery = 0, price = 0 }
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
	recruit_wear = {
		male = {
			['tshirt_1'] = 59,  ['tshirt_2'] = 1,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 46,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 36,  ['tshirt_2'] = 1,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = 45,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	officer_wear = {
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	sergeant_wear = {
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 1,
			['arms'] = 41,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 1,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	intendent_wear = {
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 2,
			['arms'] = 41,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	lieutenant_wear = { -- currently the same as intendent_wear
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 2,
			['arms'] = 41,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	chef_wear = {
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 3,
			['arms'] = 41,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	boss_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 3,
			['arms'] = 41,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	bullet_wear = {
		male = {
			['bproof_1'] = 11,  ['bproof_2'] = 1
		},
		female = {
			['bproof_1'] = 13,  ['bproof_2'] = 1
		}
	},
	gilet_wear = {
		male = {
			['tshirt_1'] = 59,  ['tshirt_2'] = 1
		},
		female = {
			['tshirt_1'] = 36,  ['tshirt_2'] = 1
		}
	}

}
