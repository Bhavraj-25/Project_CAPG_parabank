*** Settings ***
Library  SeleniumLibrary
Resource    ../../locators/OpenNewAcc_locator.robot

*** Keywords ***
Open New Savings Account
    [Documentation]  Open new savings account for the user
    [Tags]    @ui @regression
    Wait Until Page Contains Element    ${open_new_account_link}    5s
    Click Element    ${open_new_account_link}
    Sleep    1s
    Page Should Contain Element    ${assert_open_new_account}
    Click Element    ${account_type}
    Click Element    ${saving_acc_type}
    Wait Until Element Is Enabled    ${open_acc_btn}
    Click Element    ${open_acc_btn}
    Sleep    1s
    Page Should Contain Element    ${assert_acc_made}
    Page Should Contain Element    ${assert_acc_para}

Fetching Account Number
    [Documentation]    Fetch the account number of the newly created account
    [Tags]    @ui
    Wait Until Element Is Visible    xpath=//a[@id='newAccountId']
    ${account_number}=    Get Text    xpath=//a[@id='newAccountId']
    Log To Console    The newly created account number is: ${account_number}