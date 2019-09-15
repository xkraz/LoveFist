ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
  local servername = GetConvar('sv_hostname', 'NULL')
--Send the message to your discord server
function sendToDiscord (name,message,color)
  local DiscordWebHook = Config.webhook

  -- Modify here your discordWebHook username = name, content = message,embeds = embeds

local embeds = {
    {
        ["title"]=message,
        ["type"]="rich",
        ["color"] =color,
    --    ["footer"]=  {
    --        ["text"]= "ESX-discord_bot_alert",
    --   },
    }
}

  if message == nil or message == '' then return FALSE end
  PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end


-- Send the first notification
sendToDiscord(_U('server', servername),_U('server_start'),Config.green)

RegisterNetEvent('disc_PlayerSafes:SafeSpawned')
AddEventHandler('disc_PlayerSafes:SafeSpawned', function(v, first)
 	 local xPlayer = ESX.GetPlayerFromId(source)
   if first then
     sendToDiscord(_U('SafeSpawned'),xPlayer.name.." has spawned their first safe at locatation (" .. json.encode(v.location) .. ") with id: " .. v.safeid .. " owned by: " .. v.owner, Config.yellow)
   else
 	   sendToDiscord(_U('SafeSpawned'),xPlayer.name.." has spawned a purchased safe at locatation (" .. json.encode(v.location) .. ") with id: " .. v.safeid .. " owned by: " .. v.owner, Config.orange)
   end
end)


RegisterNetEvent('disc_PlayerSafes:PickupSafe')
AddEventHandler('disc_PlayerSafes:PickupSafe', function(source,v)
 	 local xPlayer = ESX.GetPlayerFromId(source)
   sendToDiscord(_U('PickupSafe'),xPlayer.name.." has picked up a safe at locatation (" .. json.encode(v.location) .. ") with id: " .. v.safeid .. " owned by: " .. v.owner, Config.red)
end)


RegisterNetEvent('disc_PlayerSafes:PutItem')
AddEventHandler('disc_PlayerSafes:PutItem', function(source, identifier, name, count, id)
 	 local xPlayer = ESX.GetPlayerFromId(source)
   sendToDiscord(_U('PutItem'),xPlayer.name.." has put item: " .. name .. "(" .. count .. " ) in safe id: " .. id .. " owned by: " .. identifier, Config.green)
end)

RegisterNetEvent('disc_PlayerSafes:GetItem')
AddEventHandler('disc_PlayerSafes:GetItem', function(source, identifier, name, count, id)
  TriggerEvent('dbug',source .. ' GetItem ')
 	 local xPlayer = ESX.GetPlayerFromId(source)
   sendToDiscord(_U('GetItem'),xPlayer.name.." has taken out item: " .. name .. "(" .. count .. " ) in safe id: " .. id .. " owned by: " .. identifier, Config.blue)
end)


function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

function getIdentity(source)
    local identifier = GetPlayerIdentifiers(source)[1]
    --local result = MySQL.Sync.fetchAll("SELECT * FROM characters WHERE identifier = @identifier", {
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {
        ['@identifier'] = identifier
    })
  if result[1] ~= nil then
    local identity = result[1]

    return {
      firstname   = identity['firstname'],
      lastname  = identity['lastname'],
      dateofbirth = identity['dateofbirth'],
      sex   = identity['sex'],
      height    = identity['height']
    }
  else
    return {
      firstname   = '',
      lastname  = '',
      dateofbirth = '',
      sex   = '',
      height    = ''
    }
    end
end
