if Config.UseESX then
	local ESX = nil

	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

	RegisterServerEvent('fuel:pay')
	AddEventHandler('fuel:pay', function(price)
		local xPlayer = ESX.GetPlayerFromId(source)
		local amount = ESX.Math.Round(price)

		if price > 0 and xPlayer.job.name == 'org1' or xPlayer.job.name == 'org2' or xPlayer.job.name == 'org3' 
	or xPlayer.job.name == 'offfib' or xPlayer.job.name == 'offpolice' or xPlayer.job.name == 'offdea' 
	or xPlayer.job.name == 'offambulance' or xPlayer.job.name == 'miner' or xPlayer.job.name == 'marducas' 
	or xPlayer.job.name == 'lumberjack' or xPlayer.job.name == 'fueler' or xPlayer.job.name == 'gouvernor' 
	or xPlayer.job.name == 'casino' or xPlayer.job.name == 'banker' or xPlayer.job.name == 'fisherman' 
	or xPlayer.job.name == 'fruitgang' or xPlayer.job.name == 'unemployed' or xPlayer.job.name == 'taxi' 
	or xPlayer.job.name == 'tailor' or xPlayer.job.name == 'slaughterer'  or xPlayer.job.name == 'journaliste'
	or xPlayer.job.name == 'reporter'  or xPlayer.job.name == 'mechanic2' or xPlayer.job.name == 'mechanic' then
			xPlayer.removeMoney(amount)
		end
	end)
end
