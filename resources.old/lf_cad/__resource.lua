resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'LoveFist Custom CAD'

version '1.0.0'

server_scripts {
	'server/main.lua',
	'@mysql-async/lib/MySQL.lua'
}

client_scripts {
	'client/main.lua'
}

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/style.css',
	'html/app.js'
	
}

dependencies {
	'es_extended',
	'mysql-async'
}
