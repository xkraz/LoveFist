 --[[
 Commands

 Salute: 		/salute 	: Salute your commrads!
 Bird 1: 		/bird 	: One hand middle Finger
 Bird 2: 		/bird2 	: 2 hands middle finger
 Facepalm: 		/palm	: Facepalm
 BongRip:		/bong	: Press E to take a fat rip!
 Cell Record:		/photo : Press E to take a picture! 
 Notepad:		/ticket : Press E to check your watch
 Crowd Control:		/crowd		: Press E to control the crowd!
 Slow Clap:		/clap		: Slow Clap
 Umbrella:		/umbrella	: Pull out an umbrella on those rainy days!
 Coffee:		/coffee: Gets a coffee...
 Smoke:			/smoke	: Gets a cigarette...
 Cross Hands:		/cross	: Cross your hands while upset!
 Surrender:             /surrender : Surrender to Police!
]]--


-------Props-------
local holdingbong = false
local bongmodel = "hei_heist_sh_bong_01"
local bong_net = nil

local holdingphoneR = false
local phoneRmodel = "prop_amb_phone"
local phoneR_net = nil

local holdingpad = false
local padmodel = "prop_notepad_02"
local pad_net = nil

local holdingumb = false
local umbmodel = "p_amb_brolly_01"
local umb_net = nil

local holdingpistol = false
local pistolmodel = "w_pi_pistol"
local pistol_net = nil

local holdingcoffee = false
local coffeemodel = "p_amb_coffeecup_01"
local coffee_net = nil

local holdingsmoke = false
local smokemodel = "p_cs_ciggy_01b_s"
local smoke_net = nil

local handsup = false

------------- create chat message

RegisterCommand("emotes",function(source, args)
	    TriggerEvent("chatMessage", "INTERACTIVE EMOTES", {20,255,75}, "USAGE - /[emote] | (EXAMPLE: /clap)") -- Saying "EMOTES:" in green
		TriggerEvent("chatMessage", "", {190,190,190}, "salute,  phoner,  bird,  bird2,  palm,  bong,  ticket,  clap, umbrella, coffee,  smoke,  cross, surrender") -- Displaying the emotes in grey
		TriggerEvent("chatMessage", "", {255,0,0}, "Repeat the same command to cancel emote.")
end, false)

-------------------------------- Cross Hands

