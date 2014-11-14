Feature: Starting the game
  In order to start the game
  As a player at Makers Academy
  I must enter my name

  Scenario: Registering
    Given I am on the homepage
    When I see "Please enter your name"
    Then I should complete the form

  Scenario: Getting Ready To Play 
    Given I have registered
    Then I should see play options