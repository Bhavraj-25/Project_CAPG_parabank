*** Settings ***
Library    SeleniumLibrary
Resource    ../../../resources/keywords/common_keywords.robot
#Resource    ../../../resources/pages/RegistrationPage.robot
Resource    ../../../resources/pages/LoginPage.robot
Resource    ../../../resources/pages/OpenAccountPage.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
Opening savings account
    [Documentation]    Registering user account to the site
    [Tags]    @ui @regression
    Permanent Log in
    Wait Until Element Is Visible    ${open_new_account_link}    5s
    Open New Savings Account
    Log To Console    New savings account has been opened successfully
    Fetching Account Number