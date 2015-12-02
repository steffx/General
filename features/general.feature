Feature: Happy path tests for team007qa.slack.com

  Scenario: Login on the main page

    Given I log in to "team007qa.slack.com"
    And I type "stefan.buburuz@gmail.com" in the email field
    And I type "Steff007*" in the password field
     And I click the Sign in button
    Then I should be logged in
    And I should sign out

