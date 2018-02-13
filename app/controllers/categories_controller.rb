class CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = "Success"
      redirect_to category_path(@category)
    else
      flash[:notice] = "Try again"
      render :edit
    end
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

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

  private

 def category_params
    params.require(:category).permit(:name)
 end
end
