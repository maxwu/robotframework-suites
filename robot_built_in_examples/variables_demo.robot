*** Settings ***
Documentation     robot built-in keywords demo
Force Tags        robot built-in
Library           Collections

*** Test Cases ***
list demo
    [Documentation]    list demo
    @{my_list}    create list    1    2    3    a    b
    ...    c
    # you can fetch the element with '@' or '$'
    should be equal    @{my_list}[0]    1
    should be equal    ${my_list[0]}    1
    should be equal    @{my_list}[1]    2
    should be equal    ${my_list[1]}    2
    #traverse the list
    : FOR    ${item}    IN    @{my_list}
    \    log    ${item}
    #traverse the list
    ${len}    Get Length    ${my_list}
    : FOR    ${i}    IN RANGE    ${len}
    \    should be equal    ${my_list[${i}]}    @{my_list}[${i}]
    print_all_args    @{my_list}
    print_all_args    1    2    3
    log    ${my_list}

dict demo
    [Documentation]    dict demo
    &{my_dict}    Create Dictionary    key=val    foo=bar    1=2    ${1}=${2}
    log    ${my_dict}
    should be equal    &{my_dict}[1]    2
    should be equal    &{my_dict}[${1}]    ${2}
    &{my_dict_no_int}    Create Dictionary    key=val    foo=bar    1=2
    print_all_args    &{my_dict_no_int}

string and integervariables
    [Documentation]    This demo shows how to define string and integer variable
    ${str_var}    set variable    1024
    ${int_var}    set variable    ${1024}
    log    ${str_var}
    log    ${int_var}
    #this list contains 2 element '1024' and 1024
    @{my_list}    create list    1024    ${1024}
    log    ${my_list}

environment variables
    [Documentation]    This demo shows how to get environment variables
    log    %{PATH}
    ${my_path}    set variable    %{PATH}
    should contain    ${my_path}    bin
    should match regexp    ${my_path}    [\\S]+:

*** Keywords ***
print_all_args
    [Arguments]    @{args}    &{kwargs}
    [Documentation]    This keyword shows how to define keyword that takes varargs and kwargs.
    log    list args:
    : FOR    ${item}    IN    @{args}
    \    log    ${item}
    @{keys}    Get Dictionary keys    ${kwargs}
    log    dict args:
    : FOR    ${item}    IN    @{keys}
    \    log    ${item} : &{kwargs}[${item}]