RegisterCommand("cross",function(source, args)

	local ad = "amb@world_human_hang_out_street@female_arms_crossed@base"
	local player = GetPlayerPed( -1 )
	
	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
		loadAnimDict( ad )
		if ( IsEntityPlayingAnim( player, ad, "base", 3 ) ) then 
			TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
			Wait (100)
			ClearPedSecondaryTask(GetPlayerPed(-1))
		else
			TaskPlayAnim( player, ad, "base", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
			Wait (500)
		end     
	end
end, false)

-- Hands Up, kneel down surrender. Originial was created by @Cosharek on the FiveM Forums. I just made it work as a standalone instead of just ESX
	local surrendered = false

	RegisterCommand("surrender",function(source, args)
		local player = GetPlayerPed( -1 )
		if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
			loadAnimDict( "random@arrests" )
			loadAnimDict( "random@arrests@busted" )
			if ( IsEntityPlayingAnim( player, "random@arrests@busted", "idle_a", 3 ) ) then 
				TaskPlayAnim( player, "random@arrests@busted", "exit", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
				Wait (3000)
				TaskPlayAnim( player, "random@arrests", "kneeling_arrest_get_up", 8.0, 1.0, -1, 128, 0, 0, 0, 0 )
				surrendered = false
			else
				TaskPlayAnim( player, "random@arrests", "idle_2_hands_up", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
				Wait (4000)
				TaskPlayAnim( player, "random@arrests", "kneeling_arrest_idle", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
				Wait (500)
				TaskPlayAnim( player, "random@arrests@busted", "enter", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
				Wait (1000)
				TaskPlayAnim( player, "random@arrests@busted", "idle_a", 8.0, 1.0, -1, 9, 0, 0, 0, 0 )
				Wait(100)
				surrendered = true
			end     
		end
	end, false)
	
	Citizen.CreateThread(function() --disabling controls while surrendured
		while surrendered do
			Citizen.Wait(0)
			if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "random@arrests@busted", "idle_a", 3) then
				DisableControlAction(1, 140, true)
				DisableControlAction(1, 141, true)
				DisableControlAction(1, 142, true)
				DisableControlAction(0,21,true)
			end
		end
	end)


------------- smoke

RegisterCommand("smoke",function(source, args)
	local ad1 = "amb@world_human_aa_smoke@male@idle_a"
	local ad1a = "idle_c"
	local player = GetPlayerPed(-1)
	local plyCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -5.0)
	local smokespawned = CreateObject(GetHashKey(smokemodel), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)
	local netid = ObjToNet(smokespawned)

	if (DoesEntityExist(player) and not IsEntityDead(player)) then 
		loadAnimDict(ad1)
		RequestModel(GetHashKey(smokemodel))
		if holdingsmoke then
			Wait(100)
			ClearPedSecondaryTask(GetPlayerPed(-1))
			DetachEntity(NetToObj(smoke_net), 1, 1)
			DeleteEntity(NetToObj(smoke_net))
			smoke_net = nil
			holdingsmoke = false
		else
			TaskPlayAnim(player, ad1, ad1a, 8.0, 1.0, -1, 49, 0, 0, 0, 0)
			Wait(500)
			SetNetworkIdExistsOnAllMachines(netid, true)
			NetworkSetNetworkIdDynamic(netid, true)
			SetNetworkIdCanMigrate(netid, false)
			AttachEntityToEntity(smokespawned,GetPlayerPed(PlayerId()),GetPedBoneIndex(GetPlayerPed(PlayerId()), 28422),0.0,0.0,0.0,0.0,0.0,0.0,1,1,0,1,0,1)
			Wait(120)
			smoke_net = netid
			holdingsmoke = true
		end
	end
end, false)

------------- coffee

RegisterCommand("coffee",function(source, args)
	local ad1 = "amb@world_human_drinking@coffee@male@idle_a"
	local ad1a = "idle_c"
	local player = GetPlayerPed(-1)
	local plyCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -5.0)
	local coffeespawned = CreateObject(GetHashKey(coffeemodel), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)
	local netid = ObjToNet(coffeespawned)

	if (DoesEntityExist(player) and not IsEntityDead(player)) then 
		loadAnimDict(ad1)
		RequestModel(GetHashKey(coffeemodel))
		if holdingcoffee then
			Wait(100)
			ClearPedSecondaryTask(GetPlayerPed(-1))
			DetachEntity(NetToObj(coffee_net), 1, 1)
			DeleteEntity(NetToObj(coffee_net))
			coffee_net = nil
			holdingcoffee = false
		else
			TaskPlayAnim(player, ad1, ad1a, 8.0, 1.0, -1, 49, 0, 0, 0, 0)
			Wait(500)
			SetNetworkIdExistsOnAllMachines(netid, true)
			NetworkSetNetworkIdDynamic(netid, true)
			SetNetworkIdCanMigrate(netid, false)
			AttachEntityToEntity(coffeespawned,GetPlayerPed(PlayerId()),GetPedBoneIndex(GetPlayerPed(PlayerId()), 28422),0.0,0.0,0.0,0.0,0.0,0.0,1,1,0,1,0,1)
			Wait(120)
			coffee_net = netid
			holdingcoffee = true
		end
	end
end, false)


------------- umbrella

RegisterCommand("umbrella",function(source, args)
	local ad1 = "amb@code_human_wander_drinking@beer@male@base"
	local ad1a = "static"
	local player = GetPlayerPed(-1)
	local plyCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -5.0)
	local umbspawned = CreateObject(GetHashKey(umbmodel), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)
	local netid = ObjToNet(umbspawned)

	if (DoesEntityExist(player) and not IsEntityDead(player)) then 
		loadAnimDict(ad1)
		RequestModel(GetHashKey(umbmodel))
		if holdingumb then
			Wait(100)
			ClearPedSecondaryTask(GetPlayerPed(-1))
			DetachEntity(NetToObj(umb_net), 1, 1)
			DeleteEntity(NetToObj(umb_net))
			umb_net = nil
			holdingumb = false
		else
			TaskPlayAnim(player, ad1, ad1a, 8.0, 1.0, -1, 49, 0, 0, 0, 0)
			Wait(500)
			SetNetworkIdExistsOnAllMachines(netid, true)
			NetworkSetNetworkIdDynamic(netid, true)
			SetNetworkIdCanMigrate(netid, false)
			AttachEntityToEntity(umbspawned,GetPlayerPed(PlayerId()),GetPedBoneIndex(GetPlayerPed(PlayerId()), 28422),0.0,0.0,0.0,0.0,0.0,0.0,1,1,0,1,0,1)
			Wait(120)
			umb_net = netid
			holdingumb = true
		end
	end
end, false)


------------- slowclap


RegisterCommand("clap",function(source, args)
	local clapping = false
	local ad = "anim@mp_player_intupperslow_clap"
	local ad2 = "amb@world_human_drinking@beer@male@exit"
	local ad2a = "exit"
	local player = GetPlayerPed( -1 )
	
	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
		loadAnimDict( ad )
		if clapping then 
			Wait (0)
		else
			TaskPlayAnim( player, ad, "idle_a", 8.0, 1.0, 5000, 49, 0, 0, 0, 0 )
			clapping = true
			Wait (5000)
			clapping = false
		end     
	end

	
end, false)



------------- ticket

RegisterCommand("ticket",function(source, args)
	local player = GetPlayerPed(-1)
	local plyCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -5.0)
	local padspawned = CreateObject(GetHashKey(padmodel), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)
	local netid = ObjToNet(padspawned)
	local ad = "amb@medic@standing@timeofdeath@enter"
	local ad2 = "amb@medic@standing@timeofdeath@base"
	local ad3 = "amb@medic@standing@timeofdeath@exit"
	local ad4 = "amb@medic@standing@timeofdeath@idle_a" -- use idle_b for anim(check watch)

	if (DoesEntityExist(player) and not IsEntityDead(player)) then ---------------------If playing then cancel
		loadAnimDict(ad)
		loadAnimDict(ad2)
		loadAnimDict(ad3)
		loadAnimDict(ad4)
		if holdingpad then
			TaskPlayAnim(player, ad3, "exit", 8.0, 1.0, -1, 50, 0, 0, 0, 0)
			Wait(5330)
			DetachEntity(NetToObj(pad_net), 1, 1)
			DeleteEntity(NetToObj(pad_net))
			Wait(2500)
			ClearPedSecondaryTask(GetPlayerPed(-1))
			pad_net = nil
			holdingpad = false
		else
			Wait(500) ---------------------if not playing, then play
			SetNetworkIdExistsOnAllMachines(netid, true)
			NetworkSetNetworkIdDynamic(netid, true)
			SetNetworkIdCanMigrate(netid, false)
			TaskPlayAnim( player, ad, "enter", 8.0, 1.0, -1, 50, 0, 0, 0, 0 )
			Wait (3000)																							--28422
			AttachEntityToEntity(padspawned,GetPlayerPed(PlayerId()),GetPedBoneIndex(GetPlayerPed(PlayerId()), 28422),0.0,0.0,0.0,0.0,360.0,0.0,1,1,0,1,0,1)
			Wait(1310)
			DetachEntity(NetToObj(pad_net), 1, 1)
			DeleteEntity(NetToObj(pad_net))
 			AttachEntityToEntity(padspawned,GetPlayerPed(PlayerId()),GetPedBoneIndex(GetPlayerPed(PlayerId()), 18905),0.1,0.0,0.0,360.0,360.0,0.0,1,1,0,1,0,1)
			-- Wait(120)
			Notification("Press ~r~[E]~w~ check the time.")
			pad_net = netid
			holdingpad = true
		end
	end

	while holdingpad do
		Wait(0)
		if IsControlJustPressed(0, 38) then
			Wait(500)
			TaskPlayAnim( player, ad4, "idle_b", 8.0, 1.0, -1, 50, 0, 0, 0, 0 )
		end
	end
end, false)


