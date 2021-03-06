.. _test_storing:

Test Storing
========================

Nitpicker provides storing black-box test cases as files in YAML format:

::

    project
    |-qa/
      |-feature_1/
      |-feature_2/
        |-plan_1/
          |-test_case1.yml
          |-test_case2.yml
          |-test_case3.yml
          |-runs/
             |-20180820_232000_run.report
             |-20180820_232010_run.report

Directory *qa* is the root directory of all the black-box tests (QA directory). It contains all tests plans and its test cases and test run reports as well. Test plans are represented by directories which include other test plans directory and test cases. So we have some hierarchy of the test plans.

Each plan contains all its run reports in directory `runs`.

Currently Nitpicker uses the name convention:

* A test case must have extension *.yml*
* A test run must end with *_run* and have extension *.report*


Test Case Format
----------------------

A test case file is written in YAML format and has these following structure:

.. code-block:: yaml

    created: 2018-09-15 04:54:39
    author: Aleksey Timin
    email: atimin@gmail.com
    description: Checking if all the last runs are passed is success
    tags: commands, fuzzy
    setup:
      - Run command 'python -m nitpicker -d test_qa add test_test_case -p commands'
      - Save the case without changes and close the editor
      - Run command 'python -m nitpicker -d test_qa run commands' and passed all steps
    steps:
      - Run command 'python -m nitpicker -d test_qa check --all-runs-passed'
        => It should be success

    teardown:
      - Delete test_qa directory


All test case files should have the following mapping:

* *created* - The time when the test case was created in format %Y-%m-%d %H:%M:%S
* *author* - The author's name
* *email* - The author's email
* *description* - The short description of the case that should be displayed in all reports
* *tags* - The tags separated by comma (not implemented yet)
* *setup* - The actions that should be done before the test starts
* *steps* - The steps that contain the tester's actions and the expectations separated by symbol '=>'
* *teardown* - The actions that should be done after the test has been run

Run Report Format
----------------------

A test run report file is generated by Nitpicker's command *run* in YAML format and has the following structure:

.. code-block:: yaml

    cases:
      add_new_case.yml:
        comment: ''
        description: Add a new case
        failed_action: 'Run command ''python -m nitpicker -r test_qa add test_test_case
          -p commands'' '
        failed_expectation: ' The new case should be opened in the editor'
        comment: 'Something goes wrong.'
        failed_step: 1
        finished: '2018-09-15 05:10:52'
        started: '2018-09-15 05:08:52'
        status: failed
      add_new_case_in_force.yml:
        description: Add a new case in force mode
        finished: '2018-09-15 05:10:56'
        started: '2018-09-15 05:10:53'
        status: passed
    email: atimin@gmail.com
    finished: '2018-09-15 05:10:56'
    started: '2018-09-15 05:08:52'
    tester: Aleksey Timin

