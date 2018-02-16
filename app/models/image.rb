class Image < ApplicationRecord
  validates_presence_of :title, :image

  has_many :idea_images, dependent: :destroy
  has_many :ideas, through: :idea_images
end
