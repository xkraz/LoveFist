local JTL = JAM.TunerLaptop
local JNotify = JAM.Notify

function JTL:Start()
	if not self then return; end
	while not ESX do Citizen.Wait(100); end
	self.ESX = ESX
	while not ESX.IsPlayerLoaded() do Citizen.Wait(100); end
	while not JUtils do Citizen.Wait(100); end 
	while not JNotify do Citizen.Wait(100); end

	local txd = CreateRuntimeTxd(self.TextureDict)
	CreateRuntimeTextureFromImage(txd, "laptop", "JAM_TunerLaptop/Laptop.PNG")

	print("JAM_TunerLaptop:Start() - Successful")
	self.Started = true
	self:Update()
end

function JTL:Update()
	if not self or not self.Started then return; end
	local timer = GetGameTimer()
	while true do
		Citizen.Wait(0)
		self.tick = (self.tick or 0) + 1
		local inVeh = IsPedInAnyVehicle(GetPlayerPed(-1), false)
		if self.Tuneables then
			if (IsControlJustPressed(0, JUtils.Keys["G"])  or IsDisabledControlJustPressed(0, JUtils.Keys["G"]))  then self:CloseLaptop(); end	
			if self.SelectedTuneable then
				if self.SelectedTuneable.curText.colour2 ~= 0 then				
					self.SelectedTuneable.curText.colour1 = 255
					self.SelectedTuneable.curText.colour2 = 0
					self.SelectedTuneable.curText.colour3 = 0
					self.SelectedTuneable.curText.colour4 = 255
				end

				if (IsControlJustPressed(0, JUtils.Keys["LEFT"])  or IsDisabledControlJustPressed(0, JUtils.Keys["LEFT"]))  then self:TuneableHandler(-1,  0); end			
				if (IsControlJustPressed(0, JUtils.Keys["RIGHT"]) or IsDisabledControlJustPressed(0, JUtils.Keys["RIGHT"])) then self:TuneableHandler( 1,  0); end

				if (IsControlPressed(0, JUtils.Keys["LEFTSHIFT"]) or IsDisabledControlPressed(0, JUtils.Keys["LEFTSHIFT"])) then
					if (IsControlPressed(0, JUtils.Keys["UP"])    or IsDisabledControlPressed(0, JUtils.Keys["UP"]))    then self:TuneableHandler( 0,  1); end
					if (IsControlPressed(0, JUtils.Keys["DOWN"])  or IsDisabledControlPressed(0, JUtils.Keys["DOWN"]))  then self:TuneableHandler( 0, -1); end
				else
					if (IsControlJustPressed(0, JUtils.Keys["UP"])    or IsDisabledControlJustPressed(0, JUtils.Keys["UP"]))    then self:TuneableHandler( 0,  1); end
					if (IsControlJustPressed(0, JUtils.Keys["DOWN"])  or IsDisabledControlJustPressed(0, JUtils.Keys["DOWN"]))  then self:TuneableHandler( 0, -1); end
				end

			elseif not self.SelectedTuneable then
				if (self.Tuneables and type(self.Tuneables) == "table") and (self.TargetTune and type(self.TargetTune) == "table") and (self.TuneText and type(self.TuneText) == "table") then
					self.SelectedTuneable = { curTune = self.Tuneables[1], curTarget = self.TargetTune[1], curText = self.TuneText[1] }
				end
			end
		elseif inVeh then
			if not self.TunedPower then
				local plyPed = GetPlayerPed(-1)
				local plyVeh = GetVehiclePedIsUsing(plyPed)
				if plyVeh then
					local plyProp = ESX.Game.GetVehicleProperties(plyVeh)
					if self.tick % 100 == 0 then 
						ESX.TriggerServerCallback('JTL:GetVehicleBoost', function(boost) if boost then self.TunedPower = boost; end; end, plyProp.plate)
					end
				end
			end

			if self.TunedPower then	
				local plyPed = GetPlayerPed(PlayerId())
				local plyVeh = GetLastDrivenVehicle(plyPed, true)
				local engHp = GetVehicleEngineHealth(plyVeh)

				SetVehicleEnginePowerMultiplier(plyVeh, self.TunedPower + 0.0000001)

				if self.TunedPower < -30.0 then 
					--if GetVehicleFuelLevel(plyVeh) > 2.5 or GetVehicleFuelLevel(plyVeh) < 1.5 then SetVehicleFuelLevel(plyVeh, 2.0); end
					if engHp > 11.0 or engHp < 9.0 then SetVehicleEngineHealth(plyVeh, 10.0); end
					--if math.random(1, 10) > 8 then SetVehicleEngineHealth(plyVeh, 10.0); end--SimulatePlayerInputGait(plyPed, 1.0, 100, 1.0, 1, 0); end --TaskVehicleTempAction(plyPed, plyVeh, 9, 1); end
				elseif self.TunedPower < -15.0 then
					if engHp > 26.0 or engHp < 24.0 then SetVehicleEngineHealth(plyVeh, 25.0); end
					--if math.random(1, 10) > 8 then SetVehicleEngineHealth(plyVeh, 20.0); end--if GetVehicleFuelLevel(plyVeh) > 4.5 or GetVehicleFuelLevel(plyVeh) < 3.5 then SetVehicleFuelLevel(plyVeh, 4.0); end
				elseif self.TunedPower < -0.0 then
					if engHp > 51.0 or engHp < 49.0 then SetVehicleEngineHealth(plyVeh, 50.0); end
					--if math.random(1, 10) > 8 then SetVehicleEngineHealth(plyVeh, 30.0); end--if GetVehicleFuelLevel(plyVeh) > 5.5 or GetVehicleFuelLevel(plyVeh) < 4.5 then SetVehicleFuelLevel(plyVeh, 5.0); end
				end
			end
		elseif not inVeh and not self.SelectedTuneable then
			self.TunedPower = false
		end
	end
