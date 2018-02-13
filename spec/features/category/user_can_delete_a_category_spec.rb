require 'rails_helper'

describe "As an admin" do
  it "I can delete a category" do
    category = Category.create!(name: "chores")

    visit category_path(category)

    click_on 'Delete Category'

    expect(current_path).to eq categories_path
    expect(page).to_not have_content('chores')
  end
end
