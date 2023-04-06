require 'rails_helper'

RSpec.describe 'landing page', type: :feature do
  describe 'landing page- Has application title, button to create a new user, and index of existing users and a link back to the home page' do
    it 'has a landing page with an application title' do
      visit '/'
       
      expect(page).to have_content("Welcome to Collect It")
    end

    it 'has a button to create a new user' do
      visit '/'
    
      
      expect(page).to have_button('Create A New User')
   
    end
  end
end