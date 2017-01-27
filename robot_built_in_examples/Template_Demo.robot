*** Settings ***
Force Tags        robot built-in

*** Test Cases ***
calculate
    [Template]    ${a} plus ${b} result should be ${c}
    1    2    3
    1024    1024    2048
    #use for loop to generate data
    : FOR    ${i}    IN RANGE    10
    \    ${i}    0    ${i}

*** Keywords ***
${a} plus ${b} result should be ${c}
    should be true    ${a} + ${b} == ${c}
