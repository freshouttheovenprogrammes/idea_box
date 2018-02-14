require 'rails_helper'

describe "As a user" do
  context "when I sign in" do
    it "I arrive at the profile path" do
      user = User.create!(email: "Jonjon@gmail.com", password: "password", full_name: "Jon Jon")

      visit root_path
      click_on 'Log In'

      fill_in 'email', with: "Jonjon@gmail.com"
      fill_in 'password', with: "password"
      click_on 'Log In'

      expect(page).to have_content('Welcome back Jon Jon!')
    end
  end
end
