Config = {}
Config.Locale = 'en'

Config.Marker = {
	r = 250, g = 0, b = 0, a = 100,  -- red color
	x = 1.0, y = 1.0, z = 1.5,       -- tiny, cylinder formed circle
	DrawDistance = 15.0, Type = 1    -- default circle type, low draw distance due to indoors area
}

Config.PoliceNumberRequired = 3
Config.TimerBeforeNewRob    = 21600 -- The cooldown timer on a store after robbery was completed / canceled, in seconds

Config.MaxDistance    = 40   -- max distance from the robbary, going any longer away from it will to cancel the robbary
Config.GiveBlackMoney = true -- give black money? If disabled it will give cash instead

Stores = {
	["Marducas_Motors"] = {
		position = { x = 168.14, y = -2705.2, z = 6.18 },
		reward = math.random(500, 2500),
		nameOfStore = "Marducas Motors",
		secondsRemaining = math.random(240, 300), -- seconds
		lastRobbed = 0
	},

}
