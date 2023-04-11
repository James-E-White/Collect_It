require 'rails_helper'

RSpec.describe "the User Show page aka the user's dashboard" do
  describe "when a user visits '/users/:id' where id is a valid user id" do
    it "shows '<username>'s Dashboard, a discover comics button" do
      user_1 = User.create!(username: 'James', email: 'james@turing.edu', password: 'james',
                            password_confirmation: 'james')
      #save_and_open_page
      visit "users/:id"
    end
  end
end
