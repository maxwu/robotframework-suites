*** Settings ***
Documentation
... Suite Description
... Author: `Max Wu<http://maxwu.me>`_
... ---------------


*** Test Cases ***
Test title
    [Tags]    DEBUG
    Provided precondition
    When action
    Then check expectations

*** Keywords ***
Provided precondition
    Log    precondition steps..
Action
    Log    open web
check expectations
    Log    parse the dom