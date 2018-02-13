require 'rails_helper'

describe "As a user" do
  it "I can go to the images page and add a new image" do
    visit new_image_path

    expect(page).to have_content('Upload Image')

    attach_file('ok', File.relative_path('./app/assets/images/test.jpg'))

    click_on('Upload Image')

    expect(page).to have_content('app/assets/images/test.jpg')
  end
end
