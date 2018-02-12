require 'rails_helper'

describe "As a user" do
  context "when I'm on the idea show page" do
    it "I can edit the idea" do
      user = User.create!(email: "zac@zac.com", password: "password", full_name: "Zac Zac")
      idea = Idea.create!(name: "take out trash", user_id: user.id)

      visit user_idea_path(user, idea)

      
    end
  end
end
