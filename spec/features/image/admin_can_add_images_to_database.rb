require 'rails_helper'

describe "As a regular user" do
  it "I can't add new images" do

    visit new_image_path

    expect(page).to have_content('404')
  end
end


describe "As an admin" do
  xit "I can go to the new images page and add a new image" do

    visit new_image_path

    expect(page).to have_button('Create Image')

    fill_in 'image[title]', with: 'Test'
    find('form input[type="file"]').set('app/assets/images/test.jpg')
    click_on('Create Image')

    image = Image.last

    expect(current_path).to eq image_path(image.id)
    expect(page).to have_content('Test')

    expect(page).to have_css("img[src*='/uploads/image/image/1/thumb_test.jpg']")
  end
end
