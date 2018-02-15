class Admin::CategoriesController < Admin::BaseController
  before_action :current_admin?
  # ApplicationController
  def index
    @category = Category.all
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
end
