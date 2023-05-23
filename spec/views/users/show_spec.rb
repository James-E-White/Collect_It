require 'rails_helper'

RSpec.describe "the User Show page aka the user's dashboard" do
  describe "when a user visits '/users/:id' where id is a valid user id" do
    before do
      visit "/login"
      fill_in "email", with: 'done@turing.edu'
      fill_in "password", with: 'dub'
      click_button("Log In")

      user = User.create!(username: 'Turbo', email: 'done@turing.edu', password: 'dub', password_confirmation: 'dub')

      visit "/users/#{user.id}"
    end

    it "shows '<username>'s Dashboard, a discover comics button" do
      #expect(page).to have_content("#{User.find(session[:user_id]).username}'s Dashboard")
      
    end
  end
end
