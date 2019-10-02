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
      Pos     = {x = -466.34,y = 1168.34,z = 328.98 },
      Sprite  = 438,
      Display = 4,
      Scale   = 1.2,
      Colour  = 0,
    },

    AuthorizedVehicles = {
	  {name = 's65amg' , label = 'Vehicles'},
    },	

    Cloakrooms = {
      {x = -458.44,y = 1178.62,z = 326.47 },
    },

    Vehicles = {
       { 
        Spawner    = {x = -474.79,y = 1164.7,z = 325.25 },
        SpawnPoint = {x = -474.79,y = 1164.7,z = 325.25 },
        Heading    = 38.65
       }
    },

    VehicleDeleters = {
      {x = -483.3,y = 1170.07,z = 324.68 },
    },
	
    BossActions = {
      {x = -460.3,y = 1175.31,z = 329.58 },
    },

  },

}
