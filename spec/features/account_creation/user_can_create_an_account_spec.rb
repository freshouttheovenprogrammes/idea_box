require 'rails_helper'

describe "As a user" do
  context "when I get to the root page" do
    it "I see the login field" do

      visit root_path

      expect(page).to have_content('Join IdeaBox today.')
      expect(page).to have_field('Email Address')
      expect(page).to have_field('Password')
      expect(page).to have_field('Full Name')
      expect(page).to have_content('Have an account?')
      expect(page).to have_link('Log In')
    end

    it "I enter my credentials and arrive at new user page" do
      visit root_path

      fill_in 'Email Address', with: "example@email.com"
      fill_in 'Password', with: "password"
      fill_in 'Full Name', with: "Joe Smith"
      click_on 'Get Started'

      expect(current_path).to eq new_user_path
    end

    it "without entering password I get an error message" do
      visit root_path

      fill_in 'Email Address', with: "example@email.com"
      fill_in 'Password', with: ""
      fill_in 'Full Name', with: "Joe Smith"
      click_on 'Get Started'

      expect(page).to have_content "Please enter full credentials"
    end

    it "without entering email I get an error message" do
      visit root_path

      fill_in 'Email Address', with: ""
      fill_in 'Password', with: "password"
      fill_in 'Full Name', with: "Joe Smith"
      click_on 'Get Started'

      expect(page).to have_content "Please enter full credentials"
    end

    xit "without entering proper email address I get an error message" do
      visit root_path

      fill_in 'Email Address', with: "bogusemail.notreal"
      fill_in 'Password', with: "password"
      fill_in 'Full Name', with: "Joe Smith"
      click_on 'Get Started'

      expect(page).to have_content "Please enter valid email"
    end

    it "I can't enter an email thats already been saved" do
      visit root_path

      fill_in 'Email Address', with: "example1@email.com"
      fill_in 'Password', with: "password"
      fill_in 'Full Name', with: "Joe Smith"
      click_on 'Get Started'

      visit root_path

      fill_in 'Email Address', with: "example1@email.com"
      fill_in 'Password', with: "password"
      fill_in 'Full Name', with: "Joe Smith"
      click_on 'Get Started'

      expect(page).to have_content "Sorry there is a user already registered with that email, please try again"
    end
  end
end
