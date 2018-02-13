require 'rails_helper'

describe "As a user" do
  it "I can create a new category" do
    # user = User.create!(email: "zac@zac.com", password: "password", full_name: "Zac Zac")

    visit new_category_path

    fill_in 'category[name]', with: "sports"
    click_on 'Create Category'

    expect(current_path).to eq categories_path
    expect(page).to have_content 'sports'
  end
end
