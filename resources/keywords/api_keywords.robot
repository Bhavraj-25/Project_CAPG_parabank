*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    JSONLibrary
Resource    ../../resources/pages/RegistrationPage.robot
Resource    ../../resources/pages/LoginPage.robot

*** Variables ***
${API_BASE_URL}    https://parabank.parasoft.com/parabank/services/bank
${username}        cqb123
${password}        bbq123
${customerId}      None
${accountId}    None
${login_time}    None
${valid_time}    None
${NEW_ACCOUNT_ID}    None
${first_name}
${last_name}
${type}

## CustomerId ---> fetched from Login User
## AccountId ---> fetched from Valid accounts retrieval

*** Keywords ***
Login User
    [Documentation]    Verify login via
    [Tags]    @api @regression

    ${headers}=    Create Dictionary    Accept=application/json
    Create Session    bankApi    ${API_BASE_URL}    verify=True    headers=${headers}
    ${response}=    GET On Session    bankApi    /login/${username}/${password}

    ${login_time}=    Evaluate    $response.elapsed.total_seconds()
    Set Global Variable    ${login_time}
    
    Should Be Equal As Integers    ${response.status_code}    200
    ${body}=    Set Variable    ${response.json()}

    ${customerId}=    Set Variable    ${body}[id]
    Set Suite Variable    ${customerId}

Valid accounts
    [Documentation]    Retrieve accounts using customer ID
    [Tags]    @api @regression
    ${headers}=    Create Dictionary    Accept=application/json

    Create Session    bankApi    ${API_BASE_URL}    verify=True    headers=${headers}
    ${response}=    GET On Session    bankApi    /customers/${customerId}/accounts
    ${valid_time}=    Evaluate    $response.elapsed.total_seconds()

    Set Global Variable    ${valid_time}

    Should Be Equal As Integers    ${response.status_code}    200
    ${body}=    Set Variable    ${response.json()}

    ${accountId}=    Set Variable    ${body}[0][id]
    Set Suite Variable    ${accountId}

    Log To Console    ${accountId}

Valid accounts retrieval
    [Documentation]    Retrieve accounts using customer ID
    [Tags]    @api @regression
    ${headers}=    Create Dictionary    Accept=application/json

    Create Session    bankApi    ${API_BASE_URL}    verify=True    headers=${headers}
    ${response}=    GET On Session    bankApi    /customers/${customerId}/accounts
    ${valid_time}=    Evaluate    $response.elapsed.total_seconds()
    
    Set Global Variable    ${valid_time}
    
    Should Be Equal As Integers    ${response.status_code}    200
    ${body}=    Set Variable    ${response.json()}

    ${accountId}=    Set Variable    ${body}[0][id]
    Set Suite Variable    ${accountId}
    
    Should Be Equal    ${accountId}    ${acct_ID}
    Log To Console    ${accountId}
    Log To Console    ${acct_ID}

Invalid account retrieval
    [Documentation]    Retrieve accounts using customer ID
    [Tags]    @api @regression
    ${headers}=    Create Dictionary    Accept=application/json

    Create Session    bankApi    ${API_BASE_URL}    verify=True    headers=${headers}
    ${response}=    GET On Session    bankApi    /customers/9999999/accounts    expected_status=any

    Should Be Equal As Integers    ${response.status_code}    400

Account retrieval twice
    [Documentation]    Retrieve accounts using customer ID twice
    [Tags]    @api @regression
    ${headers}=    Create Dictionary    Accept=application/json

    Create Session    bankApi    ${API_BASE_URL}    verify=True    headers=${headers}

    ## First retrieval
    ${response1}=    GET On Session    bankApi    /customers/${customerId}/accounts
    Should Be Equal As Integers    ${response1.status_code}    200
    ${body1}=    Set Variable    ${response1.json()}
    Log To Console    First retrieval: ${body1}

    ## Second retrieval
    ${response2}=    GET On Session    bankApi    /customers/${customerId}/accounts
    Should Be Equal As Integers    ${response2.status_code}    200
    ${body2}=    Set Variable    ${response2.json()}
    Log To Console    Second retrieval: ${body2}

Account by accountID
    [Documentation]    Retrieve account using account ID
    [Tags]    @api @regression
    ${headers}=    Create Dictionary    Accept=application/json

    Create Session    bankApi    ${API_BASE_URL}    verify=True    headers=${headers}
    ${response}=    GET On Session    bankApi    /accounts/${accountId}

    Should Be Equal As Integers    ${response.status_code}    200
    ${body}=    Set Variable    ${response.json()}
    Log To Console    ${body}
    Should Be Equal As Integers    ${body}[customerId]    ${customerId}

