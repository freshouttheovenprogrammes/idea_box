class PagesController < ApplicationController
  layout "home_page"

  def index
    @user = User.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages.join(", ")
      render "/pages/index"
    end
  end

  def show
    @user = User.find(params[:id])
    render "pages/index" unless @user == current_user
  end

end
