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

Config.FibStations = {

	LSPD = {

		Blip = {
			Coords  = vector3(96.23, -744.13, 45.7),
			Sprite  = 419,
			Display = 4,
			Scale   = 1.2,
			Colour  = 29
		},

		Cloakrooms = {
			vector3(125.23, -729.67, 242.00)
		},

		Armories = {
			vector3(148.00, -763.00, 242.00)
		},

		Vehicles = {
			
		},

		Helicopters = {
			{
				Spawner = vector3(-138.43, -595, 211.78),
				InsideShop = vector3(-144.46, -593.33, 211.79),
				SpawnPoints = {
					{ coords = vector3(-144.46, -593.33, 211.79), heading = 92.6, radius = 10.0 }
				}
			}
		},

		BossActions = {
			vector3(112.7, -737.80, 242.00)
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
		{ weapon = 'WEAPON_KNIFE', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },

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
		{ weapon = 'WEAPON_KNIFE', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
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
		{ weapon = 'WEAPON_KNIFE', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
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
		{ weapon = 'WEAPON_KNIFE', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
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
		{ weapon = 'WEAPON_KNIFE', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
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
		{ weapon = 'WEAPON_KNIFE', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
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
		{ weapon = 'WEAPON_KNIFE', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
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
		{ weapon = 'WEAPON_KNIFE', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
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
		{ weapon = 'WEAPON_KNIFE', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
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
		{ weapon = 'WEAPON_KNIFE', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
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
		{ weapon = 'WEAPON_KNIFE', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
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
		{ weapon = 'WEAPON_KNIFE', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
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
		{ weapon = 'WEAPON_KNIFE', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
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
		{ model = 'hwaycar', label = 'HWY Patrol', price = 0 },
		{ model = 'hwaycar2', label = 'HWY Charger', price = 0 },
		{ model = 'hwaycar3', label = 'HWY SUV', price = 0 },
		{ model = 'pbus', label = 'Police Prison Bus', price = 0 },
		{ model = 'policeb', label = 'Police Bike', price = 0 },
		{ model = 'policet', label = 'Police Transporter', price = 0 },
		{ model = 'police4', label = 'Police Undercover', price = 0 },
		{ model = 'psubby16', label = 'Unmarked SUV', price = 0 },
		{ model = 'fbi5', label = 'Unmarked GTR', price = 0 },
		{ model = 'polschafter3', label = 'Unmarked Schafter', price = 0 },
		{ model = 'pyosemite', label = 'Unmarked Pyosemite', price = 0 },
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
		{ model = 'riot', label = 'Riot Vehicle', price = 0 },
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
		{ model = 'riot', label = 'Riot Vehicle', price = 0 },
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
		{ model = 'riot', label = 'Riot Vehicle', price = 0 },
		
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
		{ model = 'riot', label = 'Riot Vehicle', price = 0 },

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
		{ model = 'contendred', label = 'Unmarked Tacoma', price = 0 },
		{ model = 'fbi2', label = 'Unmarked SUV', price = 0 },
		{ model = 'riot', label = 'Riot Vehicle', price = 0 },
		
	}
}

Config.AuthorizedHelicopters = {
	recruit = {
		{ model = 'maverick', label = 'FIB Maverick', livery = 0, price = 0 },
		{ model = 'frogger', label = 'FIB FROGGER', livery = 0, price = 0 }
	},
	officer = {
		{ model = 'maverick', label = 'FIB Maverick', livery = 0, price = 0 },
		{ model = 'frogger', label = 'FIB FROGGER', livery = 0, price = 0 }
	},
	officertwo = {
		{ model = 'maverick', label = 'FIB Maverick', livery = 0, price = 0 },
		{ model = 'frogger', label = 'FIB FROGGER', livery = 0, price = 0 }
	},
	airunit = {
		{ model = 'frogger', label = 'FIB FROGGER', livery = 0, price = 0 } ,
	    { model = 'polmav', label = 'FIB Maverick', livery = 0, price = 0 }
	},
	
	recruiter = {
		{ model = 'maverick', label = 'FIB Maverick', livery = 0, price = 0 },
		{ model = 'frogger', label = 'FIB FROGGER', livery = 0, price = 0 }
},
	
	corporal = {
		{ model = 'maverick', label = 'FIB Maverick', livery = 0, price = 0 },
		{ model = 'frogger', label = 'FIB FROGGER', livery = 0, price = 0 }
},
	
	sergeant = {
		{ model = 'maverick', label = 'FIB Maverick', livery = 0, price = 0 },
		{ model = 'frogger', label = 'FIB FROGGER', livery = 0, price = 0 }
},
	
	mastersergeant = {
		{ model = 'maverick', label = 'FIB Maverick', livery = 0, price = 0 },
		{ model = 'frogger', label = 'FIB FROGGER', livery = 0, price = 0 }
},

	lieutenant = {
		{ model = 'maverick', label = 'FIB Maverick', livery = 0, price = 0 },
		{ model = 'frogger', label = 'FIB FROGGER', livery = 0, price = 0 }
	},
	
	captain = {
		{ model = 'maverick', label = 'FIB Maverick', livery = 0, price = 0 },
		{ model = 'frogger', label = 'FIB FROGGER', livery = 0, price = 0 }
	},
	
	bossthree = {
		{ model = 'maverick', label = 'FIB Maverick', livery = 0, price = 0 },
		{ model = 'frogger', label = 'FIB FROGGER', livery = 0, price = 0 }
	},

	bosstwo = {
		{ model = 'maverick', label = 'FIB Maverick', livery = 0, price = 0 },
		{ model = 'frogger', label = 'FIB FROGGER', livery = 0, price = 0 }
	},

	boss = {
		{ model = 'maverick', label = 'FIB Maverick', livery = 0, price = 0 },
		{ model = 'frogger', label = 'FIB FROGGER', livery = 0, price = 0 }
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
			['bproof_1'] = 7,  ['bproof_2'] = 2
		},
		female = {
			['bproof_1'] = 13,  ['bproof_2'] = 1
		}
	},
	fiblack_wear_vest = {
		male = {
			['bproof_1'] = 7,  ['bproof_2'] = 4
		},
		female = {
			['bproof_1'] = 11,  ['bproof_2'] = 3
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

Config.PublicZones = {

   ----
  EnterBuilding2 = {
    Pos       = { x = -1389.1787109378, y = -585.46215820313, z = 29.219924926758},
    Size      = { x = 3.0, y = 3.0, z = 0.2 },
    Color     = { r = 64, g = 0, b = 74 },
    Marker    = 1,
    Blip      = false,
    Name      = "Le Maclerait Libéré",
    Type      = "teleport",
    Hint      = "Appuyez sur ~INPUT_PICKUP~ pour entrer dans l'immeuble.",
    Teleport  = { x = -1386.8133544922, y =  -589.45202636719, z = 29.319534301758 }
  },

  ExitBuilding2 = {
    Pos       = { x = -1386.8133544922, y = -589.45202636719, z = 29.319534301758 },
    Size      = { x = 3.0, y = 3.0, z = 0.2 },
    Color     = { r = 64, g = 0, b = 74 },
    Marker    = 1,
    Blip      = false,
    Name      = "Le Maclerait Libéré",
    Type      = "teleport",
    Hint      = "Appuyez sur ~INPUT_PICKUP~ pour aller à l'entrée de l'immeuble.",
    Teleport  = { x =-1389.1787109378, y = -585.46215820313, z = 29.219924926758},
  }, 
 ---------
  EnterBuilding3 = {
    Pos       = { x = 14.081891059875, y = -1105.6704101563, z = 28.797004699707},
    Size      = { x = 1.5, y = 1.5, z = 0.2 },
    Color     = { r = 64, g = 0, b = 74 },
    Marker    = 1,
    Blip      = false,
    Name      = "Le Maclerait Libéré",
    Type      = "teleport",
    Hint      = "Appuyez sur ~INPUT_PICKUP~ pour entrer dans l'immeuble.",
    Teleport  = { x = 12.944341659546, y =  -1109.8620605469, z = 28.797010421753 }
  },

  ExitBuilding3 = {
    Pos       = { x = 13.325618743896, y = -1107.7855224609, z = 28.797010421753 },
    Size      = { x = 1.5, y = 1.5, z = 0.2 },
    Color     = { r = 64, g = 0, b = 74 },
    Marker    = 1,
    Blip      = false,
    Name      = "Le Maclerait Libéré",
    Type      = "teleport",
    Hint      = "Appuyez sur ~INPUT_PICKUP~ pour aller à l'entrée de l'immeuble.",
    Teleport  = { x =15.142413139343, y = -1105.2983398438, z = 28.797008514404},
  },  
  
}