require 'rails_helper'

describe "As a user" do
  context "after registering with IdeaBox" do
    it "I can log back in" do
      user = User.create!(email: "jon@gmail.com", password: "password", full_name: "Jon Jon", username: "jj101")

      visit root_path

      click_link 'Log In'

      expect(current_path).to eq login_path
      save_and_open_page
      fill_in 'Email', with: 'jon@gmail.com'
      fill_in 'Password', with: 'password'

      click_on 'Log In'

      expect(current_path).to eq user_path(user)

      expect(page).to have_content("Welcome back #{user.full_name}!")
    end
  end
end
