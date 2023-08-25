require 'rails_helper'

RSpec.describe "the User Show page aka the user's dashboard" do
  describe "when a user visits '/users/:id' where id is a valid user id" do
    before do
      visit "/"
      click_button("Log In")
      user = User.create!(username: 'dub', email: 'test@example.com', password: 'password', password_confirmation: 'password')
      login_user(user)
      
      expect(current_path).to eq("/dashboard")



      
    end

    it "shows '<username>'s Dashboard, a discover comics button" do

      expect(current_path).to eq("/dashboard")
      save_and_open_page
      expect(page).to have_content("Welcome to dub Collect It Dashboard")
      
    end
  end
end
