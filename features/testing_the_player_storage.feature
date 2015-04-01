Feature: Storing a Player
  In order to play BattleShips
  As a nostalgic player
  I want the system to remember my actions

  Scenario: Hitting
    Given I am on the homepage
    And I see an object id
    When I am on the hit page
    Then I should see the same object id