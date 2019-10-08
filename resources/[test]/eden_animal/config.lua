Config = {}

Config.Locale = 'en'

Config.PetShop = {
	["dog"] = {
		label = _U('dog'),
		price = 5000,
		model = -1788665315,
	},

	["cat"] = {
		label = _U('cat'),
		price = 3500,
		model = 1462895032,
		bringBall = false,
	},

	["chicken"] = {
		label = _U('chicken'),
		price = 4000,
		model = GetHashKey('a_c_hen'),
		bringBall = false,
	},

--[[
-- coyote
	["wolf"] = {
		label = _U('wolf'),
		price = 12000,
		model = 1682622302,
	},
-- chop
	["rottweiler"] = {
		label = _U('chop'),
		price = 12000,
		model = 351016938,
	},
]]--
	["bunny"] = {
		label = _U('bunny'),
		price = 2500,
		model = -541762431,
	},

	["husky"] = {
		label = _U('husky'),
		price = 5500,
		model = 1318032802,
	},

	["pig"] = {
		label = _U('pig'),
		price = 5000,
		model = -1323586730,
	},

	["poodle"] = {
		label = _U('poodle'),
		price = 5000,
		model = 1125994524,
	},

	["pug"] = {
		label = _U('pug'),
		price = 6000,
		model = 1832265812,
	},

	["retriever"] = {
		label = _U('retriever'),
		price = 5000,
		model = 882848737,
	},

	["berger"] = {
		label = _U('asatian'),
		price = 5500,
		model = 1126154828,
	},

	["westie"] = {
		label = _U('westie'),
		price = 5000,
		model = -1384627013,
	},
}

Config.Zones = {
	PetShop = {
		Pos = {x = 562.19, y = 2741.30, z = 41.66 },
		Sprite = 463,
		Display = 4,
		Scale = 1.0,
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 000, g = 164, b = 224},
		Type  = 1
	}
}
