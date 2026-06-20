*** Settings ***
Library    SeleniumLibrary
Library    ../../config/environment.py

*** Variables ***
${BROWSER}    chrome
${ENV}    qa

*** Keywords ***
Load Environment
    Load Env    ${ENV}
    ${url}=  Get Env    baseurl
    ${phone_no}=  Get Env    ph_no

    Set Global Variable    ${BASE_URL}  ${url}
    Set Global Variable    ${PHONE_NO}  ${phone_no}

Open Application
    [Documentation]  Opens the application
    Open Browser  ${BASE_URL}  ${BROWSER}
    Maximize Browser Window

Close Application
    [Documentation]  Closing the application
    Close All Browsers