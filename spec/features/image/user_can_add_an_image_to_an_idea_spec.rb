require 'rails_helper'

describe "As a user" do
  before(:each) do
    @user = create(:user)
    @category = create(:category)
    @image1 = Image.create!(title: "img1", image: "/app/assets/images/idea-bulb.jpg")
    @image2 = Image.create!(title: "img2", image: "/app/assets/images/idea-bulb.jpg")
    @image3 = Image.create!(title: "img3", image: "/app/assets/images/idea-bulb.jpg")

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
      within(:css, '.image_container') do
        # page.check('.image_1')
        # find('.image_1').set(true)
        # within_fieldset('.image_1').check
        check('image_1')
      end
      click_on 'Create Idea'
      # byebug
      expect(current_path).to eq user_idea_path(@user, Idea.last)
      expect(page).to have_content('test')
      expect(page).to have_content("#{@category.name}")

    end
  end
end
