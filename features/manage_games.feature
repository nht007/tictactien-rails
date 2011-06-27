Feature: Manage games
  In order to play a game of tic-tac-toe
  As a player
  I want to place pieces on the board
  
  Background:
    Given the following users:
      | login | password | email |
      | bob     | secret1  | bob@email.com |
    
  Scenario: Arriving at the home page
    When I am on the home page
    And I follow "Log in"
    And I fill in "user_session_login" with "bob"
    And I fill in "user_session_password" with "secret1"
    When I press "user_session_submit"
    Then I should see a new game form
    
  Scenario: Starting a new Human vs Human game
    Given I go to the new user session page
    And I fill in "user_session_login" with "bob"
    And I fill in "user_session_password" with "secret1"
    When I press "user_session_submit"
    Then I should be on the home page
    And I select "Human" from "player_one"
    And I select "Human" from "player_two"
    And I press "Start New Game"
    Then I should see an empty grid

  Scenario: Updating a Human vs Human game in progress
    Given I go to the new user session page
    And I fill in "user_session_login" with "bob"
    And I fill in "user_session_password" with "secret1"
    When I press "user_session_submit"
    Then I should be on the home page
    And I select "Human" from "player_one"
    And I select "Human" from "player_two"
    And I press "Start New Game"
    When I select "2" from "row"
    And I select "2" from "column"
    And I press "Continue"
    And I should see a non-empty grid
