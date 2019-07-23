Config = {}
Config.Locale = 'en'

Config.DoorList = {

--- NEW HOSPITAL


-- OFFICE
{ 
		objName = 'v_ilev_cor_offdoora',
		objCoords  = {x = 323.72, y = -590.71, z = 28.94},
		textCoords = {x = 324.4, y = -590.87, z = 28.94},
		authorizedJobs = { 'ambulance', 'adminkey', },
		locked = true,
		distance = 2.5
	},
	
	-- TRAINING
	{
		objName = 'v_ilev_cor_darkdoor',
		objCoords  = {x = 318.94, y = -588.98, z = 28.98},
		textCoords = {x = 318.94, y = -588.98, z = 28.98},
		authorizedJobs = { 'ambulance', 'adminkey', },
		locked = true,
		distance = 3
	},
	
	{
		objName = 'v_ilev_cor_darkdoor',
		objCoords  = {x = 316.52, y = -588.10, z = 28.98},
		textCoords = {x = 316.52, y = -588.10, z = 28.98},
		authorizedJobs = { 'ambulance', 'adminkey', },
		locked = true,
		distance = 3
	},
-- PHARMACY
{
		objName = 'v_ilev_cor_firedoorwide',
		objCoords  = {x = 337.23, y = -584.05, z = 28.81},
		textCoords = {x = 337.40, y = -583.32, z = 28.81},
		authorizedJobs = { 'ambulance', 'adminkey', },
		locked = true,
		distance = 2.0
	},
	
	
	{
		objName = 'v_ilev_cor_firedoorwide',
		objCoords  = {x = 332.71, y = -587.72, z = 28.81},
		textCoords = {x = 333.33, y = -587.93, z = 28.81},
		authorizedJobs = { 'ambulance', 'adminkey', },
		locked = true,
		distance = 2.0
	},


	-- MASTERS CLUB
	
	
	{
		objName = 'apa_heist_apart2_door',
		objCoords  = {x = 1381.86, y = 3617.88, z = 39.45},
		textCoords = {x = 1381.86, y = 3617.88, z = 39.45},
		authorizedJobs = { 'org1', 'adminkey', },
		locked = true,
		distance = 2.5
	},
	
	{
		objName = 'prop_arm_gate_l',
		objCoords  = {x = 1406.33069, y = 3623.52173, z = 35.6310081},
		textCoords = {x = 1408.33069, y = 3624.52173, z = 35.6310081},
		authorizedJobs = { 'org1', 'adminkey', },
		locked = true,
		distance = 5.0
	},
	
	{
		objName = 'prop_ss1_14_garage_door',
		objCoords  = {x = 1374.2533, y = 3612.4375, z = 35.7443581},
		textCoords = {x = 1374.2533, y = 3612.4375, z = 35.7443581},
		authorizedJobs = { 'org1', 'adminkey', },
		locked = true,
		distance =15.0
	},
	
	-- arve stroker
	
	--garage
	{
		objName = 'prop_ch_025c_g_door_01',
		objCoords  = {x = 18.65038, y = 546.3401, z = 176.3448},
		textCoords = {x = 18.65038, y = 546.3401, z = 176.3448},
		authorizedJobs = { 'strokerkey', 'adminkey', },
		locked = true,
		distance = 15.0
	},
	-- front door
	{
		objName = 'v_ilev_fh_frontdoor',
		objCoords  = {x = 7.518359, y = 539.5268, z = 176.1776},
		textCoords = {x = 7.518359, y = 539.5268, z = 176.1776},
		authorizedJobs = {},
		locked = true,
		distance = 3.0
	},
	
	
	-- METH SPOT
	
	
	{
		objName = 'apa_heist_apart2_door',
		objCoords  = {x = 2363.08, y = 3134.58, z = 48.37},
		textCoords = {x = 2363.08, y = 3134.58, z = 48.37},
		authorizedJobs = { 'methkey', 'adminkey', },
		locked = false,
		distance = 2.5
	},
	
		{
		objName = 'apa_heist_apart2_door',
		objCoords  = {x = 2339.9590, y = 3135.1953, z = 48.6022},
		textCoords = {x = 2339.9590, y = 3135.1953, z = 48.6022},
		authorizedJobs = { 'methkey', 'adminkey', },
		locked = false,
		distance = 2.5
	},
	
	
	--- COKE
	
	{
		objName = 'ex_prop_door_arcad_roof_l',
		objCoords  = {x = -323.4244, y = -1367.134, z = 31.0707},
		textCoords = {x = -323.4244, y = -1367.134, z = 31.0707},
		authorizedJobs = { 'cokekey', 'adminkey', },
		locked = false,
		distance = 2.5
	},
	
	
	
	--
	-- Mission Row First Floor
	--



	
	--- POLICE GATE
	
	{
		objName = 'v_ilev_ph_door01',
		objCoords  = {x = 434.747, y = -980.618, z = 30.839},
		textCoords = {x = 434.747, y = -981.50, z = 31.50},
		authorizedJobs = { 'police', 'fib', 'dea', 'policekey', 'adminkey', },
		locked = false,
		distance = 2.5
	},
	
	{
		objName = 'apa_heist_apart2_door',
		objCoords  = {x = 1381.86, y = 3617.88, z = 39.45},
		textCoords = {x = 1381.86, y = 3617.88, z = 39.45},
		authorizedJobs = { 'org1', 'adminkey', },
		locked = true,
		distance = 2.5
	},

	{
		objName = 'v_ilev_ph_door002',
		objCoords  = {x = 434.747, y = -983.215, z = 30.839},
		textCoords = {x = 434.747, y = -982.50, z = 31.50},
		authorizedJobs = { 'police', 'fib', 'dea', 'policekey', 'adminkey', },
		locked = false,
		distance = 2.5
	},

	-- To locker room & roof
	{
		objName = 'v_ilev_ph_gendoor004',
		objCoords  = {x = 449.698, y = -986.469, z = 30.689},
		textCoords = {x = 450.104, y = -986.388, z = 31.739},
		authorizedJobs = { 'police', 'fib', 'dea', 'policekey', 'adminkey', },
		locked = true
	},

	-- Rooftop
	{
		objName = 'v_ilev_gtdoor02',
		objCoords  = {x = 464.361, y = -984.678, z = 43.834},
		textCoords = {x = 464.361, y = -984.050, z = 44.834},
		authorizedJobs = { 'police', 'fib', 'dea', 'policekey', 'adminkey', },
		locked = true
	},

	-- Hallway to roof
	{
		objName = 'v_ilev_arm_secdoor',
		objCoords  = {x = 461.286, y = -985.320, z = 30.839},
		textCoords = {x = 461.50, y = -986.00, z = 31.50},
		authorizedJobs = { 'police', 'fib', 'dea', 'policekey', 'adminkey', },
		locked = true
	},

	-- Armory
	{
		objName = 'v_ilev_arm_secdoor',
		objCoords  = {x = 452.618, y = -982.702, z = 30.689},
		textCoords = {x = 453.079, y = -982.600, z = 31.739},
		authorizedJobs = { 'police', 'fib', 'dea', 'policekey', 'adminkey', },
		locked = true
	},

	-- Captain Office
	{
		objName = 'v_ilev_ph_gendoor002',
		objCoords  = {x = 447.238, y = -980.630, z = 30.689},
		textCoords = {x = 447.200, y = -980.010, z = 31.739},
		authorizedJobs = { 'police', 'fib', 'dea', 'policekey', 'adminkey', },
		locked = true
	},

	-- To downstairs (double doors)
	{
		objName = 'v_ilev_ph_gendoor005',
		objCoords  = {x = 443.97, y = -989.033, z = 30.6896},
		textCoords = {x = 444.020, y = -989.445, z = 31.739},
		authorizedJobs = { 'police', 'fib', 'dea', 'policekey', 'adminkey', },
		locked = true,
		distance = 4
	},

	{
		objName = 'v_ilev_ph_gendoor005',
		objCoords  = {x = 445.37, y = -988.705, z = 30.6896},
		textCoords = {x = 445.350, y = -989.445, z = 31.739},
		authorizedJobs = { 'police', 'fib', 'dea', 'policekey', 'adminkey', },
		locked = true,
		distance = 4
	},

	-- 
	-- Mission Row Cells
	--

	-- Main Cells
	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = 463.815, y = -992.686, z = 24.9149},
		textCoords = {x = 463.30, y = -992.686, z = 25.10},
		authorizedJobs = { 'police', 'fib', 'dea', 'policekey', 'adminkey', },
		locked = true
	},

	-- Cell 1
	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = 462.381, y = -993.651, z = 24.914},
		textCoords = {x = 461.806, y = -993.308, z = 25.064},
		authorizedJobs = { 'police', 'fib', 'dea', 'policekey', 'adminkey', },
		locked = true
	},

	-- Cell 2
	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = 462.331, y = -998.152, z = 24.914},
		textCoords = {x = 461.806, y = -998.800, z = 25.064},
		authorizedJobs = { 'police', 'fib', 'dea', 'policekey', 'adminkey', },
		locked = true
	},

	-- Cell 3
	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = 462.704, y = -1001.92, z = 24.9149},
		textCoords = {x = 461.806, y = -1002.450, z = 25.064},
		authorizedJobs = { 'police', 'fib', 'dea', 'policekey', 'adminkey', },
		locked = true
	},

	-- To Back
	{
		objName = 'v_ilev_gtdoor',
		objCoords  = {x = 463.478, y = -1003.538, z = 25.005},
		textCoords = {x = 464.00, y = -1003.50, z = 25.50},
		authorizedJobs = {'police', 'fib', 'dea', 'policekey', },
		locked = true
	},

	--
	-- Mission Row Back
	--
	

	-- Back (double doors)
	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = 467.371, y = -1014.452, z = 26.536},
		textCoords = {x = 468.09, y = -1014.452, z = 27.1362},
		authorizedJobs = { 'police', 'fib', 'dea', 'policekey', 'adminkey', },
		locked = true,
		distance = 4
	},

	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = 469.967, y = -1014.452, z = 26.536},
		textCoords = {x = 469.35, y = -1014.452, z = 27.136},
		authorizedJobs = { 'police', 'fib', 'dea', 'policekey', 'adminkey', },
		locked = true,
		distance = 4
	},

	-- Back Gate
	{
		objName = 'hei_prop_station_gate',
		objCoords  = {x = 488.894, y = -1017.210, z = 27.146},
		textCoords = {x = 488.894, y = -1020.210, z = 30.00},
		authorizedJobs = { 'police', 'fib', 'dea', 'policekey', 'adminkey', },
		locked = true,
		distance = 14,
		size = 2
	},

	-- 
	-- Mission Row Extended
	--

	-- Interogation 1
	{
		objName = 'v_ilev_ph_gendoor006',
		objCoords  = {x = 468.73, y = -992.75, z = 25.10},
		textCoords = {x = 467.96, y = -992.75, z = 25.10},
		authorizedJobs = { 'police', 'fib', 'dea', 'policekey', 'adminkey', },
		locked = false,
		distance = 2.5
	},

	-- Booking
	{
		objName = 'v_ilev_ph_gendoor006',
		objCoords  = {x = 469.47, y = -987.25, z = 25.09},
		textCoords = {x = 470.17, y = -987.25, z = 25.09},
		authorizedJobs = { 'police', 'fib', 'dea', 'policekey', 'adminkey', },
		locked = true
	},

	-- LOCKUP
	{
		objName = 'v_ilev_ph_gendoor006',
		objCoords  = {x = 478.42, y = -987.25, z = 25.09},
		textCoords = {x = 477.72, y = -987.25, z = 25.09},
		authorizedJobs = { 'police', 'fib', 'dea', 'policekey', 'adminkey', },
		locked = true
	},

	-- Interogation ONE WAY ROOM
	{
		objName = 'v_ilev_ph_gendoor006',
		objCoords  = {x = 470.34, y = -993.66, z = 25.10},
		textCoords = {x = 470.30, y = -994.36, z = 25.10},
		authorizedJobs = { 'police', 'fib', 'dea', 'policekey', 'adminkey', },
		locked = true
	},

	

	--
	-- Sandy Shores
	--

	-- Entrance
	{
		objName = 'v_ilev_shrfdoor',
		objCoords  = {x = 1855.105, y = 3683.516, z = 34.266},
		textCoords = {x = 1855.105, y = 3683.516, z = 35.00},
		authorizedJobs = { 'police', 'fib', 'dea', 'policekey', 'adminkey', },
		locked = true
	},
	-- JAIL CELL 1
	{ 
		objName = 'Prop_LD_jail_door',
		objCoords  = {x = 1849.713, y = 3708.264, z = 1.2100},
		textCoords = {x = 1849.713, y = 3708.264, z = 1.2100},
		authorizedJobs = { 'police', 'fib', 'dea', 'policekey', 'adminkey', },
		locked = true
	},
	-- JAIL CELL 2
	{
		objName = 'Prop_LD_jail_door',
		objCoords  = {x = 1847.71, y = 3710.89, z = 1.21},
		textCoords = {x = 1847.71, y = 3710.89, z = 1.21},
		authorizedJobs = { 'police', 'fib', 'dea', 'policekey', 'adminkey', },
		locked = true
	},
	-- JAIL CELL 3
	{
		objName = 'Prop_LD_jail_door',
		objCoords  = {x = 1845.86, y = 3705.238, z = 1.21},
		textCoords = {x = 1845.86, y = 3705.238, z = 1.21},
		authorizedJobs = { 'police', 'fib', 'dea', 'policekey', 'adminkey', },
		locked = true
	},
	-- JAIL CELL 4
	{
		objName = 'Prop_LD_jail_door',
		objCoords  = {x = 1843.79, y = 3707.81, z = 1.227758},
		textCoords = {x = 1843.79, y = 3707.81, z = 1.227758},
		authorizedJobs = { 'police', 'fib', 'dea', 'policekey', 'adminkey', },
		locked = true
	},
	-- SHERIFF OFFICE
	{
		objName = 'V_ILev_CF_OfficeDoor',
		objCoords  = {x = 1857.536, y = 3712.343, z = 1.23317000},
		textCoords = {x = 1857.536, y = 3712.343, z = 1.23317000},
		authorizedJobs = { 'police', 'fib', 'dea', 'policekey', 'adminkey', },
		locked = true
	},

	--
	-- Paleto Bay
	--

	-- Entrance (double doors)
	{
		objName = 'v_ilev_shrf2door',
		objCoords  = {x = -443.14, y = 6015.685, z = 31.716},
		textCoords = {x = -443.14, y = 6015.685, z = 32.00},
		authorizedJobs = { 'police', 'fib', 'dea', 'policekey', 'adminkey', },
		locked = true,
		distance = 2.5
	},

	{
		objName = 'v_ilev_shrf2door',
		objCoords  = {x = -443.951, y = 6016.622, z = 31.716},
		textCoords = {x = -443.951, y = 6016.622, z = 32.00},
		authorizedJobs = { 'police', 'fib', 'dea', 'policekey', 'adminkey', },
		locked = true,
		distance = 2.5
	},

	--
	-- Bolingbroke Penitentiary
	--

	-- Entrance (Two big gates)
	{
		objName = 'prop_gate_prison_01',
		objCoords  = {x = 1844.998, y = 2604.810, z = 44.638},
		textCoords = {x = 1844.998, y = 2608.50, z = 48.00},
		authorizedJobs = { 'police', 'fib', 'dea', 'policekey', 'adminkey', },
		locked = true,
		distance = 2.5
	},

	{
		objName = 'prop_gate_prison_01',
		objCoords  = {x = 1818.542, y = 2604.812, z = 44.611},
		textCoords = {x = 1818.542, y = 2608.40, z = 48.00},
		authorizedJobs = { 'police', 'fib', 'dea', 'policekey', 'adminkey', },
		locked = true,
		distance = 2.5
	},

	--
	-- Central Hospital
	--
	
		{
		objName = 'prop_sc1_06_gate_r',
		objCoords  = {x = 333.1839, y = -561.3282, z = 27.74027},
		textCoords = {x = 332.47, y = -551.53, z = 28.74},
		authorizedJobs = { 'ambulancekey', 'adminkey', },
		locked = true,
		distance = 15
	},

	{
		objName = 'prop_sc1_06_gate_r',
		objCoords  = {x = 331.5234, y = -534.6703, z = 27.74027},
		textCoords = {x = 332.54, y = -544.63, z = 28.74},
		authorizedJobs = { 'ambulancekey', 'adminkey', },
		locked = true,
		distance = 15
	},

	

	-- Door Wide 1
	{
		objName = 'v_ilev_cor_firedoorwide',
		objCoords  = {x = 271.6, y = -1361.07, z = 24.54},
		textCoords = {x = 271.6, y = -1361.07, z = 25.1},
		authorizedJobs = { 'ambulance', 'police' , 'fib', 'dea', 'ambulancekey', 'adminkey', },
		locked = true,
		distance = 2.5
	},

	-- Door Wide 2
	{
		objName = 'v_ilev_cor_firedoorwide',
		objCoords  = {x = 265.5, y = -1362.61, z = 24.54},
		textCoords = {x = 265.5, y = -1362.61, z = 25.1},
		authorizedJobs = { 'ambulance', 'police' , 'fib', 'dea', 'ambulancekey', 'adminkey', },
		locked = true,
		distance = 2.5
	},

	-- Door Wide 3
	{
		objName = 'v_ilev_cor_firedoorwide',
		objCoords  = {x = 242.86, y = -1367.38, z = 24.54},
		textCoords = {x = 242.86, y = -1367.38, z = 25.1},
		authorizedJobs = { 'ambulance', 'police' , 'fib', 'dea', 'ambulancekey', 'adminkey', },
		locked = true,
		distance = 2.5
	},

	-- Door Wide 4
	{
		objName = 'v_ilev_cor_firedoorwide',
		objCoords  = {x = 243.02, y = -1367.4, z = 29.65},
		textCoords = {x = 243.02, y = -1367.4, z = 30.0},
		authorizedJobs = { 'ambulance', 'police' , 'fib', 'dea', 'ambulancekey', 'adminkey', },
		locked = true,
		distance = 2.5
	},

	-- Door Double Up 1
	{
		objName = 'v_ilev_cor_firedoor',
		objCoords  = {x = 251.55, y = -1365.64, z = 39.65},
		textCoords = {x = 251.55, y = -1365.64, z = 40.0},
		authorizedJobs = { 'ambulance', 'police' , 'fib', 'dea', 'ambulancekey', 'adminkey', },
		locked = true,
		distance = 2.5
	},

	-- Door Double Up 2
	{
		objName = 'v_ilev_cor_firedoor',
		objCoords  = {x = 252.4, y = -1366.29, z = 39.65},
		textCoords = {x = 252.4, y = -1366.29, z = 40.0},
		authorizedJobs = { 'ambulance', 'police' , 'fib', 'dea', 'ambulancekey', 'adminkey', },
		locked = true,
		distance = 2.5
	},

	-- Door Double Down 1
	{
		objName = 'v_ilev_cor_firedoor',
		objCoords  = {x = 252.4, y = -1366.29, z = 24.54},
		textCoords = {x = 252.4, y = -1366.29, z = 25.0},
		authorizedJobs = { 'ambulance', 'police' , 'fib', 'dea', 'ambulancekey', 'adminkey', },
		locked = true,
		distance = 2.5
	},

	-- Door Double Down 2
	{
		objName = 'v_ilev_cor_firedoor',
		objCoords  = {x = 251.55, y = -1365.64, z = 24.54},
		textCoords = {x = 251.55, y = -1365.64, z = 25.0},
		authorizedJobs = { 'ambulance', 'police' , 'fib', 'dea', 'ambulancekey', 'adminkey', },
		locked = true,
		distance = 2.5
	},

	-- Door Office
	{
		objName = 'v_ilev_cor_offdoora',
		objCoords  = {x = 236.84, y = -1368.02, z = 39.54},
		textCoords = {x = 236.84, y = -1368.02, z = 40.0},
		authorizedJobs = { 'ambulance', 'ambulancekey','adminkey', },
		locked = true,
		distance = 2.5
	},

	-- Door Dark Office 1
	{
		objName = 'v_ilev_cor_darkdoor',
		objCoords  = {x = 240.38, y = -1362.01, z = 39.54},
		textCoords = {x = 240.38, y = -1362.01, z = 40.0},
		authorizedJobs = { 'ambulance', 'ambulancekey','adminkey', },
		locked = true,
		distance = 2.5
	},

	-- Door Dark Office 2
	{
		objName = 'v_ilev_cor_darkdoor',
		objCoords  = {x = 239.61, y = -1362.86, z = 39.54},
		textCoords = {x = 239.61, y = -1362.86, z = 40.0},
		authorizedJobs = { 'ambulance', 'ambulancekey','adminkey', },
		locked = true,
		distance = 2.5
	},

	-- Door Morgue 1-1
	{
		objName = 'v_ilev_cor_doorglassa',
		objCoords  = {x = 286.05, y = -1345.34, z = 24.54},
		textCoords = {x = 286.05, y = -1345.34, z = 25.00},
		authorizedJobs = { 'ambulance', 'police' , 'fib', 'dea', 'ambulancekey', 'adminkey', },
		locked = true,
		distance = 2.5
	},

	-- Door Morgue 1-2
	{
		objName = 'v_ilev_cor_doorglassb',
		objCoords  = {x = 286.78, y = -1344.53, z = 24.54},
		textCoords = {x = 286.78, y = -1344.53, z = 25.00},
		authorizedJobs = { 'ambulance', 'police' , 'fib', 'dea', 'ambulancekey', 'adminkey', },
		locked = true,
		distance = 2.5
	},

	-- Door Morgue 2-1
	{
		objName = 'v_ilev_cor_doorglassa',
		objCoords  = {x = 283.00, y = -1341.54, z = 24.54},
		textCoords = {x = 283.00, y = -1341.54, z = 25.00},
		authorizedJobs = { 'ambulance', 'police' , 'fib', 'dea', 'ambulancekey', 'adminkey', },
		locked = true,
		distance = 2.5
	},

	-- Door Morgue 2-2
	{
		objName = 'v_ilev_cor_doorglassb',
		objCoords  = {x = 282.44, y = -1342.36, z = 24.54},
		textCoords = {x = 282.44, y = -1342.36, z = 25.00},
		authorizedJobs = { 'ambulance', 'police' , 'fib', 'dea', 'ambulancekey', 'adminkey', },
		locked = true,
		distance = 2.5
	},

	-- Door Morgue 3-1
	{
		objName = 'v_ilev_cor_doorglassa',
		objCoords  = {x = 267.04, y = -1344.52, z = 24.54},
		textCoords = {x = 267.04, y = -1344.52, z = 25.00},
		authorizedJobs = { 'ambulance', 'police' , 'fib', 'dea', 'ambulancekey', 'adminkey', },
		locked = true,
		distance = 2.5
	},

	-- Door Morgue 3-2
	{
		objName = 'v_ilev_cor_doorglassb',
		objCoords  = {x = 266.26, y = -1345.39, z = 24.54},
		textCoords = {x = 266.26, y = -1345.39, z = 25.00},
		authorizedJobs = { 'ambulance', 'police' , 'fib', 'dea', 'ambulancekey', 'adminkey', },
		locked = true,
		distance = 2.5
	},

	-- Door Morgue 4-1
	{
		objName = 'v_ilev_cor_doorglassa',
		objCoords  = {x = 253.78, y = -1359.95, z = 24.54},
		textCoords = {x = 253.78, y = -1359.95, z = 25.00},
		authorizedJobs = { 'ambulance', 'police' , 'fib', 'dea', 'ambulancekey', 'adminkey', },
		locked = true,
		distance = 2.5
	},

	-- Door Morgue 4-2
	{
		objName = 'v_ilev_cor_doorglassb',
		objCoords  = {x = 253.3, y = -1360.87, z = 24.54},
		textCoords = {x = 253.3, y = -1360.87, z = 25.00},
		authorizedJobs = { 'ambulance', 'police' , 'fib', 'dea', 'ambulancekey', 'adminkey', },
		locked = true,
		distance = 2.5
	},
	--
	-- Unicorn
	--
	{
		objName = 'v_ilev_door_orangesolid',
		objCoords  = {x = 113.7693, y = -1296.6870, z = 28.2687},
		textCoords = {x = 113.7693, y = -1296.6870, z = 29.2687},
		authorizedJobs =  { 'unicorn', 'unicornkey','adminkey', },
		locked = true,
		distance = 2.5
	},

	{
		objName = 'prop_magenta_door',
		objCoords  = {x = 95.4944, y = -1285.2659, z = 28.7763},
		textCoords = {x = 95.4944, y = -1285.2659, z = 29.7763},
		authorizedJobs =  { 'unicorn', 'unicornkey','adminkey', },
		locked = true,
		distance = 2.5
	},

	{
	objName = 'v_ilev_roc_door2',
	objCoords  = {x = 99.7319, y = -1293.2723, z = 28.2687},
	textCoords = {x = 99.7319, y = -1293.2723, z = 29.2687},
	authorizedJobs =  { 'unicorn', 'unicornkey','adminkey', },
	locked = true,
	distance = 2.5
},

