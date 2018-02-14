require 'rails_helper'

describe "As a user" do
  context "when I sign in" do
    it "I arrive at the profile path and see my name on the screen" do
      user = create(:user)

      visit root_path
      click_on 'Log In'

      fill_in 'Email Address', with: "zac@zac.com"
      fill_in 'Password', with: "password"
      click_on 'Log In'

      expect(page).to have_content('Welcome back Zac Psquizz!')
    end
  end
end
