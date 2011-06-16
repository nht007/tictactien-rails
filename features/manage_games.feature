Feature: Manage games
  In order to play a game of tic-tac-toe
  As a player
  I want to place pieces on the board
  
  Scenario: Arriving at the home page
    When I am on the home page
    Then I should see a new game form
    
  Scenario: Starting a new Human vs Human game
    When I am on the home page
    And I select "Human" from "Player One"
    And I select "Human" from "Player Two"
    And I press "Start New Game"
    Then show me the page
    And I should see an empty grid

