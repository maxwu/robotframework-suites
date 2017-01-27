*** Settings ***
Documentation     keyword can accept varargs and kwargs
Force Tags        robot built-in
Library           Collections

*** Test Cases ***
varargs
    I am keyword accept varargs    1    2    a    b

kwargs
    I am keyword accept kwargs    a=1    b=2

*** Keywords ***
I am keyword accept varargs
    [Arguments]    @{args}
    : FOR    ${arg}    IN    @{args}
    \    log    ${arg}

I am keyword accept kwargs
    [Arguments]    &{kwargs}
    @{keys}    Get Dictionary keys    ${kwargs}
    : FOR    ${item}    IN    @{keys}
    \    log    ${item} : &{kwargs}[${item}]
