class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:show]
# redirects any requests to users/:id to own profile if logged in
# a better version: show limited info on a particular user to others (list of images posted)
  def show
    @user = User.find(current_user.id)
  end

end