-- 
	-- Mission Row Extended
	--

	-- Interogation 1
	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = 443.85, y = -1002.33, z = 4.85},
		textCoords = {x = 443.85, y = -1002.33, z = 5.5},
		authorizedJobs = { 'police', 'fib', 'dea', 'policekey', 'adminkey', },
		locked = true
	},

	-- Interogation 2
	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = 440.33, y = -1005.05, z = 4.85},
		textCoords = {x = 440.33, y = -1005.05, z = 5.5},
		authorizedJobs = { 'police', 'fib', 'dea', 'policekey', 'adminkey', },
		locked = true
	},

	-- Interogation 3
	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = 443.63, y = -1007.17, z = 4.85},
		textCoords = {x = 443.63, y = -1007.17, z = 5.5},
		authorizedJobs = { 'police', 'fib', 'dea', 'policekey', 'adminkey', },
		locked = true
	},

	-- Interogation 4
	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = 434.52, y = -1004.80, z = 4.85},
		textCoords = {x = 434.52, y = -1004.80, z = 5.5},
		authorizedJobs = { 'police', 'fib', 'dea', 'policekey', 'adminkey', },
		locked = true
	},

	-- Interogation 5
	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = 437.23, y = -1003.23, z = 4.85},
		textCoords = {x = 437.23, y = -1003.23, z = 5.5},
		authorizedJobs = { 'police', 'fib', 'dea', 'policekey', 'adminkey', },
		locked = true
	},

	-- Evidence
	{
		objName = 'v_ilev_arm_secdoor',
		objCoords  = {x = 461.43, y = -1000.0, z = 4.85},
		textCoords = {x = 461.43, y = -1000.0, z = 5.5},
		authorizedJobs = { 'police', 'fib', 'dea', 'policekey', 'adminkey', },
		locked = true
	},
	
	--
	-- Car Dealer
	--
	{
		objName = 'v_ilev_fib_door1',
		objCoords  = {x = -31.9621, y = -1102.4952, z = 25.4223},
		textCoords = {x = -31.9621, y = -1102.4952, z = 26.4223},
		authorizedJobs =  { 'cardealer','adminkey', },
		locked = true,
		distance = 2.5
	},

	{
		objName = 'v_ilev_fib_door1',
		objCoords  = {x = -34.0121, y = -1108.2611, z = 25.4223},
		textCoords = {x = -34.0121, y = -1108.2611, z = 26.4223},
		authorizedJobs =  { 'cardealer','adminkey', },
		locked = true,
		distance = 2.5
},