Account by invalid accountID
    [Documentation]    Retrieve account using invalid account ID
    [Tags]    @api @regression
    ${headers}=    Create Dictionary    Accept=application/json

    Create Session    bankApi    ${API_BASE_URL}    verify=True    headers=${headers}
    ${response}=    GET On Session    bankApi    /accounts/0000000    expected_status=any

    Should Be Equal As Integers    ${response.status_code}    400

Get Customer Details
    [Documentation]    Retrieve customer details using customer ID
    [Tags]    @api @regression
    ${headers}=    Create Dictionary    Accept=application/json

    Create Session    bankApi    ${API_BASE_URL}    verify=True    headers=${headers}
    ${response}=    GET On Session    bankApi    /customers/${customerId}    expected_status=any

    Should Be Equal As Integers    ${response.status_code}    200
    ${body}=    Set Variable    ${response.json()}
    Log To Console    ${body}[id]
    Log To Console    ${body}[firstName]
    Log To Console    ${body}[lastName]
    Log To Console    ${response.text}
    
Get Customer Details for e2e
    [Documentation]    Retrieve customer details using customer ID
    [Tags]    @api @regression
    ${headers}=    Create Dictionary    Accept=application/json

    Create Session    bankApi    ${API_BASE_URL}    verify=True    headers=${headers}
    ${response}=    GET On Session    bankApi    /customers/${customerId}

    Should Be Equal As Integers    ${response.status_code}    200
    ${body}=    Set Variable    ${response.json()}
    
    ${first_name}=    Set Variable    ${body}[firstName]
    ${last_name}=    Set Variable    ${body}[lastName]
    Set Global Variable    ${first_name}
    Set Global Variable    ${last_name}
    
    Log To Console    ${body}[id]
    Log To Console    ${body}[firstName]
    Log To Console    ${body}[lastName]
    Log To Console    ${response.text}

Invalid Customer Details
    [Documentation]    Retrieve customer details using customer ID
    [Tags]    @api @regression
    ${headers}=    Create Dictionary    Accept=application/json

    Create Session    bankApi    ${API_BASE_URL}    verify=True    headers=${headers}
    ${response}=    GET On Session    bankApi    /customers/000000

    Should Be Equal As Integers    ${response.status_code}    200
    ${body}=    Set Variable    ${response.json()}
    Log To Console    ${body}[id]
    Log To Console    ${body}[firstName]
    Log To Console    ${body}[lastName]
    Log To Console    ${response.text}

Empty Transaction List
    [Documentation]    Retrieve transaction list for an account
    [Tags]    @api @regression
    ${headers}=    Create Dictionary    Accept=application/json

    Create Session    bankApi    ${API_BASE_URL}    verify=True    headers=${headers}
    ${response}=    GET On Session    bankApi    /accounts/${accountId}/transactions

    Should Be Equal As Integers    ${response.status_code}    200
    ${body}=    Set Variable    ${response.json()}
    Log To Console    ${body}

Transaction List
    [Documentation]    Retrieve transaction list for an account
    [Tags]    @api @regression
    ${headers}=    Create Dictionary    Accept=application/json

    Create Session    bankApi    ${API_BASE_URL}    verify=True    headers=${headers}
    ${response}=    GET On Session    bankApi    /accounts/${accountId}/transactions

    Should Be Equal As Integers    ${response.status_code}    200
    ${body}=    Set Variable    ${response.json()}
    Log To Console    ${body}

Login Response Time Validation
    [Documentation]    Validate login response structure and content
    [Tags]    @api @regression

    ${headers1}=    Create Dictionary    Accept=application/json

    Create Session    bankApi    ${API_BASE_URL}    verify=True    headers=${headers1}
    ${response}=    GET On Session    bankApi    /login/${username}/${password}

    ${response_time}=    Evaluate    $response.elapsed.total_seconds()
    Log To Console    Login response time: ${response_time} seconds
    Should Be True    ${response_time} < 2
    
Accounts Retrieval Response Time
    [Documentation]    Validate account retrieval response time
    [Tags]    @api @regression
    ${headers2}=    Create Dictionary    Accept=application/json

    Create Session    bankApi    ${API_BASE_URL}    verify=True    headers=${headers2}
    ${response}=    GET On Session    bankApi    /customers/${customerId}/accounts

    ${response_time}=    Evaluate    $response.elapsed.total_seconds()
    Log To Console    Account retrieval response time: ${response_time} seconds
    Should Be True    ${response_time} < 2

