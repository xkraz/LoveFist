
RegisterServerEvent('PlaySoundAt')
AddEventHandler('PlaySoundAt', function(loc, _min, _max, soundFile)
  TriggerClientEvent('PlaySoundAt', -1, loc, _min, _max, soundFile)
end)

RegisterServerEvent('PlaySoundOn')
AddEventHandler('PlaySoundOn', function(_ent, _min, _max, soundFile)
  TriggerClientEvent('PlaySoundOn', -1, _ent, _min, _max, soundFile)
end)

RegisterServerEvent('PlayLoopAt')
AddEventHandler('PlayLoopAt', function(loc, _min, _max, soundFile)
  TriggerClientEvent('PlayLoopAt', -1, loc, _min, _max, soundFile)
end)

RegisterServerEvent('StopLoopAt')
AddEventHandler('StopLoopAt', function(loc)
  TriggerClientEvent('StopLoopAt', -1, loc)
end)

-- PLAYLOOPFOR loopLength == how long to loop for

RegisterNetEvent('PlayLoopFor')
AddEventHandler('PlayLoopFor', function(loc, _min, _max, soundFile, loopLength)
  TriggerClientEvent('PlayLoopFor', -1, loc, _min, _max, soundFile, loopLength)
end)

-- PLAYLOOPON loopLength == how long to loop for

RegisterNetEvent('PlayLoopOn')
AddEventHandler('PlayLoopOn', function(_ent, _min, _max, soundFile)
  TriggerClientEvent('PlayLoopOn', -1, _ent, _min, _max, soundFile)
end)

RegisterNetEvent('StopLoopOn')
AddEventHandler('StopLoopOn', function(_ent)
  TriggerClientEvent('StopLoopOn', -1, _ent)
end)

RegisterNetEvent('PlayLoopOnFor')
AddEventHandler('PlayLoopOnFor', function(_ent, _min, _max, soundFile, loopLength)
  TriggerClientEvent('PlayLoopOnFor', -1, _ent, _min, _max, soundFile, loopLength)
end)

RegisterNetEvent('StopLoopAll')
AddEventHandler('StopLoopAll', function()
  TriggerClientEvent('StopLoopAll', -1)
end)
