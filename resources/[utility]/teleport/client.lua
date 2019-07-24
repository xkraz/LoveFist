local TeleportFromTo = {
	["FIB ELE"] = {
		positionFrom = { ['x'] = 136.33, ['y'] = -761.171, ['z'] = 45.75, nom = "Go up - Elevator"},
		positionTo = { ['x'] = 136.33, ['y'] = -761.171, ['z'] = 242.6916, nom = "Go down - Elevator"},
	},
	["FIB armory"] = {
		positionFrom = { ['x'] = 141.75, ['y'] = -770.0, ['z'] = 241.75, nom = "Go in - Armory"},
		positionTo = { ['x'] = 143.75, ['y'] = -770.00, ['z'] = 241.75, nom = "Go out - Armory"},
	},
	["FIB HELIPAD"] = {
		positionFrom = { ['x'] = 139.00, ['y'] = -762.39, ['z'] = 45.75, nom = "Go to - Helipad"},
		positionTo = { ['x'] = -138.55, ['y'] = -585.41, ['z'] = 211.79, nom = "Go to - FIB Building"},
	},
	["FIB Garage"] = {
		positionFrom = { ['x'] = 125.00, ['y'] = -761.39, ['z'] = 41.75, nom = "Go to - Garage"},
		positionTo = { ['x'] = 165.42, ['y'] = -700.41, ['z'] = 32.69, nom = "Go to - FIB Building"},
	},
	["DEA"] = {
		positionFrom = { ['x'] = 3594.00, ['y'] = 3673.77, ['z'] = 33.57, nom = "Go to - Lab"},
		positionTo = { ['x'] = 3540.72, ['y'] = 3676.00, ['z'] = 27.75, nom = "Go to - Surface"},
	},
	["CASINO"] = {
		positionFrom = { ['x'] = 930.11, ['y'] = 41.6, ['z'] = 81.1, nom = "Enter Casino"},
		positionTo = { ['x'] = 1090.26, ['y'] = 206.08, ['z'] = -49.00, nom = "Leave Casino"},
	},
	["SANDYSHORESPD"] = {
		positionFrom = { ['x'] = 1851.04, ['y'] = 3683.22, ['z'] = 34.27, nom = "Offices & Jail"},
		positionTo = { ['x'] = 1854.37, ['y'] = 3716.53, ['z'] = 1.08, nom = "Back to Lobby"},
	},
	["YAKUZAARMORY"] = {
		positionFrom = { ['x'] = -888.9, ['y'] = -1439.3, ['z'] = 7.53, nom = "Enter Armory"},
		positionTo = { ['x'] = -893.76, ['y'] = -1441.36, ['z'] = 7.53, nom = "Exit Armory"},
	},
	["ADMINAPPSTPUP"] = {
		positionFrom = { ['x'] = -1425.65, ['y'] = -1004.45, ['z'] = 4.93, nom = "Go Upstairs"},
		positionTo = { ['x'] = -1399.39, ['y'] = -986.16, ['z'] = 19.38, nom = "Go Downstairs"},
	},
	["ADMINAPT1"] = {
		positionFrom = { ['x'] = -1393.38, ['y'] = -995.68, ['z'] = 19.38, nom = "Red's Apartment"},
		positionTo = { ['x'] = -1396.3, ['y'] = -1000.68, ['z'] = 34.7, nom = "Exit Apartment"},
	},
	["ADMINAPT3"] = {
		positionFrom = { ['x'] = -1406.09, ['y'] = -977.45, ['z'] = 19.38, nom = "Admin Apt 3"},
		positionTo = { ['x'] = -1418.22, ['y'] = -966.75, ['z'] = 34.7, nom = "Exit Apartment"},
	},
	["CHURCH"] = {
		positionFrom = { ['x'] = -320.62, ['y'] = 2818.95, ['z'] = 59.45, nom = "Enter Church"},
		positionTo = { ['x'] = -308.71, ['y'] = 2811.37, ['z'] = -185.26, nom = "Exit Church"},
	},
	["PRIVATEEYE"] = {
		positionFrom = { ['x'] = -524.46, ['y'] = -711.15, ['z'] = 33.83, nom = "Enter LF Investigations"},
		positionTo = { ['x'] = 1173.74, ['y'] = -3196.6, ['z'] = -39.01, nom = "Exit to City"},
	},
	["exit aprt glitch"] = {
		positionFrom = { ['x'] = 155.08, ['y'] = -1007.96, ['z'] = -98.33, nom = "EXIT APRT GLITCH"},
		positionTo = { ['x'] = 310.43, ['y'] = -278.54, ['z'] = 59.53	, nom = ""},
	},
	["stroker bunker"] = {
		positionFrom = { ['x'] = 1461.11, ['y'] = 1086.46, ['z'] = 114.33, nom = "Enter bunker"},
		positionTo = { ['x'] = 1477.24, ['y'] = 1060.82, ['z'] = 27.71, nom = "Exit bunker"},
	},
	["mitchell & dawns"] = {
		positionFrom = { ['x'] = -1836.14, ['y'] = 447.60, ['z'] = 126.51, nom = "Enter house"},
		positionTo = { ['x'] = -724.49, ['y'] = 200.73, ['z'] = 124.82, nom = "Exit house"},
	},
	["sanctuary"] = {
		positionFrom = { ['x'] = -933.04, ['y'] = 4839.83, ['z'] = 312.51, nom = "BE CLEANSED"},
		positionTo = { ['x'] = -919.85, ['y'] = 4826.98, ['z'] = 294.85, nom = "GO FORTH"},
	},
	["mash pool "] = {
		positionFrom = { ['x'] = -151.54, ['y'] = 910.27, ['z'] = 159.81, nom = "GO TO POOL"},
		positionTo = { ['x'] = -132.01, ['y'] = 868.22, ['z'] = 232.69, nom = "GO DRY OFF"},
	},
	



}

