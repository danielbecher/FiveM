resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

data_file 'HANDLING_FILE' 'data/as350/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/as350/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/as350/carvariations.meta'

files {
'data/as350/handling.meta',
'data/as350/vehicles.meta',
'data/as350/carvariations.meta',
}
---------------------------------------------------------------------


client_script 'vehicle_names.lua'