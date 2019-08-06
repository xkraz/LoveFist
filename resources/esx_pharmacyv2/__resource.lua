description 'Pharmacie V2'

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    '@es_extended/locale.lua',
    'server/esx_pharmacyv2.server.lua',
    'locales/fr.lua',
    'locales/en.lua',
    'config.lua'
}

client_scripts {
    '@es_extended/locale.lua',
    'client/esx_pharmacyv2.client.lua',
    'client/esx_pharmacyv2_gui.client.lua',
    'locales/fr.lua',
    'locales/en.lua',
    'config.lua'
}