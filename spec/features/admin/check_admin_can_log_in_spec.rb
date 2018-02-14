require 'rails_helper'

describe "As an admin" do
  context "when I visit the categories page" do
    it "I can see all of the categories" do
    admin = User.create!(email: "boss@gmail.com", password: "password", full_name: "bossbossboss", role: 1)

    visit admin_categories_path

    expect(page).to have_content("Admin Categories Path")
    end
  end
end
