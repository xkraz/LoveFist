local sounds = {}

function _addSound(loc,_minn,_maxx,_sound,_length,_loop)
  local location = loc
  local sound = _sound
  local _min = _minn
  local _max = _maxx
  local length = _length
  local loop = _loop
  table.insert(sounds,{ID = math.floor(location.x*100)..math.floor(location.y*100),playing = false,location = location,_min = _min,_max = _max,sound = sound,length = length,loop = _loop,startTime = 0,played = false})
end
function _addSoundOn(_entt,_minn,_maxx,_sound,_length,_loop)
  local _enttc = GetEntityCoords(_entt)
  local sound = _sound
  local _min = _minn
  local _max = _maxx
  local length = _length
  local loop = _loop
  table.insert(sounds,{ID = math.floor(_enttc.x*100)..math.floor(_enttc.y*100),playing = false,location = _enttc,_min = _min,_max = _max,sound = sound,length = length,loop = _loop,startTime = 0,played = false,entity = _entt})
end

Citizen.CreateThread(function()
  local volume
  local wasPlaying = false
  local lastVol = {}
  while true do
    local lc = GetEntityCoords(GetPlayerPed(PlayerId()))
    for k,v in pairs(sounds) do
      if not v.playing and not v.played then
        if v.entity ~= nil then
          v.location = GetEntityCoords(v.entity)
        end
        local dist  = Vdist(lc.x, lc.y, lc.z, v.location.x, v.location.y, v.location.z)

        if dist < v._min then
          volume = 1.0
        elseif dist > v._max then
          volume = 0.0
        else
          volume =  math.floor(100 - ((dist - v._min)*100)/(v._max - v._min))/100
        end
        SendNUIMessage({
            playerID = '' .. v.ID,
            transactionType     = 'playSound',
            transactionFile     = v.sound,
            volume   = volume * _volumes[v.sound]
        })
        lastVol[v.ID] = volume
        v.startTime = GetGameTimer()
        v.playing = true
        v.played = true
      end
      if v.playing then
        if GetGameTimer() - v.startTime <= v.length then
          if v.entity ~= nil then
            v.location = GetEntityCoords(v.entity)
          end
          local dist  = Vdist(lc.x, lc.y, lc.z, v.location.x, v.location.y, v.location.z)
          if dist < v._min then
            volume = 1.0
          elseif dist > v._max then
            volume = 0.0
          else
            volume =  math.floor(100 - ((dist - v._min)*100)/(v._max - v._min))/100
          end
          volume = volume * _volumes[v.sound]

          --drawTxt(0.4, 0.14, 1.0,1.0,0.4, math.floor(dist) .. ' away, volume: ' .. volume, 255, 255, 255, 255)
          if volume ~= lastVol[v.ID] and not (dist > v._max) then
            SendNUIMessage({
                playerID = '' .. v.ID,
                transactionType     = 'setVolume',
                volume   = volume
            })
            lastVol[v.ID] = volume
          end

        else
          v.playing = false
        end
      elseif v.playing == false and v.played then
        if v.loop then
          v.playing = false
          v.played = false
          v.startTime = GetGameTimer()
          TriggerServerEvent('dbug', 'PlaySound:SoundsLoop:RESTART: ' .. v.startTime)
        else
          TriggerServerEvent('dbug', 'PlaySound:SoundsLoop:KillSound:IN ' ..GetGameTimer() - v.startTime .. ', ' .. v.length)
          v.playing = false
          SendNUIMessage({
              playerID = '' .. v.ID,
              transactionType     = 'stop'
          })
          table.remove(sounds,k)
          TriggerServerEvent('dbug', 'PlaySound:SoundsLoop:KillSound:OUT ' .. #sounds)
        end
      end
    end
    Citizen.Wait(10)
  end
end)

RegisterCommand('play',  function(source, args)
  if args[1] ~= nil then
    if args[1] == 'list' then
      local txt = ''
      for k,v in pairs(_sounds) do
        if k ~= _sounds[#sounds] then
          txt = txt .. k ..', '
        else
          txt = txt .. k ..'.'
        end
      end
      TriggerEvent("chatMessage", "", {190,190,190},txt) -- Displaying the emotes in grey
      TriggerEvent("chatMessage", "", {255,0,0}, "Plays a sounds on your end at your location to see the diffrent sounds.")
    else
      TriggerEvent('PlaySoundAt',GetEntityCoords(PlayerPedId()),5,10,args[1])
    end
  end
end)

_sounds = {
  bankAlarm = 11980,
  item_chips = 1320,
  item_cuffs = 1700,
  ambient_farm = 16620,
  ambient_hawk = 3700,
  ambient_siren = 7500
}
_volumes = {
  bankAlarm = 0.7,
  item_chips = 1.0,
  item_cuffs = 1.0,
  ambient_farm = 0.5,
  ambient_hawk = 1.0,
  ambient_siren = 0.7
}

RegisterNetEvent('PlayLoopAt')
AddEventHandler('PlayLoopAt', function(loc, _min, _max, soundFile)
  for k,v in pairs(_sounds) do
    if soundFile == k then
      TriggerServerEvent('dbug', 'PlayLoopAt| ' .. math.floor(loc.x*100)..', '..math.floor(loc.y*100))
      _addSound(loc, _min, _max, soundFile, v, true)
    end
  end
end)

RegisterNetEvent('PlayLoopOn')
AddEventHandler('PlayLoopOn', function(_ent, _min, _max, soundFile)
  for k,v in pairs(_sounds) do
    if soundFile == k then
      TriggerServerEvent('dbug', 'PlayLoopOn| ' .. _ent)
      _addSoundOn(_ent, _min, _max, soundFile, v, true)
    end
  end
end)

RegisterNetEvent('PlayLoopFor')
AddEventHandler('PlayLoopFor', function(loc, _min, _max, soundFile, loopLength)
      for k,v in pairs(_sounds) do
        if soundFile == k then
          TriggerServerEvent('dbug', 'PlayLoopAt| ' .. math.floor(loc.x*100)..', '..math.floor(loc.y*100))
          _addSound(loc, _min, _max, soundFile, v, true)
        end
      end
      Citizen.CreateThread(function()
      Citizen.Wait(loopLength)
      TriggerServerEvent('dbug','PlayLoopFor|STOP| ' .. math.floor(loc.x*100)..', '..math.floor(loc.y*100))
      TriggerEvent('StopLoopAt', loc)
    end)
end)

RegisterNetEvent('StopLoopAt')
AddEventHandler('StopLoopAt', function(loc)
  for k,v in pairs(sounds) do
    if v.location == loc then
      TriggerServerEvent('dbug','StopLoopAt| ' .. math.floor(loc.x*100)..', '..math.floor(loc.y*100)..', '.. v.ID)
      v.loop = false
    end
  end
end)

RegisterNetEvent('StopLoopAll')
AddEventHandler('StopLoopAll', function()
  for k,v in pairs(sounds) do
      TriggerServerEvent('dbug','StopLoop| ' .. v.ID)
      v.startTime = GetGameTimer()
      v.loop = false
  end
end)

RegisterNetEvent('PlaySoundAt')
AddEventHandler('PlaySoundAt', function(loc, _min, _max, soundFile, soundLength)
  for k,v in pairs(_sounds) do
    if soundFile == k then
      TriggerServerEvent('dbug', 'PlaySoundAt| ' .. math.floor(loc.x*100)..', '..math.floor(loc.y*100))
      _addSound(loc, _min, _max, soundFile, v, false)
    end
  end
end)

RegisterNetEvent('PlaySoundFor')
AddEventHandler('PlaySoundFor', function(loc, _min, _max, soundFile, soundLength, loopLength)
  for k,v in pairs(_sounds) do
    if soundFile == k then
      TriggerServerEvent('dbug', 'PlaySoundFor| ' .. math.floor(loc.x*100)..', '..math.floor(loc.y*100))
      _addSound(loc, _min, _max, soundFile, v, true)
    end
  end
end)

function drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
	    SetTextOutline()
	end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y+ 0.005)
end
