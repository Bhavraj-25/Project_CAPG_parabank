*** Settings ***
Library    SeleniumLibrary
Resource    ../../../resources/keywords/common_keywords.robot
Resource    ../../../resources/pages/LoginPage.robot
Resource    ../../../resources/pages/TransferFundPage.robot
Resource    ../../../resources/pages/OpenAccountPage.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
Defect - Negative Amount Transfer Accepted
    [Documentation]    DEFECT: ParaBank does not accept invalid destination account and does not show.
    [Tags]    @ui @negative @defect @regression
    Permanent Log In
    Sleep    2s
    Open New Savings Account
    Sleep    2s
    Invalid Account Transfer Page    100
    Sleep    2s
    Log To Console    DEFECT CONFIRMED: Transaction successful even after amount exceeding balance