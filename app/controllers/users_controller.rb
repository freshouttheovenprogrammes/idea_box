class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    redirect_to root_path unless @user == current_user
    if @user.admin?
      redirect_to admin_user_path(@user)
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to new_user_path
    else
      flash[:error] = @user.errors.full_messages.join(", ")
      render "/pages/index"
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :full_name)
  end
end
