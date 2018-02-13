require 'rails_helper'

describe Idea, type: :model do
  it { should validate_presence_of(:name) }
  it { should belong_to(:user) }
  it { should belong_to(:category) }
end
