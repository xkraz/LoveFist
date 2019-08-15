resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX Identity'

version '3.0'

server_scripts {
	'config/config.lua',
	'@mysql-async/lib/MySQL.lua',
	'server/main.lua'
}

client_scripts {
	'config/config.lua',
	'client/main.lua'
}

ui_page 'client/html/index.html'

files {
	'client/html/index.html',
	'client/html/script.js',
	'client/html/style.css',
	'client/html/images/bg.jpg'
}

dependency 'es_extended'

exports {
  'openRegistry'
}
