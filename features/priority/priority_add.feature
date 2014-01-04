Feature: Add Priority
  A signed in user
  Should be able to add a priority

    Background:
      Given I am logged in

    Scenario: I sign in and add a high priority
      When I add a high priority
      Then I should have a high priority in my queue

    Scenario: I sign in and add a low priority
      When I add a low priority
      Then I should have a low priority in my queue