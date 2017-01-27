*** Settings ***
Force Tags        robot built-in

*** Test Cases ***
Simple loop
    #simple loop
    : FOR    ${item}    IN    1    2    a    b
    \    log    ${item}
    #loop for list
    @{my_list}    create list    hello    world
    : FOR    ${item}    IN    @{my_list}
    \    log    ${item}

Loop in range
    : FOR    ${item}    IN RANGE    5
    \    log    ${item}
    # in range with start and end
    log    for 1 to 5
    : FOR    ${item}    IN RANGE    1    5
    \    log    ${item}
    # in range with step
    log    for 1 to 5, step 2
    : FOR    ${item}    IN RANGE    1    5    2
    \    log    ${item}
    # in range with negative step
    log    for 5 to 1, step -2
    : FOR    ${item}    IN RANGE    5    1    -2
    \    log    ${item}
    # in range with float step
    log    for 1 to 5, step 1.5
    : FOR    ${item}    IN RANGE    1    5    1.5
    \    log    ${item}

nested loop
    [Documentation]    Robot does not support loop-in-loop syntax, but support keyword-in-keyword, so you need to wrap loop with keyword and nest them.
    @{row1}    create list    a1    a2    a3
    @{row2}    create list    b1    b2    b3
    @{row3}    create list    c1    c2    c3
    @{table}    create list    ${row1}    ${row2}    ${row3}
    Traverse table    ${table}

several loop variables
    : FOR    ${index}    ${var1}    ${var2}    IN    1    a
    ...    b    2    c    d
    \    log    ${index}: ${var1}: ${var2}
    # for several var in list
    @{my_list}    create list    1    a    2    b
    : FOR    ${index}    ${var}    IN    @{my_list}
    \    log    ${index}: ${var}

Loop in enumerate
    @{my_list}    set variable    a    b    c    d
    : FOR    ${index}    ${var}    IN ENUMERATE    @{my_list}
    \    log    ${index}: ${var}

Loop in zip
    @{my_list1}    set variable    A    B    C    D
    @{my_list2}    set variable    a    b    c    d
    : FOR    ${item1}    ${item2}    IN ZIP    ${my_list1}    ${my_list2}
    \    log    ${item1}: ${item2}

Exit loop
    @{my_list}    set variable    a    b    c    d
    log    type1
    : FOR    ${item}    IN    @{my_list}
    \    log    ${item}
    \    Run keyword if    '${item}' == 'c'    Exit for loop
    log    type2
    : FOR    ${item}    IN    @{my_list}
    \    log    ${item}
    \    Exit for loop if    '${item}' == 'c'

Continue loop
    @{my_list}    set variable    a    b    c    d
    log    type1
    : FOR    ${item}    IN    @{my_list}
    \    Run keyword if    '${item}' == 'c'    Continue for loop
    \    log    ${item}
    log    type2
    : FOR    ${item}    IN    @{my_list}
    \    Continue for loop if    '${item}' == 'c'
    \    log    ${item}

Repeat single keyword
    Repeat Keyword    5    my_keyword    in my keyword

*** Keywords ***
Traverse table
    [Arguments]    ${table}
    # take care of `$` and `@`, `$` means treate the var as one argument, `@` means treate the var as a list and expand the list. If you are familiar with python, `@` is equal to use prefix * operator for a list variable.
    : FOR    ${row}    IN    @{table}
    \    Traverse row    @{row}

Traverse row
    [Arguments]    @{row}
    : FOR    ${column}    IN    @{row}
    \    log    ${column}

my_keyword
    [Arguments]    ${arg1}
    log    ${arg1}
