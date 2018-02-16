class Idea < ApplicationRecord
  validates_presence_of :name
  belongs_to :user
  belongs_to :category

  has_many :idea_images, dependent: :destroy
  has_many :images, through: :idea_images
end
