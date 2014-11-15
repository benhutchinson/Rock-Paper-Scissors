Feature: Playing the game
  In order to play the game
  As a player at Makers Academy
  I must take a turn and choose rock, paper, or scissors

  Scenario: Playing
    Given I have registered
    When I select a weapon such as "Rock" to play
    When I press "Play"
    Then I should be taken to the "Results" page

  Scenario: A Winner Should Be Declared
    Given I have played
    Then I should see the computer's play
      And I should see who won