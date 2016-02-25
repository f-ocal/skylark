require 'aws-sdk'
require 'open-uri'

class ImagesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :upvote]
  before_action :set_image, only: [:show, :edit, :update, :destroy, :upvote, :like_form]
  skip_before_action :verify_authenticity_token

  def index
    @images = Image.all
    gon.images = @images.map do |image|
      {username: image.user.username,
        map: image.map,
        description: image.description,
        tileset_name: image.tileset_name,
        camera_type: image.camera_type,
        id: image.id,
        upvotes: image.get_upvotes.size
      }
    end
  end

  def show
    # deprecated for before_action
    # @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
  end

  def edit
    # deprecated for before_action
    # @image = Image.find(params[:id])
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
    # deprecated for before_action
    # @image = Image.find(params[:id])
    success = @image.update(image_params)

    if success
      flash[:alert] = ["Your image information has been edited"]
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end

  def destroy
    # deprecated for before_action
    # @image = Image.find(params[:id])
    @image.destroy
    flash[:error] = ["The image has been deleted!"]
    redirect_to user_path(current_user)
  end

  def like_form
    if request.xhr?
      render '_upvote_form', locals: { image: @image }, layout: false
    end
  end

  def upvote
    @image.liked_by current_user
    if request.xhr?
       render '_upvote_form', locals: { image: @image }, layout: false
    else
      redirect_to images_path
    end
  end


  private

  def image_params
    params.require(:image).permit(:tileset_name, :description, :date_taken, :camera_type, :image_file)
  end

  def set_image
    @image = Image.find(params[:id])
  end
end
