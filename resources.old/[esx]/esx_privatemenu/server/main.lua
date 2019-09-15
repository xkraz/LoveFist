characters = {}
ESX	= nil
owners = {}

AddEventHandler('esx:getSharedObject', function(cb)
	cb(ESX)
end)

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function getSharedObject()
		return ESX
end

function getIdentity(source, callback)
	local identifier = GetPlayerIdentifiers(source)[1]
	MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = @identifier",
	{
		['@identifier'] = identifier
	},
	function(result)
		if result[1] ~= nil then
			local data = {
				identifier	= identifier,
				firstname	= result[1]['firstname'],
				lastname	= result[1]['lastname'],
				dateofbirth	= result[1]['dateofbirth'],
				sex			= result[1]['sex'],
				height		= result[1]['height'],
				phonenumber = result[1]['phone_number']
			}
			
			callback(data)
		else	
			local data = {
				identifier 	= '',
				firstname 	= '',
				lastname 	= '',
				dateofbirth = '',
				sex 		= '',
				height 		= '',
				phonenumber = ''
			}
			
			callback(data)
		end
	end)
end

function getCharacters(source, callback)
	local identifier = GetPlayerIdentifiers(source)[1]
	MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = @identifier",
	{
		['@identifier'] = identifier
	},
	function(result)
		if result[1] then
			local data = {
				identifier    = result[1]['identifier'],
				firstname    = result[1]['firstname'],
				lastname    = result[1]['lastname'],
				dateofbirth  = result[1]['dateofbirth'],
				sex      = result[1]['sex'],
				height     = result[1]['height']
			}

			callback(data)
		else
			local data = {
				identifier    = '',
				firstname    = '',
				lastname    = '',
				dateofbirth  = '',
				sex      = '',
				height      = ''
			}

			callback(data)
		end
	end)
end

function getLicenses(steamid, callback)
	local src = source
	local srcIdentifier = GetPlayerIdentifiers(src)[1]
	local data = MySQL.Sync.fetchAll("SELECT `type`, `owner` FROM user_licenses",{})
	if data ~= nil then
		for _,v in pairs(data) do
			local type = string.lower(v.type)
			owners[type] = v.owner
		end

		for type, plyIdentifier in pairs(owners) do
			if(plyIdentifier == srcIdentifier)then
				local _type = type
				TriggerClientEvent("esx_privatemenu:newLicense", src, _type, srcIdentifier)
			end
		end
	end
end

function getChars(steamid, callback)
	MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = @identifier",
	{
		['@identifier'] = steamid
	},
	function(result)
		if result[1] then
			local data = {
				identifier    = result[1]['identifier'],
				firstname    = result[1]['firstname'],
				lastname    = result[1]['lastname'],
				dateofbirth  = result[1]['dateofbirth'],
				sex      = result[1]['sex'],
				height      = result[1]['height']
			}

			callback(data)
		else
			local data = {
				identifier    = '',
				firstname     = '',
				lastname    = '',
				dateofbirth  = '',
				sex     = '',
				height      = ''
			}

			callback(data)
		end
	end)
end

function getID(steamid, callback)
	MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = @identifier",
	{
		['@identifier'] = steamid
	},
	function(result)
		if result[1] ~= nil then
			local data = {
				identifier	= identifier,
				firstname	= result[1]['firstname'],
				lastname	= result[1]['lastname'],
				dateofbirth	= result[1]['dateofbirth'],
				sex			= result[1]['sex'],
				height		= result[1]['height'],
				phonenumber = result[1]['phone_number']
			}
			
			callback(data)
		else	
			local data = {
				identifier 	= '',
				firstname 	= '',
				lastname 	= '',
				dateofbirth = '',
				sex 		= '',
				height 		= '',
				phonenumber = ''
			}
			
			callback(data)
		end
	end)
end

function updateIdentity(identifier, data, callback)
	MySQL.Async.execute('UPDATE `users` SET `firstname` = @firstname, `lastname` = @lastname, `dateofbirth` = @dateofbirth, `sex` = @sex, `height` = @height WHERE identifier = @identifier', {
		['@identifier']		= identifier,
		['@firstname']		= data.firstname,
		['@lastname']		= data.lastname,
		['@dateofbirth']	= data.dateofbirth,
		['@sex']			= data.sex,
		['@height']			= data.height
	}, function(rowsChanged)
		if callback then
			callback(true)
		end
	end)
end

function deleteIdentity(identifier, data, callback)
	MySQL.Async.execute('UPDATE `users` SET `firstname` = @firstname, `lastname` = @lastname, `dateofbirth` = @dateofbirth, `sex` = @sex, `height` = @height WHERE identifier = @identifier', {
		['@identifier']		= identifier,
		['@firstname']		= '',
		['@lastname']		= '',
		['@dateofbirth']	= '',
		['@sex']			= '',
		['@height']			= ''
	}, function(rowsChanged)
		if callback then
			callback(true)
		end
	end)
end

RegisterServerEvent('esx_privatemenu:id')
AddEventHandler('esx_privatemenu:id', function(myIdentifiers)
	getID(myIdentifiers.steamidentifier, function(data)
		if data ~= nil then
			TriggerClientEvent("esx_privatemenu:sendProximityMessageID", -1, myIdentifiers.playerid, data.firstname .. " " .. data.lastname)
		end
	end)
end)

RegisterNetEvent('esx_privatemenu:phone')
AddEventHandler('esx_privatemenu:phone', function(myIdentifiers)
	getID(myIdentifiers.steamidentifier, function(data)
		if data ~= nil then
			local name = data.firstname .. " " .. data.lastname
			TriggerClientEvent("esx_privatemenu:sendProximityMessagePhone", -1, myIdentifiers.playerid, name, data.phonenumber)
		end
	end)
end)

