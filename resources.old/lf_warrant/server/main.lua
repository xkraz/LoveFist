ESX = nil
local  delid = ""
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


function addWarrant(data, callback)
	MySQL.Async.execute('INSERT INTO criminal_warrants (firstname, lastname, gender, description, reason, seen, datee) VALUES (@firstname, @lastname, @gender, @description, @reason, @seen, curdate())', {
		['@firstname']		= data.firstname,
		['@lastname']		= data.lastname,
		['@gender']			= data.gender,
		['@description']	= data.desc,
		['@reason']			= data.reason,
		['@seen']			= data.seen,
	}, function(rowsChanged)
		if callback then
			callback(true)
		end
	end)
end

function delWarrant(data, callback)
	MySQL.Async.execute('DELETE FROM criminal_warrants WHERE id =@args ', {
		['@args']		= delid
	}, function(rowsChanged)
		if callback then
			callback(true)
		end
	end)
end

RegisterServerEvent('lf_addwarrant')
AddEventHandler('lf_addwarrant', function(data, myIdentifiers)
	addWarrant(data, function(callback)
	end)
end)
RegisterServerEvent('lf_removewarrant')
AddEventHandler('lf_removewarrant', function(args)
			delid = args[1]
			delWarrant(args)
end)

TriggerEvent('es:addCommand', 'addwarrant', function(source, args)
			TriggerClientEvent('lf_warrantstart', source, {})
	end)

TriggerEvent('es:addCommand', 'delwarrant', function(source, args)
			TriggerClientEvent('lf_warrantstop', source, args)
	end)
