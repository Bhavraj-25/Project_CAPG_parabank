*** Settings ***
Library  SeleniumLibrary
Resource    ../../locators/login_locator.robot

*** Variables ***
${acct_ID}    None

*** Keywords ***
Log In to Para Bank
    [Documentation]  logging in to Para Bank account
    Input Text    ${uname_btn}    cqb123
    Input Text    ${pwd_btn}    bbq123
    Click Element    ${login_btn}

    Wait Until Page Contains Element    xpath=//a[text()='Log Out']    10s
    Wait Until Page Contains Element    xpath=(//table//tr[td])[1]/td[1]/a    10s
    ${acc_ID}=    Get Text    xpath=(//table//tr[td])[1]/td[1]/a
    ${acct_ID}=    Evaluate    ${acc_ID}
    Set Global Variable    ${acct_ID}

    Click Element    xpath=//a[text()='Log Out']

LogIn
    [Documentation]  logging in to Para Bank account
    Input Text    ${uname_btn}    cqb123
    Input Text    ${pwd_btn}    bbq123
    Click Element    ${login_btn}

    Wait Until Page Contains Element    xpath=//a[text()='Log Out']    10s
    Wait Until Page Contains Element    xpath=(//table//tr[td])[1]/td[1]/a    10s
    ${acc_ID}=    Get Text    xpath=(//table//tr[td])[1]/td[1]/a
    ${acct_ID}=    Evaluate    ${acc_ID}
    Set Global Variable    ${acct_ID}

Invalid Log in
    [Documentation]  logging in to Para Bank account
    Input Text    ${uname_btn}    acq123
    Input Text    ${pwd_btn}    bbq123
    Click Element    ${login_btn}

Permanent Log in
    [Documentation]  logging in to Para Bank account
    Input Text    ${uname_btn}    john
    Input Text    ${pwd_btn}    demo
    Click Element    ${login_btn}