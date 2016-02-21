class UsersController < ApplicationController

# slightly janky - redirects any requests to users/:id to own profile if logged in
# a better version: show limited info on a particular user to others (list of images posted)
  def show
    if user_signed_in?
      @user = User.find(current_user.id)
      @images = Image.where(user_id: current_user.id)
    else
      redirect_to new_user_session_path
    end
  end

end
