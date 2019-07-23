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

Config.warrantStations = {

	LSPD = {

		Blip = {
			Coords  = vector3(709.5212, -1084.095, 22.4115),
			Sprite  = 458,
			Display = 4,
			Scale   = 1.1,
			Colour  = 57
		},

		Cloakrooms = {
			vector3(728.154, -1063.984, 22.1687)
		},

		Armories = {
			vector3(737.7556, -1078.188, 22.16863)
		},

		Vehicles = {
			{
				Spawner = vector3(454.6, -1017.4, 28.4),
				InsideShop = vector3(228.5, -993.5, -99.5),
				SpawnPoints = {
					{ coords = vector3(438.4, -1018.3, 27.7), heading = 90.0, radius = 6.0 },
					{ coords = vector3(441.0, -1024.2, 28.3), heading = 90.0, radius = 6.0 },
					{ coords = vector3(453.5, -1022.2, 28.0), heading = 90.0, radius = 6.0 },
					{ coords = vector3(450.9, -1016.5, 28.1), heading = 90.0, radius = 6.0 }
				}
			},

			{
				Spawner = vector3(473.3, -1018.8, 28.0),
				InsideShop = vector3(228.5, -993.5, -99.0),
				SpawnPoints = {
					{ coords = vector3(475.9, -1021.6, 28.0), heading = 276.1, radius = 6.0 },
					{ coords = vector3(484.1, -1023.1, 27.5), heading = 302.5, radius = 6.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(461.1, -981.5, 43.6),
				InsideShop = vector3(477.0, -1106.4, 43.0),
				SpawnPoints = {
					{ coords = vector3(449.5, -981.2, 43.6), heading = 92.6, radius = 10.0 }
				}
			}
		},

		BossActions = {
			vector3(727.6418, -1066.523, 28.31117)
		}

	}

}

Config.AuthorizedWeapons = {
	cadet = {
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	deputy = {
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},
	srdeputy = {
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},
	
	asstchief = {
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},
	
	boss = {
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_PISTOL', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	}
	
	
}

Config.AuthorizedVehicles = {
	Shared = {
		
		
		
		
	},

	cadet = {
		{ model = 'scorcher', label = 'Police Bicycle', price = 0 },
		{ model = 'hwaycar7', label = 'Recruit Cruiser', price = 0 }

	},
	
	deputy = {
		{ model = 'cap89', label = '89 Caprice', price = 0 },
		{ model = 'police', label = 'Police Cruiser', price = 0 },
		{ model = 'police2', label = 'Police Charger', price = 0 },
		{ model = 'police3', label = 'Police Interceptor', price = 0 },
		{ model = 'hwaycar', label = 'HWY Patrol', price = 0 },
		{ model = 'hwaycar2', label = 'HWY Charger', price = 0 },
		{ model = 'hwaycar3', label = 'HWY SUV', price = 0 },
		{ model = 'pbus', label = 'Police Prison Bus', price = 0 },
		{ model = 'policeb', label = 'Police Bike', price = 0 },
		{ model = 'psubby16', label = 'Unmarked SUV', price = 0 },
		{ model = 'contendred', label = 'Unmarked Tacoma', price = 0 },
		{ model = 'policet', label = 'Police Transporter', price = 0 },

},
	
	srdeputy = {
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
		{ model = 'polschafter3', label = 'Unmarked Schafter', price = 0 },
		{ model = 'contendred', label = 'Unmarked Tacoma', price = 0 },
		
},
	
	asstchief = {
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
		{ model = 'polschafter3', label = 'Unmarked Schafter', price = 0 },
		{ model = 'contendred', label = 'Unmarked Tacoma', price = 0 },
},
	
	boss = {
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
		{ model = 'polschafter3', label = 'Unmarked Schafter', price = 0 },
		{ model = 'contendred', label = 'Unmarked Tacoma', price = 0 },
	}
}

Config.AuthorizedHelicopters = {
	recruit = {},
	
	officer = {},
	
	officertwo = {},
	
	airunit = {
		{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 0 }
	},
	
	recruiter = {
		{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 0 }
},
	
	corporal = {
		{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 0 }
},
	
	sergeant = {
		{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 0 }
},
	
	mastersergeant = {
		{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 0 }
},

	lieutenant = {
		{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 0 }
	},
	
	captain = {
		{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 0 }
	},
	
	bossthree = {
		{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 0 }
	},

	bosstwo = {
		{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 0 }
	},

	boss = {
		{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 0 }
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
	cadet_wear = {
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
	deputy_wear = {
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
	srdeputy_wear = {
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
	asstchief_wear = {
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
	boss_wear = { -- currently the same as intendent_wear
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
	
	bullet_wear = {
		male = {
			['bproof_1'] = 11,  ['bproof_2'] = 2
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