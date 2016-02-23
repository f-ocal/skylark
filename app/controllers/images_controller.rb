require 'aws-sdk'
require 'open-uri'

class ImagesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def index
    @images = Image.all
    gon.images = @images.map do |image|
      {username: image.user.username,
        map: image.map,
        description: image.description,
        tileset_name: image.tileset_name
      }
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
  end

  def edit
    @image = Image.find(params[:id])
  end

  def create
    @mapbox_image  = MapBoxService.new.upload_file(params[:image][:image_file], params[:image][:tileset_name])
    @image         = Image.new(image_params)
    @image.user_id = current_user.id
    @image.map     = @mapbox_image

    if @image.save
      flash[:success] = ["You have successfully uploaded an image with title of #{@image.tileset_name} !"]
      redirect_to images_path
    else
      flash[:error] = @image.errors.full_messages
      render 'new'
    end
  end

  def update
    @image  = Image.find(params[:id])
    success = @image.update(image_params)

    if success
      flash[:alert] = ["Your image information has been edited"]
      redirect_to user_path(current_user)
    else
      render 'edit'
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
end
