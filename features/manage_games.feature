Feature: Manage games
  In order to play a game of tic-tac-toe
  As a player
  I want to place pieces on the board
  
  Scenario: Viewing a board
    When I am on the home page
    Then I should see an empty board
    
  Scenario: Making a move on an empty board
    When I am on the home page
    And I press "top-left"
    Then I should not see an empty board

  Scenario: