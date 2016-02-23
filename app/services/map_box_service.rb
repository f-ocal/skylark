class MapBoxService

  def upload_file(image_file, tileset_name)
    response = get_credentials_from_mapbox

    access_key_id     = response.parsed_response['accessKeyId']
    secret_access_key = response.parsed_response['secretAccessKey']
    session           = response.parsed_response['sessionToken']

    credentials = Aws::Credentials.new(access_key_id, secret_access_key, session)

    key               = response.parsed_response['key']
    @full_key         = generate_full_key(key)

    bucket            = response.parsed_response['bucket']
    @url              = response.parsed_response['url']


    upload_file_to_s3_bucket(bucket, credentials, image_file, key)

    HTTParty.post('https://api.mapbox.com/uploads/v1/f-ocal?access_token=sk.eyJ1IjoiZi1vY2FsIiwiYSI6ImNpa3ZneGFpYzAwZnV1bWtzczA2YWQ5OTQifQ.Eqezri-fTOcuCfv_mMTCuw',

                  :body    => {"tileset" => "#{@full_key}",
                               "url"     => @url,
                               "name"    => tileset_name

                  }.to_json,
                  :headers => {'Content-Type' => 'application/json'})

    @full_key
  end

  def upload_file_to_s3_bucket(bucket, credentials, image_file, key)
    s3_client = Aws::S3::Client.new(:region      => 'us-east-1',
                                    :credentials => credentials)

    s3 = Aws::S3::Resource.new(client: s3_client)

    s3.bucket(bucket).object(key).upload_file(image_file.tempfile)
  end

  def generate_full_key(key)
    "#{key.slice(38..-1)}.#{key.slice(12..36)}"
  end


  def get_credentials_from_mapbox
    HTTParty.get('https://api.mapbox.com/uploads/v1/f-ocal/credentials?access_token=sk.eyJ1IjoiZi1vY2FsIiwiYSI6ImNpa3ZneGFpYzAwZnV1bWtzczA2YWQ5OTQifQ.Eqezri-fTOcuCfv_mMTCuw')
  end
end
