*** Settings ***
Library    SeleniumLibrary
Resource    ../../../resources/keywords/common_keywords.robot
Resource    ../../../resources/pages/LoginPage.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
User Account Login
    [Documentation]    Invalid login credentials to login to user account
    [Tags]    @ui @negative
    Invalid Log In
    Sleep    3s
    Log To Console    Invalid log in error displayed