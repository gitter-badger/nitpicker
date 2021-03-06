Feature: Checking QA test plans for failed cases

    Scenario: A CI script returns 0 if there are no failed cases in QA dir
    Given there are 2 passed cases in "feature_1.plan_1"
    And there are 2 passed cases in "feature_1.plan_2"
    When we input command "check"
    And flag --all-runs-passed is added
    Then we get 0 status code

    Scenario: A CI script returns 1 if there is a failed cases in QA dir
    Given there are 2 passed cases in "feature_1.plan_1"
    And there are 1 failed cases in "feature_1.plan_2"
    When we input command "check"
    And flag --all-runs-passed is added
    Then we get 1 status code

    Scenario: A CI script returns 0 if there is a skipped cases in QA dir
    Given there are 2 passed cases in "feature_1.plan_1"
    And there are 1 skipped cases in "feature_1.plan_2"
    When we input command "check"
    And flag --all-runs-passed is added
    Then we get 0 status code

    Scenario: A CI script returns 1 if there are not any new runs in the feature branch
    Given there are no new runs in the feature branch
    When we input command "check"
    And flag --has-new-runs is added
    Then we get 1 status code

    Scenario: A CI script returns 0 if there are some new runs in the feature branch
    Given there are some new runs in the feature branch
    When we input command "check"
    And flag --has-new-runs is added
    Then we get 0 status code
    And the current branch compared with master

    Scenario: A CI script returns 0 if there are no changes at all
    Given there are not changes in the feature branch
    When we input command "check"
    And flag --has-new-runs is added
    Then we get 0 status code
    And the current branch compared with master