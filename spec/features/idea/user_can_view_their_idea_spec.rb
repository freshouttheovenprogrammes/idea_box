require 'rails_helper'

describe "As a user" do
  context "after I create an idea" do
    it "I can view the details of that idea" do
      user = User.create!(email: "zac@zac.com", password: "password", full_name: "Zac Zac")
      idea = Idea.create!(name: "take out trash", user_id: user.id)
      visit user_idea_path(user, idea)
      
      expect(page).to have_content("take out trash")
    end
  end
end
