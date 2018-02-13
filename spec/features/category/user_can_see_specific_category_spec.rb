require 'rails_helper'

describe "As a user" do
  context "when I go to the category index" do
    it "I see all the categories" do
      category = Category.create!(name: "chores")
      category2 = Category.create!(name: "smores")

      visit categories_path

      expect(page).to have_content category.name
      expect(page).to have_content category2.name
    end
    it "I click on the category name and go to the category show page" do
      category = Category.create!(name: "chores")

      visit categories_path

      click_link(category.name)

      expect(current_path).to eq category_path(category)
      expect(page).to have_content(category.name)
    end
  end
end
