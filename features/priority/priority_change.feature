Feature: Change Priority
  A signed in user
  Should be able to change the urgency of a priority

    Background:
      Given I am logged in

    Scenario: I add and change the urgency of a high priority
      When I add a high priority
      Then I should have a high priority in my queue
      When I push a priority lower
      Then I should not have a high priority in my queue

    Scenario: I add and change the urgency of a low priority
      When I add a low priority
      Then I should have a low priority in my queue
      When I raise a priority higher
      Then I should not have a low priority in my queue