class Idea < ApplicationRecord
  validates_presence_of :name, :user_id, :category_id
end
