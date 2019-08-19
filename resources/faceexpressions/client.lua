ESX               = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

-- FACIAL EXPRESSIONS: normal, smug, happy, excited, upset, angry, stress, sad, wow, focus,

RegisterCommand('normal', function(source, args, rawCommand)
    local ped = GetPlayerPed(-1)
	local male = IsPedMale(GetPlayerPed(-1))
	
		if male then
			ESX.Streaming.RequestAnimDict('facials@gen_male@base')
			TaskPlayAnim(ped, 'facials@gen_male@base', 'mood_normal_1', 2.0, -8.0, -1, 35, 0, 0, 0, 0)
		elseif not male then
			ESX.Streaming.RequestAnimDict('facials@gen_female@base')
			TaskPlayAnim(ped, 'facials@gen_female@base', 'mood_normal_1', 2.0, -8.0, -1, 35, 0, 0, 0, 0)
		end
	
end)

RegisterCommand('happy', function(source, args, rawCommand)
    local ped = GetPlayerPed(-1)
	local male = IsPedMale(GetPlayerPed(-1))
	
		if male then
			ESX.Streaming.RequestAnimDict('facials@gen_male@base')
			TaskPlayAnim(ped, 'facials@gen_male@base', 'mood_happy_1', 2.0, -8.0, -1, 35, 0, 0, 0, 0)
		elseif not male then
			ESX.Streaming.RequestAnimDict('facials@gen_female@base')
			TaskPlayAnim(ped, 'facials@gen_female@base', 'mood_happy_1', 2.0, -8.0, -1, 35, 0, 0, 0, 0)
		end
	
end)

RegisterCommand('sad', function(source, args, rawCommand)
    local ped = GetPlayerPed(-1)
	local male = IsPedMale(GetPlayerPed(-1))
	
		if male then
			ESX.Streaming.RequestAnimDict('facials@gen_male@base')
			TaskPlayAnim(ped, 'facials@gen_male@base', 'mood_sulk_1', 2.0, -8.0, -1, 35, 0, 0, 0, 0)
		elseif not male then
			ESX.Streaming.RequestAnimDict('facials@gen_female@base')
			TaskPlayAnim(ped, 'facials@gen_female@base', 'mood_sulk_1', 2.0, -8.0, -1, 35, 0, 0, 0, 0)
		end
end) 

RegisterCommand('wow', function(source, args, rawCommand)
    local ped = GetPlayerPed(-1)
	local male = IsPedMale(GetPlayerPed(-1))
	
		if male then
			ESX.Streaming.RequestAnimDict('facials@gen_male@base')
			TaskPlayAnim(ped, 'facials@gen_male@base', 'shocked_1', 2.0, -8.0, -1, 35, 0, 0, 0, 0)
		elseif not male then
			ESX.Streaming.RequestAnimDict('facials@gen_female@base')
			TaskPlayAnim(ped, 'facials@gen_female@base', 'shocked_1', 2.0, -8.0, -1, 35, 0, 0, 0, 0)
		end
	
		
end) 

RegisterCommand('stress', function(source, args, rawCommand)
    local ped = GetPlayerPed(-1)
	local male = IsPedMale(GetPlayerPed(-1))
	
		if male then
			ESX.Streaming.RequestAnimDict('facials@gen_male@base')
			TaskPlayAnim(ped, 'facials@gen_male@base', 'mood_stressed_1', 2.0, -8.0, -1, 35, 0, 0, 0, 0)
		elseif not male then
			ESX.Streaming.RequestAnimDict('facials@gen_female@base')
			TaskPlayAnim(ped, 'facials@gen_female@base', 'mood_stressed_1', 2.0, -8.0, -1, 35, 0, 0, 0, 0)
		end
	
		
end) 

RegisterCommand('upset', function(source, args, rawCommand)
    local ped = GetPlayerPed(-1)
	local male = IsPedMale(GetPlayerPed(-1))
	
		if male then
			ESX.Streaming.RequestAnimDict('facials@gen_male@base')
			TaskPlayAnim(ped, 'facials@gen_male@base', 'mood_angry_1', 2.0, -8.0, -1, 35, 0, 0, 0, 0)
		elseif not male then
			ESX.Streaming.RequestAnimDict('facials@gen_female@base')
			TaskPlayAnim(ped, 'facials@gen_female@base', 'mood_angry_1', 2.0, -8.0, -1, 35, 0, 0, 0, 0)
		end
	
	
		
end) 

RegisterCommand('focus', function(source, args, rawCommand)
    local ped = GetPlayerPed(-1)
	local male = IsPedMale(GetPlayerPed(-1))
	
		if male then
			ESX.Streaming.RequestAnimDict('facials@gen_male@base')
			TaskPlayAnim(ped, 'facials@gen_male@base', 'mood_aiming_1', 2.0, -8.0, -1, 35, 0, 0, 0, 0)
		elseif not male then
			ESX.Streaming.RequestAnimDict('facials@gen_female@base')
			TaskPlayAnim(ped, 'facials@gen_female@base', 'mood_aiming_1', 2.0, -8.0, -1, 35, 0, 0, 0, 0)
		end
	
		
end) 

RegisterCommand('angry', function(source, args, rawCommand)
    local ped = GetPlayerPed(-1)
	local male = IsPedMale(GetPlayerPed(-1))
	
		if male then
			ESX.Streaming.RequestAnimDict('facials@gen_male@base')
			TaskPlayAnim(ped, 'facials@gen_male@base', 'mood_drivefast_1', 2.0, -8.0, -1, 35, 0, 0, 0, 0)
		elseif not male then
			ESX.Streaming.RequestAnimDict('facials@gen_female@base')
			TaskPlayAnim(ped, 'facials@gen_female@base', 'mood_drivefast_1', 2.0, -8.0, -1, 35, 0, 0, 0, 0)
		end
	
		
end) 


RegisterCommand('smug', function(source, args, rawCommand)
    local ped = GetPlayerPed(-1)
	local male = IsPedMale(GetPlayerPed(-1))
	
		if male then
			ESX.Streaming.RequestAnimDict('facials@gen_male@base')
			TaskPlayAnim(ped, 'facials@gen_male@base', 'mood_smug_1', 2.0, -8.0, -1, 35, 0, 0, 0, 0)
		elseif not male then
			ESX.Streaming.RequestAnimDict('facials@gen_female@base')
			TaskPlayAnim(ped, 'facials@gen_female@base', 'mood_smug_1', 2.0, -8.0, -1, 35, 0, 0, 0, 0)
		end
	
		
end) 
