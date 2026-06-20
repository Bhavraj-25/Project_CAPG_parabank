*** Settings ***
Library    SeleniumLibrary
Resource    ../../../resources/keywords/common_keywords.robot
Resource    ../../../resources/pages/LoginPage.robot
Resource    ../../../resources/pages/TransferFundPage.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
User Account Registration
    [Documentation]    Registering user account to the site
    [Tags]    @ui @regression
    Permanent Log In
    Sleep    2s
    Fund Transfer Page    -100
    Sleep    2s
    Log To Console    Minimum fund transfer successful