--
-- Training
--
	{
		objName = 'v_ilev_cd_entrydoor',
		objCoords  = {x = -1074.8, y = -3477.12, z = 14.14},
		textCoords = {x = -1074.8, y = -3477.12, z = 15.14},
		authorizedJobs =  { 'police', 'fib', 'dea', 'policekey', 'adminkey', },
		locked = true,
		distance = 2.5
	},

	{
		objName = 'v_ilev_cd_entrydoor',
		objCoords  = {x = -1053.09, y = -3489.28, z = 14.14},
		textCoords = {x = -1053.09, y = -3489.28, z = 15.14},
		authorizedJobs =  { 'police', 'fib', 'dea', 'policekey', 'adminkey', },
		locked = true,
		distance = 2.5
	},

	{
		objName = 'Prop_Gate_airport_01',
		objCoords  = {x = -1015.28, y = -3471.71, z = 14.00},
		textCoords = {x = -1012.34, y = -3472.91, z = 16.00},
		authorizedJobs = { 'police', 'fib', 'dea', 'policekey', 'adminkey', },
		locked = true,
		distance = 14,
		size = 2
	},
	{
		objName = 'Prop_Gate_airport_01',
		objCoords  = {x = -1049.15, y = -3452.18, z = 14.00},
		textCoords = {x = -1051.84, y = -3450.69, z = 16.00},
		authorizedJobs = { 'police', 'fib', 'dea', 'policekey', 'adminkey', },
		locked = true,
		distance = 14,
		size = 2
	},

	{
		objName = 'prop_fnclink_09gate1',
		objCoords  = {x = -1039.15, y = -3473.50, z = 14.40},
		textCoords = {x = -1039.15, y = -3473.50, z = 15.40},
		authorizedJobs = { 'police', 'fib', 'dea', 'policekey', 'adminkey', },
		locked = true,
		distance = 2.5,

},