------------- mobile phone record

RegisterCommand("phoner",function(source, args)

	local player = GetPlayerPed(-1)
	local plyCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -5.0)
	local phoneRspawned = CreateObject(GetHashKey(phoneRmodel), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)
	local netid = ObjToNet(phoneRspawned)
	local ad = "amb@world_human_mobile_film_shocking@male@enter"
	local ad2 = "amb@world_human_mobile_film_shocking@male@base"
	local ad3 = "amb@world_human_mobile_film_shocking@male@exit"
	local pd = "core" 
	local pn = "ent_anim_paparazzi_flash"

	if (DoesEntityExist(player) and not IsEntityDead(player)) then ---------------------If playing then cancel
		loadAnimDict(ad)
		loadAnimDict(ad2)
		loadAnimDict(ad3)
		RequestPtfxAsset(pd)
		RequestModel(GetHashKey(phoneRmodel))
		if holdingphoneR then
			TaskPlayAnim(player, ad3, "exit", 8.0, 1.0, -1, 50, 0, 0, 0, 0)
			Wait(1840)
			DetachEntity(NetToObj(phoneR_net), 1, 1)
			DeleteEntity(NetToObj(phoneR_net))
			Wait(750)
			ClearPedSecondaryTask(GetPlayerPed(-1))
			phoneR_net = nil
			holdingphoneR = false
		else
			Wait(500) ---------------------if not playing, then play
			SetNetworkIdExistsOnAllMachines(netid, true)
			NetworkSetNetworkIdDynamic(netid, true)
			SetNetworkIdCanMigrate(netid, false)
			TaskPlayAnim( player, ad, "enter", 8.0, 1.0, -1, 50, 0, 0, 0, 0 )
			Wait (1260)
			AttachEntityToEntity(phoneRspawned,GetPlayerPed(PlayerId()),GetPedBoneIndex(GetPlayerPed(PlayerId()), 28422),-0.005,0.0,0.0,360.0,360.0,0.0,1,1,0,1,0,1)
			-- Wait(1310)
 			-- TaskPlayAnim( player, ad2, "base", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
			-- Wait(120)
			phoneR_net = netid
			holdingphoneR = true
		end
	end

	while holdingphoneR do
		Wait(0)
		if IsControlJustPressed(0, 38) then
			Wait(500)
			UseParticleFxAssetNextCall(pd)
			StartParticleFxNonLoopedOnEntity(pn, phoneRspawned, 0.0	, 0.1, 0.0, 0.0, 0.0, 0.0, 2.0, 0.0, 0.0, 0.0)
		end
	end
end, false)

