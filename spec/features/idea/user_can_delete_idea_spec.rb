require 'rails_helper'

describe "As a user" do
  context "when I'm on the idea show page" do
    it "I can delete my idea" do
      user = create(:user)
      category = create(:category)
      idea = create(:idea)

      visit user_idea_path(user, idea)

      click_on 'Delete Idea'

      expect(current_path).to eq(user_ideas_path(user))
      expect(page).to_not have_content('make things')
    end
  end
end
