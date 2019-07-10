-- Manifest
resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

client_script 'cl_delivery_gopostal.lua'
client_script 'cl_delivery_china.lua'
client_script 'cl_delivery_pizza.lua'
--client_script 'cl_delivery_weed.lua'
--client_script 'cl_delivery_meth.lua'


server_script 
'sv_delivery.lua'
'@mysql-async/lib/MySQL.lua'
