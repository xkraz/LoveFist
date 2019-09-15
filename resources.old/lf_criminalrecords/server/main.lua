ESX = nil
local  delid = ""
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


function addPlayer(id)
local identifier = ESX.GetPlayerFromId(id).identifier
  MySQL.Async.fetchAll(
    'SELECT firstname, lastname FROM users WHERE identifier = @identifier',{['@identifier'] = identifier},
    function(result)
  end)
end

function addCrime(data, id, callback)
local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
local identifier = ESX.GetPlayerFromId(id).identifier
	MySQL.Async.fetchAll(
    'SELECT firstname, lastname FROM users WHERE identifier = @identifier',{['@identifier'] = identifier},
	function(result)
	
	if result[1] ~= nil then
	MySQL.Async.execute('INSERT INTO criminal_records (identifier, firstname, lastname, dateofcrime, charges, fine, sentence, notes, issued) VALUES (@identifier, @firstname, @lastname, curdate(), @charges, @fine, @sentence, @notes, @issued )', {
	
		['@identifier']   = identifier,
        ['@firstname']    = result[1].firstname,
        ['@lastname']     = result[1].lastname,
		['@charges']	  = data.charges,
		['@fine']		  = data.fine,
		['@sentence']	  = data.sentence,
		['@notes']        = data.notes,
		['@issued']		  = data.issued,
	}, function(rowsChanged)
		if callback then
			callback(true)
		end
	end)
	
end
end)
end

function delCrime(data, callback)
	MySQL.Async.execute('DELETE FROM criminal_records WHERE id =@args ', {
		['@args']		= delid
	}, function(rowsChanged)
		if callback then
			callback(true)
		end
	end)
end

RegisterServerEvent('lf_addcrime')
AddEventHandler('lf_addcrime', function(data, myIdentifiers, id)
	addCrime(data, id, function(callback)
	end)
end)
RegisterServerEvent('lf_removecrime')
AddEventHandler('lf_removecrime', function(args)
			delid = args[1]
			delCrime(args)
end)

TriggerEvent('es:addCommand', 'addcrime', function(source, args)
			TriggerClientEvent('lf_crimestart', source, {})
	end)

TriggerEvent('es:addCommand', 'delcrime', function(source, args)
			TriggerClientEvent('lf_crimestop', source, args)
	end)
