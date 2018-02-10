class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new
      if @user.save
        redirect_to new_user_path
      else
        flash[:error] = "Please enter full credentials"
        redirect_to root_path
      end
  end
end