end

function JTL:TuneableHandler(x, y)
	if not self or not self.Started or not self.SelectedTuneable or type(self.SelectedTuneable) ~= "table" then return; end
	if (self.Tuneables and type(self.Tuneables) == "table") and (self.TargetTune and type(self.TargetTune) == "table") and (self.TuneText and type(self.TuneText) == "table") then
		local key		
		for k,v in pairs(self.TuneText) do
			if v == self.SelectedTuneable.curText then key = k; end
		end
		if x ~= 0 then
			if x > 0 then
				if key then 			
					if key < #self.TuneText then
						key = key + 1
					else key = 1; end
				end
			elseif x < 0 then
				if key then
					if key <= 1 then
						key = #self.TuneText
					else key = key - 1; end
				end
			end
			if key then 
				self.SelectedTuneable.curText.colour1 = 255
				self.SelectedTuneable.curText.colour2 = 255
				self.SelectedTuneable.curText.colour3 = 255
				self.SelectedTuneable.curText.colour4 = 255
				self.SelectedTuneable = { curTune = self.Tuneables[key], curTarget = self.TargetTune[key], curText = self.TuneText[key] }
			end
		end
		if y ~= 0 then
			if y > 0 then				
				self.SelectedTuneable.curTune = self.SelectedTuneable.curTune + 1.00
				self.SelectedTuneable.curText.text = self:ToDec(self.SelectedTuneable.curTune)
				self.Tuneables[key] = self.SelectedTuneable.curTune
			elseif y < 0 then
				self.SelectedTuneable.curTune = self.SelectedTuneable.curTune - 1.00
				self.SelectedTuneable.curText.text = self:ToDec(self.SelectedTuneable.curTune)
				self.Tuneables[key] = self.SelectedTuneable.curTune
			end
		end
	end
	self:PercCalc()
end

function JTL:ToDec(val)
	local valA = math.floor(val * 100)
	local valB = string.sub(tostring(valA), 1, 4)
	local valC = (tonumber(valB) / 100)
	return valC
end

function JTL:PercCalc()
	local difference = 0
	for k,v in pairs(self.Tuneables) do
		for key,val in pairs(self.TargetTune) do 
			local same = false
			if k == key then same = true; end
			if same then 
				local diff = 0.0
				if v > val then
					diff = v - val
				else diff = val - v; end

				diff = math.floor(diff * 1) / 1

				if diff < 1.0 and diff > -1.0 then  bonus = 2.0
				else bonus = 0.0; end

				if diff > 0.0 then diff = math.min(diff, 10.0)
				elseif diff < 0.0 then diff = diff + diff
				end

				difference = (difference - diff) + bonus
			end
		end
    end
    self.Percentage = 100.0 + difference
	self.PercentageText.text = self.Percentage .. "%"
end

