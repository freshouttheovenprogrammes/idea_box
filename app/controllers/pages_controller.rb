class PagesController < ApplicationController
  layout "home_page"

  def index
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    render "pages/index" unless @user == current_user
  end

end
