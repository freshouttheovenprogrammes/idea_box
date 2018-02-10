class Idea < ApplicationRecord
  validates_presence_of :user_id, :name
end
