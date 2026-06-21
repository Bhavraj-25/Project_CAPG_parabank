*** Settings ***
Library    SeleniumLibrary
Library    DataDriver   file=${EXECDIR}/test_data/login_data.csv    dialect=excel
Resource    locators/registration_locator.robot
Resource    resources/keywords/common_keywords.robot

#Test Setup    Navigate To Parabank Register Page
##Test Setup  CLick Register After Navigating
#Test Teardown  Close Browser

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

Test Template  Register User

*** Test Cases ***
Test Case For Data Driven   ${Firstname}    ${Lastname}    ${Address}    ${City}    ${State}    ${Zipcode}    ${Phno}    ${SSN}    ${Username}    ${Password}    ${Confirm}
   [Documentation]      Data driven testing using csv
   [Tags]   datadriver

*** Keywords ***
#Navigate To Parabank Register Page
#    Open Browser    ${BASE_URL}    chrome
#    Maximize Browser Window
#    Sleep    2s
#    Wait Until Element Is Visible    xpath=//a[text()="Register"]  timeout=10s
#    Click Element    xpath=//a[text()="Register"]
    
Register User
    [Arguments]    ${Firstname}    ${Lastname}    ${Address}    ${City}    ${State}    ${Zipcode}    ${Phno}    ${SSN}    ${Username}    ${Password}    ${Confirm}
    Click Element    ${register_link}
    Input Text    ${reg_first_name}   ${Firstname}
    Input Text    ${reg_last_name}  ${Lastname}
    Input Text    ${reg_address}  ${Address}
    Input Text    ${reg_city}  ${City}
    Input Text    ${reg_state}  ${State}
    Input Text    ${reg_zip_code}  ${Zipcode}
    Input Text    ${reg_phone}  ${Phno}
    Input Text    ${reg_ssn}  ${SSN}
    Input Text    ${reg_username}  ${Username}
    Input Text    ${reg_password}  ${Password}
    Input Text    ${reg_confirm_password}  ${Confirm}
    Click Element    ${register_btn}