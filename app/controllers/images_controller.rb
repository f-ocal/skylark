require 'aws-sdk'
require 'open-uri'

class ImagesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def index
    @images = Image.all
    gon.images = Image.all
    p gon.images
  end

  def show
   @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
  end

  def create
    @mapbox_image = set_s3_direct_post(params[:image][:image_file], params[:image][:tileset_name])
    @image = Image.new(image_params)
    @image.user_id = current_user.id
    @image.map = @mapbox_image
    if @image.save
      flash[:success] = ["You have successfully uploaded an image with title of #{@image.tileset_name}"]
      redirect_to images_path
    else
      flash[:error] = @image.errors.full_messages
      render 'new'
    end
  end

  def destroy
   image = Image.find(params[:id])
   image.destroy
   flash[:error] = ["The image has been deleted!"]
   redirect_to user_path(current_user)
  end

  private

    def image_params
      params.require(:image).permit(:tileset_name, :description, :date_taken, :camera_type)
    end

    def set_image
      @image = Image.find(params[:id])
    end

    def set_s3_direct_post(image_file, tileset_name)
      response = HTTParty.get('https://api.mapbox.com/uploads/v1/f-ocal/credentials?access_token=sk.eyJ1IjoiZi1vY2FsIiwiYSI6ImNpa3ZneGFpYzAwZnV1bWtzczA2YWQ5OTQifQ.Eqezri-fTOcuCfv_mMTCuw')

      access_key_id = response.parsed_response['accessKeyId']
      secret_access_key = response.parsed_response['secretAccessKey']
      @key = response.parsed_response['key']
      session = response.parsed_response['sessionToken']
      bucket = response.parsed_response['bucket']
      @url = response.parsed_response['url']

      credentials = Aws::Credentials.new(access_key_id,secret_access_key, session)

      s3_client = Aws::S3::Client.new(:region => 'us-east-1',
                                      :credentials => credentials)

      s3 = Aws::S3::Resource.new(client: s3_client)

      obj = s3.bucket(bucket).object(@key)

      obj.upload_file(image_file.tempfile)

      create_image_in_mapbox(tileset_name)
      return @key[12..36]
    end

    def create_image_in_mapbox(tileset_name)
      HTTParty.post('https://api.mapbox.com/uploads/v1/f-ocal?access_token=sk.eyJ1IjoiZi1vY2FsIiwiYSI6ImNpa3ZneGFpYzAwZnV1bWtzczA2YWQ5OTQifQ.Eqezri-fTOcuCfv_mMTCuw',

        :body => {  "tileset" => "f-ocal.#{@key[12..36]}",
                    "url"=> @url,
                    "name" => tileset_name

                  }.to_json,
        :headers => { 'Content-Type' => 'application/json'}
      )
    end
end
