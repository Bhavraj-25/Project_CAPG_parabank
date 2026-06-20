*** Settings ***
Library    SeleniumLibrary
Resource    ../../../resources/keywords/api_keywords.robot
Resource    ../../../resources/keywords/common_keywords.robot
Resource    ../../../resources/pages/AccountOverviewPage.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
Retrieve Account by ID
    [Documentation]    Retrieve account using account ID
    [Tags]    @api @regression
    Login Or Register User
    Login User
    Valid accounts
    Account by accountID
#    Log To Console    Same account entries retrieved twice successfully