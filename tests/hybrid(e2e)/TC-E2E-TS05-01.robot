*** Settings ***
Library    SeleniumLibrary
Resource    ../../resources/keywords/api_keywords.robot
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/AccountOverviewPage.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
UI Creation to Api Validation
    [Documentation]    Create user account through UI and validate via API
    [Tags]    @hybrid @e2e @regression
    ##    UI registration
    Login Or Register User
    ##    API validation part
    Login User
    Valid accounts retrieval
    Log To Console    UI login and API validation successful