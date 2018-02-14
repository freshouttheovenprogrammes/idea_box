require 'rails_helper'

describe "As a user" do
  context "when I'm on the idea show page" do
    it "I can delete my idea" do
      user = create(:user)
      category = create(:category)
      idea = Idea.create!(name: "make things", user_id: user.id, category_id: category.id)

      visit root_path

      click_on 'Log In'

      fill_in 'Email Address', with: 'zac@zac.com'
      fill_in 'Password', with: 'password'

      click_on 'Log In'

      visit user_idea_path(user, idea)

      click_on 'Delete Idea'

      expect(current_path).to eq(user_ideas_path(user))
      expect(page).to_not have_content('make things')
    end
  end
  context "I am another user who didn't make the idea" do
    it "I can't even go to the other users page" do
      user1 = create(:user)
      user2 = create(:user, email: "zac2@zac.com")
      category = create(:category)
      idea = Idea.create!(name: "take out trash", user_id: user1.id, category_id: category.id)

      visit root_path

      click_on "Log In"

      fill_in "Email Address", with: "zac2@zac.com"
      fill_in "Password", with: "test"

      visit user_idea_path(user1, idea)
      expect(page).to have_content "404"
    end
  end
end
