require 'rails_helper'

describe "As a user" do
  before(:each) do
    image_src = File.join(Rails.root, "/app/assets/images/idea-bulb.jpg")
    src_file = File.new(image_src)
    @user = create(:user)
    @category = create(:category)
    @image1 = Image.create!(title: "img1", image: src_file)
    @image2 = Image.create!(title: "img2", image: src_file)
    @image3 = Image.create!(title: "img3", image: src_file)

    visit root_path

    click_on 'Log In'

    fill_in 'Email Address', with: "zac@zac.com"
    fill_in 'Password', with: "password"

    click_on 'Log In'
  end
  context "while I'm adding an idea" do
    it "I can attach an image to the idea" do
      click_on 'Create Idea'
      fill_in 'Name', with: "test"

      select "#{@category.name}", from: "idea[category_id]"
      page.check('img2')
      click_on 'Create Idea'

      expect(current_path).to eq user_idea_path(@user)
      expect(page).to have_content('test')
      expect(page).to have_css("img[src*='/uploads/image/image/1/idea-bulb.jpg']")
    end
  end
end