--MICHAEL MANSION
	{     --- GARDEN GATE
		objName = 'prop_bh1_48_gate_1',
		objCoords  = {x = -848.93, y = 178.50, z = 70.02},
		textCoords = {x = -848.93, y = 178.50, z = 70.02},
		authorizedJobs = { 'org2','adminkey', },
		locked = true,
		distance = 2.5,

	},

	{  ---- DRIVEWAY GATE 
		objName = 'prop_lrggate_02_ld',
		objCoords  = {x = -844.05, y = 155.96, z = 66.03},
		textCoords = {x = -843.96, y = 159.03, z = 66.80},
		authorizedJobs = { 'org2', 'org2key','adminkey', },
		locked = true,
		distance = 10,

	},


	{  ---- GARAGE DOOR
		objName = 'prop_ld_garaged_01',
		objCoords  = {x = -815.29, y = 185.97, z = 73.02},
		textCoords = {x = -815.33, y = 185.96, z = 72.46},
		authorizedJobs = { 'org2', 'org2key','adminkey', },
		locked = true,
		distance = 5,

	},

	{  ---- ARMORY DOOR
		objName = 'v_ilev_mm_doordaughter',
		objCoords  = {x = -802.7017, y = 176.1755, z = 76.89033},
		textCoords = {x = -802.7017, y = 176.1755, z = 76.89033},
		authorizedJobs = { 'org2', 'org2key','adminkey', },
		locked = true,
		distance = 2.5,

	},
	
	{  ---- BLACKMARKET DOOR
		objName = 'v_ilev_mm_doorw',
		objCoords  = {x = -809.2809, y = 177.8554, z = 76.89033},
		textCoords = {x = -809.92, y = 177.64, z = 76.74},
		authorizedJobs = { 'org2', 'org2key','adminkey', },
		locked = true,
		distance = 2.5,

	},

--
-- CARTEL
--
	{  ---- FRONT DOOR
		objName = 'prop_lrggate_01c_r',
		objCoords  = {x = -2652.75, y = 1327.77, z = 147.61},
		textCoords = {x = -2652.92, y = 1326.26, z = 147.45},
		authorizedJobs = { 'org2', 'org2key','adminkey', },
		locked = true,
		distance = 4,

	},

	{  ---- DRIVEWAY
		objName = 'apa_prop_ss1_mpint_garage2',
		objCoords  = {x = -2652.44, y = 1307.366, z = 147.679},
		textCoords = {x = -2652.44, y = 1307.366, z = 147.679},
		authorizedJobs = { 'org2', 'org2key','adminkey', },
		locked = true,
		distance = 15,

	},

	{  ---- DRIVEWAY
		objName = 'apa_p_mp_yacht_door_01',
		objCoords  = {x = -2667.602, y = 1326.96, z = 147.5934},
		textCoords = {x = -2667.888, y = 1326.00, z = 147.449},
		authorizedJobs = { 'org2', 'org2key','adminkey', },
		locked = true,
		distance = 2.5,

	},

		{  ---- SECURITY DOOR
		objName = 'xm_Prop_IAA_BASE_Door_01',
		objCoords  = {x = -2666.40, y = 1330.10, z = 147.5934},
		textCoords = {x = -2667.506, y = 1330.391, z = 147.4449},
		authorizedJobs = { 'org2', 'org2key','adminkey', },
		locked = true,
		distance = 2.5,

	},
--
-- MASTERS OF MAYHEM 
--
	{  ---- BACK ROOM
		objName = 'v_ilev_mldoor02',
		objCoords  = {x = 1388.139, y = 3605.707, z = 35.14375},
		textCoords = {x = 1388.78, y = 3605.87, z = 34.98},
		authorizedJobs = { 'org1', 'org1key','adminkey', },
		locked = true,
		distance = 2.5,

	},

	{  ---- DOOR TWO
		objName = 'v_ilev_ss_door04',
		objCoords  = {x = 1395.613, y = 3609.327, z = 35.13078},
		textCoords = {x = 1395.36, y = 3609.97, z = 35.13078},
		authorizedJobs = { 'org1', 'org1key','adminkey', },
		locked = true,
		distance = 2.5,

	},

	{  ---- TOP FLOOR OUTSIDE PORCH
		objName = 'v_ilev_ss_doorext',
		objCoords  = {x = 1388.499, y = 3614.828, z = 39.09187},
		textCoords = {x = 1387.93, y = 3614.43, z = 39.09187},
		authorizedJobs = { 'org1', 'org1key','adminkey', },
		locked = true,
		distance = 2.5,

	},

	{  ---- TOP FLOOR OUTSIDE PORCH 2
		objName = 'v_ilev_ss_doorext',
		objCoords  = {x = 1399.7, y = 3607.767, z = 39.09187},
		textCoords = {x = 1399.46, y = 3608.34, z = 39.09187},
		authorizedJobs = { 'org1', 'org1key','adminkey', },
		locked = true,
		distance = 2.5,

	},

--
--- WARRANT OFFICER
--

	{  ---- Garage Door
		objName = 'prop_id2_11_gdoor',
		objCoords  = {x = 723.116, y = -1088.831, z = 23.23201},
		textCoords = {x = 723.116, y = -1088.831, z = 23.23201},
		authorizedJobs = { 'warrant', 'warrantkey','adminkey', },
		locked = true,
		distance = 10,

	},


--- 
---- LSPD AND SUCH ADDITIONS
---

-- Zancudo Military Base Front Entrance
{
	objName = 'prop_gate_airport_01',
	objCoords  = {x = -1587.23, y = 2805.08, z = 15.82},
	textCoords = {x = -1587.23, y = 2805.08, z = 19.82},
	authorizedJobs = { 'ambulance', 'police' , 'fib', 'dea', 'policekey','adminkey',},
	locked = true,
	distance = 12,
	size = 2
},
{
	objName = 'prop_gate_airport_01',
	objCoords  = {x = -1600.29, y = 2793.74, z = 15.74},
	textCoords = {x = -1600.29, y = 2793.74, z = 19.74},
	authorizedJobs = { 'ambulance', 'police' , 'fib', 'dea', 'policekey','adminkey',},
	locked = true,
	distance = 12,
	size = 2
},
-- Zancudo Military Base Back Entrance
{
	objName = 'prop_gate_airport_01',
	objCoords  = {x = -2296.17, y = 3393.1, z = 30.07},
	textCoords = {x = -2296.17, y = 3393.1, z = 34.07},
	authorizedJobs = { 'ambulance', 'police' , 'fib', 'dea', 'policekey','adminkey',},
	locked = true,
	distance = 12,
	size = 2
},
{
	objName = 'prop_gate_airport_01',
	objCoords  = {x = -2306.13, y = 3379.3, z = 30.2},
	textCoords = {x = -2306.13, y = 3379.3, z = 34.2},
	authorizedJobs = { 'ambulance', 'police' , 'fib', 'dea', 'policekey','adminkey',},
	locked = true,
	distance = 12,
	size = 2
},
-- Paleto Bay Parking Lot Gate
{
	objName = 'prop_gate_airport_01',
	objCoords  = {x = -451.04, y = 6025.31, z = 30.12},
	textCoords = {x = -453.6, y = 6027.87, z = 32.12},
	authorizedJobs = { 'police', 'fib', 'dea', 'policekey', 'adminkey', },
	locked = true,
	distance = 14,
	size = 2
},
--[[ Mission Row PD Parking Lot Gate
{
	objName = 'prop_gate_airport_01',
	objCoords  = {x = 415.85, y = -1025.08, z = 28.15},
	textCoords = {x = 415.85, y = -1021.49, z = 30.15},
	authorizedJobs = { 'police', 'fib', 'dea', 'policekey','adminkey',},
	locked = true,
	distance = 14,
	size = 2
},

-- Sandy Shores Parking Lot Gates
-- PD Front Gate
{
	objName = 'prop_gate_military_01',
	objCoords  = {x = 1871.62, y = 3681.23, z = 32.35},
	textCoords = {x = 1871.62, y = 3681.23, z = 34.35},
	authorizedJobs = { 'ambulance', 'police' , 'fib', 'dea', 'policekey','adminkey',},
	locked = true,
	distance = 14,
	size = 2
},
--]]
-- PD Back Gate
{
	objName = 'prop_gate_military_01',
	objCoords  = {x = 1858.11, y = 3719.22, z = 32.03},
	textCoords = {x = 1858.11, y = 3719.22, z = 34.03},
	authorizedJobs = { 'ambulance', 'police' , 'fib', 'dea', 'policekey','adminkey',},
	locked = true,
	distance = 14,
	size = 2
},
-- FR Back Gate (Exit)
{
	objName = 'prop_gate_military_01',
	objCoords  = {x = 1845.07, y = 3712.2, z = 32.17},
	textCoords = {x = 1845.07, y = 3712.2, z = 34.17},
	authorizedJobs = { 'ambulance', 'police' , 'fib', 'dea', 'policekey','adminkey',},
	locked = true,
	distance = 14,
	size = 2
},
-- FR Front Gate (Entrance)
{
	objName = 'prop_gate_military_01',
	objCoords  = {x = 1804.49, y = 3675.7, z = 33.21},
	textCoords = {x = 1804.49, y = 3675.7, z = 35.21},
	authorizedJobs = { 'ambulance', 'police' , 'fib', 'dea', 'policekey','adminkey',},
	locked = true,
	distance = 14,
	size = 2
},
-- Los Santos | FBI Building
-- Entrance Double Doors
{
	objName = 'v_ilev_fibl_door02',
	objCoords  = {x = 106.37, y = -742.69, z = 46.18},
	textCoords = {x = 106.07, y = -743.76, z = 46.18},
	authorizedJobs = {'fib', 'fibkey','adminkey',},
	locked = true,
	distance = 6
},
{
	objName = 'v_ilev_fibl_door01',
	objCoords  = {x = 105.76, y = -746.64, z = 46.18},
	textCoords = {x = 105.71, y = -745.28, z = 46.18},
	authorizedJobs = {'fib', 'fibkey','adminkey',},
	locked = true,
	distance = 6
},
--fib
	{
		objName = 'v_ilev_fib_door1',
		objCoords  = {x = 127.089, y = -760.248, z = 46.75111},
		textCoords = {x = 127.089, y = -760.248, z = 46.75111},
		authorizedJobs = {'fib', 'fibkey','adminkey',},
		locked = true,
		distance = 2.5,

},
	{
		objName = 'v_ilev_fib_door2',
		objCoords  = {x = 142.4589, y = -770.4548, z = 250.90111},
		textCoords = {x = 142.4589, y = -770.4548, z = 250.90111},
		authorizedJobs = {'fib', 'fibkey','adminkey',},
		locked = true,
		distance = 2.5,
},

	{
		objName = 'v_ilev_fib_doore_l',
		objCoords  = {x = 137.7594, y = -763.9288, z = 44.75291},
		textCoords = {x = 137.7594, y = -763.9288, z = 44.75291},
		authorizedJobs = {'fib', 'fibkey','adminkey',},
		locked = true,
		distance = 2.5,
},
	{
		objName = 'V_ilev_fib_doore_r',
		objCoords  = {x = 139.1689, y = -764.4418, z = 44.75182},
		textCoords = {x = 139.1689, y = -764.4418, z = 44.75182},
		authorizedJobs = {'fib', 'fibkey','adminkey',},
		locked = true,
		distance = 2.5,
},

