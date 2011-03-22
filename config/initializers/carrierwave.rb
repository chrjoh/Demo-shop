CarrierWave.configure do |config|
  config.grid_fs_database = 'shop_carrier_wave'
  config.grid_fs_host = 'localhost'
  config.storage = :grid_fs
  config.grid_fs_access_url = "/images"
end


