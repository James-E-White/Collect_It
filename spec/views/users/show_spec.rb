require 'rails_helper'

RSpec.describe "the User Show page aka the user's dashboard" do
  describe "when a user visits '/users/:id' where id is a valid user id" do
    before do
      visit "/"
      click_button("Log In")
      expect(current_path).to eq("/login")
      fill_in "email", with: 'jw@test.com'
      fill_in "password", with: 'test'
      click_button("Log In")
      expect(current_path).to eq("/dashboard")

      
    end

    it "shows '<username>'s Dashboard, a discover comics button" do
            click_button("Log In")
      expect(current_path).to eq("/login")
      fill_in "email", with: 'jw@test.com'
      fill_in "password", with: 'test'
      click_button("Log In")
      expect(current_path).to eq("/login")
      expect(page).to have_content("Welcome to your Collect It Dashboard
")
      
    end
  end
end
