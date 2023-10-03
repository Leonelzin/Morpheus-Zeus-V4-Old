*** Settings ***
Library             Browser
Resource            ../../resources/common.resource
Resource            ../../resources/fiber.resource
Resource            ../../resources/pages/login/login.resource
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
Advertising banner is displayed
    Advertising banner should be displayed

Default language is Portuguese
    First access login form should be in Portuguese

Username is admin and not editable
    Username input should be "admin"
    Username input should be disabled

Password and confirmation password are empty by default
    Password input should be "${empty}"
    Password confirmation input should be "${empty}"

Privacy policy and terms of use are not accepted by default
    Privacy policy and terms of use should not be accepted

Dashboard is displayed after first access login
    [Tags]    robot:skip
    Enter password "${DUT_MGMT_PASSWORD}"
    Enter password confirmation "${DUT_MGMT_PASSWORD}"
    Accept privacy policy and terms of use
    Click login button
    Wait until dashboard webpage is displayed