-----------  BongRips

RegisterCommand("bong",function(source, args)
	local ad1 = "anim@safehouse@bong"
	local ad1a = "bong_stage1"
	local player = GetPlayerPed(-1)
	local plyCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -5.0)
	local bongspawned = CreateObject(GetHashKey(bongmodel), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)
	local netid = ObjToNet(bongspawned)

	if (DoesEntityExist(player) and not IsEntityDead(player)) then 
		loadAnimDict(ad1)
		RequestModel(GetHashKey(bongmodel))
		if holdingbong then
			Wait(100)
			ClearPedSecondaryTask(GetPlayerPed(-1))
			DetachEntity(NetToObj(bong_net), 1, 1)
			DeleteEntity(NetToObj(bong_net))
			bong_net = nil
			holdingbong = false
		else
			Wait(500)
			SetNetworkIdExistsOnAllMachines(netid, true)
			NetworkSetNetworkIdDynamic(netid, true)
			SetNetworkIdCanMigrate(netid, false)
			AttachEntityToEntity(bongspawned,GetPlayerPed(PlayerId()),GetPedBoneIndex(GetPlayerPed(PlayerId()), 18905),0.10,-0.25,0.0,95.0,190.0,180.0,1,1,0,1,0,1)
			Wait(120)
			Notification("Press ~r~[E]~w~ to take a hit.")
			bong_net = netid
			holdingbong = true
		end
	end

	while holdingbong do
		Wait(0)
		local plyCoords2 = GetEntityCoords(player, true)
		local head = GetEntityHeading(player)
		if IsControlJustPressed(0, 38) then
			TaskPlayAnimAdvanced(player, ad1, ad1a, plyCoords2.x, plyCoords2.y, plyCoords2.z, 0.0, 0.0, head, 8.0, 1.0, 4000, 49, 0.25, 0, 0)
			Wait(100)
			Wait(7250)
			TaskPlayAnim(player, ad2, ad2a, 8.0, 1.0, -1, 49, 0, 0, 0, 0)
		end
	end
