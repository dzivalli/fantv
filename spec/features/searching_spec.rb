require 'rails_helper'

feature 'Searching' do
  scenario 'User input nonexistent name', js: true do
    visit root_path
    fill_in 'text', with: 'qqqqqqqqqqqqqqqqqq'

    within '.results' do
      expect(page).to have_content 'Nothing found'
    end
  end
end