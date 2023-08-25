require 'rails_helper'

RSpec.describe 'Discover Comics Page' do
  describe 'As a user when I visit /dashboard' do
    it 'discover page has a search button to discover comic books' do
      user = User.create!(username: 'dub', email: 'test@example.com', password: 'password', password_confirmation: 'password')
      login_user(user)
      
      expect(current_path).to eq("/dashboard")

      expect(page).to have_button('Find Comics')
      fill_in :query, with: 'Batman'
      click_button 'Find Comics'
      expect(current_path).to eq("/users/#{user.id}/discover/search")
    end
  end
end

