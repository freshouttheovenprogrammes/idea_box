require 'rails_helper'

describe "As a user" do
  context "after registering with IdeaBox" do
    xit "I can log back in" do
      user = User.create!(email: "jon@gmail.com", password: "password", full_name: "Jon Jon")

      visit root_path

      click_link 'Log In'
      
      expect(current_path).to eq login_path

      fill_in 'Email', with: 'jon@gmail.com'
      fill_in 'Password', with: 'password'

      click_link 'Log In'

      expect(current_path).to eq user_path(user)
    end
  end
end
