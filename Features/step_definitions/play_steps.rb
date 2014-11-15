Given(/^I have registered$/) do
  step "I am on the homepage"
  step 'I fill in the form with "(.*?)"'
  step "I click the submit button"
end

When(/^I select a weapon such as "Rock" to play$/) do
  select('Rock', :from => "weapon")
end

When (/^I press "Play"$/) do 
  click_button("Play")
end

Then(/^I should be taken to the "Results" page$/) do
  expect(page).to have_content("Result")
end

Given(/^I have played$/) do
  step "I have registered"
  step 'I select a weapon such as "Rock" to play'
  step 'I press "Play"'
  step 'I should be taken to the "Results" page'
end

Then(/^I should see the computer's play$/) do
  expect(page).to have_content("The computer chose")
end

Then(/^I should see who won$/) do
  expect(page).to have_content("The winner is ... ")
end