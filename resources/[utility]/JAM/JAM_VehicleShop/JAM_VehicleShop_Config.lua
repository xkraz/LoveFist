JAM.VehicleShop = {}
local JVS = JAM.VehicleShop
JVS.ESX = JAM.ESX

JVS.DrawTextDist = 4.0
JVS.MenuUseDist = 3.0
JVS.SpawnVehDist = 5000.0
JVS.VehRetDist = 5.0

JVS.CarDealerJobLabel = "cardealer"
JVS.DealerMarkerPos = vector3(769.01, -250.76, 72.49)

-- Why vector4's, you ask?
-- X, Y, Z, Heading.

JVS.PurchasedCarPos = vector4(809.33, -218.33, 73.02, 335.70)
JVS.PurchasedUtilPos = vector4(390.6, -1625.84, 29.40, 319.35)

JVS.SmallSpawnVeh = 'asea'
JVS.SmallSpawnPos = vector4(755.55, -235.90, 73.45, 283.46)

JVS.LargeSpawnVeh = 'police7'
JVS.LargeSpawnPos = vector4(384.48, -1617.37, 29.49, 148.35)

JVS.DisplayPositions = {
	[1] = vector4(763.35, -225.68, 73.45, 277.29),
	[2] = vector4(763.35, -220.03, 73.45, 272.67),
	[3] = vector4(763.35, -215.34, 73.45, 285.34),
	[4] = vector4(763.35, -211.42, 73.45, 271.91),
	[5] = vector4(763.35, -208.23, 73.45, 278.24),
	[6] = vector4(763.35, -204.86, 73.45, 282.11),
}

JVS.Blips = {
	CityShop = {
		Zone = "Vehicle Shop",
		Sprite = 225,
		Scale = 1.0,
		Display = 4,
		Color = 4,
		Pos = { x = 770.71, y = -249.40, z = 73.45 },
	},
}
