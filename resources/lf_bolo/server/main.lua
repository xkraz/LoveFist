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


function addBolo(data, callback)
local date = os.date("%Y-%m-%d")
	MySQL.Async.execute('INSERT INTO criminal_bolos (firstname, lastname, gender, description, reason, seen, datee) VALUES (@firstname, @lastname, @gender, @description, @reason, @seen, curdate() )', {
		['@firstname']		= data.firstname,
		['@lastname']		= data.lastname,
		['@gender']			= data.gender,
		['@description']	= data.desc,
		['@reason']			= data.reason,
		['@seen']			= data.seen,
		['@datee']			= date,
	}, function(rowsChanged)
		if callback then
			callback(true)
		end
	end)
end

function delBolo(data, callback)
	MySQL.Async.execute('DELETE FROM criminal_bolos WHERE id =@args ', {
		['@args']		= delid
	}, function(rowsChanged)
		if callback then
			callback(true)
		end
	end)
end

RegisterServerEvent('lf_addbolo')
AddEventHandler('lf_addbolo', function(data, myIdentifiers)
	addBolo(data, function(callback)
	end)
end)
RegisterServerEvent('lf_removebolo')
AddEventHandler('lf_removebolo', function(args)
			delid = args[1]
			delBolo(args)
end)

TriggerEvent('es:addCommand', 'addbolo', function(source, args)
			TriggerClientEvent('lf_bolostart', source, {})
	end)

TriggerEvent('es:addCommand', 'delbolo', function(source, args)
			TriggerClientEvent('lf_bolostop', source, args)
	end)

