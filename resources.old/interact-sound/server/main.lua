
RegisterServerEvent('PlaySoundAt')
AddEventHandler('PlaySoundAt', function(loc, soundFile)
  TriggerClientEvent('PlaySoundAt', -1, loc, soundFile)
end)

RegisterServerEvent('PlaySoundOn')
AddEventHandler('PlaySoundOn', function(_ent, soundFile)
  TriggerClientEvent('PlaySoundOn', -1, _ent, soundFile)
end)

RegisterServerEvent('PlayLoopAt')
AddEventHandler('PlayLoopAt', function(loc, soundFile)
  TriggerClientEvent('PlayLoopAt', -1, loc, soundFile)
end)

RegisterServerEvent('StopLoopAt')
AddEventHandler('StopLoopAt', function(loc)
  TriggerClientEvent('StopLoopAt', -1, loc)
end)

-- PLAYLOOPFOR loopLength == how long to loop for

RegisterNetEvent('PlayLoopFor')
AddEventHandler('PlayLoopFor', function(loc, soundFile, loopLength)
  TriggerClientEvent('PlayLoopFor', -1, loc, soundFile, loopLength)
end)

-- PLAYLOOPON loopLength == how long to loop for

RegisterNetEvent('PlayLoopOn')
AddEventHandler('PlayLoopOn', function(_ent, soundFile)
  TriggerClientEvent('PlayLoopOn', -1, _ent, soundFile)
end)

RegisterNetEvent('StopLoopOn')
AddEventHandler('StopLoopOn', function(_ent)
  TriggerClientEvent('StopLoopOn', -1, _ent)
end)

RegisterNetEvent('PlayLoopOnFor')
AddEventHandler('PlayLoopOnFor', function(_ent, soundFile, loopLength)
  TriggerClientEvent('PlayLoopOnFor', -1, _ent, soundFile, loopLength)
end)

RegisterNetEvent('StopLoopAll')
AddEventHandler('StopLoopAll', function()
  TriggerClientEvent('StopLoopAll', -1)
end)
