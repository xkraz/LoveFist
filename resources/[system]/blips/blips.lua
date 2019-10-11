
	local blips = {
		-- The Comedy Club
	 	{title="Comedy Club", colour=24, id=133, x=-435.01, y=274.07, z=89.89},
		-- The Dojo
		{title="Dojo", colour=27, id=557, x=301.44, y=202.71, z=104.38},


		}

Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.9)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)


