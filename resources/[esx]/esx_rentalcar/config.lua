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
Config.Key                        = 46 -- C or R3

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
Config.TypeMarker = 4
Config.MarkerScale = {x = 3.000,y = 3000,z = 3.000}
Config.MarkerColor = {r = 255,g = 255,b = 255}
Config.DrawDistance = 100
	
Config.MarkerZones = { 
    {x = -2809.56,y = -6953.71,z = 11.22},-- Monaco
	{x = 4382.77,y = 8685.27,z = 92.25},-- Monaco

}


-- Edit blip titles
Config.BlipZones = { 

   {title="F1 Teams", colour=2, id=376, x = -2799.22,y = -6970.56,z = 10.55},
   {title="F1 Teams", colour=2, id=376, x = 4382.77,y = 8685.27,z = 92.25},
   
  
}
