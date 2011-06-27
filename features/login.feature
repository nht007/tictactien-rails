Feature: Login
  In order to prevent evildoers from doing evildoings
  As a noble user
  I want to have a login

  Background:
    Given the following users:
      | login | password | email |
      | bob     | secret1  | bob@email.com |
      | bill    | secret2  | bill@email.com |

  Scenario: Successful Login
    Given I go to the new user session page
    And I fill in "user_session_login" with "bob"
    And I fill in "user_session_password" with "secret1"
    When I press "user_session_submit"
    Then I should be on the home page
