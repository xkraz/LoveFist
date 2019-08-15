ESX					= nil
local InService		= {}
local MaxInService	= {}
local id			= 1
local calls			= {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


AddEventHandler('playerDropped', function()
	local _source = source
		
	for k,v in pairs(InService) do
		if v[_source] == true then
			v[_source] = nil
		end
	end
end)

RegisterServerEvent("CAD:addCall")
AddEventHandler('CAD:addCall', function(data)
	data.id = id
	id = id + 1
	table.insert(calls, data);
	TriggerClientEvent('CAD:updateCalls', -1, calls)
end)


RegisterServerEvent("CAD:code4")
AddEventHandler('CAD:code4', function(id1)
	for k, v in pairs(calls) do
		if v["id"] == id1 then
			table.remove(calls, k)
			break;
		end
	end
	TriggerClientEvent('CAD:updateCalls', -1, calls)
end)

RegisterServerEvent("CAD:respondCall")
AddEventHandler('CAD:respondCall', function(id1, callsign)
	for k, v in pairs(calls) do
		if v["id"] == id1 then
			if not has_value(calls[k]["units"], callsign) then
				table.insert(calls[k]["units"], callsign)
				TriggerClientEvent('CAD:updateCalls', -1, calls)
			end
			break;
		end
	end
end)


ESX.RegisterServerCallback('CAD:lookupPlate', function(source, cb, plate)	
	MySQL.Async.fetchAll("SELECT plate, owner, numberOfImpounds, lastImpound, `character`, name, firstname, lastname, id FROM owned_vehicles JOIN users ON owned_vehicles.owner=users.identifier where plate = @plate",
	{
		['@plate'] = plate
	},
	function(result)
		if result[1] ~= nil then
			local data = {
				plate  = result[1]['plate'],
				owner  = result[1]['owner'],
				numberOfImpounds  = result[1]['numberOfImpounds'],
				lastImpound  = result[1]['lastImpound'],
				name  = result[1]['name'],
				firstname  = result[1]['firstname'],
				lastname      = result[1]['lastname'],
				character      = result[1]['character'],
				id =result[1]['id']
			}
			cb(data)
		else
			local data = {
				plate  = '',
				owner  = '',
				numberOfImpounds  = '',
				lastImpound  = '',
				name  = '',
				firstname  = '',
				lastname      = '',
				character      = '',
				id =''
			}
			cb(data)
		end
	end)
end)
ESX.RegisterServerCallback('CAD:charLookup', function(source, cb, fname, lname)	
	MySQL.Async.fetchAll("SELECT `id`,firstname,lastname,dateofbirth,sex,height FROM users WHERE firstname like  @fname AND lastname like @lname LIMIT 10",
	{
		['@fname'] = "%"..fname.."%",
		['@lname'] = "%"..lname.."%"
	},
	function(result)
		if result[1] ~= nil then
			cb(result)
		else
			local data = {
				{
					id			= '',
					dateofbirth	= '',
					sex			= '',
					height		= '',
					firstname	= '',
					lastname	= ''
				}
			}
			cb(data)
		end
	end)
end)


ESX.RegisterServerCallback('CAD:getChar', function(source, cb, id)	
	MySQL.Async.fetchAll("SELECT `id`, `identifier`, firstname, lastname, dateofbirth, sex, height FROM users WHERE id = @id",
	{
		['@id'] = id
	},
	function(result)
		if result[1] ~= nil then
			MySQL.Async.fetchAll("SELECT * FROM criminal_records WHERE identifier = @identifier AND firstname = @fname AND lastname = @lname",
			{
				['@identifier'] = result[1]["identifier"],
				['@fname'] = result[1]["firstname"],
				['@lname'] = result[1]["lastname"]
			}, function(res2)
				if res2[1] ~= nil then
					result[1]["crimes"] = res2
				else
					result[1]["crimes"] = {}
				end
				MySQL.Async.fetchAll("SELECT date,label,amount FROM billing WHERE identifier = @identifier AND target = 'society_police' AND paid = 0",
				{
					['@identifier'] = result[1]["identifier"]
				}, function(res3)
					if res3[1] ~= nil then
						result[1]["fines"] = res3
					else
						result[1]["fines"] = {}
					end
				MySQL.Async.fetchAll("SELECT type,owner FROM user_licenses WHERE owner = @identifier",
				{
					['@identifier'] = result[1]["identifier"]
				}, function(res4)
					if res4[1] ~= nil then
						result[1]["licenses"] = res4
					else
						result[1]["licenses"] = {}
					end
				MySQL.Async.fetchAll("SELECT * FROM criminal_bolos",
				{
					['@identifier'] = result[1]["identifier"]
				}, function(res5)
					if res5[1] ~= nil then
						result[1]["bolos"] = res5
					else
						result[1]["bolos"] = {}
					end
				MySQL.Async.fetchAll("SELECT * FROM criminal_warrants",
				{
					['@identifier'] = result[1]["identifier"]
				}, function(res6)
					if res6[1] ~= nil then
						result[1]["warrants"] = res6
					else
						result[1]["warrants"] = {}
					end
				MySQL.Async.fetchAll("SELECT * FROM medical_records WHERE identifier = @identifier AND firstname = @fname AND lastname = @lname",
				{
					['@identifier'] = result[1]["identifier"]
				}, function(res7)
					if res7[1] ~= nil then
						result[1]["medicals"] = res7
					else
						result[1]["medicals"] = {}
					end
					cb(result)
				end)
			end)
			end)
			end)
			end)
			end)
		else
			local data = {
				{
					id			= '',
					dateofbirth	= '',
					sex			= '',
					height		= '',
					firstname	= '',
					lastname	= ''
				}
			}
			cb(data)
		end
	end)
end)


ESX.RegisterServerCallback('CAD:getCalls', function(source, cb)	
	cb(calls)
end)



function has_value(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end


