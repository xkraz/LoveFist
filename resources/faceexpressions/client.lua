ESX               = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)





RegisterCommand('happy', function(source, args, rawCommand)
    local ped = GetPlayerPed(-1)
		ESX.Streaming.RequestAnimDict('facials@gen_female@base')
        TaskPlayAnim(ped, 'facials@gen_female@base', 'mood_happy_1', 2.0, -8.0, -1, 35, 0, 0, 0, 0)
end) 

RegisterCommand('sad', function(source, args, rawCommand)
    local ped = GetPlayerPed(-1)
		ESX.Streaming.RequestAnimDict('facials@gen_female@base')
        TaskPlayAnim(ped, 'facials@gen_female@base', 'mood_sad_1', 2.0, -8.0, -1, 35, 0, 0, 0, 0)
end) 

RegisterCommand('wow', function(source, args, rawCommand)
    local ped = GetPlayerPed(-1)
		ESX.Streaming.RequestAnimDict('facials@gen_female@base')
        TaskPlayAnim(ped, 'facials@gen_female@base', 'shocked_1', 2.0, -8.0, -1, 35, 0, 0, 0, 0)
end) 
