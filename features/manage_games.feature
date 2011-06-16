Feature: Manage games
  In order to play a game of tic-tac-toe
  As a player
  I want to place pieces on the board
  
  Scenario: Starting a game
    When I am on the home page
    Then I should see a new game form
