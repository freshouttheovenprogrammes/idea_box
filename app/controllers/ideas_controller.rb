class IdeasController < ApplicationController
  before_action :logged_in?
  before_action :idea_current_user, only: [:show, :edit, :update, :destroy]

  def new
    @idea = Idea.new
    @user = User.find(params[:user_id])
    @categories = Category.all
    @images = Image.all
  end

  def create
    @user = User.find(params[:user_id])
    @idea = @user.ideas.new(idea_params)
    set_image
    if @idea.save
      redirect_to user_idea_path(@user, @idea)
    else
      render :new
    end
  end

  def index
    @ideas = Idea.all
  end

  def show
    @idea = Idea.find(params[:id])
    @user = @idea.user
  end

  def edit
    @idea = Idea.find(params[:id])
    @user = @idea.user
    @categories = Category.all
    @images = @idea.images
  end

  def update
     @idea = Idea.find(params[:id])
     @user = @idea.user
     if @idea.update(idea_params)
       flash[:notice] = "Success"
       redirect_to user_idea_path(@user, @idea)
     else
       flash[:notice] = "Try again"
       render :edit
     end
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.images.destroy_all
    @idea.destroy
    @user = @idea.user
    redirect_to user_path(@user)
  end

  private

  def idea_params
    params.require(:idea).permit(:user_id, :name, :category_id)
  end

  def idea_current_user
    @user = current_user
  end

  def set_image
    @idea.images << params[:images].map { |f| Image.find(f)}
  end
end
