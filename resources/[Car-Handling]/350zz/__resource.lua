-- Manifest
resource_manifest_version 'f15e72ec-3972-4fe4-9c7d-afc5394ae207'

files {
	'vehicles.meta',
	'carvariations.meta',
	--'carcols.meta',
	'handling.meta',

    --'data/contentunlocks.meta',
    'data/vehiclelayouts.meta',
    --'data/shop_vehicle.meta',
}

data_file 'HANDLING_FILE' 'handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'vehicles.meta'
--data_file 'CARCOLS_FILE' 'data/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'carvariations.meta'



--data_file 'CONTENT_UNLOCKING_META_FILE' 'data/contentunlocks.meta'
--data_file 'VEHICLE_LAYOUTS_FILE' 'data/vehiclelayouts.meta'
--data_file 'VEHICLE_SHOP_DLC_FILE' 'data/shop_vehicle.meta'


--client_script 'vehicle_name.lua'
