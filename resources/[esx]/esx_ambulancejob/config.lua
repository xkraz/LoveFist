Config                            = {}

Config.DrawDistance               = 100.0

Config.Marker                     = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }

Config.ReviveReward               = 10  -- revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = true -- enable anti-combat logging?
Config.LoadIpl                    = false -- disable if you're using fivem-ipl or other IPL loaders

Config.Locale = 'en'

local second = 1000
local minute = 60 * second

Config.EarlyRespawnTimer          = 6 * minute  -- Time til respawn is available
Config.BleedoutTimer              = 60 * minute -- Time til the player bleeds out

Config.EnablePlayerManagement     = true

Config.RemoveWeaponsAfterRPDeath  = true
Config.RemoveCashAfterRPDeath     = false	
Config.RemoveItemsAfterRPDeath    = false

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = false
Config.EarlyRespawnFineAmount     = 2000

Config.RespawnPoint = { coords = vector3(299.7, -579.5, 43.3), heading = 48.5 }

Config.Hospitals = {

	Pillbox = {

		Blip = {
			coords = vector3(292.3, -583.6, 43.2),
			sprite = 61,
			scale  = 1.2,
			color  = 2
		},

		AmbulanceActions = {
			vector3(337.49, -588.01, 42.33)
		},

		Pharmacies = {
			vector3(316.60, -588.29, 42.29)
		},

		Vehicles = {
			{
				Spawner = vector3(299.7, -579.5, -1043.3),
				InsideShop = vector3(446.7, -1355.6, 43.5),
				Marker = { type = 36, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(286.0, -595.7, 43.1), heading = 338.6, radius = 4.0 },
					{ coords = vector3(290.3, -597.3, 43.2), heading = 338.6, radius = 4.0 },
					{ coords = vector3(294.4, -585.6, 43.2), heading = 338.6, radius = 4.0 },
					{ coords = vector3(289.9, -583.9, 43.2), heading = 338.6, radius = 4.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(344.3, -580.7, 74.2),
				InsideShop = vector3(305.6, -1419.7, 41.5),
				Marker = { type = 34, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(352.0, -588.2, 74.2), heading = 344.1, radius = 10.0 }
				}
			}
		},

		FastTravels = {
			{
				From = vector3(355.85, -596.34, 27.78),
				To = { coords = vector3(336.9, -591.4, 42.3), heading = 67.3 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false }
			},

			{
				From = vector3(339.3, -592.5, 42.3),
				To = { coords = vector3(359.73, -584.95, 27.82), heading = 247.08 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false }
			}
		},

		FastTravelsPrompt = {
			{
				From = vector3(319.7, -579.9, 43.3),
				To = { coords = vector3(339.9, -586.7, 74.2), heading = 249.1 },
				Marker = { type = 34, x = 1.0, y = 1.0, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = true },
				Prompt = 'Press ~INPUT_CONTEXT~ to fast travel to the roof.'
			},

			{
				From = vector3(339.3, -583.9, 74.2),
				To = { coords = vector3(320.2, -577.1, 43.3), heading = 255.1 },
				Marker = { type = 42, x = 1.0, y = 1.0, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = true },
				Prompt = 'Press ~INPUT_CONTEXT~ to fast travel to the hospital.'
			}
		}
	}
}

Config.AuthorizedVehicles = {

	ambulance = {
		{ model = 'ambulance', label = 'Ambulance Van', price = 0},
		{ model = 'emsvan', label = 'EMS Van', price = 0 }
	},
	
	nurse = {
		{ model = 'ambulance', label = 'Ambulance Van', price = 0},
		{ model = 'emsvan', label = 'EMS Van', price = 0 },
		{ model = 'emssuv', label = 'EMS SUV', price = 0 },
	},
	
	jrdoctor = {
		{ model = 'ambulance', label = 'Ambulance Van', price = 0},
		{ model = 'emsvan', label = 'EMS Van', price = 0 },
		{ model = 'emssuv', label = 'EMS SUV', price = 0 },
		{ model = 'qrv', label = 'EMS SUV2', price = 0 },
	},

	doctor = {
		{ model = 'ambulance', label = 'Ambulance Van', price = 0},
		{ model = 'emsvan', label = 'EMS Van', price = 0 },
		{ model = 'emssuv', label = 'EMS SUV', price = 0 },
		{ model = 'sheriff2', label = 'EMS GMC', price = 0 },
		{ model = 'qrv', label = 'EMS SUV2', price = 0 }
	},
	
	surgeon = {
		{ model = 'ambulance', label = 'Ambulance Van', price = 0},
		{ model = 'emsvan', label = 'EMS Van', price = 0 },
		{ model = 'ambulanc2', label = 'EMS Oldie', price = 0 },
		{ model = 'emssuv', label = 'EMS SUV', price = 0 },
		{ model = 'sheriff2', label = 'EMS GMC', price = 0 },
		{ model = 'qrv', label = 'EMS SUV2', price = 0 }
	},

	chief_doctor = {
		{ model = 'ambulance', label = 'Ambulance Van', price = 0},
		{ model = 'emsvan', label = 'EMS Van', price = 0 },
		{ model = 'ambulanc2', label = 'EMS Oldie', price = 0 },
		{ model = 'emssuv', label = 'EMS SUV', price = 0 },
		{ model = 'qrv', label = 'EMS SUV2', price = 0 },
		{ model = 'sheriff2', label = 'EMS GMC', price = 0 },
		{ model = 'emscar2', label = 'EMS Charger', price = 0 }
	},

	boss = {
		{ model = 'ambulance', label = 'Ambulance Van', price = 0},
		{ model = 'emsvan', label = 'EMS Van', price = 0 },
		{ model = 'ambulanc2', label = 'EMS Oldie', price = 0 },
		{ model = 'emssuv', label = 'EMS SUV', price = 0 },
		{ model = 'qrv', label = 'EMS SUV2', price = 0 },
		{ model = 'sheriff2', label = 'EMS GMC', price = 0 },
		{ model = 'emscar2', label = 'EMS Charger', price = 0 }

	}

}

Config.AuthorizedHelicopters = {

	ambulance = {},
	
	nurse = {},
	
	jrdoctor = {},

	doctor = {
		{ model = 'supervolito', label = 'EMS Chopper', price = 0 },
		{ model = 'seasparrow', label = 'Sea Sparrow', price = 0 },
		{ model = 'maverick' , label = 'maverick' , price = 1}
	},
	
	surgeon = {
		{ model = 'supervolito', label = 'EMS Chopper', price = 0 },
		{ model = 'seasparrow', label = 'Sea Sparrow', price = 0 },
		{ model = 'maverick' , label = 'maverick' , price = 1}
	},

	chief_doctor = {
		{ model = 'supervolito', label = 'EMS Chopper', price = 0 },
		{ model = 'seasparrow', label = 'Sea Sparrow', price = 0 },
		{ model = 'maverick' , label = 'maverick' , price = 1}
	},

	boss = {
		{ model = 'supervolito', label = 'EMS Chopper', price = 0 },
		{ model = 'seasparrow', label = 'Sea Sparrow', price = 0 },
		{ model = 'maverick' , label = 'maverick' , price = 1}
	}

}
