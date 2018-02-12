class Image < ApplicationRecord
  has_many :idea_images
  has_many :ideas, through: :idea_images
  mount_uploader :image, ImagesUploader
end
