class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success]
      redirect_to categories_path
    else
      redirect_to new_category_path
    end
  end

  private

 def category_params
    params.require(:category).permit(:name)
 end

 def correct_user?
  @user == current_admin?
 end

end
