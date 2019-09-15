Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 2.3, y = 2.3, z = 0.65 }
Config.MarkerColor                = { r = 33, g = 107, b = 255 }
Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false
Config.MaxInService               = -1
Config.Locale = 'en'

Config.LawyerStations = {

  LAWYER = {

    Blip = {
      Pos     = {x = -524.46,y = -711.15,z = 33.83 },
      Sprite  = 498,
      Display = 4,
      Scale   = 1.2,
      Colour  = 5,
    },

    AuthorizedVehicles = {
	  {name = 's65amg' , label = 'Vehicles'},
    },	

    Cloakrooms = {
      {x = 1157.44,y = -3195.12,z = -40.01 },
    },

    Vehicles = {
       { 
        Spawner    = {},
        SpawnPoint = {},
        Heading    = 50.0
       }
    },

    VehicleDeleters = {
      {},
    },
	
    BossActions = {
      {x = 1164.33,y = -3198.88,z = -40.01 },
    },

  },

}
