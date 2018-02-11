require 'rails_helper'

describe User do
  context "validations" do
    it { should validate_presence_of(:email)}
    it { should validate_presence_of(:password)}
    it { should validate_presence_of(:full_name)}
    it { should have_many(:ideas)}
    it { should validate_uniqueness_of(:email)}
  end
end
