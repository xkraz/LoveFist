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
      Pos     = {x = -747.22,y = -51039.7,z = 16.4 },
      Sprite  = 498,
      Display = 4,
      Scale   = 1.2,
      Colour  = 5,
    },

    AuthorizedVehicles = {
	  {name = 's65amg' , label = 'Vehicles'},
    },	

    Cloakrooms = {
      {x = -757.0,y = -1038.5,z = 12.0 },
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
      {x = -753.68,y = -1044.55,z = 12.0 },
    },

  },

}
