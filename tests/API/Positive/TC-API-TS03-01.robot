*** Settings ***
Library    SeleniumLibrary
Resource    ../../../resources/keywords/api_keywords.robot
Resource    ../../../resources/keywords/common_keywords.robot
Resource    ../../../resources/pages/AccountOverviewPage.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
Get All Accounts
    [Documentation]    Retrieve all accounts using customer ID
    [Tags]    @api @regression
    Login Or Register User
    Login User
    Valid accounts