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

Config.PoliceStations = {

	LSPD = {

		Blip = {
			Coords  = vector3(425.1, -979.5, 30.7),
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 29
		},

		Cloakrooms = {
			vector3(452.6, -992.8, 30.6)
		},

		Armories = {
			vector3(451.7, -980.1, 30.6)
		},

		Vehicles = {
			{
				Spawner = vector3(454.6, -1017.4, -1028.4),
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
			vector3(448.4, -973.2, 30.6)
		},

	},
	
	PPD = {

		Blip = {
			Coords  = vector3(-444.70, 6014.50, 31.72),
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 29
		},

		Cloakrooms = {
			vector3(-438.72, 6011.72, 31.72)
		},

		Armories = {
			vector3(-437.86, 5988.32, 31.72)
		},

		Vehicles = {
			{
				Spawner = vector3(454.6, -1017.4, -1028.4),
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
			vector3(-437.26, 5998.52, 31.72)
		},

	},

	BCPD = {

		Blip = {
			Coords  = vector3(1852.6, 3686.5, 34.27),
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 29
		},

		Cloakrooms = {
			vector3(1840.94, 3691.55, 34.29)
		},

		Armories = {
			vector3(1840.31, 3688.60, 34.29)
		},

		Vehicles = {
			{
				Spawner = vector3(-458.39, 6011.77, 3.49),
				InsideShop = vector3(228.5, -993.5, -99.5),
				SpawnPoints = {
					{ coords = vector3(-454.47, 6001.80, 31.34), heading = 86.29, radius = 6.0 },
					{ coords = vector3(-451.34, 5998.26, 31.34), heading = 88.96, radius = 6.0 }

				}
			},

			{
				Spawner = vector3(1851.05, -3700.35, 34.27),
				InsideShop = vector3(228.5, -993.5, -99.0),
				SpawnPoints = {
					{ coords = vector3(1843.51, 3704.83, 33.69), heading = 15.24, radius = 6.0 },
					{ coords = vector3(1861.22, 3709.39, 33.27), heading = 29.92, radius = 6.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(-474.86, 5988.80, 31.34),
				InsideShop = vector3(-474.86, 5988.80, 31.34),
				SpawnPoints = {
					{ coords = vector3(-474.86, 5988.80, 31.34), heading = 32.79, radius = 10.0 }
				}
			}
		},

		BossActions = {
			vector3(1850.86, 3697.27, 34.29)
		}

	}

}

Config.AuthorizedWeapons = {
	recruit = {
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_PISTOL', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
	},

	officer = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_PISTOL', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
	},
	officertwo = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_PISTOL', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
	},

	airunit = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_PISTOL', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
	},

	recruiter = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_PISTOL', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},
	corporal = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_PISTOL', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
	},
	sergeant = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_PISTOL', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	mastersergeant = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_PISTOL', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	intendent = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_PISTOL', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	lieutenant = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_PISTOL', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	captain = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_PISTOL', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	bossthree = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_PISTOL', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	bosstwo = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_PISTOL', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	boss = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_PISTOL', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		--{ weapon = 'WEAPON_FLASHBANG', price = 0 }
	}
}

