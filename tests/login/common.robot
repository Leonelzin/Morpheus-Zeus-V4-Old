*** Settings ***
Library             Browser
Resource            ../../resources/common.resource
Resource            ../../resources/fiber.resource
Resource            ../../resources/pages/login/login.resource

Suite Setup         Run keywords
...                     Setup browser    url=${DUT_LOGIN_WEBPAGE_URL}
...                     AND    Go to DUT login webpage
Test Teardown       Run keyword if test failed
...                     Run keywords
...                     Clear browser storages
...                     Go to DUT login webpage

Force Tags          lang-pt    login    smoke


*** Test Cases ***
Advertising banner is displayed
    Advertising banner should be displayed

Default language is Portuguese
    Login form should be in Portuguese

Username and password are empty by default
    Username input should be "${empty}"
    Password input should be "${empty}"

First access webpage is displayed after first access login
    [Setup]    fiber.Reset DUT settings to factory default if first access password has been changed
    Enter username "${DUT_MGMT_USER}"
    Enter password "${DUT_MGMT_FIRST_ACCESS_PASSWORD}"
    Click login button
    First access webpage should be displayed

Dashboard is displayed after login
    [Setup]    fiber.Change DUT first access password if it has not been changed
    Clear browser storages
    Go to DUT login webpage
    Enter username "${DUT_MGMT_USER}"
    Enter password "${DUT_MGMT_PASSWORD}"
    Click login button
    Dashboard webpage should be displayed
