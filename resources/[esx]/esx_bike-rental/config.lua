local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

Config                            = {}
Config.Locale = 'en'
Config.Key                        = 26 -- C or R3

--- #### BASICS
Config.EnablePrice = false -- false = bikes for free
Config.EnableEffects = true
Config.EnableBlips = true


--- #### PRICES	
Config.PriceTriBike = 8
Config.PriceScorcher = 99
Config.PriceCruiser = 12
Config.PriceBmx = 10


--- #### MARKER EDITS
Config.TypeMarker = 27
Config.MarkerScale = {x = 2.000,y = 2.000,z = 0.500}
Config.MarkerColor = {r = 0,g = 255,b = 255}
Config.DrawDistance = 100
	
Config.MarkerZones = { 
    {x = -1262.36,y = -1438.98,z = 3.45},-- 306 Magellan Avenue
	{x = 10.22, y = -979.63, z = 28.54},--399 Vespucci Boulevard
	{x = -219.73, y = -934.93, z = 28.32},--382 Alta Street
	{x = 280.96, y = -1210.57, z = 28.33},--139 Strawberry Avenue
	{x = 96.08, y = -773.54, z = 30.55},--398 San Andreas Avenue
    {x = 31.5, y = -165.1, z = 54.58},--571 Hawick Avenue
	{x = -1107.68, y = -1693.56, z = 3.43},--310 Bay City Avenue
	{x = 1183.15, y = 2697.48, z = 37.01},--940 Route 68
	{x = 1970.36, y = 3738.39, z = 31.32},--1036 Alhambra Drive
	{x = 1655.79, y = 4874.41, z = 41.07},--2009 Grapeseed Main Street
	{x = 327.89, y = -204.24, z = 54.08},-- Apartment Complex Bicycles
}


-- Edit blip titles
Config.BlipZones = { 

   {title="Bikes Rental", colour=2, id=376, x = -1262.36, y = -1438.98, z = 3.45},-- 306 Magellan Avenue
   {title="Bikes Rental", colour=2, id=376, x = 10.22, y = -979.63, z = 28.54},--399 Vespucci Boulevard
   {title="Bikes Rental", colour=2, id=376, x = -219.73, y = -934.93, z = 28.32},--382 Alta Street
   {title="Bikes Rental", colour=2, id=376, x = 280.96, y = -1210.57, z = 28.33},--139 Strawberry Avenue
   {title="Bikes Rental", colour=2, id=376, x = 96.08, y = -773.54, z = 30.55},--398 San Andreas Avenue
   {title="Bikes Rental", colour=2, id=376, x = 31.5, y = -165.1, z = 54.58},--571 Hawick Avenue
   {title="Bikes Rental", colour=2, id=376, x = -1107.68, y = -1693.56, z = 3.43},--310 Bay City Avenue
   {title="Bikes Rental", colour=2, id=376, x = 1183.15, y = 2697.48, z = 37.01},--940 Route 68
   {title="Bikes Rental", colour=2, id=376, x = 1970.36, y = 3738.39, z = 31.32},--1036 Alhambra Drive
   {title="Bikes Rental", colour=2, id=376, x = 1655.79, y = 4874.41, z = 41.07},--2009 Grapeseed Main Street
   {title="Bikes Rental", colour=2, id=376, x = -94.27, y = 6391.42, z = 30.48},--
}
