Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 2.3, y = 2.3, z = 0.65 }
Config.MarkerColor                = { r = 33, g = 107, b = 255 }
Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false
Config.MaxInService               = -1
Config.Locale = 'en'

Config.CourthouseStations = {

  Courthouse = {

    Blip = {
      Pos     = {x = 1205.43,y = 3591.59,z = 35.33 },
      Sprite  = 438,
      Display = 4,
      Scale   = 1.2,
      Colour  = 0,
    },

    AuthorizedVehicles = {
	  {name = 's65amg' , label = 'Vehicles'},
    },	

    Cloakrooms = {
      {x = 1181.71,y = 3575.69,z = 36.19 },
    },

    Vehicles = {
       { 
        Spawner    = {x = 1165.17,y = 3579.61,z = 35.52 },
        SpawnPoint = {x = 1158.85,y = 3578.57,z = 35.52 },
        Heading    = 178.1
       }
    },

    VehicleDeleters = {
      {x = 1152.3,y = 3578.44,z = 35.52 },
    },
	
    BossActions = {
      {x = 1222.98,y = 3577.83,z = 36.25 },
    },

  },

}
