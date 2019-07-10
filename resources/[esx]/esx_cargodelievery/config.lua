Config                        	= {}
Config.CopsScaleReward			= true

-- Change this to false if you want clean / legit money
Config.UsesBlackMoney			= true

--Hash of the npc ped. Change only if you know what you are doing.
Config.NPCHash					= 349680864 			

--Random time societies will get alerted. This is a range in seconds.
Config.AlertCopsDelayRangeStart	= 5
Config.AlertCopsDelayRangeEnd	= 5
Config.TimerBeforeNewDelievery   = 1000000 -- The cooldown timer
--If you want to notify more societies add them here. example { "mafia", "bikers" }
Config.AlertExtraSocieties 		= { "fib", "org1", "org2", "org3" }

--Self Explained
Config.CargoProviderLocation	= { x = -471.8, y = -2700.45, z = 5.00, h = 225.39}
Config.TimerBeforeNewDel = 2700

Config.CargoDeliveryLocations 	= {

		{ x = 731.89, y = 4172.27, z = 39.3 },
		{ x = 1959.28, y = 3845.48, z = 31.2 },
		{ x = 388.76, y = 3591.34, z = 32.09},
		{ x = 97.24, y = 3739.86, z = 38.8}

}


Config.Scenarios = {
	
	{ 
		SpawnPoint = { x = -454.02, y = -2706.29, z = 6, h = 310.27}, 
		DeliveryPoint = 3.0,
		VehicleName = "pony2",
		MinCopsOnline = 5,
		CargoCost = 0,
		lastDelievery = 0,
		CargoReward = math.random(6000, 7000)
	
	}
}