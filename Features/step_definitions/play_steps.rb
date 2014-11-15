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

Then(/^the computer should play by selecting a random weapon from the same list$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^I have played and the computer has played$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I am on the Result page$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see the computer's play$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see who won$/) do
  pending # express the regexp above with the code you wish you had
end