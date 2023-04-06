require 'rails_helper'
include Capybara::DSL

RSpec.describe ' User registration page' do
  describe "when a user visits '/welcome' page" do
    it 'shows a form to register, once registered they are redirected to the user show page' do
      visit "/"

      expect(page).to_not have_content('james@turing.edu')
       
    #   click_link('Create New User')
      
      visit '/register'

      expect(current_path).to eq("/register")
      expect(page).to have_field(:username)
      expect(page).to have_field(:email)
      expect(page).to have_field(:password)
      expect(page).to have_button('Create New User')

    #   fill_in(:username, with: 'James')
    #   fill_in(:email, with: 'james@truing.edu')
    #   fill_in(:password, with: 'test')
    #   fill_in(:password_confirmation, with: 'test')
    #   click_button('Create New User')

    #   last_created = User.last
       
     
    #   save_and_open_page
    #   expect(page).to have_content('james@turing.edu')
    end
  end
   it "doesn't allow you to leave fields blank" do
      visit '/register'
      fill_in(:Username, with: 'James')
     
      click_button('Create New User')

      expect(current_path).to eq("/")
      within '#flash-messages' do
        expect(page).to have_content("Error: Email can't be blank, Password can't be blank")
        
        fill_in(:Email, with: 'j@turing.edu')
        click_button('Create New User')
        
        expect(current_path).to eq("/")
      end
      within '#flash-messages' do
        expect(page).to have_content("Error: Username can't be blank, Password can't be blank, Password confirmation can't be blank")
        fill_in(:Username, with: 'j')
        fill_in(:email, with: 'j@turing.edu')
        fill_in(:password, with: '')
        click_button('Create New User')
      end

      expect(current_path).to eq("/")
      within '#flash-messages' do
        expect(page).to have_content("Error: Password can't be blank, Password confirmation can't be blank")
        
        fill_in(:username, with: 'James')
        fill_in(:email, with: 'james@turing.edu')
        fill_in(:password, with: 'James')
        fill_in(:password_confirmation, with: '')
        click_button('Create New User')
        
        expect(current_path).to eq("/")
      end
      within '#flash-messages' do
        expect(page).to have_content("Password confirmation can't be blank")
        
        fill_in(:username, with: 'James')
        fill_in(:email, with: 'james@turing.edu')
        fill_in(:password, with: 'Test')
        fill_in(:password_confirmation, with: 'Tes')
        click_button('Create New User')
        
        expect(current_path).to eq("/")
      end
      within '#flash-messages' do
        expect(page).to have_content("Error: Password confirmation doesn't match Password")
        
        
        it "doesn't allow you to register a non-unique email address" do
          User.create!(username: 'Jam', email: 'james@turing.edu', password: 'test', password_confirmation: 'test')
          visit "/register"
          fill_in(:username, with: 'Jam')
          fill_in(:email, with: 'james@turing.edu')
          fill_in(:password, with: 'Jam')
          click_button('Create New User')
          
          expect(current_path).to eq("/")
        end
          within '#flash-messages' do
        expect(page).to have_content('Error: Email has already been taken')
      end
    end
  end
end
