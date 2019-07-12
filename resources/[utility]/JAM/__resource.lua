resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'
ui_page 'ProgressBar/h.html'
client_scripts {
	-- Base
	'JAM_Main.lua',
	'JAM_Client.lua',
	'JAM_Utilities.lua',

  -- Notify
  'JAM_Notify/JAM_Notify_Client.lua',

  -- Progress Bar
  'ProgressBar/ProgressBar_Client.lua',

  -- Garage
  'JAM_Garage/JAM_Garage_Config.lua',
  'JAM_Garage/JAM_Garage_Client.lua',

	-- DNATracker
--	'JAM_DNATracker/JAM_DNATracker_Config.lua',
--	'JAM_DNATracker/JAM_DNATracker_Client.lua',

    -- VehicleShop
  'JAM_VehicleShop/JAM_VehicleShop_Config.lua', 
  'JAM_VehicleShop/JAM_VehicleShop_Client.lua',

  -- VehicleFinance  
  'JAM_VehicleFinance/JAM_VehicleFinance_Config.lua', 
  'JAM_VehicleFinance/JAM_VehicleFinance_Client.lua',
  
  -- Race Mod
	'JAM_RaceMod/JAM_RaceMod_Config.lua',
	'JAM_RaceMod/JAM_RaceMod_Client.lua',

  -- Tuner Laptop
 -- 'JAM_TunerLaptop/JAM_TunerLaptop_Config.lua',
--  'JAM_TunerLaptop/JAM_TunerLaptop_Client.lua',

	-- NativeUI
	"NativeUILua-Reloaded/Wrapper/Utility.lua",

  "NativeUILua-Reloaded/UIElements/UIVisual.lua",
  "NativeUILua-Reloaded/UIElements/UIResRectangle.lua",
  "NativeUILua-Reloaded/UIElements/UIResText.lua",
  "NativeUILua-Reloaded/UIElements/Sprite.lua",

  "NativeUILua-Reloaded/UIMenu/elements/Badge.lua",
  "NativeUILua-Reloaded/UIMenu/elements/Colours.lua",
  "NativeUILua-Reloaded/UIMenu/elements/ColoursPanel.lua",
  "NativeUILua-Reloaded/UIMenu/elements/StringMeasurer.lua",

  "NativeUILua-Reloaded/UIMenu/items/UIMenuItem.lua",
  "NativeUILua-Reloaded/UIMenu/items/UIMenuCheckboxItem.lua",
  "NativeUILua-Reloaded/UIMenu/items/UIMenuListItem.lua",
  "NativeUILua-Reloaded/UIMenu/items/UIMenuSliderItem.lua",
  "NativeUILua-Reloaded/UIMenu/items/UIMenuSliderHeritageItem.lua",
  "NativeUILua-Reloaded/UIMenu/items/UIMenuColouredItem.lua",

  "NativeUILua-Reloaded/UIMenu/items/UIMenuProgressItem.lua",
  "NativeUILua-Reloaded/UIMenu/items/UIMenuSliderProgressItem.lua",

  "NativeUILua-Reloaded/UIMenu/windows/UIMenuHeritageWindow.lua",

  "NativeUILua-Reloaded/UIMenu/panels/UIMenuGridPanel.lua",
  "NativeUILua-Reloaded/UIMenu/panels/UIMenuHorizontalOneLineGridPanel.lua",
  "NativeUILua-Reloaded/UIMenu/panels/UIMenuVerticalOneLineGridPanel.lua",
  "NativeUILua-Reloaded/UIMenu/panels/UIMenuColourPanel.lua",
  "NativeUILua-Reloaded/UIMenu/panels/UIMenuPercentagePanel.lua",
  "NativeUILua-Reloaded/UIMenu/panels/UIMenuStatisticsPanel.lua",

  "NativeUILua-Reloaded/UIMenu/UIMenu.lua",
  "NativeUILua-Reloaded/UIMenu/MenuPool.lua",

  "NativeUILua-Reloaded/UITimerBar/UITimerBarPool.lua",

  "NativeUILua-Reloaded/UITimerBar/items/UITimerBarItem.lua",
  "NativeUILua-Reloaded/UITimerBar/items/UITimerBarProgressItem.lua",
  "NativeUILua-Reloaded/UITimerBar/items/UITimerBarProgressWithIconItem.lua",

  "NativeUILua-Reloaded/UIProgressBar/UIProgressBarPool.lua",
  "NativeUILua-Reloaded/UIProgressBar/items/UIProgressBarItem.lua",

  "NativeUILua-Reloaded/NativeUI.lua",
}

server_scripts {	
	-- Base
	'JAM_Main.lua',
	'JAM_Server.lua',
	'JAM_Utilities.lua',

	-- MySQL
	'@mysql-async/lib/MySQL.lua',

  -- Garage
  'JAM_Garage/JAM_Garage_Config.lua',
  'JAM_Garage/JAM_Garage_Server.lua',

	-- DNATracker
	--'JAM_DNATracker/JAM_DNATracker_Config.lua',
--	'JAM_DNATracker/JAM_DNATracker_Server.lua',

	-- VehicleShop
	'JAM_VehicleShop/JAM_VehicleShop_Config.lua',	
	'JAM_VehicleShop/JAM_VehicleShop_Server.lua',

	-- VehicleFinance
	'JAM_VehicleFinance/JAM_VehicleFinance_Config.lua',	
	'JAM_VehicleFinance/JAM_VehicleFinance_Server.lua',
	
		-- Race Mod
	'JAM_RaceMod/JAM_RaceMod_Config.lua',
	'JAM_RaceMod/JAM_RaceMod_Server.lua',

  -- Tuner Laptop
 -- 'JAM_TunerLaptop/JAM_TunerLaptop_Config.lua',
 -- 'JAM_TunerLaptop/JAM_TunerLaptop_Server.lua',
}

files {	
  'JAM_TunerLaptop/Laptop.png',
}

export "startUI"