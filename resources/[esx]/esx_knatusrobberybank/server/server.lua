local rob = {}
local robbed = {}
local robbers = {}
ESX = nil

for k,v in pairs(Banks) do
	rob[k] = false
	robbed[k] = false
end

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function get3DDistance(x1, y1, z1, x2, y2, z2)
	return math.sqrt(math.pow(x1 - x2, 2) + math.pow(y1 - y2, 2) + math.pow(z1 - z2, 2))
end

RegisterServerEvent('esx_holdupbank:toofar')
AddEventHandler('esx_holdupbank:toofar', function(robb)
	local source = source
	local xPlayers = ESX.GetPlayers()
	rob[robb] = false
	for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' or xPlayer.job.name == 'fib' then
			TriggerClientEvent('esx:showNotification', xPlayers[i], _U('robbery_cancelled_at') .. Banks[robb].nameofbank)
			TriggerClientEvent('esx_holdupbank:killblip', xPlayers[i])
		end
	end
	if(robbers[source])then
		TriggerClientEvent('esx_holdupbank:toofarlocal', source)
		robbers[source] = nil
		TriggerClientEvent('esx:showNotification', source, _U('robbery_has_cancelled') .. Banks[robb].nameofbank)
		TriggerClientEvent('esx_holdupbank:killblip', source)
	end
	TriggerClientEvent('bankstopalarm', -1,robb)
end)

RegisterServerEvent('esx_holdupbank:toofarhack')
AddEventHandler('esx_holdupbank:toofarhack', function(robb)
	local source = source
	local xPlayers = ESX.GetPlayers()
	rob[robb]= false
	for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' or xPlayer.job.name == 'fib' then
			--TriggerClientEvent('esx:showNotification', xPlayers[i], _U('robbery_cancelled_at') .. Banks[robb].nameofbank)
			TriggerClientEvent('esx_holdupbank:killblip', xPlayers[i])
		end
	end
	if(robbers[source])then
		TriggerClientEvent('esx_holdupbank:toofarlocal', source)
		robbers[source] = nil
		--TriggerClientEvent('esx:showNotification', source, _U('robbery_has_cancelled') .. Banks[robb].nameofbank)
	end
end)

function fmtTime(_in)
	local out = ""
	local _tmp = _in
	local _hour = (60*60000)
	local _minute = 60000
	local _second = 1000
 	if _in ~= nil then
		if _in >= (_hour) then
			local tmp = math.floor(_in / _hour)
			_in = _in - tmp * _hour
			out = tmp .. 'h '
		end

		if _in >= (_minute) then
			local tmp = math.floor(_in / _minute)
			_in = _in - tmp * _minute
			out = out .. tmp .. 'm '
		end

		if _in >= (_second) and _tmp < 60000 then
			local tmp = math.floor(_in / _second)
			_in = _in - tmp * _second
			out = out .. tmp .. 's '
		end

		if _in >= 1 and _tmp < 1000 then
			local tmp = _in
			_in = _in - tmp
			out = out .. tmp .. 'ms'
		end

		return out
	end
end

