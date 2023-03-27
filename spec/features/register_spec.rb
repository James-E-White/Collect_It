require 'rails_helper'

RSpec.describe ' User registration page' do
  describe "when a user visits '/' page" do
    it 'shows a for to register, once registered they are redirected to the user show page' do
      visit "/"

      expect(page).to_not have_content('james@turing.edu')

      click_on('Create New User')

      expect(current_path).to eq("/")
      expect(page).to have_field(:username)
      expect(page).to have_field(:email)
      expect(page).to have_field(:password)
      save_and_open_page
      expect(page).to have_button('Create New User')
    end
  end
end
