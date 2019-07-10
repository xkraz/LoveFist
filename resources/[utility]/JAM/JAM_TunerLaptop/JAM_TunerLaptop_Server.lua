local JTL = JAM.TunerLaptop

ESX.RegisterUsableItem('jamtunerlaptop', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	while not xPlayer do Citizen.Wait(100); xPlayer = ESX.GetPlayerFromId(source); end
 	TriggerClientEvent('JAM_TunerLaptop:TuneVehicle', source)
end)

ESX.RegisterServerCallback('JTL:GetVehicleBoost', function(source, cb, plate)
	local cbData	
	local data = MySQL.Sync.fetchAll("SELECT * FROM owned_vehicles WHERE plate=@plate",{['@plate'] = plate})
	if data and data[1] and data[1].jamboost then cbData = data[1].jamboost else cbData = false; end
	cb(cbData)
end)

ESX.RegisterServerCallback('JTL:SetVehicleBoost', function(source, cb, boost, plate)
	local cbData	
	local data = MySQL.Sync.fetchAll("SELECT * FROM owned_vehicles WHERE plate=@plate",{['@plate'] = plate})
	if data and data[1] then 
		cbData = true 
		MySQL.Sync.execute("UPDATE owned_vehicles SET jamboost=@jamboost WHERE plate=@plate",{['@jamboost'] = boost, ['@plate'] = plate})
	else 
		cbData = false 
	end
	cb(cbData)
end)