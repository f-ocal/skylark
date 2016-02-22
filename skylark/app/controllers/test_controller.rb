class TestController < ApplicationController

  def show
    response = HTTParty.get('https://api.mapbox.com/uploads/v1/natasha-t/credentials?access_token=sk.eyJ1IjoibmF0YXNoYS10IiwiYSI6ImNpa3Q0YmhuYjAwMjl1YW0zMGJhcDAya2MifQ.C4u_Lx4TzEuA6HIkbTJFwg')
    p response.parsed_response

    access_key = response.parsed_response["accessKeyId"]
    secret_access_key_id = response.parsed_response["secretAccessKey"]
    bucket = response.parsed_response["bucket"]

    Aws.config.update({
      region: 'us-east-1',
      credentials: Aws::Credentials.new(access_key, secret_access_key_id)
    })

    s3_bucket = Aws::S3::Resource.new.bucket(bucket)

  end

end
