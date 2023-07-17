require 'rails_helper'

RSpec.describe 'Discover Comics Page' do
  describe 'As a user when I visit /dashboard' do
    it 'discover page has a search button to discover comic books' do
      user = User.create!(username: 'dub', email: 'test@example.com', password: 'password', password_confirmation: 'password')
      # click_button 'Home'
      login_user(email: 'test@example.com', password: 'password')
      
      expect(current_path).to eq("/dashboard")
      expect(page).to have_content('Find Comics')
      
      click_button 'Find Comics'
      expect(current_path).to eq("/users/#{user.id}/discover/comics")
    end
  end
end

