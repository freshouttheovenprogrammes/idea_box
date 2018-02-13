require 'rails_helper'

describe "As a user" do
  it "I can update a category with a new name" do
    category = Category.create!(name: "chores")
    visit category_path(category)

    click_on 'Edit Category'

    expect(current_path).to eq edit_category_path(category)

    fill_in 'category[name]', with: "house music"
    click_on 'Update Category'

    expect(page).to have_content 'house music'
  end
end
