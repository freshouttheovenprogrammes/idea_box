require 'rails_helper'

describe Image, type: :model do
  it {should validate_presence_of(:title)}
  it {should validate_presence_of(:image)}
  it {should have_many(:ideas)}
end