function JTL:OpenLaptop()
	print("A")
	if not self or not self.Started then return; end
	print("B")
	Citizen.CreateThread(function(...) 
		if not HasStreamedTextureDictLoaded(self.TextureDict, false) then RequestStreamedTextureDict(self.TextureDict, false); end
		local plyId = PlayerId()
		local plyPed = GetPlayerPed(plyId)
		if not IsPedInAnyVehicle(plyPed, false) then 
			JNotify:DoNotify("You ~r~must ~s~be in a ~r~vehicle ~s~to use this.")
			return 
		end
		local plyVeh = GetVehiclePedIsIn(plyPed, false)
		if not plyVeh then return; end

		self.Tuneables = {
			[1] 	= math.random(  1,  10 )	/1, -- fuel
			[2] 	= math.random(  1,  10 )	/1, -- air
			[3] 	= math.random(  1,  10 )	/1, -- intake
			[4] 	= math.random(  1,  10 )	/1, -- exhaust
			[5] 	= math.random(  1,  10 )	/1, -- boost
		}
		self.TargetTune = {
			[1] 	= math.random(  1,  10 )	/1, -- fuel
			[2] 	= math.random(  1,  10 )	/1, -- air
			[3] 	= math.random(  1,  10 )	/1, -- intake
			[4] 	= math.random(  1,  10 )	/1, -- exhaust
			[5] 	= math.random(  1,  10 )	/1, -- boost
		}

		self.TuneText = {}	
		self.Percentage = 0.0	
		self.PercentageText = JUtils:DrawTextTemplate()			
		self.PercentageText.font = 4
		self.PercentageText.y = 0.35	
		self.PercentageText.x = 0.50
		self.PercentageText.scale1 = 1.00
		self.PercentageText.scale2 = 1.00
		self.PercentageText.text = self.Percentage .. "%"
		self:PercCalc()

		local adder = 0.084
		local startpos = 0.248

		for k,v in pairs(self.Tuneables) do	
			local template = JUtils:DrawTextTemplate()
			template.font = 4
			template.y = 0.521	
			template.x = (startpos + (adder * k))
			template.text = v
			self.TuneText[k] = template
		end

		FreezeEntityPosition(plyPed, true)
		while self.Tuneables do
			Citizen.Wait(0)
			--		 Texture Dictionary, Texture Name,    xPos,   yPos,  xSize,  ySize,  Heading,   R,   G,   B,   A,
			DrawSprite(self.TextureDict, 	 "laptop",    0.50,   0.50,   0.80,   0.80, 	 0.0, 255, 255, 255, 255)
			if self.PercentageText then JUtils:DrawText(self.PercentageText); end
			if self.TuneText then 
				for k,v in pairs(self.TuneText) do 
					JUtils:DrawText(v); 
				end
			end

			ClampGameplayCamYaw(0.0, 0.0)
			ClampGameplayCamPitch(0.0, 0.0)
			SetFirstPersonCamPitchRange(0.0, 0.0)
			DisableAllControlActions(0)
		end

		FreezeEntityPosition(plyPed, false)
		SetStreamedTextureDictAsNoLongerNeeded(self.TextureDict)
	end)
end

function JTL:CloseLaptop()
	if not self or not self.Started or not ESX or not JNotify then return; end

	local power = 50.0	
	if self.Percentage > 100.0 then	power = (self.Percentage - 100.0)
	else power = -(100.0 - self.Percentage); end

	local plyPed = GetPlayerPed(-1)
	local plyVeh = GetVehiclePedIsIn(plyPed, true)
	local vehProps = ESX.Game.GetVehicleProperties(plyVeh)

	ESX.TriggerServerCallback('JTL:SetVehicleBoost', function(valid)
		if valid then 
			if power > 0.0 then
				JNotify:DoNotify("You gained ~g~"..power.."~s~% power by tuning your engine correctly.") 
			else
				JNotify:DoNotify("You ~r~failed ~s~to tune your engine correctly, and suffer from ~r~"..power.."~s~% power loss.") 
			end
			self.TunedPower = power
		else JNotify:DoNotify("~r~You don't own this vehicle.")
		end
	end, power, vehProps.plate)

	self.Tuneables = false
	self.TargetTune = false
	self.TuneText = false
	self.SelectedTuneable = false
	self.Percentage = false
	self.PercentageText = false
end

RegisterNetEvent('JAM_TunerLaptop:TuneVehicle')
AddEventHandler('JAM_TunerLaptop:TuneVehicle', function(...) JTL:OpenLaptop(...); end)

Citizen.CreateThread(function(...) JTL:Start(...); end)