--dea
	{
		objName = 'Prop_biolab_g_door',
		objCoords  = {x = 3589.531, y = 3671.415, z = 34.97015},
		textCoords = {x = 3589.531, y = 3671.415, z = 34.97015},
		authorizedJobs = {  'dea','adminkey',  },
		locked = true,
		distance = 8,
},
	{
		objName = 'Prop_biolab_g_door',
		objCoords  = {x = 3588.078, y = 3663.185, z = 34.97015},
		textCoords = {x = 3588.078, y = 3663.185, z = 34.97015},
		authorizedJobs = {  'dea','adminkey',  },
		locked = true,
		distance = 8,
},
	{
		objName = 'V_ilev_bl_shutter2',
		objCoords  = {x = 3627.713, y = 3746.716, z = 27.69009},
		textCoords = {x = 3627.713, y = 3746.716, z = 29.69009},
		authorizedJobs = {  'dea','adminkey',  },
		locked = true,
		distance = 5,
},
	{
		objName = 'V_ilev_bl_shutter2',
		objCoords  = {x = 3620.843, y = 3751.527, z = 27.69009},
		textCoords = {x = 3620.843, y = 3751.527, z = 29.69009},
		authorizedJobs = {  'dea','adminkey',  },
		locked = true,
		distance = 5,
},
	{
		objName = 'V_ilev_bl_doorel_l',
		objCoords  = {x = 3539.00, y = 3673.659, z = 27.12146},
		textCoords = {x = 3539.00, y = 3673.659, z = 27.12146},
		authorizedJobs = {  'dea','adminkey',  },
		locked = true,
		distance = 3,
},
	{
		objName = 'V_ilev_bl_doorel_r',
		objCoords  = {x = 3541.56, y = 3673.208, z = 27.12146},
		textCoords = {x = 3541.56, y = 3673.208, z = 27.12146},
		authorizedJobs = {  'dea','adminkey',  },
		locked = true,
		distance = 3,
},

-- NEW MARDUCAS
--GARAGE SIDE DOOR
{
		objName = 'apa_Prop_SS1_MPint_Garage2',
		objCoords  = {x = -1128.18, y = -1693.69, z = 5.63},
		textCoords = {x = -1128.18, y = -1693.69, z = 5.63},
		authorizedJobs = {  'marducas', 'marducaskey','adminkey',  },
		locked = true,
		distance = 20,
}, 

--FRONT DOOR R
{ 
		objName = 'hei_prop_ss1_mpint_door_r',
		objCoords  = {x = -1124.88, y = -1728.76, z = 4.92},
		textCoords = {x = -1124.88, y = -1728.76, z = 4.92},
		authorizedJobs = {  'marducas', 'marducaskey','adminkey',  },
		locked = true,
		distance = 5,
}, 
-- FRONT DOOR L
{
		objName = 'hei_prop_ss1_mpint_door_l',
		objCoords  = {x = -1126.64, y = -1730.01, z = 4.92},
		textCoords = {x = -1126.64, y = -1730.01, z = 4.92},
		authorizedJobs = {  'marducas', 'marducaskey','adminkey',  },
		locked = true,
		distance = 5,
}, 

--SIDE DOOR L
{ 
		objName = 'hei_prop_ss1_mpint_door_l',
		objCoords  = {x = -1153.28, y = -1729.47, z = 4.91},
		textCoords = {x = -1153.28, y = -1729.47, z = 4.91},
		authorizedJobs = {  'marducas', 'marducaskey','adminkey',  },
		locked = true,
		distance = 5,
}, 
-- SIDE DOOR R
{
		objName = 'hei_prop_ss1_mpint_door_r',
		objCoords  = {x = -1152.05, y = -1731.25, z = 4.92},
		textCoords = {x = -1152.05, y = -1731.25, z = 4.92},
		authorizedJobs = {  'marducas', 'marducaskey','adminkey',  },
		locked = true,
		distance = 5,
}, 

--EAST SIDE DOOR L
{ 
		objName = 'hei_prop_ss1_mpint_door_l',
		objCoords  = {x = -1181.05, y = -1737.15, z = 4.90},
		textCoords = {x = -1181.05, y = -1737.15, z = 4.90},
		authorizedJobs = {  'marducas', 'marducaskey','adminkey',  },
		locked = true,
		distance = 5,
}, 
-- EAST SIDE DOOR R
{
		objName = 'hei_prop_ss1_mpint_door_r',
		objCoords  = {x = -1179.29, y = -1735.89, z = 4.89},
		textCoords = {x = -1179.29, y = -1735.89, z = 4.89},
		authorizedJobs = {  'marducas', 'marducaskey','adminkey',  },
		locked = true,
		distance = 5,
}, 
-- EAST GARAGE DOOR
{
		objName = 'apa_Prop_SS1_MPint_Garage2',
		objCoords  = {x = -1189.14, y = -1743.05, z = 5.52},
		textCoords = {x = -1189.14, y = -1743.05, z = 5.52},
		authorizedJobs = {  'marducas', 'marducaskey','adminkey',  },
		locked = true,
		distance = 20,
}, 

-- EAST GARAGE SIDE DOOR
{
		objName = 'prop_biolab_g_door',
		objCoords  = {x = -1215.03, y = -1738.59, z = 5.55},
		textCoords = {x = -1215.03, y = -1738.59, z = 5.55},
		authorizedJobs = {  'marducas', 'marducaskey','adminkey',  },
		locked = true,
		distance = 20,
}, 

--
-- LOST MC
--
-- NEW MAFIA
--
{ -- GARAGE FLOOR 1
		objName = 'prop_biolab_g_door',
		objCoords  = {x = -1343.49, y = -744.63, z = 23.38},
		textCoords = {x = -1343.49, y = -744.63, z = 23.38},
		authorizedJobs = {  'org2', 'org2key','adminkey',  },
		locked = true,
		distance = 25,
}, 


{ -- GARAGE FLOOR 2
		objName = 'prop_gar_door_03',
		objCoords  = {x = -1355.33, y = -754.08, z = 22.45},
		textCoords = {x = -1355.38, y = -754.0663, z = 22.33},
		authorizedJobs = {  'org2', 'org2key','adminkey',  },
		locked = true,
		distance = 25,
}, 

{ -- SLIDING DOOR
		objName = 'imp_Prop_ImpExp_Liftdoor_R',
		objCoords  = {x = -1352.86, y = -755.87, z = 21.34},
		textCoords = {x = -1352.049, y = -754.989, z = 22.34},
		authorizedJobs = {  'org2', 'org2key','adminkey',  },
		locked = true,
		distance = 5,
}, 

{ -- HELI SLIDING DOOR
		objName = 'imp_Prop_ImpExp_Liftdoor_R',
		objCoords  = {x = -1352.66, y = -756.73, z = 32.99},
		textCoords = {x = -1351.871, y = -757.53, z = 34.08},
		authorizedJobs = {  'org2', 'org2key','adminkey',  },
		locked = true,
		distance = 5,
}, 


--
---YAKUZA
---

{ -- MAIN GATE R
		objName = 'yakuza_gate_r',
		objCoords  = {x = -948.1393, y = -1477.893, z = 8.156317},
		textCoords = {x = -948.1393, y = -1477.893, z = 8.156317},
		authorizedJobs = {  'org3','org3key','adminkey',  },
		locked = true,
		distance = 10,
}, 

{ -- MAIN GATE L
		objName = 'yakuza_gate_l',
		objCoords  = {x = -949.505, y = -1474.209, z = 8.156317},
		textCoords = {x = -949.505, y = -1474.209, z = 8.156317},
		authorizedJobs = {  'org3','org3key','adminkey',  },
		locked = true,
		distance = 10,
}, 

{ -- MONEY WASH R
		objName = 'prop_grumandoor_r',
		objCoords  = {x = -898.5968, y = -1448.942, z = 7.798107},
		textCoords = {x = -898.5968, y = -1448.942, z = 7.798107},
		authorizedJobs = {  'org3','org3key','adminkey',  },
		locked = true,
		distance = 5,
}, 

{ -- MONEY WASH L
		objName = 'prop_grumandoor_l',
		objCoords  = {x = -900.4246, y = -1449.613, z = 7.7980107},
		textCoords = {x = -900.4246, y = -1449.613, z = 7.7980107},
		authorizedJobs = {  'org3','org3key','adminkey',  },
		locked = true,
		distance = 5,
}, 

{ -- MEDITATION R
		objName = 'prop_grumandoor_r',
		objCoords  = {x = -894.8269, y = -1464.113, z = 7.798107},
		textCoords = {x = -894.8269, y = -1464.113, z = 7.798107},
		authorizedJobs = {  'org3','org3key','adminkey',  },
		locked = true,
		distance = 5,
}, 

{ -- MEDITATION L
		objName = 'prop_grumandoor_l',
		objCoords  = {x = -892.9956, y = -1463.474, z = 7.798145},
		textCoords = {x = -892.9956, y = -1463.474, z = 7.798145},
		authorizedJobs = {  'org3','org3key','adminkey',  },
		locked = true,
		distance = 5,
}, 

