class IdeasController < ApplicationController

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
      if @idea.save
        redirect_to user_idea_path(@user)
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

  private

  def idea_params
    params.require(:idea).permit(:name)
  end

end
