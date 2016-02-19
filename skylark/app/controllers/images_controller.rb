class ImagesController < ApplicationController

  def index
    flash[:test] = "This is a test"
    redirect_to '/'
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

end
