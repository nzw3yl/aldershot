Feature: Complete Priority
  A signed in user
  Should be able to mark a priority as complete

    Background:
      Given I am logged in

    Scenario: I add and complete a high priority
      When I add a high priority
      Then I should have a high priority in my queue
      When I mark a priority as complete
      Then I should not have a high priority in my queue

    Scenario: I add and complete a low priority
      When I add a low priority
      Then I should have a low priority in my queue
      When I mark a priority as complete
      Then I should not have a low priority in my queue