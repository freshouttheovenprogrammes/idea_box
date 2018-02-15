class Admin::ImagesController < Admin::BaseController
  before_action :current_admin?

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:success]
      redirect_to images_path
    else
      redirect_to new_image_path
    end
  end

  private

  def image_params
    params.require(:image).permit(:title, :image)
  end
end
