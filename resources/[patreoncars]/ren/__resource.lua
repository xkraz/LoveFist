-- Manifest
resource_manifest_version 'f15e72ec-3972-4fe4-9c7d-afc5394ae207'

files {
  	'vehicles.meta',
   	'carvariations.meta',
	'carcols.meta',
    'handling.meta',
	'dlctext.meta',
}

data_file 'HANDLING_FILE' 'handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'vehicles.meta'
data_file 'CARCOLS_FILE' 'carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'carvariations.meta'
data_file 'VEHICLE_VARIATION_FILE' 'dlctext.meta'

--client_script { 'client/vehicle_name.lua' }
