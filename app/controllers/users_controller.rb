class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_signup_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to new_user_path
      else
        flash[:error] = "Please enter full credentials"
        render "/pages/main"
      end
  end

  private

    def user_signup_params
      params.require(:user).permit(:email, :password, :full_name)
    end
end
