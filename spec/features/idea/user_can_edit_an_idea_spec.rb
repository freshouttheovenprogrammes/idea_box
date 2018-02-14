require 'rails_helper'

describe "As a user" do
  before(:each) do
    @user = create(:user)

    visit root_path

    click_on 'Log In'

    fill_in 'Email', with: "zac@zac.com"
    fill_in 'Password', with: "password"

    click_on 'Log In'
  end
  context "when I'm on the idea show page" do
    it "I can edit the idea" do
      category = create(:category)
      idea = Idea.create!(name: "take out trash", user_id: @user.id, category_id: category.id)

      visit user_idea_path(@user, idea)

      click_on 'Edit Idea'
      fill_in 'idea[name]', with: "wash dishes"
      select "#{category.name}", from: "idea[category_id]"

      click_on 'Update Idea'

      expect(page).to have_content "Success"
      expect(page).to have_content 'wash dishes'
    end
  end
end
