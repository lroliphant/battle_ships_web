When(/^I follow 'New Game'$/) do
  click_link 'New Game'
end

Then(/^I should see 'What\\'s your name\?'$/) do
  expect(page).to have_content 'What\'s your name?'
end

Given(/^I see an object id$/) do
  @object_id = page.body.scan(/\d+/)[0]
end

Then(/^I should see the same object id$/) do
  expect(page).to have_content @object_id
end
