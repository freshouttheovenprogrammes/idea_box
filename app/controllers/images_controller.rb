class ImagesController < ApplicationController
  before_action :logged_in?, :current_admin?, only: [:new]

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      redirect_to image_path(@image)
    else
      flash[:error]
      render :new
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  def index
    @image = Image.all
  end

  private

    def image_params
      params.require(:image).permit(:title, :image)
    end
end
