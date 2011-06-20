Feature: Manage games
  In order to play a game of tic-tac-toe
  As a player
  I want to place pieces on the board
  
  Scenario: Arriving at the home page
    When I am on the home page
    Then I should see a new game form
    
  Scenario: Starting a new Human vs Human game
    When I am on the home page
    And I select "Human" from "player_one"
    And I select "Human" from "player_two"
    And I press "Start New Game"
    Then I should see an empty grid

  Scenario: Updating a Human vs Human game in progress
    Given a new game
    When I select "2" from "row"
    And I select "2" from "column"
    And I press "Continue"
    And I should get a non-empty grid
