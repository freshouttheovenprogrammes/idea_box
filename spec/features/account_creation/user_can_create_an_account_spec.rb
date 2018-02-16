require 'rails_helper'

describe "As a user" do
  context "when I get to the root page" do
    it "I see the login field" do

      visit root_path

      expect(page).to have_content('Join IdeaBox')
      expect(page).to have_field('Email Address')
      expect(page).to have_field('Password')
      expect(page).to have_field('Full Name')
      expect(page).to have_content('Already have an account with us?')
      expect(page).to have_selector(:link_or_button, 'Log In')
    end

    it "without entering password I get an error message" do
      visit root_path

      fill_in 'Email Address', with: "example@email.com"
      fill_in 'Password', with: ""
      fill_in 'Full Name', with: "Joe Smith"
      click_on 'Get Started'

      expect(page).to have_content "Password can't be blank"
    end

    it "without entering email I get an error message" do
      visit root_path

      fill_in 'Email Address', with: ""
      fill_in 'Password', with: "password"
      fill_in 'Full Name', with: "Joe Smith"
      click_on 'Get Started'

      expect(page).to have_content "Email can't be blank"
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