{ -- BOSS ROOM R
		objName = 'prop_sm1_11_doorr',
		objCoords  = {x = -874.1503, y = -1459.374, z = 7.719718},
		textCoords = {x = -874.1503, y = -1459.374, z = 7.719718},
		authorizedJobs = {  'org3','org3key','adminkey',  },
		locked = true,
		distance = 5,
}, 

{ -- BOSS ROOM L
		objName = 'prop_sm1_11_doorl',
		objCoords  = {x = -873.3333, y = -1461.531, z = 7.713996},
		textCoords = {x = -873.3333, y = -1461.531, z = 7.713996},
		authorizedJobs = {  'org3','org3key','adminkey',  },
		locked = true,
		distance = 5,
}, 

--
-- CASINO
--

	{ -- Door 1
		objName = 'v_ilev_cd_entrydoor',
		objCoords  = {x = 1034.25, y = 27.5, z = -39},
		textCoords = {x = 1034.25, y = 27.5, z = -39},
		authorizedJobs = {  'casino', 'casinokey','adminkey',  },
		locked = true,
		distance = 2,
	}, 
	{ -- Door 2
		objName = 'v_ilev_cd_entrydoor',
		objCoords  = {x = 972.0149, y = 38.5791, z = 3.58573200},
		textCoords = {x = 972.0149, y = 38.5791, z = 3.58573200},
		authorizedJobs = {  'casino', 'casinokey','adminkey',  },
		locked = true,
		distance = 2,
	}, 
	{ -- Door 3
		objName = 'v_ilev_cd_entrydoor',
		objCoords  = {x = 979.3969, y = 40.02075, z = 3.58573200},
		textCoords = {x = 979.3969, y = 40.02075, z = 3.58573200},
		authorizedJobs = {  'casino', 'casinokey','adminkey',  },
		locked = true,
		distance = 2,
	},
	{ -- Door 4
		objName = 'v_ilev_cd_entrydoor',
		objCoords  = {x = 971.8871, y = 45.56994, z = 7.65625800},
		textCoords = {x = 971.8871, y = 45.56994, z = 7.65625800},
		authorizedJobs = {  'casino', 'casinokey','adminkey',  },
		locked = true,
		distance = 2,
	}, 
	{ -- Security Door
		objName = 'v_ilev_cd_entrydoor',
		objCoords  = {x = 978.59140000, y = 35.89788000, z = 3.58573200},
		textCoords = {x = 978.59140000, y = 35.89788000, z = 3.58573200},
		authorizedJobs = {  'casino', 'casinokey','adminkey',  },
		locked = true,
		distance = 2,
	}, 
	{ -- Back Room First Door
		objName = 'v_ilev_cd_entrydoor',
		objCoords  = {x = 978.77490000, y = 30.28588000, z = 3.58573200},
		textCoords = {x = 978.77490000, y = 30.28588000, z = 3.58573200},
		authorizedJobs = {  'casino', 'casinokey','adminkey',  },
		locked = true,
		distance = 2,
	}, 
	{ -- Door 7
		objName = 'v_ilev_cd_entrydoor',
		objCoords  = {x = 978.20550000, y = 42.57952000, z = 3.58573200},
		textCoords = {x = 978.20550000, y = 42.57952000, z = 3.58573200},
		authorizedJobs = {  'casino', 'casinokey','adminkey',  },
		locked = true,
		distance = 2,
	}, 
	{ -- Gate 1
		objName = 'hei_v_ilev_bk_gate_molten',
		objCoords  = {x = 981.06990000, y = 41.89270000, z = 3.58560900},
		textCoords = {x = 981.06990000, y = 41.89270000, z = 3.58560900},
		authorizedJobs = {  'casino', 'casinokey','adminkey',  },
		locked = true,
		distance = 2,
	}, 
	{ -- Gate 2
		objName = 'hei_v_ilev_bk_gate_molten',
		objCoords  = {x = 980.88800000, y = 39.57867000, z = 3.58560900},
		textCoords = {x = 980.88800000, y = 39.57867000, z = 3.58560900},
		authorizedJobs = {  'casino', 'casinokey','adminkey',  },
		locked = true,
		distance = 2,
	}, 
