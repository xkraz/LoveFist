local isPlayerSafe = false
local size
RegisterNetEvent("esx_inventoryhud:openPropertyInventory")
AddEventHandler("esx_inventoryhud:openPropertyInventory", function(data, playerSafe)
    if playerSafe then isPlayerSafe = playerSafe; else isPlayerSafe = false; end
    setPropertyInventoryData(data)
    openPropertyInventory()
    end
)

function refreshPropertyInventory()
    if isPlayerSafe then
        ESX.TriggerServerCallback('MF_PlayerSafes:GetSafeInventory', function(inventory)
            setPropertyInventoryData(inventory);
        end,isPlayerSafe.safeid)
    else
        ESX.TriggerServerCallback("esx_property:getPropertyInventory",function(inventory)
            setPropertyInventoryData(inventory)
        end,ESX.GetPlayerData().identifier)
    end
end

function setPropertyInventoryData(data)
    items = {}

    local blackMoney = data.blackMoney
    local propertyItems = data.items
    local propertyWeapons = data.weapons
    local safeAmt = 0
    if blackMoney == nil or propertyItems == nil or propertyWeapons == nil then return end

    if blackMoney > 0 then
        accountData = {
            label = _U("black_money"),
            count = blackMoney,
            type = "item_account",
            name = "black_money",
            usable = false,
            rare = false,
            limit = -1,
            canRemove = false
        }
        table.insert(items, accountData)
        safeAmt = blackMoney / 1000
    end

    for i = 1, #propertyItems, 1 do
        local item = propertyItems[i]

        if item.count > 0 then
            item.type = "item_standard"
            item.usable = false
            item.rare = false
            item.limit = -1
            item.canRemove = false

            table.insert(items, item)
            safeAmt = safeAmt + item.count
        end
    end

    for i = 1, #propertyWeapons, 1 do
        local weapon = propertyWeapons[i]

        if propertyWeapons[i].name ~= "WEAPON_UNARMED" then
            table.insert(
                items,
                {
                    label = ESX.GetWeaponLabel(weapon.name),
                    count = weapon.ammo,
                    limit = -1,
                    type = "item_weapon",
                    name = weapon.name,
                    usable = false,
                    rare = false,
                    canRemove = false
                }
            )
            safeAmt = safeAmt + 1
        end
    end

    if data.size ~= nil then
      local _label = "SMALL"
      if data.size == 500 then _label = "LARGE" end

      SendNUIMessage(
          {
              action = "setInfoText",
              text = "<h3>Player Safe</h3><br><strong>Size:</strong>" .. _label .. "<br><strong>Capacity:</strong> " .. math.floor(safeAmt) .. "/".. data.size
          }
      )
    end

    SendNUIMessage(
        {
            action = "setSecondInventoryItems",
            itemList = items
        }
    )
end

function openPropertyInventory()
    loadPlayerInventory()
    isInInventory = true

    SendNUIMessage(
        {
            action = "display",
            type = "safe"
        }
    )

    SetNuiFocus(true, true)
end

RegisterNUICallback(
    "PutIntoProperty",
    function(data, cb)
        if IsPedSittingInAnyVehicle(playerPed) then
            return
        end

        if type(data.number) == "number" and math.floor(data.number) == data.number then
            local count = tonumber(data.number)
            local isWeapon = false
            if data.item.type == "item_weapon" then
                isWeapon = true
                count = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data.item.name))
            end

            if isPlayerSafe then
                local _size = 200
                if isPlayerSafe.size == 'small' then
                  _size = 400
                elseif isPlayerSafe.size == 'large' then
                  _size = 1000
                end
                TriggerServerEvent("MF_PlayerSafes:PutItem", ESX.GetPlayerData().identifier, data.item.type, data.item.name, count, isPlayerSafe.safeid, isWeapon, _size)
            else
                TriggerServerEvent("esx_property:putItem", ESX.GetPlayerData().identifier, data.item.type, data.item.name, count)
            end
        end

        Wait(150)
        refreshPropertyInventory()
        Wait(150)
        loadPlayerInventory()

        cb("ok")
    end
)

RegisterNUICallback(
    "TakeFromProperty",
    function(data, cb)
        if IsPedSittingInAnyVehicle(playerPed) then
            return
        end

        if type(data.number) == "number" and math.floor(data.number) == data.number then
            if isPlayerSafe then
                TriggerServerEvent("MF_PlayerSafes:GetItem", ESX.GetPlayerData().identifier, data.item.type, data.item.name, tonumber(data.number), isPlayerSafe.safeid)
            else
                TriggerServerEvent("esx_property:getItem", ESX.GetPlayerData().identifier, data.item.type, data.item.name, tonumber(data.number))
            end
        end

        Wait(150)
        refreshPropertyInventory()
        Wait(150)
        loadPlayerInventory()

        cb("ok")
    end
)
