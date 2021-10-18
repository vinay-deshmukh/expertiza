
Feature: Late Policy

    As described in the requirements document, I need to be able to 
    succesfully create and modify late policies, and associate them
    with an assignment

    Scenario: Create new late policy successfully
        Given I am on the assignment 1 edit page
        When I switch to Due Dates tab
        When I click on "New late policy"
        Then I should be on "/late_policies/new"
        When I fill in "late_policy[policy_name]" with "Late pol1"
        And  I fill in "late_policy[penalty_per_unit]" with "1"
        And  I fill in "late_policy[max_penalty]" with "5"
        And  I click on "Create"
        Then I should be on "/late_policies/"
        And see "The penalty policy was successfully created."


