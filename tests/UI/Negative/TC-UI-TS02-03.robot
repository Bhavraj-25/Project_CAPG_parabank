*** Settings ***
Library    SeleniumLibrary
Resource    ../../../resources/keywords/common_keywords.robot
Resource    ../../../resources/pages/RegistrationPage.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
User Account Registration
    [Documentation]    Registering user account to the site
    [Tags]    @ui @negative
    Register Password Mismatch
    Wait Until Page Contains Element    xpath=//div[@id='rightPanel']    5s
    Page Should Contain Element    xpath=//span[@id='repeatedPassword.errors']
    Sleep    2s
    Log To Console    Error message displayed for mismatched password registration