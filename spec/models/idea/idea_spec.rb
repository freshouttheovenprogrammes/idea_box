require 'rails_helper'

describe Idea, type: :model do
      it {should validate_presence_of(:name, :user_id, :category_id)}
end
