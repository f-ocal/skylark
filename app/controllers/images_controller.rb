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
        tileset_name: image.tileset_name,
        camera_type: image.camera_type
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
    @mapbox_image  = MapBoxService.new.upload_file(image_params[:image_file], image_params[:tileset_name])
    @image         = Image.new(image_params.reject!{|k,_| k == 'image_file'})
    @image.user_id = current_user.id
    @image.map     = @mapbox_image

    if @image.save
      flash[:success] = ["Upload in process for #{@image.tileset_name}. This may take a few minutes."]
      redirect_to user_path(current_user)
    else
      flash[:error] = @image.errors.full_messages
      render 'new'
    end

  rescue ActionController::ParameterMissing
    flash[:error] = ['Something went wrong. Please try again.']
    render 'new'
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
    params.require(:image).permit(:tileset_name, :description, :date_taken, :camera_type, :image_file)
  end

  def set_image
    @image = Image.find(params[:id])
  end
end
