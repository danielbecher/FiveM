resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

data_file 'HANDLING_FILE' 'PALIOIML/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'PALIOIML/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'PALIOIML/carvariations.meta'


files {
  'PALIOIML/handling.meta',
  'PALIOIML/vehicles.meta',
  'PALIOIML/carvariations.meta',

}

client_script 'vehicle_names.lua'
