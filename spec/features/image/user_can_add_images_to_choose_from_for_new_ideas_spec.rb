require 'rails_helper'

describe "As a user" do
  it "I can go to the images page and add a new image" do
    visit new_image_path

    expect(page).to have_button('Create Image')

    fill_in 'image[title]', with: 'Test'
    find('form input[type="file"]').set('app/assets/images/test.jpg')
    click_on('Create Image')

    image = Image.last

    expect(current_path).to eq image_path(image.id)
    expect(page).to have_content('Test')
    save_and_open_page
    expect(page).to have_css("img[src*='/uploads/image/image/1/thumb_test.jpg']")
  end
end
