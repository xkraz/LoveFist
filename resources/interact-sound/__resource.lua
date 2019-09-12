-- Manifest Version
resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

-- Client Scripts
client_script 'client/main.lua'

-- Server Scripts
server_script 'server/main.lua'

-- NUI Default Page
ui_page('client/html/index.html')

-- Files needed for NUI
-- DON'T FORGET TO ADD THE SOUND FILES TO THIS!
files {
    'client/html/index.html',
    -- Begin Sound Files Here...
    -- client/html/sounds/ ... .ogg
    'client/html/sounds/bankAlarm.ogg',
    'client/html/sounds/jewelryAlarm.ogg',
    'client/html/sounds/item_chips.ogg',
    'client/html/sounds/item_cuffs.ogg',
    'client/html/sounds/ambient_farm.ogg',
    'client/html/sounds/ambient_hawk.ogg',
    'client/html/sounds/ambient_siren.ogg',
    'client/html/sounds/glassbreak1.ogg',
    'client/html/sounds/glassbreak2.ogg',
    'client/html/sounds/glassbreak3.ogg',
    'client/html/sounds/glassbreak4.ogg',
    'client/html/sounds/glassbreak5.ogg'

}
