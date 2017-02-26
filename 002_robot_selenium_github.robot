*** Settings ***
Documentation    Demo documentation
...  Suite Description
...  Author: `Max Wu<http://maxwu.me>`

Library    Selenium2Library
Library    test_lib.fast_sample.KW_Test    WITH NAME    kwtest

*** Test Cases ***
Get Repo List of maxwu
    [Tags]    Demo
    [Setup]   Open github for maxwu
    [Teardown]   #close browser

    #${cnt}=  get text  css=div.user-profile-nav nav.underline-nav a.underline-nav-item span.counter
    #Log  ${cnt} repostories in total!
    log    "check1"    console=yes

Alpha Demo: Test Python Keyword
    [Documentation]    Case Document
    [Tags]    Cafe    @author=mawu

    #log    "check1"    console=yes
    ${ts}=    kwtest.ts
    log    "Timestamp:${ts} check1"    console=yes
    kwtest.static_help
    #log    "Timestamp:${ts} check2*+-"    console=yes

*** Keywords ***
Open github for maxwu
    Log    precondition steps..
    #create webdriver  Firefox  firefox_binary=/Applications/FirefoxNightly.app/Contents/MacOS/firefox-bin"
    #OPEN BROWSER  https://github.com/maxwu gc