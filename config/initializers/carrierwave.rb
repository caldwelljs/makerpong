CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => ENV['AS3_ACCESS_KEY'],       # required
    :aws_secret_access_key  => ENV['AS3_SECRET_ACCESS_KEY']      # required
  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'makerpong-1' # required
  # see https://github.com/jnicklas/carrierwave#using-amazon-s3
  # for more optional configuration

end