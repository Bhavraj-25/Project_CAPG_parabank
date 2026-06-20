*** Variables ***
${transfer_funds_btn}    xpath=//a[text()='Transfer Funds']
${assert_transfer_funds}    xpath=(//h1[@class='title'])[1]
${amount}    xpath=//input[@id='amount']
${from_account}    xpath=//select[@id='fromAccountId']
${to_account}    xpath=//select[@id='toAccountId']
${transfer_btn}    xpath=//input[@value='Transfer']
${assert_transfer_success}    xpath=//h1[text()='Transfer Complete!']