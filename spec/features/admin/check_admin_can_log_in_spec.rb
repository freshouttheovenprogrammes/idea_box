require 'rails_helper'

describe "As an admin" do
  context "when I log in" do
    it "I arrive at the admin dashboard" do
      admin = create(:admin)
      visit root_path

      click_on 'Log In'

      fill_in 'Email Address', with: admin.email
      fill_in 'Password', with: admin.password

      click_on 'Log In'

      expect(current_path).to eq admin_user_path(admin)
    end
  end

  context "when I visit the categories page" do
    it "I can see all of the categories" do
    create(:admin)

    visit admin_categories_path

    expect(page).to have_content("Admin Categories Path")
    end
  end
end
