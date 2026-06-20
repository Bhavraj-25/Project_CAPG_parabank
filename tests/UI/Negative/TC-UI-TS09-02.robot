*** Settings ***
Library    SeleniumLibrary
Resource    ../../../resources/keywords/common_keywords.robot
Resource    ../../../resources/pages/LoginPage.robot
Resource    ../../../resources/pages/TransferFundPage.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
Defect - Negative Amount Transfer Accepted
    [Documentation]    DEFECT: ParaBank accepts negative transfer amounts (-100) and shows
    ...                "Transfer Complete!" instead of rejecting the input.
    ...                This test documents the bug — a negative amount should be rejected.
    [Tags]    @ui @negative @defect @regression
    Permanent Log In
    Sleep    2s
    Fund Transfer Page    -100
    Sleep    2s
    Log To Console    DEFECT CONFIRMED: Negative amount -100 was accepted by ParaBank