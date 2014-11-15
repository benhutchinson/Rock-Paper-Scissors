Feature: Starting the game
  In order to start the game
  As a player at Makers Academy
  I must enter my name

  Scenario: Visiting The Home Page
    Given I am on the homepage
    Then I should see "Please enter your name"

  Scenario: Registered
    Given I am on the homepage
    When I fill in the form with "Ben"
      And I click the submit button
    Then I should be taken to the Play page and see "Ben"
