require 'rails_helper'

RSpec.describe 'Discover Comics Page' do 
    describe 'As a user when I visit users/:id/discover' do 
        it 'discover page has a search button to tdiscover comic books' do 
           user_1 = User.create!(username: 'Jam', email: 'james@turing.edu', password: 'test', password_confirmation: 'test')

           visit "/users/#{user_1.id}/discover"
           click_button 'Find your Comics' 
           expect(current_path).to eq("/users/#{user_1.id}/comics")
        end
    end
end