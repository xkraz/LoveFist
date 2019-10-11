Config = {}

Config.Locale = 'en'

-- Set the time (in minutes) during the player is outlaw
Config.Timer = 1

-- Set if show alert when player use gun
Config.GunshotAlert = true

-- Set if show when player do carjacking
Config.CarJackingAlert = true

-- Set if show when player fight in melee
Config.MeleeAlert = true

-- Set if show when player speeds over 100mph
Config.FelonySpeedingAlert = true

-- In Seconds
Config.BlipSpeedingTime = 10

--Blip radius, in float value!
Config.BlipSpeedingRadius = 150.0

-- In seconds
Config.BlipGunTime = 10

-- Blip radius, in float value!
Config.BlipGunRadius = 150.0

-- In seconds
Config.BlipMeleeTime = 7

-- Blip radius, in float value!
Config.BlipMeleeRadius = 150.0

-- In seconds
Config.BlipJackingTime = 10

-- Blip radius, in float value!
Config.BlipJackingRadius = 150.0

-- Show notification when cops steal too?
Config.ShowCopsMisbehave = true

-- Jobs in this table are considered as cops
Config.WhitelistedCops = {
	'police'
	-- 'ambulance'
}