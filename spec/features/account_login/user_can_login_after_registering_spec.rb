require 'rails_helper'

describe "As a user" do
  context "after registering with IdeaBox" do
    it "I can log back in" do
      User.create!(email: "jon@gmail.com", password: "password", full_name: "Jon Jon")

      visit root_path

      click_on 'Log In'

      expect(current_path).to eq login_path
    end
  end
end
