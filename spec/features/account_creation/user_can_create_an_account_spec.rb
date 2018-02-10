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
  end
end
