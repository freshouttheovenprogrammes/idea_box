class IdeaImageController < ApplicationRecord
  def new
    @idea = Idea.find(params[:id])
    @image = Image.new
  end

  def create
    @idea_image = IdeaImage.new(image_idea_params)
  end

  private

  def image_idea_params
    params.require(:idea_image).permit(:image_id, :idea_id)
  end

end
