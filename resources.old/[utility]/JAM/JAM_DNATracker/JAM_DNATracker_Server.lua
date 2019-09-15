local JDNA = JAM.DNATracker

RegisterNetEvent('JAM_DNATracker:PlaceEvidenceS')
AddEventHandler('JAM_DNATracker:PlaceEvidenceS', function(pos, obj, weapon, weaponType)	
	local xPlayer = ESX.GetPlayerFromId(source)
	while not xPlayer do Citizen.Wait(0); ESX.GetPlayerFromId(source); end
	local playername = ''
	local data = MySQL.Sync.fetchAll("SELECT * FROM characters WHERE identifier=@identifier",{['@identifier'] = xPlayer.getIdentifier()})
	for key,val in pairs(data) do
		playername = val.firstname .. " " .. val.lastname
	end
	TriggerClientEvent('JAM_DNATracker:PlaceEvidenceC', -1, pos, obj, playername, weapon, weaponType)
end)

ESX.RegisterServerCallback('JAM_DNATracker:PickupEvidenceS', function(source, cb, evidence)
	local xPlayer = ESX.GetPlayerFromId(source)
	while not xPlayer do Citizen.Wait(0); ESX.GetPlayerFromId(source); end
	local cbData
	if evidence.obj == JDNA.BloodObject then
		local count = xPlayer.getInventoryItem('bulletsample')
		if xPlayer.getInventoryItem('bloodsample').count > 0 then cbData = false
		else
			xPlayer.addInventoryItem('bloodsample', 1)
			TriggerClientEvent('JAM_DNATracker:PickupEvidenceC', -1, evidence)
			cbData = true
		end
	elseif evidence.obj == JDNA.ResidueObject then
		local count = xPlayer.getInventoryItem('bulletsample')
		if xPlayer.getInventoryItem('bulletsample').count > 0 then cbData = false
		else
			xPlayer.addInventoryItem('bulletsample', 1)
			TriggerClientEvent('JAM_DNATracker:PickupEvidenceC', -1, evidence)
			cbData = true
		end
	end
	cb(cbData)
end)

ESX.RegisterServerCallback('JAM_DNATracker:GetJob', function(source, cb, evidence)
	local xPlayer = ESX.GetPlayerFromId(source)
	while not xPlayer do Citizen.Wait(0); ESX.GetPlayerFromId(source); end
	local cbData = xPlayer.getJob()
	cb(cbData)
end)

ESX.RegisterUsableItem('dnaanalyzer', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	while not xPlayer do Citizen.Wait(0); ESX.GetPlayerFromId(source); end
	if xPlayer.getInventoryItem('bloodsample').count > 0 then 
		xPlayer.removeInventoryItem('bloodsample', 1)
		TriggerClientEvent('JAM_DNATracker:AnalyzeDNA', source)
	end
end)

ESX.RegisterUsableItem('ammoanalyzer', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	while not xPlayer do Citizen.Wait(0); ESX.GetPlayerFromId(source); end
	if xPlayer.getInventoryItem('bulletsample').count > 0 then 
		xPlayer.removeInventoryItem('bulletsample', 1)
		TriggerClientEvent('JAM_DNATracker:AnalyzeAmmo', source)
	end
end)