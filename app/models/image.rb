class Image < ApplicationRecord
  validates_presence_of :title, :image
  has_many :idea_images
  has_many :ideas, through: :idea_images
  mount_uploader :image, ImagesUploader
end
