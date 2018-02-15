require 'rails_helper'

describe "As a regular user" do
  it "I can't add new images" do

    visit new_image_path

    expect(page).to have_content('404')
  end
end

describe "As an admin" do
  it "I can add a new image" do
  admin = create(:admin)

  visit login_path

  fill_in 'Email Address', with: admin.email
  fill_in 'Password', with: admin.password
  click_on 'Log In'
  click_on "Add Image"

  expect(current_path).to eq(new_admin_image_path)

  fill_in 'Title', with: "Test Img"
  attach_file("image[image]", Rails.root + "app/assets/images/idea-bulb.jpg")
  click_on 'Create Image'

  expect(page).to have_css("img[src*='/uploads/image/image/1/idea-bulb.jpg']")
  end
end
