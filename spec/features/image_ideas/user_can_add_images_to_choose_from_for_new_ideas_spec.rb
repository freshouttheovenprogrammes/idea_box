require 'rails_helper'

describe "As a user" do
  pending("CarrierWave not implemented yet") do
  it "I can go to the images page and add a new image" do
    visit images_path

    click_on('Upload Image')

    expect(current_path).to eq(new_image_path)

    attach_file('ok', File.relative_path('./app/assets/images/test.jpg'))

    expect(page).to have_content('app/assets/images/test.jpg')
  end
  end
end
