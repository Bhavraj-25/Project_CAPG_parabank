*** Settings ***
Library    SeleniumLibrary
Resource    ../../resources/keywords/api_keywords.robot
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/AccountOverviewPage.robot
Resource    ../../resources/pages/OpenAccountPage.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
UI Creation to Api Validation
    [Documentation]    Create user account through UI and validate via API
    [Tags]    @hybrid @e2e @regression
    ##    UI registration
    Login User or Register
    Open New Savings Account
    ##    API validation part
    Login User
    Get Account Types
    Should Be Equal    ${type}    CHECKING
    Log To Console    UI login and API validation successful