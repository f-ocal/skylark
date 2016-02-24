require 'rails_helper'

RSpec.feature "Images", type: :feature do

# Should these be in Users feature spec?
# There are unsolved issues when using this code over there ...

  context 'a guest user' do
    it 'can see the page title' do
      visit root_path
      expect(page).to have_content('SKYLARK')
    end

    it 'can visit the Register link' do
      visit root_path
      expect(page).to have_content('Register')
      click_link('Register')
      expect(page).to have_content('Sign up')
    end

    it 'can visit the Login link' do
      visit root_path
      expect(page).to have_content('Login')
      click_link('Login')
      expect(page).to have_content('Log in')
    end

# No Contact us Page, so not working yet!
    # it 'can visit the Contact Us link' do
    #   visit root_path
    #   expect(page).to have_content('Contact Us')
    #   click_link('Contact Us')
    #   ????
    #   expect(page).to have_content('?????')
    # end

# WARNING - Security hole here:
# There's gotta be a more secure way to do this...
    describe 'logging in' do
      it 'can log in and see a welcome message' do
        visit root_path
        expect(page).to have_content('Login')
        click_link('Login')
        expect(page).to have_content('Log in')
        email = 'michael@email.com'
        password = 'whelpley'
        fill_in 'user_email', with: email
        fill_in 'user_password', with: password
        click_button 'Log in'
        expect(page).to have_content('Welcome back. You have successfully signed in.')
        # expect(page).to have_content('Invalid email or password.')
      end
      it 'can log in incorrectly and see an error message' do
        visit root_path
        expect(page).to have_content('Login')
        click_link('Login')
        expect(page).to have_content('Log in')
        fill_in 'user_email', with: 'blah@blah.com'
        fill_in 'user_password', with: 'gookbook'
        click_button 'Log in'
        expect(page).to have_content('Invalid email or password.')
      end

    end

  end

end

