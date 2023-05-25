require 'rails_helper'

RSpec.describe 'Discover Comics Page' do
  describe 'As a user when I visit /dashboard' do
    it 'discover page has a search button to discover comic books' do
      user = User.create!(username: 'dub', email: 'test@example.com', password: 'password', password_confirmation: 'password')
      login_user(user) 
      
      visit "/users/#{user.id}"
      expect(page).to have_field('query', placeholder: 'Search Comics')
      expect(page).to have_button('Find Comics')
      
      click_button 'Find Comics'
      expect(current_path).to eq("/users/#{user.id}/discover/comics")
    end
  end
end

