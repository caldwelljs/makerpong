CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => 'AKIAIN7JH7LKO4I5BUHA',       # required
    :aws_secret_access_key  => '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',       # required
    :region                 => 'eu-west-1'  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'makerpong-1' # required
  # see https://github.com/jnicklas/carrierwave#using-amazon-s3
  # for more optional configuration
end

