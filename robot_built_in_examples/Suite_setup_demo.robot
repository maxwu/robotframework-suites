*** Settings ***
Documentation     You can run multi keywords in `suite setup` or `suite teardown` step with keyword `Run keywords`
Suite Setup       Run keywords    my kw 1    my kw 2    my kw 3
Force Tags        robot built-in

*** Test Cases ***
my case
    log    my case

*** Keywords ***
my kw 1
    log    my keyword 1

my kw 2
    log    my keyword 2

my kw 3
    log    my keyword 3
