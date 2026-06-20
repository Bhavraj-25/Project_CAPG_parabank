*** Variables ***
${open_new_account_link}    xpath=//a[text()='Open New Account']
${assert_open_new_account}    xpath=//h1[text()='Open New Account']
${account_type}    xpath=//select[@id='type']
${saving_acc_type}    xpath=//select[@id='type']/option[text()='SAVINGS']
${open_acc_btn}    xpath=//input[@value='Open New Account']
${assert_acc_made}    xpath=//h1[contains(text(), 'Account Opened!')]
${assert_acc_para}    xpath=//p[contains(text(),'Congratulations, your account is now open.')]