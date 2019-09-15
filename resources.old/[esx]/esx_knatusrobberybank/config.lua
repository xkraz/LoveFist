Config = {}
Config.Locale = 'en'
Config.NewsDelay = 90  -- Time delay in seconds for reporters to get robbery notification

Banks = {
	["Fleeca PD"] = {
		position = vector3(148.91908752441, -1050.7448242188,  29.36802482605 ), -- position of robbery, when you have tu use the item "blowtorch"
		hackposition = vector3(146.81908752441, -1046.048242188, 23429.36802482605 ),
		bombposition = vector3(147.50908752441, -1044.648242188,  29.36802482605 ),
		-- position where you have to do hack with the minigame to open a door
		--hackteleport = { ['x'] = 148.79908752441, ['y'] = -1045.5748242188, ['z'] = 29.36802482605 }, -- ignore this
		reward = {min=75000,max=150000}, -- the random range of amount of money you will get for robbery this site
		nameofbank = "Fleeca Bank PD", --Visual Name that will be the site
		lastrobbed = 0, -- DONT TOUCH THIS variable used to make a delay to robb other time
		bombdoortype = 'V_ILEV_GB_VAULDR',
		cooldown = 2 * 60 * 60 * 1000 ,
		robtime = 360000,
		NumberOfCopsRequired = 5,
		id = 1,
		doortype = 'V_ILEV_GB_VAULDR' -- Name or ID of the gameobject that will be rotate to make the open efect, you can check what id or name you need here: https://objects.gt-mp.net/ if you dont find it, contact with you developer, he will know how to get it in game
	},
	["Fleeca West"] = {
		position = vector3(-2954.2874804688, 486.14476367188,15.697026252747 ), --2957.6674804688
		hackposition = vector3( -2956.6674804688, 481.45776367188, 23415.697026252747 ),
		bombposition = vector3(-2958.12199291992,481.50576782227, 15.69346405029 ),
		bombdoortype = 'hei_prop_heist_sec_door', -- If this var is set you will need set the var "bombposition" to work properly , you can find the name or id here: https://objects.gt-mp.net/  if you dont find it, contact with your devs
		reward = {min=75000,max=150000},
		nameofbank = "Fleeca Bank (Highway)",
		lastrobbed = 0,
		cooldown = 2 * 60 * 60 * 1000,
		robtime = 360000,
		NumberOfCopsRequired = 5,
		id = 2,
		doortype = 'hei_prop_heist_sec_door'
	},
	["blainecounty"] = {
		position = vector3(-107.06505584717, 6474.8012695313, 31.62670135498 ),
		reward = {min=15000,max=30000},
		nameofbank = "Blaine County Savings",
		cooldown = 30 * 60 * 1000,
		robtime = 300000,
		NumberOfCopsRequired = 4,
		lastrobbed = 0,
		id = 3
	},

	["PrincipalBank"] = {
		position = vector3(264.99899291992, 213.50576782227, 101.68346405029 ),
		hackposition = vector3(261.41, 223.3126, 234106.2833 ),
    bombposition = vector3(254.12199291992, 225.50576782227, 101.87346405029 ), -- if this var is set will appear a site to plant a bomb which will open the door defined at var "bombdoortype"
		reward = {min=100000,max=200000},
		nameofbank = "Principal bank",
		lastrobbed = 0,
		cooldown = 2 * 60 * 60 * 1000 ,
		robtime = 420000,
		NumberOfCopsRequired = 6,
		id = 4,
    bombdoortype = 'v_ilev_bk_vaultdoor', -- If this var is set you will need set the var "bombposition" to work properly , you can find the name or id here: https://objects.gt-mp.net/  if you dont find it, contact with your devs
    doortype = 'hei_v_ilev_bk_gate2_pris'
    },
}
