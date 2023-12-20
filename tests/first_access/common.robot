*** Settings ***
Library             Browser
Resource            ../../resources/common.resource
Resource            ../../resources/fiber.resource
Resource            ../../resources/pages/first_access/first_access.resource

Suite Setup         Run keywords
...                     fiber.Reset DUT settings to factory default if first access password has been changed
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
Advertising banner is displayed
    first_access.Advertising banner should be displayed

Default language is Portuguese
    First access login form should be in Portuguese

Username is admin and not editable
    first_access.Username input should be "admin"
    first_access.Username input should be disabled

Password and confirmation password are empty by default
    first_access.Password input should be "${empty}"
    first_access.Password confirmation input should be "${empty}"

Privacy policy and terms of use are not accepted by default
    Privacy policy and terms of use should not be accepted

Dashboard is displayed after first access login
    [Documentation]
    ...    This test should be the last to run in this suite.
    ...    Reason: if successful, this test case will change the default
    ...    password and then other tests that must navigate to the first access
    ...    login webpage will fail since the user will be automatically
    ...    redirected to dashboard webpage after logging in.

    first_access.Enter password "${DUT_MGMT_PASSWORD}"
    first_access.Enter password confirmation "${DUT_MGMT_PASSWORD}"
    Accept privacy policy and terms of use
    first_access.Click login button
    Wait until dashboard webpage is displayed
