local JDNA = JAM.DNATracker

function JDNA:Start()
	if not self then return; end
	while not ESX do Wait(1000); end
	while not ESX.IsPlayerLoaded() do Wait(1000); end
	while not JUtils do Wait(1000); end

	self.CurJob = ESX.GetPlayerData().job.label
	--print("JAM_DNATracker:Start() -- Successful")
	Citizen.CreateThread(function(...) self:Update(...); end)
	Citizen.CreateThread(function(...) self:PositionUpdate(...); end)
end

function JDNA:PositionUpdate()
	Citizen.Wait(5000)
	local tick = 0
	while true do
		Citizen.Wait(0)
		tick = tick + 1
		if tick % 200 == 0 then ESX.TriggerServerCallback('JAM_DNATracker:GetJob', function(job) self.CurJob = job.label; end); end
		if self.CurJob == self.AmbulanceJob or self.CurJob == self.PoliceJob then
			local plyPed = GetPlayerPed(-1)
			local plyPos = GetEntityCoords(plyPed)
			local distA = JUtils:GetVecDist(plyPos, self.AmmoAnalyzePos)
			local distB = JUtils:GetVecDist(plyPos, self.DNAAnalyzePos)
			local drawing = false
			if distA and distA < self.DrawTextDist then
				drawing = "ammo"
				self:DrawText3D(self.AmmoAnalyzePos.x,self.AmmoAnalyzePos.y,self.AmmoAnalyzePos.z, "Press [~g~E~s~] to analyze ammo casings.")
			elseif distB and distB < self.DrawTextDist then
				drawing = "blood"
				self:DrawText3D(self.DNAAnalyzePos.x,self.DNAAnalyzePos.y,self.DNAAnalyzePos.z, "Press [~g~E~s~] to analyze DNA.")
			end
			if drawing then
				if (IsControlJustPressed(0, JUtils.Keys["E"]) or IsDisabledControlJustPressed(0, JUtils.Keys["E"])) then
					if drawing == "ammo" then TriggerEvent('JAM_DNATracker:AnalyzeAmmo')
					elseif drawing == "blood" then TriggerEvent('JAM_DNATracker:AnalyzeDNA')
					end
				end
			end
		end
	end
end

function JDNA:Update()
	Citizen.Wait(5000)
	local startHealth = GetEntityHealth(GetPlayerPed(-1))
	self.timer = GetGameTimer()
	local tick = 0
	while true do
		Citizen.Wait(0)
		tick = tick + 1
		local plyPed = GetPlayerPed(-1)
		local plyHealth = GetEntityHealth(plyPed)
		local plyShooting = IsPedShooting(plyPed)

		if plyHealth > startHealth then 
			startHealth = plyHealth 
		end

		if plyHealth < startHealth then
			startHealth = plyHealth
			self:TakeDamage(plyPed)
		end

		if plyShooting then
			self:PlayerShooting(plyPed)
		end

		if self.SpawnedObjs then
			self:HandleObjects(timer)
		end

		if self.CurDNA and #self.CurDNA > 0 then
			if tick % 100 == 1 then
				self:GetClosest(plyPed)
			end
			self:HandleDrawText(plyPed)			
		end
	end
end

function JDNA:GetClosest(plyPed)
	if self.CurJob == self.AmbulanceJob or self.CurJob == self.PoliceJob then
		local closest,closestDist
		for k,v in pairs(self.CurDNA) do
			if v and type(v) ~= "boolean" then
				local dist = JUtils:GetVecDist(GetEntityCoords(plyPed),v.pos)
				if not closestDist or dist < closestDist then
					closest = v
					closestDist = dist
				end
			end
		end
		self.Closest = closest or false
		self.ClosestDist = closestDist or false
	else
		self.Closest = false
		self.ClosestDist = false
	end
end

function JDNA:HandleDrawText(plyPed)
	local closest = self.Closest or false
	local closestDist = self.ClosestDist or false	

	if closestDist and closestDist < 5.0 then
		local str = ''
		if closest.obj == self.BloodObject then str = "[ ~r~DNA~s~ ] : Human Blood : Press [~r~ E ~s~] to take sample." else str = "[ ~r~EVIDENCE ~s~] : Bullet Casing : Press [~r~ E ~s~] to pick up."; end 
		self:DrawText3D(closest.pos.x,closest.pos.y,closest.pos.z + 1.0, str)
		if (IsControlJustPressed(1, JUtils.Keys["E"]) or IsDisabledControlJustPressed(0, JUtils.Keys["E"])) and (GetGameTimer() - self.timer) > 150 then
			self.timer = GetGameTimer()
			ESX.TriggerServerCallback('JAM_DNATracker:PickupEvidenceS', function(canPickup)
				if not canPickup then ESX.ShowNotification("You can't pick up any more of these.")
				else
					if closest.obj == self.BloodObject then self.CurBlood = closest
					elseif closest.obj == self.ResidueObject then self.CurBullet = closest
					end
				end
			end, closest)
		end
	end
end

