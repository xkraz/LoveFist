local xnmark = xnmark or {}
local distance = 50.5999

xnmark.locations = {
	["Nightclub"] = {
		["markin"] = {-22.12, 217.35, 106.58},
		["markout"] = {-1643.04, -2989.81, -76.89},
		["locin"] = {-1638.15, -2990.05, -77.46, 263.61},
		["locout"] = {-20.39, 212.48, 106.52, 249.70},
	},
}

function TeleportIntoInterior(locationdata, ent)
	local x,y,z,h = table.unpack(locationdata)
	DoScreenFadeOut(1000)
	while IsScreenFadingOut() do Citizen.Wait(0) end
	NetworkFadeOutEntity(GetPlayerPed(-1), true, false)
	Wait(1000)
	SetEntityCoords(GetPlayerPed(-1), x, y, z)
	SetEntityHeading(GetPlayerPed(-1), h)
	NetworkFadeInEntity(GetPlayerPed(-1), 0)
	Wait(1000)
	FreezeEntityPosition(PlayerPedId(), false)
	SetGameplayCamRelativeHeading(0.0)
	DoScreenFadeIn(1000)
	while IsScreenFadingIn() do Citizen.Wait(0)	end
end

function TeleportIntoInteriorVehicle(locationdata, ent)
	local x,y,z,h = table.unpack(locationdata)
	DoScreenFadeOut(1000)
	while IsScreenFadingOut() do Citizen.Wait(0) end
	NetworkFadeOutEntity(GetPlayerPed(-1), true, false)
	Wait(1000)
	SetEntityCoords(GetVehiclePedIsIn(PlayerPedId(), false), x, y, z)
	SetEntityHeading(GetVehiclePedIsIn(PlayerPedId(), false), h)
	NetworkFadeInEntity(GetPlayerPed(-1), 0)
	Wait(1000)
	FreezeEntityPosition(GetVehiclePedIsIn(PlayerPedId(), false), false)
	SetGameplayCamRelativeHeading(0.0)
	DoScreenFadeIn(1000)
	while IsScreenFadingIn() do Citizen.Wait(0)	end
end


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if not IsEntityDead(PlayerPedId(-1)) then
			for k,v in pairs(xnmark.locations) do
			
				local ix,iy,iz = table.unpack(v["markin"])
				local ox,oy,oz = table.unpack(v["markout"])
			
				if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), ix, iy, iz, true) < 50.5999 then -- Outside Marker
					DrawMarker(2, ix,iy,iz, 0.0, 0.0, 0.0, 180.0, 0.0, 0.0, 1.75, 1.75, 1.75, 255, 255, 0, 100, false, true, 2, false, false, false, false)
					if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), ix, iy, iz, true) < 1.0 then
						if k == "Nightclub" then
							if IsPedInVehicle(PlayerPedId(), GetVehiclePedIsIn(PlayerPedId(), false), false) then
								FreezeEntityPosition(GetVehiclePedIsIn(PlayerPedId(), false), true)
								TeleportIntoInteriorVehicle(v["locin"], false)
							else
								FreezeEntityPosition(PlayerPedId(), true)
								TeleportIntoInterior(v["locin"], false)
							end
						else		
							FreezeEntityPosition(PlayerPedId(), true)
							TeleportIntoInterior(v["locin"], false)
						end
					end
				end
				
				if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), ox, oy, oz, true) < 50.5999 then -- Inside Marker
					DrawMarker(2, ox, oy, oz, 0.0, 0.0, 0.0, 180.0, 0.0, 0.0, 1.75, 1.75, 1.75, 255, 255, 0, 100, false, true, 2, false, false, false, false)
					if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), ox, oy, oz, true) < 1.0 then
						if k == "Nightclub" then
							if IsPedInVehicle(PlayerPedId(), GetVehiclePedIsIn(PlayerPedId(), false), false) then
								FreezeEntityPosition(GetVehiclePedIsIn(PlayerPedId(), false), true)
								TeleportIntoInteriorVehicle(v["locout"], false)
							else
								FreezeEntityPosition(PlayerPedId(), true)
								TeleportIntoInterior(v["locout"], false)
							end
						else
							FreezeEntityPosition(PlayerPedId(), true)
							TeleportIntoInterior(v["locout"], false)
						end
					end
				end
				
			end
		end
	end
end)