function getPlayerID(source)
	local identifiers = GetPlayerIdentifiers(source)
	local player = getIdentifiant(identifiers)
	return player
end

function getIdentifiant(id)
	for _, v in ipairs(id) do
		return v
	end
end

RegisterServerEvent('esx_privatemenu:updateInformation')
AddEventHandler('esx_privatemenu:updateInformation', function()
	local src = source
	local myID = {
		steamid = GetPlayerIdentifiers(src)[1],
		playerid = src
	}

	TriggerClientEvent('esx_privatemenu:saveID', source, myID)

	local steamid = GetPlayerIdentifiers(src)[1]
  
	getLicenses()

	getCharacters(src, function(data)
		if data ~= nil then
			if data.firstname ~= '' then
				local charName 		= tostring(data.firstname) .. " " .. tostring(data.lastname)
				local charDOB 		= tostring(data.dateofbirth)
				local charSex		= tostring(data.sex)
				local charHeight	= tostring(data.height)

				identification = {
					steamidentifier = steamid,
					playerid        = src
				}
		
		      	characterInfo = {
					characterName       = charName,
					characterDOB		= charDOB,
					characterSex		= charSex,
					characterHeight		= charHeight
				}
				TriggerClientEvent('esx_privatemenu:setChar', src, characterInfo)	
				TriggerClientEvent('esx_privatemenu:setIdentifier', src, identification)
		
			else
				local charName = "No Character"
		
				identification = {
					steamidentifier = steamid,
					playerid        = src
				}
		
		      	characterInfo = {
					characterName       = charName,
					characterDOB		= "",
					characterSex		= "",
					characterHeight		= ""
				}
		  
				TriggerClientEvent('esx_privatemenu:setChar', src, characterInfo)	
				TriggerClientEvent('esx_privatemenu:setIdentifier', src, identification)		
		
			end
		end
	end)
end)

RegisterServerEvent('esx_privatemenu:setCharacter')
AddEventHandler('esx_privatemenu:setCharacter', function(myIdentifiers)
	getChars(myIdentifiers.steamidentifier, function(data)	
		if data ~= nil then
			if data.firstname ~= '' then
				local charName 		= tostring(data.firstname) .. " " .. tostring(data.lastname)
				local charDOB 		= tostring(data.dateofbirth)
				local charSex		= tostring(data.sex)
				local charHeight	= tostring(data.height)
		      	characterInfo = {
					characterName       = charName,
					characterDOB		= charDOB,
					characterSex		= charSex,
					characterHeight		= charHeight
				}
			
				TriggerClientEvent('esx_privatemenu:setChar', myIdentifiers.playerid, characterInfo)
			else	
		      	characterInfo = {
					characterName       = "No Character",
					characterDOB		= "",
					characterSex		= "",
					characterHeight		= ""
				}
				TriggerClientEvent('esx_privatemenu:setChar', myIdentifiers.playerid, characterInfo)  
			end
		end
	end)
end)


RegisterServerEvent('esx_privatemenu:deleteCharacter')
AddEventHandler('esx_privatemenu:deleteCharacter', function(myIdentifiers)
	getChars(myIdentifiers.steamidentifier, function(data)
		local data = {
			identifier   = data.identifier,
			firstname  = data.firstname,
			lastname  = data.lastname,
			dateofbirth  = data.dateofbirth,
			sex      = data.sex,
			height    = data.height
		}
	
		if data.firstname ~= '' then
			deleteIdentity(myIdentifiers.steamidentifier, data, function(callback)
				if callback == true then
					TriggerClientEvent('esx_privatemenu:successfulDeleteIdentity', myIdentifiers.playerid, data)
				else
					TriggerClientEvent('esx_privatemenu:failedDeleteIdentity', myIdentifiers.playerid, data)
				end
			end)
		else
			TriggerClientEvent('esx_privatemenu:noIdentity', myIdentifiers.playerid, {})
		end
	end)
end)

RegisterServerEvent('esx_privatemenu:showID')
AddEventHandler('esx_privatemenu:showID', function(ID, targetID, job, licenseString)

	local identifier = ESX.GetPlayerFromId(ID).identifier
	local _source 	 = ESX.GetPlayerFromId(targetID).source

	MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = @identifier",
	{
		['@identifier'] = identifier
	}, function(result)
		if result[1] ~= nil then
			if result[1].firstname ~= '' then
				local data 			= result[1]
				local charName 		= tostring(data.firstname) .. " " .. tostring(data.lastname)
				local charDOB 		= tostring(data.dateofbirth)
				local charSex		= tostring(data.sex)
				local charHeight	= tostring(data.height)
				
		      	info = {
					characterName       = charName,
					characterDOB		= charDOB,
					characterSex		= charSex,
					characterHeight		= charHeight,
					characterJob		= job,
					characterLicenses	= licenseString
				}
				TriggerClientEvent('esx_privatemenu:showID', _source, info)
			else
				TriggerClientEvent("esx_privatemenu:sendProximityMessageID", -1, ID, "You sent an invalid ID.")
			end
		end
	end)
end)

RegisterServerEvent('InteractSound_SV:PlayWithinDistance')
AddEventHandler('InteractSound_SV:PlayWithinDistance', function(maxDistance, soundFile, soundVolume)
    TriggerClientEvent('InteractSound_CL:PlayWithinDistance', -1, source, maxDistance, soundFile, soundVolume)
end)