JDNA.Age = 1
JDNA.DeathAge = 1
function JDNA:HandleObjects()
	if not self.CurPlacing then
		if (self.Age - self.DeathAge) > self.MaxObjCount then
			SetEntityAsMissionEntity(self.SpawnedObjs[self.DeathAge],false,false)
			DeleteObject(self.SpawnedObjs[self.DeathAge])
			self.CurDNA[self.DeathAge] = false
			self.SpawnedObjs[self.DeathAge] = false
			self.DeathAge = self.DeathAge + 1
		end
	end
end

function JDNA:PickupEvidence(evidence)
	if not self or not self.CurDNA then return; end
	for k,v in pairs(self.CurDNA) do
		if v and v.pos and evidence and evidence.pos then
			if v.pos == evidence.pos then
				DeleteObject(v.go)
				table.remove(self.CurDNA,k)
			end
		end
	end
end

RegisterNetEvent('JAM_DNATracker:PickupEvidenceC')
AddEventHandler('JAM_DNATracker:PickupEvidenceC', function(evidence) JDNA:PickupEvidence(evidence); end)

function JDNA:TakeDamage(ped)
	if not self or not ped or self.TakingDamage then return; end
	self.TakingDamage = true
	local plyPos = GetEntityCoords(ped)
	local found,newZ = GetGroundZFor_3dCoord(plyPos.x,plyPos.y,plyPos.z,newZ,false)
	local newPos = vector3(plyPos.x,plyPos.y,newZ - 0.2)
	TriggerServerEvent('JAM_DNATracker:PlaceEvidenceS', newPos, self.BloodObject)
	self.TakingDamage = false
end

function JDNA:PlayerShooting(ped)
	if not self or not ped or self.IsShooting then return; end
	self.IsShooting = true
	local plyPos = GetEntityCoords(ped)
	local pedWeapon = GetSelectedPedWeapon(ped) 
	if pedWeapon < 0 then pedWeapon = pedWeapon%0x100000000; end
	local weapon,weaponType
	for weaType,val in pairs(JUtils.Weapons) do
		for _,weaModel in pairs(val) do
			if JUtils.GetHashKey(weaModel) == pedWeapon then weapon = weaModel; weaponType = weaType end
		end
	end
	local found,newZ = GetGroundZFor_3dCoord(plyPos.x,plyPos.y,plyPos.z,newZ,false)
	local newPos = vector3(plyPos.x,plyPos.y,newZ)
	TriggerServerEvent('JAM_DNATracker:PlaceEvidenceS', newPos, self.ResidueObject, weapon, weaponType)
	self.IsShooting = false
end

RegisterNetEvent('JAM_DNATracker:AnalyzeDNA')
AddEventHandler('JAM_DNATracker:AnalyzeDNA', function()
	local self = JDNA
	if not self.CurDNA or not self.CurBlood or not ESX then return; end
	local street,crossing = GetStreetNameAtCoord(self.CurBlood.pos.x,self.CurBlood.pos.y,self.CurBlood.pos.z)
	local elements = {
		[1] = { label = "Name: " .. self.CurBlood.name},
		[2] = { label = "Type: Blood" },
		[3] = { label = "Street: "..GetStreetNameFromHashKey(street) },
		[4] = { label = "Loc: [ X : " .. math.floor(self.CurBlood.pos.x) .. " ] [ Y : " .. math.floor(self.CurBlood.pos.y) .. "] : [ Z : " .. math.floor(self.CurBlood.pos.z).." ]"},
	}
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), "Blood_Info", { title = "DNA Analyzer", align = 'top', elements = elements }, 
		function(data,menu)
			menu.close()
			ESX.UI.Menu.CloseAll()					
		end,		
		function(data,menu)
			menu.close()
			ESX.UI.Menu.CloseAll()
		end
	)
end)

RegisterNetEvent('JAM_DNATracker:AnalyzeAmmo')
AddEventHandler('JAM_DNATracker:AnalyzeAmmo', function()
	local self = JDNA
	if not self.CurBullet or not self.CurBullet.wea or not ESX then return; end

	local st,fn = string.find(self.CurBullet.wea, "WEAPON_")
	local newStr = string.lower(string.sub(self.CurBullet.wea,fn+1))
	newStr = newStr:sub(1,1):upper()..newStr:sub(2)
	local street,crossing = GetStreetNameAtCoord(self.CurBullet.pos.x,self.CurBullet.pos.y,self.CurBullet.pos.z)

	local elements = {
		[1] = { label = "Weapon: " .. newStr},
		[2] = { label = "Type: " .. self.CurBullet.weaType },
		[3] = { label = "Street: "..GetStreetNameFromHashKey(street) },
		[4] = { label = "Loc: [ X : " .. math.floor(self.CurBullet.pos.x) .. " ] : [ Y : " .. math.floor(self.CurBullet.pos.y) .. "] : [ Z : " .. math.floor(self.CurBullet.pos.z).." ]"},
	}
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), "AnalyzeAmmo", { title = "Ammo Analyzer", align = 'top', elements = elements }, 
		function(data,menu)
			menu.close()
			ESX.UI.Menu.CloseAll()					
		end,		
		function(data,menu)
			menu.close()
			ESX.UI.Menu.CloseAll()
		end
	)
