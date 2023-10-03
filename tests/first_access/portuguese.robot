*** Settings ***
Library             Browser
Resource            ../../resources/common.resource
Resource            ../../resources/fiber.resource
Resource            ../../resources/pages/first_access/first_access.resource

Suite Setup         Run keywords
...                     Reset DUT settings to factory default if first access password has been changed
...                     AND    Setup browser    url=${DUT_LOGIN_WEBPAGE_URL}
...                     AND    Go to DUT login webpage
...                     AND    Login with first access credentials
...                     AND    Wait until first access webpage is displayed
Test Teardown       Run keyword if test failed
...                     Run keywords
...                     Clear browser storages
...                     Go to DUT login webpage
...                     Login with first access credentials
...                     Wait until first access webpage is displayed

Force Tags          lang-pt    login    first-access    smoke


*** Test Cases ***
Policy privacy text is accessible and displayed in Portuguese by default
    Open privacy policy hyperlink
    Privacy policy text should be displayed in Portuguese
    Close privacy policy modal

Terms of use text is accessible and displayed in Portuguese by default
    Open terms of use hyperlink
    Terms of use text should be displayed in Portuguese
    Close terms of use modal

########################
#    ERROR MESSAGES    #
########################

Error message: login with all fields empty
    Click login button
    Enter password "${empty}"
    Enter password confirmation "${empty}"
    Unaccept privacy policy and terms of use
    Error message "Senha obrigatória" is displayed for password input
    Error message "Senha obrigatória" is displayed for password confirmation input
    Error message "É necessário aceitar os termos" is displayed for privacy and terms toggle switch

Error message: first access login without providing password and password confirmation
    Enter password "${empty}"
    Enter password confirmation "${empty}"
    Accept privacy policy and terms of use
    Click login button
    Error message "Senha obrigatória" is displayed for password input
    Error message "Senha obrigatória" is displayed for password confirmation input
    # TODO: check that no other error messages are shown

Error message: first access login without providing password confirmation
    Enter password "${DUT_MGMT_PASSWORD}"
    Enter password confirmation "${empty}"
    Accept privacy policy and terms of use
    Click login button
    Error message "Senha obrigatória" is displayed for password confirmation input
    # TODO: check that no other error messages are shown

Error message: first access login without providing password
    Enter password "${empty}"
    Enter password confirmation "${DUT_MGMT_PASSWORD}"
    Accept privacy policy and terms of use
    Click login button
    Error message "Senha obrigatória" is displayed for password input
    # TODO: check that no other error messages are shown

Error message: login without accepting the privacy policy and terms of use
    Enter password "${DUT_MGMT_PASSWORD}"
    Enter password confirmation "${DUT_MGMT_PASSWORD}"
    Unaccept privacy policy and terms of use
    Click login button
    Error message "É necessário aceitar os termos" is displayed for privacy and terms toggle switch
    # TODO: check that no other error messages are shown
