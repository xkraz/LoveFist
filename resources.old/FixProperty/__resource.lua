-- resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'
resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

version '1.0.0'

server_script { 
     '@mysql-async/lib/MySQL.lua',
     'server.lua',
 }