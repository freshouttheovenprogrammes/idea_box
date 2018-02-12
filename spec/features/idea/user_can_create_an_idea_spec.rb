require 'rails_helper'

describe "As a user" do
  context "after I log into my profile" do
    it "I am able to add an idea" do
      user = User.create!(email: "email@email.com", password: "password", full_name: "Suzy Sue")

      visit user_path(user)

      click_on 'Create Idea'
      expect(current_path).to eq new_user_idea_path(user)

      fill_in 'idea[name]', with: "Ideabox"
      click_on 'Submit Idea'

      expect(current_path).to eq user_idea_path(user, user.ideas.last)
      expect(page).to have_content 'Ideabox'
    end
  end
end
