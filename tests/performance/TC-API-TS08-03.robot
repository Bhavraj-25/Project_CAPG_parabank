*** Settings ***
Library    SeleniumLibrary
Resource    ../../resources/keywords/api_keywords.robot
Resource    ../../resources/keywords/common_keywords.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
Retrieve Customer details
    [Documentation]    Retrieve details using customer ID
    [Tags]    @api @regression
    Login User
    Valid accounts retrieval
    Account by accountID Response Time
    Log To Console    Login response time is within acceptable limits