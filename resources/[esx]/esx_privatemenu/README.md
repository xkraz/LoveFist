# esx_privatemenu

## Requirements
* [es_extended](https://github.com/ESX-Org/es_extended)

## Optionals
* [esx_phone](https://github.com/ESX-Org/esx_phone)
* [esx_billing](https://github.com/ESX-Org/esx_billing)
* [esx_voice](https://github.com/ESX-Org/esx_voice)
* [esx_animations](https://github.com/ESX-Org/esx_animations)
* [esx_policejob](https://github.com/ESX-Org/esx_policejob)
* [esx_ambulancejob](https://github.com/ESX-Org/esx_ambulancejob)
* [esx_mecanojob](https://github.com/ESX-Org/esx_mecanojob)
* [es_taxijob](https://github.com/ESX-Org/esx_taxijob)
* [esx_identity](https://github.com/ArkSeyonet/esx_identity)
* [esx_locksystem](https://github.com/ArkSeyonet/esx_locksystem)

The updated version of ESX Identity on my github is REQUIRED for the updated PrivateMenu.

## Installation

1) Install To resources/[esx]/esx_privatemenu

2) Manually Add Code In Your ESX Scripts From exportsSetup.lua
`<< If you do not do this step ESX PrivateMenu WILL break`

3) Add this in your server.cfg :
```
start esx_privatemenu
```

## Features
[Completed]
* Locking/Unlocking Vehicles While In-Vehicle and Remotely (provided you don't use the button again while in a different vehicle)
* Toggling Engine On/Off
* Open/Close All Doors/Hood/Trunk, and Individual Controls
* Roll All Windows Down/Up, and Individual Controls
* Show ID (Proximity)
* Give Phone Number (Proximity)
* Open ESX Menus through UI Buttons and not keyboard keys.
* Character Creation/Deletion via UI Buttons and not commands.
* Config.DisableEnteringNPCDrivenVehicles (FALSE BY DEFAULT)
`<< This config option adds several features listed below`

## Config Features
* Police and Emergency Workers can enter any vehicle
* Players Cannot Steal NPC Driven Vehicles
* Players Cannot Steal Police or Emergency Vehicles
* Players Can Steal Any Parked Or Locked Vehicle, But They Must Break In And Hotwire The Vehicle (But Not Police Or Emergency Vehicles)

[WIP]
* Integration With All Jobs
* Conversion to ESX UI
* Vehicle Locks Only For Owned Vehicles
* Keys For Vehicles

## Notes
`The Default Button For Opening The Menu Is 'Page Up' and 'Esc' closes the menu`

12/12/2018: I am starting to work on this script again, as I want to finish what I started. I will post more updates in the future, and once it's finished I will open the license fully to the public.

The ESX Identity on MY Github is REQUIRED for ESX AIOMenu to work properly.

If you have any sources for esx_aiomenu that date before this update was released, then you may use them following the licenses of the old script. For help with ESX AIOMenu or the new version of ESX Identity, please join the discord via this link: https://discord.gg/vF5am5V

## Credits
* Lead Coder: ArkSeyonet
* Collaborator: justweb1

* Special thanks to onlyserenity who played a major part in the development of this script, although he is no longer a part of the project.