end)

RegisterNetEvent('JAM_DNATracker:PlaceEvidenceC')
AddEventHandler('JAM_DNATracker:PlaceEvidenceC', function(pos, obj, name, weapon, weaponType)
	if not ESX then return; end
	if not ESX.IsPlayerLoaded() then return; end
	JDNA.CurPlacing = true

	local plyPed = GetPlayerPed(-1)
	local plyJob = (JDNA.CurJob or false)

	if obj == JDNA.BloodObject and plyJob == JDNA.AmbulanceJob then
		JDNA.CurDNA = JDNA.CurDNA or {}
		JDNA.SpawnedObjs = JDNA.SpawnedObjs or {}

		local closestPed = ESX.Game.GetClosestPed(pos, { plyPed })
		local closestVeh = ESX.Game.GetClosestVehicle(pos)
		local plyPos = GetEntityCoords(plyPed)
		local pedPos = GetEntityCoords(closestPed)
		local vehPos = GetEntityCoords(closestVeh)
		local distPed 
		if pedpos and plyPos then distPed = JUtils:GetVecDist(pedPos, plyPo); end
		local distVeh
		if vehPos and plyPos then distVeh = JUtils:GetVecDist(plyPos, vehPos); end

		if distPed and distPed < 5.0 then
			SetEntityAsMissionEntity(closestPed, true, true)
		end

		if distVeh and distVeh < 5.0 then
			SetEntityAsMissionEntity(closestVeh, true, true)
		end

		local targetPosition = vector3(pos.x, pos.y, pos.z)
		local newObj = CreateObject(JUtils.GetHashKey(obj), targetPosition)
		FreezeEntityPosition(newObj, true)
		SetEntityAsMissionEntity(newObj, true, true)
		SetEntityRotation(newObj, -90.0, 0.0, 0.0, 2, false)

		table.insert(JDNA.CurDNA,{ pos = pos, obj = obj, name = name, go = newObj })

		if IsEntityAMissionEntity(closestPed) then SetEntityAsMissionEntity(closestPed,false,false); end
		if IsEntityAMissionEntity(closestVeh) then SetEntityAsMissionEntity(closestVeh,false,false); end		

		JDNA.SpawnedObjs[JDNA.Age] = newObj
		JDNA.Age = JDNA.Age + 1

		for k,v in pairs(JDNA.CurDNA) do
			if v and type(v) ~= boolean and type(v) == table then
				SetEntityNoCollisionEntity(v.go, newObj, true)
			end
		end

	elseif obj == JDNA.ResidueObject and plyJob == JDNA.PoliceJob then
		JDNA.CurDNA = JDNA.CurDNA or {}
		JDNA.SpawnedObjs = JDNA.SpawnedObjs or {}
		local newObj = CreateObject(JUtils.GetHashKey(obj), pos.x, pos.y, pos.z, false, false, false)
		SetEntityRotation(newObj, -90.0, 0.0, 0.0, 2, false)		
		SetEntityAsMissionEntity(newObj, true, true)
		FreezeEntityPosition(newObj, true)
		table.insert(JDNA.CurDNA,{ pos = pos, obj = obj, name = name, go = newObj, wea = weapon, weaType = weaponType})

		JDNA.SpawnedObjs[JDNA.Age] = newObj
		JDNA.Age = JDNA.Age + 1

	end
	JDNA.CurPlacing = false
end)

local color = { r = 220, g = 220, b = 220, alpha = 255 } -- Color of the text 
local font = 4 -- Font of the text
local time = 7000 -- Duration of the display of the text : 1000ms = 1sec
local background = { enable = true, color = { r = 35, g = 35, b = 35, alpha = 200 }, }
local chatMessage = true
local dropShadow = false

-- Don't touch
local nbrDisplaying = 1

function JDNA:DrawText3D(x,y,z, text)
    local onScreen,_x,_y = World3dToScreen2d(x,y,z)
    local px,py,pz = table.unpack(GetGameplayCamCoord())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = ((1/dist)*2)*(1/GetGameplayCamFov())*100

    if onScreen then

        -- Formalize the text
        SetTextColour(color.r, color.g, color.b, color.alpha)
        SetTextScale(0.0*scale, 0.40*scale)
        SetTextFont(font)
        SetTextProportional(1)
        SetTextCentre(true)
        if dropShadow then
            SetTextDropshadow(10, 100, 100, 100, 255)
        end

        -- Calculate width and height
        BeginTextCommandWidth("STRING")
        AddTextComponentString(text)
        local height = GetTextScaleHeight(0.45*scale, font)
        local width = EndTextCommandGetWidth(font)

        -- Diplay the text
        SetTextEntry("STRING")
        AddTextComponentString(text)
        EndTextCommandDisplayText(_x, _y)

        if background.enable then
            DrawRect(_x, _y+scale/73, width, height, background.color.r, background.color.g, background.color.b , background.color.alpha)
        end
    end
end

Citizen.CreateThread(function(...) JDNA:Start(...); end)