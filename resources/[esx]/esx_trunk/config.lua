local Keys = {
    ["ESC"] = 322,
    ["F1"] = 288,
    ["F2"] = 289,
    ["F3"] = 170,
    ["F5"] = 166,
    ["F6"] = 167,
    ["F7"] = 168,
    ["F8"] = 169,
    ["F9"] = 56,
    ["F10"] = 57,
    ["~"] = 243,
    ["1"] = 157,
    ["2"] = 158,
    ["3"] = 160,
    ["4"] = 164,
    ["5"] = 165,
    ["6"] = 159,
    ["7"] = 161,
    ["8"] = 162,
    ["9"] = 163,
    ["-"] = 84,
    ["="] = 83,
    ["BACKSPACE"] = 177,
    ["TAB"] = 37,
    ["Q"] = 44,
    ["W"] = 32,
    ["E"] = 38,
    ["R"] = 45,
    ["T"] = 245,
    ["Y"] = 246,
    ["U"] = 303,
    ["P"] = 199,
    ["["] = 39,
    ["]"] = 40,
    ["ENTER"] = 18,
    ["CAPS"] = 137,
    ["A"] = 34,
    ["S"] = 8,
    ["D"] = 9,
    ["F"] = 23,
    ["G"] = 47,
    ["H"] = 74,
    ["K"] = 311,
    ["L"] = 182,
    ["LEFTSHIFT"] = 21,
    ["Z"] = 20,
    ["X"] = 73,
    ["C"] = 26,
    ["V"] = 0,
    ["B"] = 29,
    ["N"] = 249,
    ["M"] = 244,
    [","] = 82,
    ["."] = 81,
    ["-"] = 84,
    ["LEFTCTRL"] = 36,
    ["LEFTALT"] = 19,
    ["SPACE"] = 22,
    ["RIGHTCTRL"] = 70,
    ["HOME"] = 213,
    ["PAGEUP"] = 10,
    ["PAGEDOWN"] = 11,
    ["DELETE"] = 178,
    ["LEFT"] = 174,
    ["RIGHT"] = 175,
    ["TOP"] = 27,
    ["DOWN"] = 173,
    ["NENTER"] = 201,
    ["N4"] = 108,
    ["N5"] = 60,
    ["N6"] = 107,
    ["N+"] = 96,
    ["N-"] = 97,
    ["N7"] = 117,
    ["N8"] = 61,
    ["N9"] = 118
}

Config = {}

Config.CheckOwnership = false -- If true, Only owner of vehicle can store items in trunk.
Config.AllowPolice = true -- If true, police will be able to search players' trunks.

Config.Locale = "en"

Config.OpenKey = Keys["K"]

-- Limit, unit can be whatever you want. Originally grams (as average people can hold 25kg)
Config.Limit = 25000

-- Default weight for an item:
-- weight == 0 : The item do not affect character inventory weight
-- weight > 0 : The item cost place on inventory
-- weight < 0 : The item add place on inventory. Smart people will love it.
Config.DefaultWeight = 1000

Config.localWeight = {

-- INVENTORY ITEMS
	bread = 125,
	water = 330,
	jewels = 2500,

-- WEAPONS
	WEAPON_SMG = 5000,
	WEAPON_PISTOL = 2500,
	WEAPON_FLASHLIGHT = 2000,
	WEAPON_MACHETE = 2500,
	WEAPON_NIGHTSTICK = 2500,
	WEAPON_BAT = 3000,
	WEAPON_STUNGUN = 2500,
	WEAPON_MICROSMG = 4000,
	WEAPON_PUMPSHOTGUN = 5000,
	WEAPON_ASSAULTRIFLE = 5000,
	WEAPON_FIREWORK = 8000,
	WEAPON_BZGAS = 20000,
	FIREEXTINGUISHER = 2500,
	WEAPON_BALL = 1000,
	WEAPON_SMOKEGRENADE = 1000,
	WEAPON_CARBINERIFLE = 5000,
	WEAPON_APPISTOL = 5000,

-- JOBS
	fish = 1500,
	petrol = 2000,
	petrol_raffin = 1750,
	essence = 1500,
	wood = 2000,
	cutted_wood = 1500,
	packaged_plank = 1000,
	stone = 2500,
	washed_stone = 2000,
	copper = 2000,
	iron = 2000,
	gold = 2000,
	diamond = 2000,
	alive_chicken = 2500,
	slaughtered_chicken = 2000,
	packaged_chicken = 1000,
	wool = 2500,
	fabric = 2000,
	clothe = 1000,
	
-- DRUGS
	weed = 2000,
	weed_pooch = 1500,
	coke = 2000,
	coke_pooch = 1500,
	meth = 2000,
	meth_pooch = 1500,
	opium = 2000,
	opium_pooch = 1500,
}

Config.VehicleLimit = {
    [0] = 18000, --Compact
    [1] = 30000, --Sedan
    [2] = 55000, --SUV
    [3] = 25000, --Coupes
    [4] = 30000, --Muscle
    [5] = 10000, --Sports Classics
    [6] = 8000, --Sports
    [7] = 8000, --Super
    [8] = 8000, --Motorcycles
    [9] = 55000, --Off-road
    [10] = 70000, --Industrial
    [11] = 60000, --Utility
    [12] = 40000, --Vans
    [13] = 8000, --Cycles
    [14] = 8000, --Boats
    [15] = 0, --Helicopters
    [16] = 0, --Planes
    [17] = 80000, --Service
    [18] = 80000, --Emergency
    [19] = 80000, --Military
    [20] = 100000, --Commercial
    [21] = 50000, --Trains
}

Config.VehiclePlate = {
    taxi = "TAXI",
    cop = "LSPD",
    ambulance = "EMS0",
    mecano = "MECA"
}
