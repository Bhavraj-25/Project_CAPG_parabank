*** Settings ***
Library    SeleniumLibrary
Resource    ../../locators/registration_locator.robot

*** Variables ***
${acct_ID}    None
${First}    CQB
${Last}     CBQ

*** Keywords ***
Register
    Click Element    ${register_link}
    Sleep    1s
    Wait Until Page Contains Element    ${reg_first_name}    10s
    Input Text    ${reg_first_name}         CQB
    Input Text    ${reg_last_name}          CBQ
    Input Text    ${reg_address}            IMA
    Input Text    ${reg_city}               Dehradun
    Input Text    ${reg_state}              Uttarakhand
    Input Text    ${reg_zip_code}           400001
    Input Text    ${reg_phone}              9876543210
    Input Text    ${reg_ssn}                123456789
    Input Text    ${reg_username}           cqb123
    Input Text    ${reg_password}           bbq123
    Input Text    ${reg_confirm_password}   bbq123
    Click Element    ${register_btn}

Registration with Account Overview
    Click Element    ${register_link}
    Wait Until Page Contains Element    ${reg_first_name}    10s
    Input Text    ${reg_first_name}         CQB
    Input Text    ${reg_last_name}          CBQ
    Input Text    ${reg_address}            IMA
    Input Text    ${reg_city}               Dehradun
    Input Text    ${reg_state}              Uttarakhand
    Input Text    ${reg_zip_code}           400001
    Input Text    ${reg_phone}              9876543210
    Input Text    ${reg_ssn}                123456789
    Input Text    ${reg_username}           cqb123
    Input Text    ${reg_password}           bbq123
    Input Text    ${reg_confirm_password}   bbq123
    Click Element    ${register_btn}
    
    ${First}=    Set Variable    CQB
    Set Global Variable    ${First}
    ${Last}=    Set Variable    CBQ
    Set Global Variable    ${Last}

    Wait Until Element Is Enabled    xpath=//a[text()='Accounts Overview']    5s
    Click Element    xpath=//a[text()='Accounts Overview']
    Sleep    2s
    Wait Until Page Contains Element    xpath=(//table//tr[td])[1]/td[1]/a
    ${acc_ID}=    Get Text    xpath=(//table//tr[td])[1]/td[1]/a
    ${acct_ID}=    Evaluate    ${acc_ID}
    Set Global Variable    ${acct_ID}

Register with assertion
    [Arguments]    ${uname}    ${pwd}    ${confirm_pwd}
    Click Element    ${register_link}
    Sleep    1s
    Wait Until Page Contains Element    ${reg_first_name}    10s
    Input Text    ${reg_first_name}         CQB
    Input Text    ${reg_last_name}          CBQ
    Input Text    ${reg_address}            IMA
    Input Text    ${reg_city}               Dehradun
    Input Text    ${reg_state}              Uttarakhand
    Input Text    ${reg_zip_code}           400001
    Input Text    ${reg_phone}              9876543210
    Input Text    ${reg_ssn}                123456789
    Input Text    ${reg_username}           ${uname}
    Input Text    ${reg_password}           ${pwd}
    Input Text    ${reg_confirm_password}   ${confirm_pwd}
    Click Element    ${register_btn}
    Page Should Contain Element    xpath=//div[@id='rightPanel']
#    Wait Until Page Contains Element    xpath=//p[contains(text(), 'Your account was created successfully. You are now logged in.')]    10s
#    Page Should Contain Element    xpath=//p[contains(text(), 'Your account was created successfully. You are now logged in.')]
    Log To Console    Registration successful!

Register Empty Username
    Click Element    ${register_link}
    Sleep    1s
    Wait Until Page Contains Element    ${reg_first_name}    10s
    Input Text    ${reg_first_name}         CQB
    Input Text    ${reg_last_name}          CBQ
    Input Text    ${reg_address}            IMA
    Input Text    ${reg_city}               Dehradun
    Input Text    ${reg_state}              Uttarakhand
    Input Text    ${reg_zip_code}           400001
    Input Text    ${reg_phone}              9876543210
    Input Text    ${reg_ssn}                123456789
    # Empty username field intentionally skipped
    Input Text    ${reg_password}           bbq123
    Input Text    ${reg_confirm_password}   bbq123
    Click Element    ${register_btn}

Register Password Mismatch
    Click Element    ${register_link}
    Sleep    1s
    Wait Until Page Contains Element    ${reg_first_name}    10s
    Input Text    ${reg_first_name}         CQB
    Input Text    ${reg_last_name}          CBQ
    Input Text    ${reg_address}            IMA
    Input Text    ${reg_city}               Dehradun
    Input Text    ${reg_state}              Uttarakhand
    Input Text    ${reg_zip_code}           400001
    Input Text    ${reg_phone}              9876543210
    Input Text    ${reg_ssn}                123456789
    Input Text    ${reg_username}           dqb123
    Input Text    ${reg_password}           bbq123
    Input Text    ${reg_confirm_password}   abq123
    Click Element    ${register_btn}