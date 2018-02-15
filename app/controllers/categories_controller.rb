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

  private

 def category_params
    params.require(:category).permit(:name)
 end

 def correct_user?
  @user == current_admin?
 end

end
