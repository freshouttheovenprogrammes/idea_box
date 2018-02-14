require 'rails_helper'

describe "As a user" do
  context "after registering with IdeaBox" do
    it "I can log back in and arrive at my profile" do
      user = create(:user)

      visit root_path

      click_link 'Log In'

      expect(current_path).to eq login_path

      fill_in 'Email', with: 'zac@zac.com'
      fill_in 'Password', with: 'password'

      click_on 'Log In'

      expect(current_path).to eq user_path(user)

      expect(page).to have_content("Welcome back #{user.full_name}!")
    end

    it "if I enter the wrong password I am directed back to the login page" do
      user = create(:user)
      visit root_path

      click_link 'Log In'

      expect(current_path).to eq login_path

      fill_in 'Email', with: 'zac@zac.com'
      fill_in 'Password', with: 'wrongpassword'

      click_on 'Log In'

      expect(current_path).to eq login_path
    end
  end
end
