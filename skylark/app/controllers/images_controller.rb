class ImagesController < ApplicationController

  def index
    # flash[:test] = "This is a test"
    # redirect_to '/'
    @images = Image.all
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
    @image = Image.find(params[:id])
  end

  def update
  end

  def destroy
    image = Image.find(params[:id])
    image.destroy
    flash[:success] = "You deleted an image from the app. Please note that the image file still exists on Mapbox."
    redirect_to user_path(current_user)
  end

end
