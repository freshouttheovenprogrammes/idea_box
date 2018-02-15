require 'rails_helper'

describe "As a user" do
  it "I cannot delete a category" do
    user = create(:user)
    category = create(:category)

    visit login_path

    fill_in 'Email Address', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log In'

    visit category_path(category)

    expect(page).to_not have_content('Delete Category')
    expect(page).to_not have_content('Edit Category')
  end
end

describe "As an admin" do
  it "I can delete a category" do
    admin = create(:admin)
    category = create(:category)

    visit login_path

    fill_in 'Email Address', with: admin.email
    fill_in 'Password', with: admin.password
    click_on 'Log In'

    visit category_path(category)

    click_on 'Delete Category'

    expect(current_path).to eq categories_path
    expect(page).to_not have_content('chores')
  end
end
