require 'rails_helper'

RSpec.feature "Images", type: :feature do

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

  end

end
