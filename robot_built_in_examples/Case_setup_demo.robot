*** Settings ***
Documentation     You can define global `Test Teardown`, these step will apply to every cases belong to this suite.
Test Setup        my global test setup
Force Tags        robot built-in

*** Test Cases ***
my case
    log    will call global Test setup for this case

*** Keywords ***
my global test setup
    log    my global setup