Account by accountID Response Time
    [Documentation]    Validate account retrieval by account ID response time
    [Tags]    @api @regression
    ${headers3}=    Create Dictionary    Accept=application/json

    Create Session    bankApi    ${API_BASE_URL}    verify=True    headers=${headers3}
    ${response}=    GET On Session    bankApi    /accounts/${accountId}
    ${accountId_time}=    Evaluate    $response.elapsed.total_seconds()
    
    ${total_time}=    Evaluate
    ...    ${login_time} + ${valid_time} + ${accountId_time}
    Log To Console    Account by account ID retrieval response time: ${total_time} seconds
    Should Be True    ${total_time} < 5

Open new Account
    [Documentation]    Opens a new account for the logged-in customer and stores the account ID

    ${headers4}=    Create Dictionary    Accept=application/json
    Create Session    bankApi    ${API_BASE_URL}    verify=True    headers=${headers4}

    ${parameters}=    Create Dictionary
    ...    customerId=${customerId}
    ...    newAccountType=1     ## 1 for Checking, 2 for Savings
    ...    fromAccountId=${accountId}

    ${response}=    POST On Session    bankApi    /createAccount    params=${parameters}
    Should Be Equal As Integers    ${response.status_code}    200
#    Log To Console    ${response.text}

    ${body}=    Set Variable    ${response.json()}
    ${account_id}=    Set Variable    ${body}[id]
    ${type}=    Set Variable    ${body}[type]
    ${balance}=    Set Variable    ${body}[balance]

    Log To Console    New Account ID: ${account_id}
    Set Global Variable    ${NEW_ACCOUNT_ID}  ${account_id}
    Set Global Variable    ${NEW_ACCOUNT_TYPE}  ${type}
    Set Global Variable    ${NEW_ACCOUNT_BALANCE}  ${balance}

Transfer Funds
    [Arguments]    ${amount}
    [Documentation]    Transfers funds between two accounts

    ${header5}=    Create Dictionary    Accept=application/json
    Create Session    bankApi    ${API_BASE_URL}    verify=True    headers=${header5}

    ${params}=    Create Dictionary
    ...    fromAccountId=${accountId}
    ...    toAccountId=${NEW_ACCOUNT_ID}
    ...    amount=${amount}

    ${response}=    POST On Session    bankApi    /transfer    params=${params}

    Should Be Equal As Integers    ${response.status_code}    200
    
Get Account Balance
    ${headers6}=    Create Dictionary    Accept=application/json
    Create Session    bankApi    ${API_BASE_URL}    verify=True    headers=${headers6}

    ${response}=    GET On Session
    ...    bankApi
    ...    /accounts/${accountId}

    ${body}=    Set Variable    ${response.json()}
    ${balance}=    Set Variable    ${body}[balance]

    RETURN    ${balance}

API for unavailable endpoint
    [Documentation]    Test API for an unavailable endpoint
    [Tags]    @api @regression
    ${headers7}=    Create Dictionary    Accept=application/json

    Create Session    bankApi    ${API_BASE_URL}    verify=True    headers=${headers7}
    ${response_account_invalid}=    GET On Session    bankApi    /accounts/invalid_endpoint    expected_status=404
    ${response_customer_invalid}=    GET On Session    bankApi    /customers/invalid_endpoint    expected_status=404
    ${response_transfer_invalid}=    POST On Session    bankApi    /transfer/invalid_endpoint    expected_status=404
    ${response_create_account_invalid}=    POST On Session    bankApi    /createAccount/invalid_endpoint    expected_status=404

    Should Be Equal As Integers    ${response_account_invalid.status_code}    404
    Should Be Equal As Integers    ${response_customer_invalid.status_code}    404
    Should Be Equal As Integers    ${response_transfer_invalid.status_code}    404
    Should Be Equal As Integers    ${response_create_account_invalid.status_code}    404

Get Account types
    [Documentation]    Get the type of account
    [Tags]    @api @regression
    ${headers8}=    Create Dictionary    Accept=application/json
    
    Create Session    bankApi    ${API_BASE_URL}    verify=True    headers=${headers8}
    ${response}=    GET On Session    bankApi    /customers/${customerId}/accounts
    
    ${body}=    Set Variable    ${response.json()}
    ${type}=    Set Variable    ${body}[0][type]
    Set Global Variable    ${type}
#    Log To Console    ${type}