-- Made by Kylie version 0.1
RegisterCommand('livery', function(source, args, rawCommand)
	local Veh = GetVehiclePedIsIn(GetPlayerPed(-1))
	local livery = tonumber(args[1])

		SetVehicleLivery(Veh, livery)
  			TriggerEvent("pNotify:SendNotification", {
            text = "Vehicle Livery "..livery.." loaded!",
            type = "error",
            queue = "lmao",
            timeout = 5000,
            layout = "CenterRight"
        	})
end)

RegisterCommand('extra', function(source, args)
    local Veh = GetVehiclePedIsUsing(GetPlayerPed(-1))
    local args1 = args[1]
    local args2 = args[2]

    --SetVehicleAutoRepairDisabled(Veh, true)

    if ((args1=="all")and(args2=="true")) then
        for i=0,30 do
            if (DoesExtraExist(Veh, i)==1) then
                SetVehicleExtra(Veh, i, false)
            end
        end
    elseif ((args1=="all")and(args2=="false")) then
        for i=0,30 do
            if (DoesExtraExist(Veh, i)==1) then
                SetVehicleExtra(Veh, i, true)
            end
        end
    else
        local extra = tonumber(args1)
        if (DoesExtraExist(Veh, extra)==1) then
            if (args2=='true') then
                SetVehicleExtra(Veh, extra, false)
            elseif (args2=='false') then
                SetVehicleExtra(Veh, extra, true)
            end
        end
    end
end, false)



