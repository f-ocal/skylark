require 'rails_helper'

RSpec.feature "Images", type: :feature, js:true do
  let(:user) { User.create(username: 'skylark', email: 'someone@gmail.com', password: 'something') }

  context 'a guest user' do
    it 'visits home page' do
      visit root_path
      expect(page).to have_content("SKYLARK");
      end

    it 'visits the register link' do
      visit root_path
      expect(page).to have_content('Register')
      click_link('Register')
      expect(page).to have_content('Sign up')
    end

    describe 'logging in' do
      let(:user) { User.create(username: 'skylark', email: 'someone@gmail.com', password: 'something') }

      it 'can log in and see a welcome message' do
        visit root_path
        expect(page).to have_content('Login')
        click_link('Login')
        expect(page).to have_content('Log in')
        email    = 'someone@gmail.com'
        password = 'something'
        fill_in 'user_email', with: email
        fill_in 'user_password', with: password
        click_button 'Log in'
        expect(page).to have_content('Welcome back. You have successfully signed in.')
      end

      it 'can log in incorrectly and see an error message' do
        visit root_path
        expect(page).to have_content('Login')
        click_link('Login')
        expect(page).to have_content('Log in')
        fill_in 'user_email', with: 'blah@blah.com'
        fill_in 'user_password', with: 'jhkjj'
        click_button 'Log in'
        expect(page).to have_content('Invalid email or password.')
      end

    end

  end

end

