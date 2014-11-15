Given(/^I am on the homepage$/) do
  visit('/')
end

Then(/^I should see "(.*?)"$/) do |arg1|
  expect(page).to have_content(arg1)
end

When(/^I fill in the form with "(.*?)"$/) do |arg1|
  fill_in('player_name', :with => arg1)
end

When(/^I click the submit button$/) do
  click_button('submit')
end

Then(/^I should be taken to the Play page and see "(.*?)"$/) do |arg1|
  expect(page).to have_content('Hello ' + arg1)
end
