*** Settings ***
Library    SeleniumLibrary
Resource    ../../../resources/keywords/common_keywords.robot
#Resource    ../../../resources/pages/LoginPage.robot
Resource    ../../../resources/pages/TransferFundPage.robot
Resource    ../../../resources/pages/AccountOverviewPage.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
User Account Registration
    [Documentation]    Registering user account to the site
    [Tags]    @ui @regression
    Login Or Register User
    Sleep    2s
    Diff Fund Transfer Page    10000
    Sleep    2s
    Log To Console    Fund transfer successful to a different account