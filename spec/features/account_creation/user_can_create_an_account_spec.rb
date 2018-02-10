require 'rails_helper'

describe "As a user" do
  context "when I get to the root page" do
    it "I see the login field" do

      visit root_path

      expect(page).to have_content('Join IdeaBox today.')
      expect(page).to have_field('Email Address')
      expect(page).to have_content('Have an account?')
      expect(page).to have_link('Log In')
    end

    it "I enter my credentials and arrive at new user page" do
      visit root_path

      fill_in 'Email Address', with: "example@email.com"
      fill_in 'Password', with: "password"
      click_on 'Get Started'

      expect(current_path).to eq new_user_path
    end
  end
end