Drawing = setmetatable({}, Drawing)
Drawing.__index = Drawing


function Drawing.draw3DText(x,y,z,textInput,fontId,scaleX,scaleY,r, g, b, a)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

    local scale = (1/dist)*20
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov

    SetTextScale(scaleX*scale, scaleY*scale)
    SetTextFont(fontId)
    SetTextProportional(1)
    SetTextColour(r, g, b, a)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(textInput)
    SetDrawOrigin(x,y,z+2, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

function Drawing.drawMissionText(m_text, showtime)
    ClearPrints()
    SetTextEntry_2("STRING")
    AddTextComponentString(m_text)
    DrawSubtitleTimed(showtime, 1)
end

function msginf(msg, duree)
    duree = duree or 500
    ClearPrints()
    SetTextEntry_2("STRING")
    AddTextComponentString(msg)
    DrawSubtitleTimed(duree, 1)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(2)
		local pos = GetEntityCoords(GetPlayerPed(-1), true)

		for k, j in pairs(TeleportFromTo) do

			--msginf(k .. " " .. tostring(j.positionFrom.x), 15000)
			if(Vdist(pos.x, pos.y, pos.z, j.positionFrom.x, j.positionFrom.y, j.positionFrom.z) < 150.0)then
				DrawMarker(1, j.positionFrom.x, j.positionFrom.y, j.positionFrom.z - 1, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, .801, 255, 255, 255,255, 0, 0, 0,0)
				if(Vdist(pos.x, pos.y, pos.z, j.positionFrom.x, j.positionFrom.y, j.positionFrom.z) < 5.0)then
					Drawing.draw3DText(j.positionFrom.x, j.positionFrom.y, j.positionFrom.z - 1.100, j.positionFrom.nom, 1, 0.2, 0.1, 255, 255, 255, 215)
					if(Vdist(pos.x, pos.y, pos.z, j.positionFrom.x, j.positionFrom.y, j.positionFrom.z) < 1.0)then
						ClearPrints()
						SetTextEntry_2("STRING")
						AddTextComponentString("Press ~r~E~w~ to ".. j.positionFrom.nom)
						DrawSubtitleTimed(2000, 1)
						if IsControlJustPressed(1, 38) then
							Citizen.Wait(20)
							SetEntityCoords(GetPlayerPed(-1), j.positionTo.x, j.positionTo.y, j.positionTo.z - 1)
						end
					end
				end
			end

			if(Vdist(pos.x, pos.y, pos.z, j.positionTo.x, j.positionTo.y, j.positionTo.z) < 150.0)then
				DrawMarker(1, j.positionTo.x, j.positionTo.y, j.positionTo.z - 1, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, .801, 255, 255, 255,255, 0, 0, 0,0)
				if(Vdist(pos.x, pos.y, pos.z, j.positionTo.x, j.positionTo.y, j.positionTo.z) < 5.0)then
					Drawing.draw3DText(j.positionTo.x, j.positionTo.y, j.positionTo.z - 1.100, j.positionTo.nom, 1, 0.2, 0.1, 255, 255, 255, 215)
					if(Vdist(pos.x, pos.y, pos.z, j.positionTo.x, j.positionTo.y, j.positionTo.z) < 1.0)then
						ClearPrints()
						SetTextEntry_2("STRING")
						AddTextComponentString("Press ~r~E~w~ to ".. j.positionTo.nom)
						DrawSubtitleTimed(2000, 1)
						if IsControlJustPressed(1, 38) then
							Citizen.Wait(20)
							SetEntityCoords(GetPlayerPed(-1), j.positionFrom.x, j.positionFrom.y, j.positionFrom.z - 1)
						end
					end
				end
			end
		end
	end
end)
