require 'rails_helper'

feature 'Searching' do
  scenario 'User input nonexistent name', js: true do
    visit root_path
    fill_in 'text', with: 'qqqqqqq'

    expect(page).to have_selector '.results', visible: false

    within '.message' do
      expect(page).to have_content 'Nothing found'
    end
  end

  scenario 'User is typing', js: true do
    visit root_path
    fill_in 'text', with: 'clint'

    expect(page).to have_selector '.results', visible: true

    within '.message' do
      expect(page).to_not have_content 'Nothing found'
    end

    within '.movies' do
      expect(page).to have_selector '.entity', count: 7
    end

    within '.shows' do
      expect(page).to have_selector '.entity', count: 10
    end

    within '.people' do
      expect(page).to have_selector '.entity', count: 2
    end
  end
end