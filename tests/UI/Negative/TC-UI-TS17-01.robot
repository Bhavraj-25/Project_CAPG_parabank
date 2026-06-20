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
    [Tags]    @ui @regression @negative @boundary
#    Login Or Register User
    Permanent Log In
    Open New Savings Account
    Max Min Fund Transfer Page    999999999999999
    Sleep    1s
    Log To Console    Max fund transfer successful to a different account
    Max Min Fund Transfer Page    -99999999999999
    Sleep    1s
    Log To Console    Min fund transfer successful to a different account