Config.AuthorizedVehicles = {
	Shared = {




	},

	recruit = {
		{ model = 'police7', label = 'Recruit Cruiser', price = 0 },

	},

	officer = {
		{ model = 'police', label = 'Police Cruiser', price = 0 },
		{ model = 'police4', label = 'Police Cruiser 2', price = 0 },
		{ model = 'policeb', label = 'Police Bike', price = 0 },

},

	officertwo = {
		{ model = 'police', label = 'Police Cruiser', price = 0 },
		{ model = 'police2', label = 'Police Charger', price = 0 },
		{ model = 'police4', label = 'Police Cruiser 2', price = 0 },
		{ model = 'policeb', label = 'Police Bike', price = 0 },

},

	airunit = {
		{ model = 'police', label = 'Police Cruiser', price = 0 },
		{ model = 'police2', label = 'Police Charger', price = 0 },
		{ model = 'police3', label = 'Police Explorer', price = 0 },
		{ model = 'police4', label = 'Police Cruiser 2', price = 0 },
		{ model = 'police6', label = 'Police K9 GMC', price = 0 },
		{ model = 'police7', label = 'Police Cadet', price = 0 },
		{ model = 'policeb', label = 'Police Bike', price = 0 },
		{ model = 'policet', label = 'Police Transporter', price = 0 },
		{ model = '2015polstang', label = 'Police Stang', price = 0 },
		{ model = 'pcpdvig', label = 'Police rod', price = 0 },
		{ model = 'pbus', label = 'Police Prison Bus', price = 0 },
		{ model = 'polschafter3', label = 'Unmarked Schafter', price = 0 },
		{ model = 'fbi', label = 'Unmarked Charger', price = 0 },
		{ model = 'fbi2', label = 'Unmarked SUV', price = 0 },
},

	recruiter = {
		{ model = 'police', label = 'Police Cruiser', price = 0 },
		{ model = 'police2', label = 'Police Charger', price = 0 },
		{ model = 'police3', label = 'Police Explorer', price = 0 },
		{ model = 'police4', label = 'Police Cruiser 2', price = 0 },
		{ model = 'policeb', label = 'Police Bike', price = 0 },
		{ model = 'pcpdvig', label = 'Police rod', price = 0 },
},

	corporal = {
		{ model = 'police', label = 'Police Cruiser', price = 0 },
		{ model = 'police2', label = 'Police Charger', price = 0 },
		{ model = 'police3', label = 'Police Explorer', price = 0 },
		{ model = 'police4', label = 'Police Cruiser 2', price = 0 },
		{ model = 'policeb', label = 'Police Bike', price = 0 },
},

	sergeant = {
		{ model = 'police', label = 'Police Cruiser', price = 0 },
		{ model = 'police2', label = 'Police Charger', price = 0 },
		{ model = 'police3', label = 'Police Explorer', price = 0 },
		{ model = 'police4', label = 'Police Cruiser 2', price = 0 },
		{ model = 'policeb', label = 'Police Bike', price = 0 },
		{ model = 'pcpdvig', label = 'Police rod', price = 0 },
		{ model = 'polschafter3', label = 'Unmarked Schafter', price = 0 },
},

	mastersergeant = {
		{ model = 'police', label = 'Police Cruiser', price = 0 },
		{ model = 'police2', label = 'Police Charger', price = 0 },
		{ model = 'police3', label = 'Police Explorer', price = 0 },
		{ model = 'police4', label = 'Police Cruiser 2', price = 0 },
		{ model = 'policeb', label = 'Police Bike', price = 0 },
		{ model = 'pcpdvig', label = 'Police rod', price = 0 },
		{ model = '2015polstang', label = 'Police Stang', price = 0 },
		{ model = 'polschafter3', label = 'Unmarked Schafter', price = 0 },
		{ model = 'policet', label = 'Police Transporter', price = 0 },
		{ model = 'pbus', label = 'Police Prison Bus', price = 0 },

},

	intendent = {
		{ model = 'police', label = 'Police Cruiser', price = 0 },
		{ model = 'police2', label = 'Police Charger', price = 0 },
		{ model = 'police3', label = 'Police Explorer', price = 0 },
		{ model = 'police4', label = 'Police Cruiser 2', price = 0 },
		{ model = 'police6', label = 'Police K9 GMC', price = 0 },
		{ model = 'police7', label = 'Police Cadet', price = 0 },
		{ model = 'policeb', label = 'Police Bike', price = 0 },
		{ model = 'policet', label = 'Police Transporter', price = 0 },
		{ model = '2015polstang', label = 'Police Stang', price = 0 },
		{ model = 'pcpdvig', label = 'Police rod', price = 0 },
		{ model = 'pbus', label = 'Police Prison Bus', price = 0 },
		{ model = 'polschafter3', label = 'Unmarked Schafter', price = 0 },
		{ model = 'fbi2', label = 'Unmarked SUV', price = 0 },


	},

	lieutenant = {
		{ model = 'police', label = 'Police Cruiser', price = 0 },
		{ model = 'police2', label = 'Police Charger', price = 0 },
		{ model = 'police3', label = 'Police Explorer', price = 0 },
		{ model = 'police4', label = 'Police Cruiser 2', price = 0 },
		{ model = 'police6', label = 'Police K9 GMC', price = 0 },
		{ model = 'police7', label = 'Police Cadet', price = 0 },
		{ model = 'policeb', label = 'Police Bike', price = 0 },
		{ model = 'policet', label = 'Police Transporter', price = 0 },
		{ model = '2015polstang', label = 'Police Stang', price = 0 },
		{ model = 'pcpdvig', label = 'Police rod', price = 0 },
		{ model = 'pbus', label = 'Police Prison Bus', price = 0 },
		{ model = 'polschafter3', label = 'Unmarked Schafter', price = 0 },
		{ model = 'fbi2', label = 'Unmarked SUV', price = 0 },
	},

	captain = {
		{ model = 'police', label = 'Police Cruiser', price = 0 },
		{ model = 'police2', label = 'Police Charger', price = 0 },
		{ model = 'police3', label = 'Police Explorer', price = 0 },
		{ model = 'police4', label = 'Police Cruiser 2', price = 0 },
		{ model = 'police6', label = 'Police K9 GMC', price = 0 },
		{ model = 'police7', label = 'Police Cadet', price = 0 },
		{ model = 'policeb', label = 'Police Bike', price = 0 },
		{ model = 'policet', label = 'Police Transporter', price = 0 },
		{ model = '2015polstang', label = 'Police Stang', price = 0 },
		{ model = 'pcpdvig', label = 'Police rod', price = 0 },
		{ model = 'pbus', label = 'Police Prison Bus', price = 0 },
		{ model = 'umkscout', label = 'Unmarked SUV', price = 0 },
		{ model = 'contendred', label = 'Sheriff Truck', price = 0 },
		{ model = 'polschafter3', label = 'Unmarked Schafter', price = 0 },
		{ model = 'fbi2', label = 'Unmarked SUV', price = 0 },
	},

	bossthree = {
			{ model = 'police', label = 'Police Cruiser', price = 0 },
		{ model = 'police2', label = 'Police Charger', price = 0 },
		{ model = 'police3', label = 'Police Explorer', price = 0 },
		{ model = 'police4', label = 'Police Cruiser 2', price = 0 },
		{ model = 'police6', label = 'Police K9 GMC', price = 0 },
		{ model = 'police7', label = 'Police Cadet', price = 0 },
		{ model = 'policeb', label = 'Police Bike', price = 0 },
		{ model = 'policet', label = 'Police Transporter', price = 0 },
		{ model = '2015polstang', label = 'Police Stang', price = 0 },
		{ model = 'pcpdvig', label = 'Police rod', price = 0 },
		{ model = 'pbus', label = 'Police Prison Bus', price = 0 },
		{ model = 'umkscout', label = 'Unmarked SUV', price = 0 },
		{ model = 'contendred', label = 'Sheriff Truck', price = 0 },
		{ model = 'polschafter3', label = 'Unmarked Schafter', price = 0 },
		{ model = 'fbi2', label = 'Unmarked SUV', price = 0 },

	},

	bosstwo = {
		{ model = 'police', label = 'Police Cruiser', price = 0 },
		{ model = 'police2', label = 'Police Charger', price = 0 },
		{ model = 'police3', label = 'Police Explorer', price = 0 },
		{ model = 'police4', label = 'Police Cruiser 2', price = 0 },
		{ model = 'police6', label = 'Police K9 GMC', price = 0 },
		{ model = 'police7', label = 'Police Cadet', price = 0 },
		{ model = 'policeb', label = 'Police Bike', price = 0 },
		{ model = 'policet', label = 'Police Transporter', price = 0 },
		{ model = '2015polstang', label = 'Police Stang', price = 0 },
		{ model = 'pcpdvig', label = 'Police rod', price = 0 },
		{ model = 'pbus', label = 'Police Prison Bus', price = 0 },
		{ model = 'umkscout', label = 'Unmarked SUV', price = 0 },
		{ model = 'contendred', label = 'Sheriff Truck', price = 0 },
		{ model = 'polschafter3', label = 'Unmarked Schafter', price = 0 },
		{ model = 'fbi2', label = 'Unmarked SUV', price = 0 },

	},

	boss = {
		{ model = 'police', label = 'Police Cruiser', price = 0 },
		{ model = 'police2', label = 'Police Charger', price = 0 },
		{ model = 'police3', label = 'Police Explorer', price = 0 },
		{ model = 'police4', label = 'Police Cruiser 2', price = 0 },
		{ model = 'police6', label = 'Police K9 GMC', price = 0 },
		{ model = 'police7', label = 'Police Cadet', price = 0 },
		{ model = 'policeb', label = 'Police Bike', price = 0 },
		{ model = 'policet', label = 'Police Transporter', price = 0 },
		{ model = '2015polstang', label = 'Police Stang', price = 0 },
		{ model = 'pcpdvig', label = 'Police rod', price = 0 },
		{ model = 'pbus', label = 'Police Prison Bus', price = 0 },
		{ model = 'umkscout', label = 'Unmarked SUV', price = 0 },
		{ model = 'contendred', label = 'Sheriff Truck', price = 0 },
		{ model = 'polschafter3', label = 'Unmarked Schafter', price = 0 },
		{ model = 'fbi2', label = 'Unmarked SUV', price = 0 },

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
	recruit_wear = {
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 25,   ['pants_2'] = 2,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 46,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 14,
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
			['arms'] = 0,
			['pants_1'] = 25,   ['pants_2'] = 2,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 14,
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
			['arms'] = 0,
			['pants_1'] = 25,   ['pants_2'] = 2,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 1,
			['arms'] = 14,
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
			['decals_1'] = 8,   ['decals_2'] = 3,
			['arms'] = 0,
			['pants_1'] = 25,   ['pants_2'] = 2,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 14,
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
			['decals_1'] = 8,   ['decals_2'] = 3,
			['arms'] = 0,
			['pants_1'] = 25,   ['pants_2'] = 2,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 14,
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
			['decals_1'] = 8,   ['decals_2'] = 2,
			['arms'] = 0,
			['pants_1'] = 25,   ['pants_2'] = 2,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
			['arms'] = 14,
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
			['decals_1'] = 8,   ['decals_2'] = 2,
			['arms'] = 0,
			['pants_1'] = 25,   ['pants_2'] = 2,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
			['arms'] = 14,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	bullet_wear = {
		male = {
			['bproof_1'] = 12,  ['bproof_2'] = 3
		},
		female = {
			['bproof_1'] = 11,  ['bproof_2'] = 3
		}
	},
	bppolice_wear = {
		male = {
			['bproof_1'] = 4,  ['bproof_2'] = 4
		},
		female = {
			['bproof_1'] = 11,  ['bproof_2'] = 3
		}
	},
	sheriff_wear_vest = {
		male = {
			['bproof_1'] = 4,  ['bproof_2'] = 2
		},
		female = {
			['bproof_1'] = 11,  ['bproof_2'] = 3
		}
	},
	noose_wear_vest = {
		male = {
				['bproof_1'] = 16,  ['bproof_2'] = 2
		},
		female = {
				['bproof_1'] = 11,  ['bproof_2'] = 3
		}
	},
	gilet_wear = {
		male = {
			['bproof_1'] = 10,  ['bproof_2'] = 0,
		},
		female = {
			['bproof_1'] = 19,  ['bproof_2'] = 0,
		}
	},
	undershirtarmor_wear = {
		male = {
			['bproof_1'] = 0,  ['bproof_2'] = 0,
		},
		female = {
			['bproof_1'] = 0,  ['bproof_2'] = 0,
		}
	},
	--Sheriff Short Sleeve
	sheriff_wear = {
		male = {
			['tshirt_1'] = 122,  ['tshirt_2'] = 0,
			['torso_1'] = 13,   ['torso_2'] = 4,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 11,
			['pants_1'] = 25,   ['pants_2'] = 1,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 0,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
			['arms'] = 14,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
			}
	},
		--Police Short Sleeve
		shortsleeve_wear = {
			male = {
				['tshirt_1'] = 122,  ['tshirt_2'] = 0,
				['torso_1'] = 13,   ['torso_2'] = 6,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 11,
				['pants_1'] = 25,   ['pants_2'] = 2,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = -1,  ['helmet_2'] = 0,
				['chain_1'] = 0,    ['chain_2'] = 0,
				['ears_1'] = 2,     ['ears_2'] = 0
			},
			female = {
				['tshirt_1'] = 35,  ['tshirt_2'] = 0,
				['torso_1'] = 48,   ['torso_2'] = 0,
				['decals_1'] = 7,   ['decals_2'] = 2,
				['arms'] = 14,
				['pants_1'] = 34,   ['pants_2'] = 0,
				['shoes_1'] = 27,   ['shoes_2'] = 0,
				['helmet_1'] = -1,  ['helmet_2'] = 0,
				['chain_1'] = 0,    ['chain_2'] = 0,
				['ears_1'] = 2,     ['ears_2'] = 0
				}
			},
		noose_wear = {
			male = {
				['tshirt_1'] = 122,  ['tshirt_2'] = 0,
				['torso_1'] = 53,   ['torso_2'] = 0,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 17,
				['pants_1'] = 34,   ['pants_2'] = 0,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 123,  ['helmet_2'] = 15,
				['chain_1'] = 0,    ['chain_2'] = 0,
				['ears_1'] = 2,     ['ears_2'] = 0
			},
			female = {
				['tshirt_1'] = 35,  ['tshirt_2'] = 0,
				['torso_1'] = 48,   ['torso_2'] = 0,
				['decals_1'] = 7,   ['decals_2'] = 2,
				['arms'] = 14,
				['pants_1'] = 34,   ['pants_2'] = 0,
				['shoes_1'] = 27,   ['shoes_2'] = 0,
				['helmet_1'] = -1,  ['helmet_2'] = 0,
				['chain_1'] = 0,    ['chain_2'] = 0,
				['ears_1'] = 2,     ['ears_2'] = 0
			}
		},
		CID_wear = {
			male = {
				['tshirt_1'] = 130,  ['tshirt_2'] = 0,
				['torso_1'] = 95,   ['torso_2'] = 1,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 11,
				['pants_1'] = 25,   ['pants_2'] = 5,
				['shoes_1'] = 15,   ['shoes_2'] = 1,
				['helmet_1'] = -1,  ['helmet_2'] = 0,
				['chain_1'] = 0,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0
			},
			female = {
				['tshirt_1'] = 35,  ['tshirt_2'] = 0,
				['torso_1'] = 48,   ['torso_2'] = 0,
				['decals_1'] = 7,   ['decals_2'] = 2,
				['arms'] = 14,
				['pants_1'] = 34,   ['pants_2'] = 0,
				['shoes_1'] = 27,   ['shoes_2'] = 0,
				['helmet_1'] = -1,  ['helmet_2'] = 0,
				['chain_1'] = 0,    ['chain_2'] = 0,
				['ears_1'] = 2,     ['ears_2'] = 0
				}
			}
}
