Feature: Playing the game
  In order to play the game
  As a player at Makers Academy
  I must take a turn and choose rock, paper, or scissors

  Scenario: Playing
    Given I have registered
    When I see a list of weapons as options to play
    Then I should select one weapon from this list
    Then I should press "Play"

  Scenario: Computer Plays
    Given I have registered
    Then the computer should play by selecting a random weapon from the same list

  Scenario: A Winner Should Be Declared
    Given I have played and the computer has played
    Then I should see the computer's play
      And I should see who won