--- bank
---
---	
    { -- Door 1
		objName = 'v_ilev_bk_door',
		objCoords  = {x = 237.7704, y = 227.87, z = 106.426},
		textCoords = {x = 237.7704, y = 227.87, z = 106.426},
		authorizedJobs = {  'bankerkey','adminkey',  },
		locked = true,
		distance = 2,
	}, 
	{ -- Door 2
		objName = 'v_ilev_bk_door',
		objCoords  = {x = 266.3624, y = 217.5697, z = 110.4328},
		textCoords = {x = 266.3624, y = 217.56971, z = 110.4328},
		authorizedJobs = {  'bankerkey','adminkey',  },
		locked = true,
		distance = 2,
	}, 
	
	
	---
	---- COURTHOUSE 
	---
	
	{ -- GLASS FRONT LEFT
		objName = 'hei_prop_bh1_08_hdoor',
		objCoords  = {x = 1211.794, y = 3585.347, z = 37.45167},
		textCoords = {x = 1211.794, y = 3585.347, z = 37.45167},
		authorizedJobs = {  'courthouse', 'courthousekey','adminkey',  },
		locked = true,
		distance = 5,
	}, 
	
	{ -- GLASS FRONT RIGHT
		objName = 'hei_prop_bh1_08_hdoor',
		objCoords  = {x = 1213.064, y = 3587.497, z = 37.46204},
		textCoords = {x = 1213.064, y = 3587.497, z = 37.46204},
		authorizedJobs = {  'courthouse', 'courthousekey','adminkey',  },
		locked = true,
		distance = 5,
	}, 
	{ -- Secret Door
		objName = 'v_ilev_cbankcountdoor01',
		objCoords  = {x = 1224.086, y = 3599.331, z = 37.4556},
		textCoords = {x = 1224.086, y = 3599.331, z = 37.4556},
		authorizedJobs = {  'courthouse', 'courthousekey','adminkey',  },
		locked = true,
		distance = 5,
	}, 
	{ -- Office Door
		objName = 'apa_v_ilev_ss_door2',
		objCoords  = {x = 1186.463, y = 3577.96, z = 37.33998},
		textCoords = {x = 1186.463, y = 3577.96, z = 37.33998},
		authorizedJobs = {  'courthouse', 'courthousekey','adminkey',  },
		locked = true,
		distance = 5,
	}, 
	
	{ -- Cell Door
		objName = 'v_ilev_fingate',
		objCoords  = {x = 1175.5356, y = 3576.0051, z = 36.9301},
		textCoords = {x = 1175.5356, y = 3576.0051, z = 36.9301},
		authorizedJobs = {  'courthouse', 'courthousekey','adminkey',  },
		locked = true,
		distance = 2,
	}, 
	
	{ -- Cell Door 2
		objName = 'v_ilev_fingate',
		objCoords  = {x = 1176.1736, y = 3578.7158, z = 36.9366},
		textCoords = {x = 1176.1736, y = 3578.7158, z = 36.9366},
		authorizedJobs = {  'courthouse', 'courthousekey','adminkey',  },
		locked = true,
		distance = 2,
	}, 
	
	{ -- Cell Door 3
		objName = 'v_ilev_fingate',
		objCoords  = {x = 1167.6437, y = 3574.7319, z = 36.9268},
		textCoords = {x = 1167.6437, y = 3574.7319, z = 36.9268},
		authorizedJobs = {  'courthouse', 'courthousekey','adminkey',  },
		locked = true,
		distance = 2,
	}, 
	
	{ -- Cell Door 4
		objName = 'v_ilev_fingate',
		objCoords  = {x = 1168.4250, y = 3578.4197, z = 36.9424},
		textCoords = {x = 1168.4250, y = 3578.4197, z = 36.9424},
		authorizedJobs = {  'courthouse', 'courthousekey','adminkey',  },
		locked = true,
		distance = 2,
	}, 
	
	{ -- Security Door
		objName = 'v_ilev_arm_secdoor',
		objCoords  = {x = 1166.5002, y = 3576.8796, z = 37.1851},
		textCoords = {x = 1166.5002, y = 3576.8796, z = 37.1851},
		authorizedJobs = {  'courthouse', 'courthousekey','adminkey',  },
		locked = true,
		distance = 2,
	}, 
	
	{ -- Garage Gate
		objName = 'prop_sc1_06_gate_r',
		objCoords  = {x = 1159.9706, y = 3570.0, z = 36.0115},
		textCoords = {x = 1159.9706, y = 3570.0, z = 36.0115},
		authorizedJobs = {  'courthouse', 'courthousekey','adminkey',  },
		locked = true,
		distance = 10,
	}, 
	
	{ -- Courtroom Door Right
		objName = 'apa_p_mp_yacht_door',
		objCoords  = {x = 1218.9344, y = 3598.9939, z = 36.8056},
		textCoords = {x = 1218.9344, y = 3598.9939, z = 36.8056},
		authorizedJobs = {  'courthouse', 'courthousekey','adminkey',  },
		locked = true,
		distance = 5,
	}, 
	{ -- Courtroom Door Left
		objName = 'apa_p_mp_yacht_door',
		objCoords  = {x = 1216.6008, y = 3599.1377, z = 37.1008},
		textCoords = {x = 1216.6008, y = 3599.1377, z = 37.1008},
		authorizedJobs = {  'courthouse', 'courthousekey','adminkey',  },
		locked = true,
		distance = 5,
	}, 
	{ --Bank gate
		objName = 'v_ilev_bk_vaultdoor',
		objCoords  = {x = 255.2283, y = 223.976, z = 102.3932},
		textCoords = {x = 255.2283, y = 223.976, z = 102.3932},
		authorizedJobs = {  'police', 'policekey','adminkey',  },
		locked = true,
		distance = 5,
	}, 
	
	
	---
	---
	----           WEED DOOR
	---
	---
	
	{ -- MAIN DOOR
	
		objName = 'v_ilev_cd_secdoor',
		objCoords  = {x = 3187.497, y = 5357.329, z = 23.417},
		textCoords = {x = 3187.497, y = 5357.329, z = 23.417},
		authorizedJobs = {  'weedkey','adminkey',  },
		locked = false,
		distance = 5,
	}, 
	
	{ -- PD VEHICL GARGAGE
	
		objName = 'prop_com_gar_door_01',
		objCoords  = {x = 459.5504, y = -1014.646, z = 29.10957},
		textCoords = {x = 459.5504, y = -1014.646, z = 29.10957},
		authorizedJobs = {  'ambulance','fib','police','adminkey',  },
		locked = true,
		distance = 5,
	}, 
	
	{ -- PD VEHICL GARGAGE
	
		objName = 'prop_com_gar_door_01',
		objCoords  = {x = 459.5504, y = -1019.699, z = 29.08874},
		textCoords = {x = 459.5504, y = -1019.699, z = 29.08874},
		authorizedJobs = {  'ambulance','fib','police','adminkey',  },
		locked = true,
		distance = 5,
	}, 
	
		{ -- Patreon
	
		objName = 'v_ilev_ch_glassdoor',
		objCoords  = {x = -157.1293, y = -306.4341, z = 39.99308},
		textCoords = {x = -157.1293, y = -306.4341, z = 39.99308},
		authorizedJobs = {  'patreonkey','adminkey',  },
		locked = true,
		distance = 5,
	}, 
	
	{ -- Patreon
	
		objName = 'v_ilev_ch_glassdoor',
		objCoords  = {x = -156.439, y = -304.4294, z = 39.99308},
		textCoords = {x = -156.439, y = -304.4294, z = 39.99308},
		authorizedJobs = {  'patreonkey','adminkey',  },
		locked = true,
		distance = 5,
	}, 
	
	-- simmons house 
	
	{ -- simmons house front door
	
		objName = 'apa_p_mp_yacht_door_02',
		objCoords  = {x = 165.300598, y = 877.256226, z = 201.003036},
		textCoords = {x = 165.300598, y = 878.256226, z = 201.003036},
		authorizedJobs = {  'simmonskey','adminkey',  },
		locked = true,
		distance = 5,
	}, 
	{ -- simmons house front door
	
		objName = 'apa_p_mp_yacht_door_02',
		objCoords  = {x = 165.300598, y = 879.256226, z = 201.003036},
		textCoords = {x = 166.300598, y = 879.256226, z = 201.003036},
		authorizedJobs = {  'simmonskey','adminkey',  },
		locked = true,
		distance = 5,
	},
	
       ---central pd 
	   
	{ -- pd gate 
	
		objName = 'p_gate_prison_01_s',
		objCoords  = {x = 420.160339, y = -1020.76715, z = 28.0157566},
		textCoords = {x = 420.160339, y = -1024.76715, z = 30.0157566},
		authorizedJobs = {  'policekey','adminkey','police',  },
		locked = true,
		distance = 10.00,
	},

	{ -- pd side gate  
	
		objName = 'prop_fnclink_03gate5',
		objCoords  = {x = 425.263245, y = -1004.59229, z = 31.3285046},
		textCoords = {x = 425.263245, y = -1004.59229, z = 31.3285046},
		authorizedJobs = {  'policekey','adminkey','police',  },
		locked = true,
		distance = 10.00,
	}, 
	
	{ -- PI Office 
	
		objName = 'v_ilev_janitor_frontdoor',
		objCoords  = {x = -742.89, y = -1042.09, z = 13},
		textCoords = {x = -742.89, y = -1042.09, z = 13},
		authorizedJobs = {  'lawyer','adminkey','lawyerkey',  },
		locked = true,
		distance = 5.0,
	}, 
	
		{ -- PI Office 
	
		objName = 'v_ilev_cf_officedoor',
		objCoords  = {x = -748.1444, y = -1041.377, z = 13.19008},
		textCoords = {x = -748.1444, y = -1041.377, z = 13.19008},
		authorizedJobs = {  'lawyer','adminkey','lawyerkey',  },
		locked = true,
		distance = 5.0,
	}, 
	
	{ -- PI Office 
	
		objName = 'apa_v_ilev_fh_heistdoor1',
		objCoords  = {x = -740.67010, y = -1041.327, z = 13.15057},
		textCoords = {x = -740.67010, y = -1041.327, z = 13.15057},
		authorizedJobs = {  'lawyer','adminkey','lawyerkey',  },
		locked = true,
		distance = 5.0,
	}, 
	---
	---- stroker property 
	---
	
	{ -- front gate 1
		objName = 'prop_gate_tep_01_l',
		objCoords  = {x = 1315.60474, y = 1109.74634, z = 106.665199},
		textCoords = {x = 1315.60474, y = 1109.74634, z = 106.665199},
		authorizedJobs = { 'strokerkey','adminkey',  },
		locked = true,
		distance = 15,
	},
	{ -- front gate r
		objName = 'prop_gate_tep_01_r',
		objCoords  = {x = 1318.70667, y = 1102.54602, z = 106.667236},
		textCoords = {x = 1318.70667, y = 1102.54602, z = 106.667236},
		authorizedJobs = { 'strokerkey','adminkey',  },
		locked = true,
		distance = 15,
	}, 
	{ -- glass front R
		objName = 'v_ilev_ra_door1_r',
		objCoords  = {x = 1390.666, y = 1133.317, z = 114.4808},
		textCoords = {x = 1390.666, y = 1133.317, z = 114.4808},
		authorizedJobs = { 'strokerkey','adminkey',  },
		locked = true,
		distance = 5,
	}, 
	{ -- glass front l
		objName = 'v_ilev_ra_door1_l',
		objCoords  = {x = 1390.666, y = 1131.117, z = 114.4808},
		textCoords = {x = 1390.666, y = 1131.117, z = 114.4808},
		authorizedJobs = { 'strokerkey','adminkey',  },
		locked = true,
		distance = 5,
	}, 
	{ -- bunker entrance
		objName = 'prop_ld_vault_door',
		objCoords  = {x = 1461.41345, y = 1089.74072, z = 114.589523},
		textCoords = {x = 1461.41345, y = 1089.74072, z = 114.589523},
		authorizedJobs = { 'strokerkey','adminkey',  },
		locked = true,
		distance = 5,
	}, 
	{ -- front door r
		objName = 'v_ilev_ra_door4r',
		objCoords  = {x = 1395.92, y = 1140.705, z = 114.7902},
		textCoords = {x = 1395.92, y = 1140.705, z = 114.7902},
		authorizedJobs = { 'strokerkey','adminkey',  },
		locked = true,
		distance = 3,
	}, 
	
	{ -- front door l
		objName = 'v_ilev_ra_door4l',
		objCoords  = {x = 1395.92, y = 1142.904, z = 114.7902},
		textCoords = {x = 1395.92, y = 1142.904, z = 114.7902},
		authorizedJobs = { 'strokerkey','adminkey',  },
		locked = true,
		distance = 3,
	}, 
	
	{ -- side gate l
		objName = 'prop_gate_tep_01_l',
		objCoords  = {x = 1364.93689, y = 1161.87183, z = 114.536491},
		textCoords = {x = 1364.93689, y = 1161.87183, z = 114.536491},
		authorizedJobs = { 'strokerkey','adminkey',  },
		locked = true,
		distance = 15,
	}, 
	{ -- side gate R
		objName = 'prop_gate_tep_01_r',
		objCoords  = {x = 1357.10657, y = 1161.56677, z = 114.534531},
		textCoords = {x = 1357.10657, y = 1161.56677, z = 114.534531},
		authorizedJobs = { 'strokerkey','adminkey',  },
		locked = true,
		distance = 15,
	}, 
	{ -- side glass l
		objName = 'v_ilev_ra_door1_l',
		objCoords  = {x = 1400.489, y = 1128.314, z = 114.4836},
		textCoords = {x = 1400.489, y = 1128.314, z = 114.4836},
		authorizedJobs = { 'strokerkey','adminkey',  },
		locked = true,
		distance = 2,
	}, 
	{ -- side glass R
		objName = 'v_ilev_ra_door1_r',
		objCoords  = {x = 1400.488, y = 1128.314, z = 114.4836},
		textCoords = {x = 1400.488, y = 1128.314, z = 114.4836},
		authorizedJobs = { 'strokerkey','adminkey', },
		locked = true,
		distance = 2,
	}, 
	{ -- barn door
		objName = 'apa_p_mp_door_01',
		objCoords  = {x = 1454.98962, y = 1132.83765, z = 114.502357},
		textCoords = {x = 1454.98962, y = 1132.83765, z = 114.502357},
		authorizedJobs = { 'strokerkey','adminkey', },
		locked = true,
		distance = 2,
	}, 
	---
	---
	---  siquans penthouse garage
	
	{ -- garage door 
		objName = 'hei_prop_com_mp_gar2',
		objCoords  = {x = -33.80561, y = -621.6387, z = 36.06102},
		textCoords = {x = -33.80561, y = -621.6387, z = 36.06102},
		authorizedJobs = { 'penthousekey','adminkey', },
		locked = true,
		distance = 10,
	}, 
	---  emergency garage
	
	{ -- front door r 
		objName = 'xm_prop_lab_door01_star_r',
		objCoords  = {x = 393.798004, y = -1612.84546, z = 29.4582901},
		textCoords = {x = 393.798004, y = -1612.84546, z = 29.4582901},
		authorizedJobs = { 'police','fib','marducas','mechanic','warrant','adminkey', },
		locked = true,
		distance = 3,
	}, 
	{ -- front door L 
		objName = 'xm_prop_lab_door01_star_l',
		objCoords  = {x = 395.045532, y = -1611.18652, z = 29.44944},
		textCoords = {x = 395.045532, y = -1611.18652, z = 29.44944},
		authorizedJobs = { 'police','fib','marducas','mechanic','warrant','adminkey', },
		locked = true,
		distance = 3,
	}, 
	{ -- garage door 
		objName = 'prop_ss1_14_garage_door',
		objCoords  = {x = 385.358215, y = -1623.62634, z = 30.1002388},
		textCoords = {x = 385.358215, y = -1623.62634, z = 30.1002388},
		authorizedJobs = { 'police','fib','marducas','mechanic','warrant','adminkey', },
		locked = true,
		distance = 15,
	},
