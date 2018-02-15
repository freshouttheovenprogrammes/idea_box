require 'rails_helper'

describe "As an admin" do
  context "when I log in" do
    before(:each) do
      @admin = create(:admin)
      visit root_path

      click_on 'Log In'

      fill_in 'Email Address', with: @admin.email
      fill_in 'Password', with: @admin.password

      click_on 'Log In'
    end

    it "I arrive at the admin dashboard" do
      expect(current_path).to eq admin_user_path(@admin)
    end

    it "there are links to admin only paths" do
      expect(page).to have_content("Add Categories")
      expect(page).to have_content("Add Images")
    end

    it "the add categories link takes me to the right path" do
      click_on "Add Categories"

      expect(current_path).to eq new_admin_category_path
    end

    it "the add images link takes me to the right path" do
      click_on "Add Images"

      expect(current_path).to eq new_admin_image_path
    end
  end
end
