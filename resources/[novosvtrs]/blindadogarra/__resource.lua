resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

data_file 'HANDLING_FILE' 'riot/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'riot/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'riot/carvariations.meta'


files {
  'riot/handling.meta',
  'riot/vehicles.meta',
  'riot/carvariations.meta',

}

client_script 'vehicle_names.lua'
