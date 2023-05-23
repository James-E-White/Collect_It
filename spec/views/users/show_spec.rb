require 'rails_helper'

RSpec.describe "the User Show page aka the user's dashboard" do
  describe "when a user visits '/users/:id' where id is a valid user id" do
    it "shows '<username>'s Dashboard, a discover comics button" do
        #User.create!(username: 'Dublin', email: 'dublin@turing.edu', password: 'dub', password_confirmation: 'dub')
          visit "/dashboard"
          # fill_in(:username, with: 'Dublin')
          # fill_in(:email, with: 'dublin@turing.edu')
          # fill_in(:password, with: 'dub')
          # fill_in(:password_confirmation, with: 'dub')
          # click_button('Create New User')
         
    #   @user_1 = User.create!(username: 'James', email: 'james@turing.edu', password: 'james',
    #                         password_confirmation: 'james')
    # visit "users/user.id"
    #save_and_open_page
    # expect(page).to have_content('James')
    end
  end
end
