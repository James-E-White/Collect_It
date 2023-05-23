require 'rails_helper'

RSpec.describe 'Discover Comics Page' do 
    describe 'As a user when I visit users/:id/discover' do 
        it 'discover page has a search button to discover comic books' do 
           user_1 = User.create!(username: 'Jam', email: 'james@turing.edu', password: 'test', password_confirmation: 'test')

           visit "/users/#{user_1.id}/discover"
         
           expect(page).to have_content("Discover Comics")
           expect(page).to have_field("q")
           click_button 'Find Comics' 
           expect(current_path).to eq("/users/#{user_1.id}/comics")
          save_and_open_page
          
        end

        it 'provides a list of comics from search button' do 
            
        end
    end
end