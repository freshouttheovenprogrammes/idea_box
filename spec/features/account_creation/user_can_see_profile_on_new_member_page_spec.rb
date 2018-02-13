describe "As a user" do
  context "when I sign in" do
    xit "I arrive at the profile path" do
      user = User.create!(email: "Jonjon@gmail.com", password: "password", full_name: "Jon Jon")

      visit user_path(user)



      expect(page).to have_content('Welcome back Jon Jon!')
    end
  end
end
