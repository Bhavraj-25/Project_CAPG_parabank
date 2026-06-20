*** Settings ***
Library  SeleniumLibrary
Resource    ../../resources/pages/LoginPage.robot
Resource    ../../resources/pages/RegistrationPage.robot

*** Variables ***
${logged_in}    None

*** Keywords ***
Login Or Register User
    [Documentation]    Try login first; if login fails attempt registration; if registration fails (user already exists), retry login once more
    [Tags]    @regression

    ${logged_in}=    Run Keyword And Return Status    Log In To Para Bank

    IF    not ${logged_in}
        Log To Console    Login failed — attempting registration
        ${registration_success}=    Run Keyword And Return Status    Registration With Account Overview
        IF    not ${registration_success}
            Log To Console    Registration failed (user likely already exists) — retrying login
            ${retry_login}=    Run Keyword And Return Status    Log In To Para Bank
            IF    not ${retry_login}
                Fail    Login failed before and after registration attempt. Check credentials or app state.
            END
        END
    END

Login User or Register
    [Documentation]    Try login first; if login fails attempt registration; if registration fails (user already exists), retry login once more
    [Tags]    @regression

    ${logged_in}=    Run Keyword And Return Status    LogIn

    IF    not ${logged_in}
        Log To Console    Login failed — attempting registration
        ${registration_success}=    Run Keyword And Return Status    Registration With Account Overview
        IF    not ${registration_success}
            Log To Console    Registration failed (user likely already exists) — retrying login
            ${retry_login}=    Run Keyword And Return Status    Log In To Para Bank
            IF    not ${retry_login}
                Fail    Login failed before and after registration attempt. Check credentials or app state.
            END
        END
    END
