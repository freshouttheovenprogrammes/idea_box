require 'rails_helper'

describe "As a guest" do
  context "I can view all images" do
    it "by clicking on the link in the root" do
      visit root_path

      click_on('All Images')

      expect(current_path).to eq images_path
    end
  end
end
