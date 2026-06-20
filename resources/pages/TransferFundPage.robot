*** Settings ***
Library    SeleniumLibrary
Resource    ../../locators/Funds_locator.robot

*** Keywords ***
Fund Transfer Page
    [Documentation]    Navigating to the fund transfer page
    [Arguments]    ${to_send}
    Click Element    ${transfer_funds_btn}
    Wait Until Element Is Visible    ${assert_transfer_funds}    10s
    Input Text    ${amount}    ${to_send}
    Click Element    ${to_account}
    Wait Until Element Is Visible    xpath=//select[@id='toAccountId']/option[2]    15s
    Click Element    xpath=//select[@id='toAccountId']/option[2]
    Wait Until Element Is Visible    ${transfer_btn}    10s
    Click Element    ${transfer_btn}
    Wait Until Element Is Visible    ${assert_transfer_success}    15s
    Page Should Contain Element    ${assert_transfer_success}

Diff Fund Transfer Page
    [Documentation]    Navigating to the fund transfer page
    [Arguments]    ${to_send}
    Click Element    ${transfer_funds_btn}
    Wait Until Element Is Visible    ${assert_transfer_funds}    10s
    Input Text    ${amount}    ${to_send}
    Click Element    ${to_account}
    Click Element    xpath=//select[@id='toAccountId']/option[4]
    Wait Until Element Is Visible    ${transfer_btn}    10s
    Click Element    ${transfer_btn}
    Page Should Contain Element    ${assert_transfer_success}

Invalid Fund Transfer Page
    [Documentation]    Navigating to the fund transfer page
    [Arguments]    ${to_send}
    Click Element    ${transfer_funds_btn}
    Wait Until Element Is Visible    ${assert_transfer_funds}    10s
    Input Text    ${amount}    ${to_send}
    Click Element    ${to_account}
    Wait Until Page Contains Element    xpath=//select[@id='toAccountId']/option[2]    15s
    Click Element    xpath=//select[@id='toAccountId']/option[2]
    Wait Until Element Is Visible    ${transfer_btn}    10s
    Click Element    ${transfer_btn}
    Wait Until Element Is Visible    xpath=//div[@id='rightPanel']    10s
    Page Should Contain Element    xpath=(//p[@class='error'])[3]

Max Min Fund Transfer Page
    [Documentation]    Navigating to the fund transfer page
    [Arguments]    ${to_send}
    Click Element    ${transfer_funds_btn}
    Wait Until Element Is Visible    ${assert_transfer_funds}    10s
    Input Text    ${amount}    ${to_send}
    Click Element    ${to_account}
    Click Element    xpath=//select[@id='toAccountId']/option[2]
    Wait Until Element Is Visible    ${transfer_btn}    10s
    Click Element    ${transfer_btn}
    Wait Until Element Is Visible    xpath=//div[@id='rightPanel']    10s
    Page Should Contain Element    xpath=(//p[@class='error'])[3]