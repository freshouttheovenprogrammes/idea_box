require 'rails_helper'

describe "As a user" do
  before(:each) do
    @user = create(:user)
    @category = create(:category)
    visit root_path

    click_on 'Log In'

    fill_in 'Email Address', with: "zac@zac.com"
    fill_in 'Password', with: "password"

    click_on 'Log In'
  end
  context "when I go to the category index" do
    it "I see all the categories" do
      category2 = create(:category, name: "smores", id: 2)

      visit categories_path

      expect(page).to have_content @category.name
      expect(page).to have_content category2.name
    end
    it "I click on the category name and go to the category show page" do
      visit categories_path

      click_link(@category.name)

      expect(current_path).to eq category_path(@category)
      expect(page).to have_content(@category.name)
    end
  end
end
