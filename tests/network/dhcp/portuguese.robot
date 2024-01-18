*** Settings ***
Library             Browser
Resource            ../../../resources/common.resource
Resource            ../../../resources/pages/network/dhcp.resource

Suite Setup         Run keywords
...                     Setup browser    url=${DUT_LOGIN_WEBPAGE_URL}
...                     AND    Login to DUT    language=portuguese
Test Teardown       Run keyword if test failed
...                     Run keywords
...                     Clear browser storages
...                     AND    Login to DUT    language=portuguese

Force Tags          lang-pt    network    dhcp


*** Test Cases ***
Factory default settings are correct
    [Tags]    robot:continue-on-failure    smoke
    Access network DHCP settings page
    Wait until DHCP server modal is displayed
    Close DHCP server modal

    Page inner title should be "Servidor DHCP"
    Page inner subtitle should be "Distribuição automática de endereços IP e vinculação de endereços MAC a endereços IP específicos"

    DHCP enable toggle switch should be off
    DHCP enable toggle switch text should be "Habilitar DHCP"

    DNS rebind attack protection toggle switch should not be visible

    DHCP pool initial IPv4 address input should not be visible
    DHCP pool final IPv4 address input should not be visible
    DHCP pool lease time input should not be visible

    MAC-IP bind table should not be visible

    [Teardown]    No operation
