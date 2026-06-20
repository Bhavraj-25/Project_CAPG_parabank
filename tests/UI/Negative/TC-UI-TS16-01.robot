*** Settings ***
Library    SeleniumLibrary
Resource    ../../../resources/keywords/common_keywords.robot
#Resource    ../../../resources/pages/LoginPage.robot
Resource    ../../../resources/pages/TransferFundPage.robot
Resource    ../../../resources/pages/AccountOverviewPage.robot
Resource    ../../../resources/pages/OpenAccountPage.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
User Account Registration
    [Documentation]    Registering user account to the site
    [Tags]    @ui @regression
    Login Or Register User
    Sleep    2s
    Open New Savings Account
    Sleep    2s
    Invalid Fund Transfer Page    abcd
    Sleep    2s
    Log To Console    Non numeric value not applicable for fund transfer