*** Settings ***
Library             Browser
Library             String
Resource            ../../../../resources/common.resource
Resource            ../../../../resources/fiber.resource
Resource            ../../../../resources/pages/wireless/wireless_ssid.resource
Resource            ../../../../resources/pages/network/operation_mode.resource


Suite Setup         Run keywords
...                     Setup browser    url=${DUT_LOGIN_WEBPAGE_URL}
...                     AND    Login to DUT    language=portuguese
...                     AND    Access Wireless SSID settings page
Test Teardown       Run keyword if test failed
...                     Run keywords
...                     Clear browser storages
...                     AND    Login to DUT    language=portuguese
...                     AND    Access Wireless SSID settings page

Force Tags          lang-pt    wireless-ssid    psk-psk2


*** Test Cases ***
Factory Default settings for authentication psk-psk2 are correct
    [Documentation]    Validation when editing default SSID in wpa-psk and wpa2-psk personal authentication
    Edit default SSID in table

    Page inner subtitle add new network should be "Salvar"
    
    SSID input title should be "Nome da Rede (SSID)"
    Value of the SSID in the input should be
    ...    [a-zA-Z0-9_]+
    SSID placeholder should be "Nome da Rede (SSID)"
    SSID input should be enabled

    Authentication SSID title should be "Autenticação"
    Authentication SSID select should be enabled

    Open Authentication SSID selection dropdown menu
    Select Authentication SSID "WPA-PSK"
    Select Authentication SSID "WPA2-PSK"

    Click password revealer
    Password revealer should be visible

    Value of the password in the input should be
    ...    [a-zA-Z0-9_]+
    Password input should be enabled

    Cryptography title should be "Criptografia"
    Cryptography select should be enabled

    Open Cryptography selection dropdown menu
    Select Cryptography "AES"

    Frequency toggle text should be "Dual band"
    Frequency toggle should be enabled
    [Teardown]    No operation

Two encryption methods are available: Select and AES
    [Tags]    smoke
    There should be "2" encryption methods available
    Cryptography "Selecione" should be available
    Cryptography "AES" should be available
    [Teardown]    No operation

Five Wireless SSID Authentication are available: Open System, WPA-PSK, WPA2-PSK, WPA & WPA2
    [Tags]    smoke
    There should be "5" authentication SSID available
    Authentication SSID "Sistema Aberto" should be available
    Authentication SSID "WPA-PSK" should be available
    Authentication SSID "WPA2-PSK" should be available
    #Authentication SSID "WPA" should be available
    #Authentication SSID "WPA2" should be available
    [Teardown]    No operation
