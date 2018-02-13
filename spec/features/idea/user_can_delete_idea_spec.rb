require 'rails_helper'

describe "As a user" do
  context "when I'm on the idea show page" do
    it "I can delete my idea" do
      user = User.create!(email: "zac@zac.com", password: "password", full_name: "Zac Zac")
      category = Category.create!(name: "chores")
      idea = Idea.create!(name: "take out trash", user_id: user.id, category_id: category.id)

      visit user_idea_path(user, idea)

      click_on 'Delete Idea'

      expect(page).to_not have_content('take out trash')
    end
  end
end
