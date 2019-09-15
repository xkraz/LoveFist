ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx_phone:registerNumber', 'flightschool', 'Flight School', true, true)
TriggerEvent('esx_society:registerSociety', 'flightschool', 'Flightschool', 'society_flightschool', 'society_flightschool', 'society_flightschool', {type = 'public'})