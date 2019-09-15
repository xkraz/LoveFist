Config                        = {}
Config.Locale = 'en'
Config.green 				  = 56108
Config.grey 				  = 8421504
Config.red 					  = 16711680
Config.orange 				  = 16744192
Config.blue 				  = 2061822
Config.purple 				  = 6965387
Config.pink                   = 11750815
Config.yellow                 = 16449301
Config.white                  = 16777215
Config.black                  = 0
Config.bluetweet              = 4436965
Config.webhook                = "https://discordapp.com/api/webhooks/569793008082616321/-6CCvk9Wzt-Xe5Zuq9F8kb6EJpz4viVq1LK1JbZIAzg56Q8Qz6hxk1z1f9vR051LDWrx"


settings = {
	LogKills = true, -- Log when a player kill an other player.
	LogEnterPoliceVehicle = false, -- Log when an player enter in a police vehicle.
	LogEnterBlackListedVehicle = true, -- Log when a player enter in a blacklisted vehicle.
	LogPedJacking = false, -- Log when a player is jacking a car
	LogChatServer = true, -- Log when a player is talking in the chat , /command works too.
	LogLoginServer = true, -- Log when a player is connecting/disconnecting to the server.
    LogItemTransfer = true, -- Log when a player is giving an item.
    LogItemDrop = true,-- Log when a player drop an item.
    LogItemPickup = true,-- Log when a player pick an item.
    LogWeaponTransfer = true, -- Log when a player is giving a weapon.
    LogWeaponDrop = false,  -- Log when a player drop a weapon.
    LogMoneyTransfer = true, -- Log when a player is giving money
    LogMoneyDrop = true,  -- Log when a player drop money
    LogMoneyPickup = true,  -- Log when a player pick money
    LogDirtyMoneyTransfer = true, -- Log when a player is giving dirty money
    LogDirtyMoneyDrop = true,  -- Log when a player drop dirty money
    LogDirtyMoneyPickup = true,  -- Log when a player pick dirty money
    LogTweetServer = true, -- Log when a player is tweeting in the chat.
    LogBanhammer = true, -- Log when a player is banned.
    LogBankWithdraw = true, -- Log when a player is transfering account money.
    LogBankDeposit = true, -- Log when a player is transfering account money.

}



blacklistedModels = {
	"APC",
	"BARRACKS",
	"BARRACKS2",
	"RHINO",
	"CRUSADER",
	"CARGOBOB",
	"SAVAGE",
	"TITAN",
    "LAZER",
    "VALKYRIE",
	"VALKYRIE2",
}
