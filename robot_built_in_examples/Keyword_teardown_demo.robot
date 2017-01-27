*** Settings ***
Documentation     You can add `teardown` step for keywords.
Force Tags        robot built-in

*** Test Cases ***
case1
    My keyword with teardown step

*** Keywords ***
My keyword with teardown step
    log    call My keyword with teardown step
    [Teardown]    Call me when keyword execute end

Call me when keyword execute end
    log    Call me whether keyword succeed or failed.
