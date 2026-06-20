*** Settings ***
Library    SeleniumLibrary
Resource    ../../../resources/keywords/common_keywords.robot
#Resource    ../../../resources/pages/LoginPage.robot
Resource    ../../../resources/pages/TransferFundPage.robot
Resource    ../../../resources/pages/OpenAccountPage.robot
Resource    ../../../resources/pages/AccountOverviewPage.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
User Account Registration
    [Documentation]    Registering user account to the site
    [Tags]    @ui @regression
#    Log In To Para Bank
    Login Or Register User
    Sleep    2s
    Permanent Log In
    Sleep    2s
    Open New Savings Account
    Sleep    2s
    Fund Transfer Page    100
    Sleep    2s
    Log To Console    Fund transfer successful