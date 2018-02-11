class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_signup_params)
      if @user.save
        redirect_to new_user_path(@user)
      else
        flash[:error] = "Please enter full credentials"
        redirect_to root_path
      end
  end

  private

    def user_signup_params
      params.require(:user).permit(:email, :password)
    end
end