RegisterServerEvent('esx_holdupbank:rob')
AddEventHandler('esx_holdupbank:rob', function(robb)

	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()

	if Banks[robb] then
		local bank = Banks[robb]
		local _timeLeft = (bank.cooldown - (GetGameTimer() - bank.lastrobbed))
		local _hour = (60*60000)
		local _minute = 60000
		local _second = 1000

		if _timeLeft > 0 and bank.lastrobbed ~= 0 and robbed[robb] == true then
			TriggerEvent('dbug', 'esx_holdupbank:rob:TIME LEFT ' .. bank.nameofbank .. ': ' .. fmtTime(_timeLeft) .. '/' .. fmtTime(bank.cooldown) .. ' ROBBED: ' .. fmtTime(GetGameTimer() - bank.lastrobbed) .. 'ago.')
			if _timeLeft >= _hour then
				TriggerClientEvent('esx:showNotification', source, _U('already_robbed') .. fmtTime(_timeLeft))
			elseif _timeLeft < _hour and _timeLeft >= _minute then
				TriggerClientEvent('esx:showNotification', source, _U('already_robbed') .. fmtTime(_timeLeft))
			else
				TriggerClientEvent('esx:showNotification', source, _U('already_robbed') .. fmtTime(_timeLeft))
			end
			return
		elseif _timeLeft <= 0 and robbed[robb] == true then
			TriggerEvent('dbug', 'esx_holdupbank:rob COOLDOWN OVER | RESSETING | ROBBED: ' .. fmtTime(GetGameTimer() - bank.lastrobbed) .. 'ago, COOLDOWN: ' .. fmtTime(bank.cooldown))
			robbed[robb] = false
		end


		local cops = 0
		for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' or xPlayer.job.name == 'fib' then
				cops = cops + 1
			end
		end


		if robbed[robb]== false then
			xPlayer = ESX.GetPlayerFromId(source)
			if xPlayer.getInventoryItem('blowtorch').count >= 1 then
				if(cops >= bank.NumberOfCopsRequired)then

					rob[robb]= true
					robbed[robb] = true
					TriggerClientEvent('esx_holdupbank:newsbroadcast', -1 ,bank.nameofbank,robb, false)
					xPlayer.removeInventoryItem('blowtorch', 1)
    			TriggerClientEvent('bankstartalarm', -1,robb)
					TriggerClientEvent('esx:showNotification', source, _U('started_to_rob') .. bank.nameofbank .. _U('do_not_move'))
					TriggerClientEvent('esx:showNotification', source, _U('alarm_triggered'))
					TriggerClientEvent('esx:showNotification', source, _U('hold_pos'))
					TriggerClientEvent('esx_holdupbank:currentlyrobbing', source, robb)
					TriggerClientEvent('esx_blowtorch:startblowtorch', source)
					Banks[robb].lastrobbed = GetGameTimer()
					robbers[source] = robb
					local savedSource = source
					SetTimeout(bank.robtime, function()

						if(robbers[savedSource])then

							rob[robb]= false
							local tmpAmnt = math.random(bank.reward.min, bank.reward.max)
							TriggerClientEvent('esx_holdupbank:robberycomplete', savedSource, tmpAmnt)
							TriggerClientEvent("bankstopalarm", -1,robb)
							if(xPlayer)then

								TriggerEvent('dbug','xPlayer.addAccountMoney(black_money, '..tmpAmnt..')')
								local xPlayers = ESX.GetPlayers()
								for i=1, #xPlayers, 1 do
									local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
									if xPlayer.job.name == 'police' or xPlayer.job.name == 'fib' or xPlayer.job.name == 'reporter' then
											TriggerClientEvent('esx:showNotification', xPlayers[i], _U('robbery_complete_at') .. bank.nameofbank)
											TriggerClientEvent('esx_holdupbank:killblip', xPlayers[i])
									end
								end
							end
						end
					end)
				else
			end
				TriggerClientEvent('esx:showNotification', source, _U('min_two_police')..bank.NumberOfCopsRequired)
			 else
				 TriggerClientEvent('esx:showNotification', source, _U('blowtorch_needed'))
			 end

		else
			TriggerClientEvent('esx:showNotification', source, _U('robbery_already'))
		end
	end
end)

RegisterServerEvent('esx_holdupbank:hack')
AddEventHandler('esx_holdupbank:hack', function(robb)

	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()

	if Banks[robb] then

		local bank = Banks[robb]

		if (os.time() - bank.lastrobbed) < 1800000 and bank.lastrobbed ~= 0 then

			TriggerClientEvent('esx:showNotification', source, _U('already_robbed') .. (1800000 - (os.time() - bank.lastrobbed)) .. _U('seconds'))
			return
		end


		local cops = 0
		for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' or xPlayer.job.name == 'fib'then
				cops = cops + 1
			end
		end



			if(cops >= bank.NumberOfCopsRequired)then

				if xPlayer.getInventoryItem('rasperry').count >= 1 then
					xPlayer.removeInventoryItem('rasperry', 1)

					TriggerClientEvent('esx:showNotification', source, _U('started_to_hack') .. bank.nameofbank .. _U('do_not_move'))
					TriggerClientEvent('esx:showNotification', source, _U('hold_pos_hack'))
					TriggerClientEvent('esx_holdupbank:currentlyhacking', source, robb, Banks[robb])



				else
					TriggerClientEvent('esx:showNotification', source, _U('rasperry_needed'))
				end
			else
				TriggerClientEvent('esx:showNotification', source, _U('min_two_police')..bank.NumberOfCopsRequired)
			end
	end
end)

