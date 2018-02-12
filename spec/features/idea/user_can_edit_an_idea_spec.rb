require 'rails_helper'

describe "As a user" do
  context "when I'm on the idea show page" do
    it "I can edit the idea" do
      user = User.create!(email: "zac@zac.com", password: "password", full_name: "Zac Zac")
      idea = Idea.create!(name: "take out trash", user_id: user.id)

      visit user_idea_path(user, idea)

      click_on 'Edit Idea'
      fill_in 'idea[name]', with: "wash dishes"
      click_on 'Update Idea'

      expect(page).to have_content 'wash dishes'
    end
  end
end
