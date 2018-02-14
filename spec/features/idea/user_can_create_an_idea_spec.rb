require 'rails_helper'

describe "As a user" do
  before(:each) do
    @user = User.create!(email: "jon@gmail.com", password: "password", full_name: "Jon Jon", username: "jj101")
    @category = Category.create!(name: "chores")

    visit root_path

    click_on 'Log In'

    fill_in 'Email Address', with: 'jon@gmail.com'
    fill_in 'Password', with: 'password'

    click_on 'Log In'
  end
  context "after I log into my profile" do
    it "I am able to add an idea" do
      click_on 'Create Idea'
      expect(current_path).to eq new_user_idea_path(@user)

      fill_in 'idea[name]', with: "Ideabox"

      select "#{@category.name}", from: "idea[category_id]"

      click_on 'Create Idea'

      expect(current_path).to eq user_idea_path(@user, @user.ideas.last)
      expect(page).to have_content 'Ideabox'
    end
  end
end