end, false)

---------------------------------------Salute Anim 



RegisterCommand("salute",function(source, args)

	local ad = "anim@mp_player_intuppersalute"
	local player = GetPlayerPed( -1 )
	
	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
		loadAnimDict( ad )
		if ( IsEntityPlayingAnim( player, ad, "idle_a", 3 ) ) then 
			TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
			Wait (600)
			ClearPedSecondaryTask(GetPlayerPed(-1))
		else
			TaskPlayAnim( player, ad, "idle_a", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
			Wait (500)
		end     
	end
end, false)

--------------------------------2 Middle Fingers

RegisterCommand("bird2",function(source, args)

	local ad = "anim@mp_player_intupperfinger"
	local player = GetPlayerPed( -1 )
	
	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
		loadAnimDict( ad )
		if ( IsEntityPlayingAnim( player, ad, "idle_a", 3 ) ) then 
			TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
			Wait (100)
			ClearPedSecondaryTask(GetPlayerPed(-1))
		else
			TaskPlayAnim( player, ad, "idle_a", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
			Wait (500)
		end     
	end
end, false)

------------------------Facepalm

RegisterCommand("palm",function(source, args)

	local ad = "anim@mp_player_intupperface_palm"
	local player = GetPlayerPed( -1 )
	
	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
		loadAnimDict( ad )
		if ( IsEntityPlayingAnim( player, ad, "idle_a", 3 ) ) then 
			TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
			Wait (100)
			ClearPedSecondaryTask(GetPlayerPed(-1))
		else
			TaskPlayAnim( player, ad, "idle_a", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
			Wait (500)
		end     
	end
end, false)

----------------------- One middle Finger


RegisterCommand("bird",function(source, args)

	local ad = "anim@mp_player_intselfiethe_bird"
	local player = GetPlayerPed( -1 )
	
	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
		loadAnimDict( ad )
		if ( IsEntityPlayingAnim( player, ad, "idle_a", 3 ) ) then 
			TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
			Wait (100)
			ClearPedSecondaryTask(GetPlayerPed(-1))
		else
			TaskPlayAnim( player, ad, "idle_a", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
			Wait (500)
		end     
	end
end, false)


--------------------Crowd Control
local control = false
local control2 = false
RegisterCommand("icrowd",function(source, args)


	local ad1 = "amb@code_human_police_crowd_control@base" -- only anim in ad -> "base"

	local ad2 = "amb@code_human_police_crowd_control@idle_a"
	local ad2a = "idle_a"
	local ad2b = "idle_b"
	local ad2c = "idle_c"

	local ad3 = "amb@code_human_police_crowd_control@idle_b"
	local ad3d = "idle_d"
	local ad3e = "idle_e"
	local ad3f = "idle_f"

	local adex = "anim@mp_player_intselfiethe_bird" --what im using to exit the anim

	local player = GetPlayerPed(-1)

	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
		loadAnimDict( ad1 )
		loadAnimDict( ad2 )
		loadAnimDict( ad3 )
		loadAnimDict( adex )
		if ( IsEntityPlayingAnim( player, ad1, "base", 3 ) ) then 
			--TaskPlayAnim( player, adex, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
			Wait (100)
			ClearPedSecondaryTask(GetPlayerPed(-1))
			control = false
		else
			TaskPlayAnim( player, ad1, "base", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
			Wait (500)
			Notification("Press ~r~[E]~w~ to control the crowd!")
			control = true
		end     
	end


	local conAnimRnd = math.random(1, 3)
	local conAnim2Rnd = math.random(1, 3)
	local connotiRnd = math.random(1, 1)

	local conAnim = {
		ad2a,
		ad2b,
		ad2c
	}

	local conAnim2 = {
		ad3d,
		ad3e,
		ad3f
	}

	local connoti = {
		"Controlling Situation..."
	}

	local fin = false
	while control do
		Wait(0)
		if IsControlJustPressed(0, 38) then
			Wait(100)
			Notification(connoti[connotiRnd])
			Wait(100)

			if connotiRnd <= 3 then
				TaskPlayAnim(player, ad2, conAnim[conAnimRnd], 8.0, -8.0, -1, 50, 0, 0, 0, 0)
			elseif connotiRnd >= 4 then
				TaskPlayAnim(player, ad3, conAnim2[conAnim2Rnd], 8.0, -8.0, -1, 50, 0, 0, 0, 0)
				if IsEntityPlayingAnim(player, ad2, ad2a, 3) then
					Wait(11000)
					fin = true
				elseif IsEntityPlayingAnim(player, ad2, ad2b, 3) then
					Wait(13000)
					fin = true
				elseif IsEntityPlayingAnim(player, ad2, ad2c, 3) then
					Wait(5050)
					fin = true
				elseif IsEntityPlayingAnim(player, ad3, ad3d, 3) then
					Wait(10900)
					fin = true
				elseif	IsEntityPlayingAnim(player, ad3, ad3e, 3) then
					Wait(9750)
					fin = true
				elseif IsEntityPlayingAnim(player, ad3, ad3f, 3) then
					Wait(8000)
					fin = true
				end
				if fin then
					TaskPlayAnim(player, ad1, "base", 8.0, -8, -1, 49, 0, 0, 0, 0)
					Wait(1000)
					fin = false
				end
			end
		end
	end
end, false)


----------------------------------------------------------------------------------------------------------------------------
------------------------------------------------ functions -----------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
function Notification(message)  --- default gta notification
	SetNotificationTextEntry("STRING")
	AddTextComponentString(message)
	DrawNotification(0, 0)
end

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do 
		RequestAnimDict(dict)
		Citizen.Wait(5)
	end
end

function DrawMissionText2(m_text, showtime) --subtitles
	ClearPrints()
	SetTextEntry_2("STRING")
	AddTextComponentString(m_text)
	DrawSubtitleTimed(showtime, 1)
end

function GetCoords()
	GetEntityCoords(GetPlayerPed(-1))
end

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/emotes', 'Displays a list of interactive animations.')
end)

----------------------------------------------------------------------------------------------------------------------------
------------------------------------------------ ADDITIONAL EMOTES -----------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------


local emotes = {}
emotes['cop'] = {name = 'cop', anim = 'WORLD_HUMAN_COP_IDLES'}
emotes['binoculars'] = {name = 'binoculars', anim = 'WORLD_HUMAN_BINOCULARS'}
emotes['cheer'] = {name = 'cheer', anim = 'WORLD_HUMAN_CHEERING'}
emotes['drink'] = {name = 'drink', anim = 'WORLD_HUMAN_DRINKING'}
emotes['film'] = {name = 'film', anim = 'WORLD_HUMAN_MOBILE_FILM_SHOCKING'}
emotes['plant'] = {name = 'plant', anim = 'WORLD_HUMAN_GARDENER_PLANT'}
emotes['guard'] = {name = 'guard', anim = 'WORLD_HUMAN_GUARD_STAND'}
emotes['hammer'] = {name = 'hammer', anim = 'WORLD_HUMAN_HAMMERING'}
emotes['hangout'] = {name = 'hangout', anim = 'WORLD_HUMAN_HANG_OUT_STREET'}
emotes['hiker'] = {name = 'hiker', anim = 'WORLD_HUMAN_HIKER_STANDING'}
emotes['statue'] = {name = 'statue', anim = 'WORLD_HUMAN_HUMAN_STATUE'}
emotes['jog'] = {name = 'jog', anim = 'WORLD_HUMAN_JOG_STANDING'}
emotes['lean'] = {name = 'lean', anim = 'WORLD_HUMAN_LEANING'}
emotes['flex'] = {name = 'flex', anim = 'WORLD_HUMAN_MUSCLE_FLEX'}
emotes['camera'] = {name = 'camera', anim = 'WORLD_HUMAN_PAPARAZZI'}
emotes['sit'] = {name = 'sit', anim = 'WORLD_HUMAN_PICNIC'}
emotes['sitchair'] = {name = 'sitchair', anim = 'PROP_HUMAN_SEAT_CHAIR_MP_PLAYER'}
emotes['hoe'] = {name = 'hoe', anim = 'WORLD_HUMAN_PROSTITUTE_HIGH_CLASS'}
emotes['hoe2'] = {name = 'hoe2', anim = 'WORLD_HUMAN_PROSTITUTE_LOW_CLASS'}
emotes['pushups'] = {name = 'pushups', anim = 'WORLD_HUMAN_PUSH_UPS'}
emotes['situps'] = {name = 'situps', anim = 'WORLD_HUMAN_SIT_UPS'}
emotes['fish'] = {name = 'fish', anim = 'WORLD_HUMAN_STAND_FISHING'}
emotes['impatient'] = {name = 'impatient', anim = 'WORLD_HUMAN_STAND_IMPATIENT'}
emotes['diggit'] = {name = 'diggit', anim = 'WORLD_HUMAN_STRIP_WATCH_STAND'}
emotes['sunbath'] = {name = 'sunbath', anim = 'WORLD_HUMAN_SUNBATHE_BACK'}
emotes['sunbath2'] = {name = 'sunbath2', anim = 'WORLD_HUMAN_SUNBATHE'}
emotes['weld'] = {name = 'weld', anim = 'WORLD_HUMAN_WELDING'}
emotes['yoga'] = {name = 'yoga', anim = 'WORLD_HUMAN_YOGA'}
emotes['kneel'] = {name = 'kneel', anim = 'CODE_HUMAN_MEDIC_KNEEL'}
emotes['crowdcontrol'] = {name = 'crowdcontrol', anim = 'CODE_HUMAN_POLICE_CROWD_CONTROL'}
emotes['investigate'] = {name = 'investigate', anim = 'CODE_HUMAN_POLICE_INVESTIGATE'}

playing_emote = false

local Keys = { ["W"] = 32, ["A"] = 34, ["S"] = 8, ["D"] = 9 }

RegisterCommand('e', function(source, args)
	ped = GetPlayerPed(-1)
	name = args[1]
	if emotes[name] then
		if playing_emote == false then
			if emotes[name].name == "sitchair" then
				pos = GetEntityCoords(ped)
				head = GetEntityHeading(ped)
				TaskStartScenarioAtPosition(ped, emotes[name].anim, pos['x'], pos['y'], pos['z'] - 1, head, 0, 0, false)
			else
				TaskStartScenarioInPlace(ped, emotes[name].anim, 0, true)
			end
			playing_emote = true
		end
	end
	print(args[1])
end)

RegisterCommand('showEmotes', function(source, args)
	TriggerEvent('chatMessage', "^2Emotes", {255, 0, 0}, " (Example: /e sit)")
	local emoteslist = ""
	for k in pairs(emotes) do
		emoteslist = k .. " ".. emoteslist
	end
	TriggerEvent('chatMessage', "", {255, 0, 0}, emoteslist)
end)

Citizen.CreateThread(function()
	while true do
        Citizen.Wait(0)
		if playing_emote == true then
			if IsControlPressed(1, Keys["W"]) or IsControlPressed(1, Keys["A"]) or IsControlPressed(1, Keys["S"]) or IsControlPressed(1, Keys["D"])  then
				ClearPedTasks(ped)
				playing_emote = false
			end
		end
    end
end)
