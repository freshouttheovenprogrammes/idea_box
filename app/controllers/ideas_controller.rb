class IdeasController < ApplicationController

  def new
    @idea = Idea.new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @idea = @user.ideas.new(idea_params)
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
  end

  def update
     @idea = Idea.find(params[:id])
     @user = @idea.user
     if @idea.update(idea_params)
       flash[:notice] = "Success"
       redirect_to user_idea_path(@user, @idea)
     else
       render :edit
     end
  end
  
  private

  def idea_params
    params.require(:idea).permit(:user_id, :name)
  end
end
