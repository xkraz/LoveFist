ESX = nil
local  delid = ""
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

AddEventHandler('es:playerLoaded', function(source)
	local myID = {
		steamid = GetPlayerIdentifiers(source)[1],
		playerid = source
	}

	TriggerClientEvent('esx_identity:saveID', source, myID)
	getIdentity(source, function(data)
		if data.firstname == '' then
			TriggerClientEvent('esx_identity:identityCheck', source, false)
			TriggerClientEvent('esx_identity:showRegisterIdentity', source)
		else
			TriggerClientEvent('esx_identity:identityCheck', source, true)
		end
	end)
end)

function addPlayer(id)
local identifier = ESX.GetPlayerFromId(id).identifier
  MySQL.Async.fetchAll(
    'SELECT firstname, lastname FROM users WHERE identifier = @identifier',{['@identifier'] = identifier},
    function(result)
  end)
end

function addMedical(data, id, callback)
local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
local identifier = ESX.GetPlayerFromId(id).identifier
	MySQL.Async.fetchAll(
    'SELECT firstname, lastname FROM users WHERE identifier = @identifier',{['@identifier'] = identifier},
	function(result)
	
	if result[1] ~= nil then
	MySQL.Async.execute('INSERT INTO medical_records (identifier, firstname, lastname, dateofinjury, injury, description, treatment, perscription, issuedby) VALUES (@identifier, @firstname, @lastname, curdate(), @injury, @description, @treatment, @perscription, @issuedby )', {
	
		['@identifier']   = identifier,
        ['@firstname']    = result[1].firstname,
        ['@lastname']     = result[1].lastname,
		['@injury']	  = data.injury,
		['@description']		  = data.description,
		['@treatment']	  = data.treatment,
		['@perscription']        = data.perscription,
		['@issuedby']		  = data.issuedby,
	}, function(rowsChanged)
		if callback then
			callback(true)
		end
	end)
	
end
end)
end

function delMedical(data, callback)
	MySQL.Async.execute('DELETE FROM medical_records WHERE id =@args ', {
		['@args']		= delid
	}, function(rowsChanged)
		if callback then
			callback(true)
		end
	end)
end

RegisterServerEvent('lf_removemedical')
AddEventHandler('lf_removemedical', function(args)
			delid = args[1]
			delMedical(args)
end)

RegisterServerEvent('lf_addmedical')
AddEventHandler('lf_addmedical', function(data, myIdentifiers, id)
	addMedical(data, id, function(callback)
	end)
end)

TriggerEvent('es:addCommand', 'addmedical', function(source, args)
			TriggerClientEvent('lf_medicalstart', source, {})
	end)

	
TriggerEvent('es:addCommand', 'delmedical', function(source, args)
			TriggerClientEvent('lf_medicalstop', source, args)
	end)