-- Plant a bomb

RegisterServerEvent('esx_holdupbank:plantbomb')
AddEventHandler('esx_holdupbank:plantbomb', function(robb)

    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayers = ESX.GetPlayers()

    if Banks[robb] then

        local bank = Banks[robb]

        if (os.time() - bank.lastrobbed) < 1800000 and bank.lastrobbed ~= 0 then

            TriggerClientEvent('esx:showNotification', source, _U('already_robbed') .. (1800000 - (os.time() - bank.lastrobbed)) .. _U('seconds'))
            return
        end


        local cops = 0
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            if xPlayer.job.name == 'police' or xPlayer.job.name == 'fib' then
                cops = cops + 1
            end
        end


        if(cops >= bank.NumberOfCopsRequired)then

			if xPlayer.getInventoryItem('c4_bank').count >= 1 then
				xPlayer.removeInventoryItem('c4_bank', 1)

				TriggerClientEvent('esx_holdupbank:newsbroadcast', -1 ,bank.nameofbank,robb,true)

				TriggerClientEvent('esx:showNotification', source, _U('started_to_plantbomb') .. bank.nameofbank .. _U('do_not_move'))

				TriggerClientEvent('esx:showNotification', source, _U('hold_pos_plantbomb'))
				TriggerClientEvent('esx_holdupbank:plantingbomb', source, robb, Banks[robb])

				robbers[source] = robb
				local savedSource = source

				SetTimeout(20000, function()

					if(robbers[savedSource])then

						rob[robb]= false
						TriggerClientEvent('esx_holdupbank:plantbombcomplete', savedSource, Banks[robb])
						if(xPlayer)then

							TriggerClientEvent('esx:showNotification', xPlayer, _U('bombplanted_run'))
							local xPlayers = ESX.GetPlayers()
							for i=1, #xPlayers, 1 do
								local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
								if xPlayer.job.name == 'police' or xPlayer.job.name == 'fib' then
									TriggerClientEvent('esx:showNotification', xPlayers[i], _U('bombplanted_at') .. bank.nameofbank)

								end
							end
						end
					end
				end)
			else
				TriggerClientEvent('esx:showNotification', source, _U('c4_needed'))
			end
        else
            TriggerClientEvent('esx:showNotification', source, _U('min_two_police')..bank.NumberOfCopsRequired)
        end

    end
end)

RegisterServerEvent('esx_holdupbank:clearweld')
AddEventHandler('esx_holdupbank:clearweld', function(x,y,z)

	TriggerClientEvent('esx_blowtorch:clearweld', -1, x,y,z)
end)

RegisterServerEvent('esx_holdupbank:opendoor')
AddEventHandler('esx_holdupbank:opendoor', function(x,y,z, doortype)

	TriggerClientEvent('esx_holdupbank:opendoors', -1, x,y,z, doortype)
end)

RegisterServerEvent('esx_holdupbank:plantbombtoall')
AddEventHandler('esx_holdupbank:plantbombtoall', function(x,y,z, doortype)
    SetTimeout(20000, function()
        TriggerClientEvent('esx_holdupbank:plantedbomb', -1, x,y,z, doortype)
    end)
end)

RegisterServerEvent('esx_holdupbank:finishclear')
AddEventHandler('esx_holdupbank:finishclear', function()
	TriggerClientEvent('esx_blowtorch:finishclear', -1)
end)

RegisterServerEvent('esx_holdupbank:closedoor')
AddEventHandler('esx_holdupbank:closedoor', function()

	TriggerClientEvent('esx_holdupbank:closedoor', -1)
end)

RegisterServerEvent('esx_holdupbank:plantbomb')
AddEventHandler('esx_holdupbank:plantbomb', function()
    TriggerClientEvent('esx_holdupbank:plantbomb', -1)
end)
