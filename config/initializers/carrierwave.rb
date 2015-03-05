CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required (amazon web services)
    :aws_access_key_id      => ENV['S3_KEY'],                        # required
    :aws_secret_access_key  => ENV['S3_SECRET'],                        # required
    :region                 => ENV['S3_REGION']                  # optional, defaults to 'us-east-1'
    #:host                   => '',             # optional, defaults to nil
    #:endpoint               => 's3.amazonaws.com' # optional, defaults to nil
  }
  config.fog_directory  = ENV['S3_BUCKET']                          # required (this is your bucket)
  # config.fog_public     = false                                        # optional, defaults to true
  # config.fog_attributes = {'Cache-Control'=>"max-age=#{365.day.to_i}"} # optional, defaults to {}
end