require 'rails_helper'

describe "As a user" do
  before(:each) do
    @user = create(:user)
    @category = create(:category)
    visit root_path

    click_on 'Log In'

    fill_in 'Email', with: "zac@zac.com"
    fill_in 'Password', with: "password"

    click_on 'Log In'
  end
  context "after I create an idea" do
    it "I can view the details of that idea" do
      idea = Idea.create!(name: "take out trash", user_id: @user.id, category_id: @category.id)
      visit user_idea_path(@user, idea)

      expect(page).to have_content("take out trash")
    end
  end
end
