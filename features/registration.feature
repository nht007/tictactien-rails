Feature: Registration
  In order to populate the system with users
  As a potential person
  I want create a user
  
  Background
    Given there are no users
 
  Scenario: Simple registration
    Given I am on the home page 
    When I follow "Register"
    And I fill in "Login" with "nht007"
    And I fill in "Email" with "nht007@gmail.com"
    And I fill in "Password" with "secret"
    And I fill in "Password confirmation" with "secret"
    And I press "Register"
    Then I should be on the home page
    And there should be the following user
    | Login  | Email            |
    | nht007 | nht007@gmail.com |
    
  Scenario: User form validations
    Given I am on the home page 
    When I follow "Register"
    And I press "Register"
    Then I should see "email is too short (minimum is 6 characters)"
    And I should see "email should look like an email address."
    And I should see "login is too short (minimum is 3 characters)"
    And I should see "login should use only letters, numbers, spaces, and .-_@ please."
    And I should see "password is too short (minimum is 4 characters)"
    And I should see "password doesn't match confirmation"
    And I should see "password_confirmation is too short (minimum is 4 characters)"
    