---  reds house
	
	{ -- front door  
		objName = 'v_ilev_housedoor1',
		objCoords  = {x = -2698.09, y = -80.15, z = 17.47},
		textCoords = {x = -2698.09, y = -80.15, z = 17.47},
		authorizedJobs = {}, 
		locked = true,
		distance = 3,
	}, 
	{ -- back door 
		objName = 'hei_heist_apart2_door',
		objCoords  = {x = -2704.52, y = -89.10, z = 17.54},
		textCoords = {x = -2704.52, y = -89.10, z = 17.54},
		authorizedJobs = { 'redskey','adminkey', },
		locked = true,
		distance = 3,
	}, 
	---  pdm
	
	{ -- stairs l  
		objName = 'apa_prop_ss1_mpint_door_r',
		objCoords  = {x = 807.816284, y = -245.587402, z = 73.9634857},
		textCoords = {x = 807.816284, y = -245.587402, z = 73.9634857},
		authorizedJobs = {'pdmownerkey','pdmkey','adminkey',}, 
		locked = true,
		distance = 3,
	}, 
	{ -- stairs r 
		objName = 'apa_prop_ss1_mpint_door_r',
		objCoords  = {x = 805.920837, y = -244.550735, z = 73.956398},
		textCoords = {x = 805.920837, y = -244.550735, z = 73.956398},
		authorizedJobs = { 'pdmownerkey','pdmkey','adminkey', },
		locked = true,
		distance = 3,
	}, 
	{ -- office 1
		objName = 'apa_p_mp_yacht_door_01',
		objCoords  = {x = 756.255127, y = -243.222763, z = 73.6240463},
		textCoords = {x = 756.255127, y = -243.222763, z = 73.6240463},
		authorizedJobs = { 'pdmownerkey','pdmkey','adminkey', },
		locked = true,
		distance = 3,
	}, 
	{ -- office 2
		objName = 'apa_p_mp_yacht_door_01',
		objCoords  = {x = 751.852844, y = -224.638428, z = 73.6124039},
		textCoords = {x = 751.852844, y = -224.638428, z = 73.6124039},
		authorizedJobs = { 'pdmownerkey','pdmkey','adminkey', },
		locked = true,
		distance = 3,
	}, 
	{ -- office L upstairs
		objName = 'xm_prop_x17_l_door_frame_01',
		objCoords  = {x = 773.180237, y = -246.895081, z = 78.6479492},
		textCoords = {x = 773.180237, y = -246.895081, z = 78.6479492},
		authorizedJobs = { 'pdmownerkey','adminkey', },
		locked = true,
		distance = 3,
	}, 
	{ -- office R upstairs
		objName = 'xm_prop_x17_l_door_frame_01',
		objCoords  = {x = 770.957214, y = -245.549759, z = 78.6575317},
		textCoords = {x = 770.957214, y = -245.549759, z = 78.6575317},
		authorizedJobs = { 'pdmownerkey','adminkey', },
		locked = true,
		distance = 3,
	},
		
		---
		--- marducas
	

	  -- door 1
	
	
	-- door 2
	{
		objName = 'prop_ss1_14_garage_door',
		objCoords  = {x = -1280.65723, y = -3352.1377, z = 14.8663607},
		textCoords = {x = -1280.65723, y = -3352.1377, z = 14.8663607},
		authorizedJobs = { 'marducaskey', 'adminkey', },
		locked = true,
		distance = 15,
	},

	-- door 3
	{
		objName = 'prop_ss1_14_garage_door',
		objCoords  = {x = -1272.12915, y = -3357.073, z = 14.8640938},
		textCoords = {x = -1272.12915, y = -3357.073, z = 14.8640938},
		authorizedJobs = {'marducaskey' , 'adminkey', },
		locked = true,
		distance = 15,
	},

	-- door 4
	{
		objName = 'prop_ss1_14_garage_door',
		objCoords  = {x = -1246.80554, y = -3371.67676, z = 14.8665056},
		textCoords = {x = -1246.80554, y = -3371.67676, z = 14.8665056},
		authorizedJobs = {'marducaskey', 'adminkey', },
		locked = true,
		distance = 15,
	},
	-- door 5
	{
		objName = 'prop_ss1_14_garage_door',
		objCoords  = {x = -1238.2771, y = -3376.61133, z = 14.8680754},
		textCoords = {x = -1238.2771, y = -3376.61133, z = 14.8680754},
		authorizedJobs = { 'marducaskey', 'adminkey', },
		locked = true,
		distance = 15,
	},

	-- door 6
	{
		objName = 'prop_ss1_14_garage_door',
		objCoords  = {x = -1263.76147, y = -3361.99756, z = 14.8656559},
		textCoords = {x = -1263.76147, y = -3361.99756, z = 14.8656559},
		authorizedJobs = { 'marducaskey', 'adminkey', },
		locked = true,
		distance = 15,
	},

	-- door 7
	{
		objName = 'prop_ss1_14_garage_door',
		objCoords  = {x = -1255.233, y = -3366.93213, z = 14.8663435},
		textCoords = {x = -1255.233, y = -3366.93213, z = 14.8663435},
		authorizedJobs = { 'marducaskey','adminkey', },
		locked = true,
		distance = 15,
	},
	--- villa del grapes
	
	{--right front gate
		objName = 'prop_lrggate_01c_r',
		objCoords  = {x = -1801.691, y = 475.4424, z = 133.9669},
		textCoords = {x = -1801.691, y = 475.4424, z = 133.9669},
		authorizedJobs = { 'villakey', 'adminkey', },
		locked = true,
		distance = 6.0
	},
	
	{-- left front gate 
		objName = 'prop_lrggate_01c_l',
		objCoords  = {x = -1799.039, y = 470.6359, z = 133.9505},
		textCoords = {x = -1799.039, y = 470.6359, z = 133.9505},
		authorizedJobs = { 'villakey', 'adminkey', },
		locked = true,
		distance = 6.0
	},

	{-- side gate door
		objName = 'prop_lrggate_03b_ld',
		objCoords  = {x = -1798.231, y = 468.8248, z = 133.7756},
		textCoords = {x = -1798.231, y = 468.8248, z = 133.7756},
		authorizedJobs = { 'villakey', 'adminkey', },
		locked = true,
		distance = 3.0
	},
	--- church of the baphomet
	
	{--right front door
		objName = 'apa_p_mp_yacht_door_02',
		objCoords  = {x = -915.120789, y = 4828.72119, z = 312.679474},
		textCoords = {x = -915.120789, y = 4828.72119, z = 312.679474},
		authorizedJobs = { 'baphometkey', 'adminkey', },
		locked = true,
		distance = 6.0
	},
	
	{-- left front door 
		objName = 'apa_p_mp_yacht_door_02',
		objCoords  = {x = -915.87146, y = 4826.2627, z = 312.679474},
		textCoords = {x = -915.87146, y = 4826.2627, z = 312.679474},
		authorizedJobs = { 'baphometkey', 'adminkey', },
		locked = true,
		distance = 6.0
	},

	{-- cleansing room
		objName = 'apa_prop_apa_bankdoor_new',
		objCoords  = {x = -934.070618, y = 4838.65967, z = 312.618896},
		textCoords = {x = -934.070618, y = 4838.65967, z = 312.618896},
		authorizedJobs = { 'baphometkey', 'adminkey', },
		locked = true,
		distance = 3.0
	},
	--- prison 
	
	{--first gate
		objName = 'prop_gate_prison_01',
		objCoords  = {x = 1844.998, y = 2604.813, z = 44.63978},
		textCoords = {x = 1844.998, y = 2604.813, z = 44.63978},
		authorizedJobs = { 'police','fib', 'adminkey' },
		locked = true,
		distance = 12
	},
	
	{-- left front door 
		objName = 'prop_gate_prison_01',
		objCoords  = {x = 1799.608, y = 2616.975, z = 44.60325},
		textCoords = {x = 1799.608, y = 2616.975, z = 44.60325},
		authorizedJobs = { 'police','fib','adminkey' },
		locked = true,
		distance = 12
	},

	{-- yard gate
		objName = 'prop_fnclink_09gate1',
		objCoords  = {x = 1627.49426, y = 2530.12646, z = 45.9207153},
		textCoords = {x = 1627.49426, y = 2530.12646, z = 45.9207153},
		authorizedJobs = { 'police','fib','adminkey' },
		locked = true,
		distance = 5.0
	},
	--- fib garages
	
	{--door 1
		objName = 'prop_ss1_mpint_garage',
		objCoords  = {x = 181.389603, y = -727.474243, z = 34.8785057},
		textCoords = {x = 181.389603, y = -727.474243, z = 34.8785057},
		authorizedJobs = { 'police','fib', 'adminkey' },
		locked = true,
		distance = 20
	},
	
	{-- door 2
		objName = 'prop_ss1_mpint_garage',
		objCoords  = {x = 184.339417, y = -719.535339, z = 35.0694389},
		textCoords = {x = 184.339417, y = -719.535339, z = 35.0694389},
		authorizedJobs = { 'police','fib','adminkey' },
		locked = true,
		distance = 20
	},

	{-- door 3
		objName = 'prop_ss1_mpint_garage',
		objCoords  = {x = 84.0112228, y = -693.506714, z = 32.7078743},
		textCoords = {x = 84.0112228, y = -693.506714, z = 32.7078743},
		authorizedJobs = { 'police','fib','adminkey' },
		locked = true,
		distance = 20
	},
	--- munsons shit pit
	
	{--door 1
		objName = 'v_ilev_trevtraildr',
		objCoords  = {x = 1972.769, y = 3815.366, z = 33.66326},
		textCoords = {x = 1972.769, y = 3815.366, z = 33.66326},
		authorizedJobs = { 'shitpitkey','adminkey' },
		locked = true,
		distance = 3
	},

	
	
}