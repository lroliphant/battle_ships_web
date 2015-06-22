require 'spec_helper'

feature 'Starting a new game' do
  scenario 'I am asked to enter my name' do
    visit '/'
    click_link 'New Game'
    visit '/name'
    expect(page).to have_content "What's your name?"
  end

  scenario 'stays on the same page if player doesnt enter his name' do
    visit '/name'
    click_button 'Submit'
    expect(page).to have_content "What's your name?"
  end

  scenario 'goes to new page if you add a name' do
    visit '/name'
    fill_in('name', with: 'Hello,  Jack Welcome to Battleship!')
    click_button 'Submit'
    expect(page).to have_content "Hello"
  end

end
