*** Settings ***
Library             Browser
Library             String
Resource            ../../../resources/common.resource
Resource            ../../../resources/fiber.resource
Resource            ../../../resources/pages/network/lan.resource
Resource            ../../../resources/pages/network/operation_mode.resource


Suite Setup         Run keywords
...                     Setup browser    url=${DUT_LOGIN_WEBPAGE_URL}
...                     AND    Set Viewport Size    1000    950
...                     AND    Login to DUT    language=spanish
...                     AND    Access LAN network settings page
Test Teardown       Run keyword if test failed
...                     Run keywords
...                     Clear browser storages
...                     AND    Set Viewport Size    1000    950
...                     AND    Login to DUT    language=spanish
...                     AND    Access LAN network settings page

Force Tags          lang-es    lan


*** Test Cases ***
Factory default IPV4 settings are correct (bridge mode)
    [Tags]    robot:continue-on-failure    smoke
    Page inner title LAN page should be "LAN"
    Page inner subtitle LAN page should be "Configuración de red local"

    IPv4 settings button text should be "IPV4"
    IPv4 settings button should be visible

    Dynamic IP Address toggle title should be "Dirección IP dinámica (Automático)"
    Dynamic IP Address info text should be "En este modo, su AP recibirá automáticamente una dirección IP del servidor DHCP de su red local."
    Dynamic IP Address toggle should be visible
    
    Fixed IP Address / Fallback bridge IPv4 input title should be "Dirección IP fija / Fallback"
    Fixed IP Address bridge IPv4 should be "10.0.0.1"
    Fixed IP Address bridge IPv4 input should be enabled

    Subnet Mask bridge IPv4 input title should be "Máscara de subred"    
    Subnet Mask bridge IPv4 should be "16"
    Subnet Mask bridge IPv4 input should be enabled

    Default Gateway bridge IPv4 input title should be "Puerta de enlace predeterminada"    
    Default Gateway bridge IPv4 should be "10.0.255.254"
    Default Gateway bridge IPv4 input should be enabled
    
    LAN page save settings button text should be "AHORRAR"
    [Teardown]    No operation

Factory default IPV6 settings are correct (bridge mode)
    [Tags]    robot:continue-on-failure    smoke
    Access LAN network settings page

    IPv6 settings button text should be "IPV6"
    IPv6 settings button should be visible
    Open IPv6 settings
    
    Select IPv6 configuration type "Automático"
    IPv6 configuration type title should be "Tipo de configuración"

    Select IPv6 configuration type "Desactivado"
    Link Local bridge IPv6 input title should be "Link-Local"
    Link Local bridge IPv6 input should be disabled
    Link Local bridge IPv6 input should be "Desactivado"

    Select IPv6 configuration type "Manual"
    Link Local bridge IPv6 input title should be "Link-Local"
    Link Local bridge IPv6 input should be disabled
    Link Local bridge IPv6 input should be "fe80::da36:5fff:feeb:4b65/64"

    IP address bridge IPv6 input title should be "Dirección IP"    
    IP address bridge IPv6 input should be enabled
    IP address bridge IPv6 input should be ""

    Prefix Size bridge IPv6 input title should be "Tamaño del prefijo"    
    Prefix Size bridge IPv6 input should be enabled
    Prefix Size bridge IPv6 input should be ""
    
    Default Gateway bridge IPv6 input title should be "Puerta de enlace predeterminada"
    Default Gateway bridge IPv6 input should be enabled
    Default Gateway bridge IPv6 input should be ""

    Select IPv6 configuration type "Link-Local"
    Link Local bridge IPv6 input title should be "Link-Local"
    Link Local bridge IPv6 input should be disabled
    Link Local bridge IPv6 input should be "fe80::da36:5fff:feeb:4b65/64"

    LAN page save settings button text should be "AHORRAR"
    [Teardown]    No operation

Factory default IPV4 settings are correct (router mode)
    [Tags]    robot:continue-on-failure    smoke
    Access network operation mode settings page
    Select network operation mode "Enrutador"
    Save network operation mode (router)

    Access LAN network settings page
    
    IPv4 settings button text should be "IPV4"
    IPv4 settings button should be visible
    
    Dynamic IP Address toggle should not be visible

    Fixed IP Address router IPv4 input title should be "Dirección IP fija"    
    Fixed IP Address router IPv4 should be "10.0.0.1"
    Fixed IP Address router IPv4 input should be enabled

    Subnet Mask router IPv4 input title should be "Máscara de subred"    
    Subnet Mask router IPv4 should be "16"
    Subnet Mask router IPv4 input should be enabled

    Default Gateway router IPv4 input should not be visible

    LAN page save settings button text should be "AHORRAR"
    [Teardown]    No operation

Factory default IPV6 settings are correct (router mode)
    [Tags]    robot:continue-on-failure    smoke
    Access LAN network settings page

    IPV6 settings button text should be "IPV6"
    IPV6 settings button should be visible
    Open IPv6 settings
    
    Select IPv6 configuration type "Automático"
    IPv6 configuration type title should be "Tipo de configuración"

    Select IPv6 configuration type "Desactivado"
    Link Local router IPv6 input title should be "Link-Local"
    Link Local router IPv6 input should be disabled
    Link Local router IPv6 input should be "Desactivado"

    Select IPv6 configuration type "Manual"
    Link Local router IPv6 input title should be "Link-Local"
    Link Local router IPv6 input should be disabled
    Link Local router IPv6 input should be "fe80::da36:5fff:feeb:4b65/64"

    IP address router IPv6 input title should be "Dirección IP"
    IP address router IPv6 input should be enabled
    IP address router IPv6 input should be ""
    
    Prefix Size router IPv6 input title should be "Tamaño del prefijo"
    Prefix Size router IPv6 input should be enabled
    Prefix Size router IPv6 input should be ""

    Default Gateway router IPv6 input should not be visible

    Select IPv6 configuration type "Link-Local"
    Link Local router IPv6 input title should be "Link-Local"
    Link Local router IPv6 input should be "fe80::da36:5fff:feeb:4b65/64"

    LAN page save settings button text should be "AHORRAR"
    [Teardown]    No operation

Four network lan configuration type are available: Desactivado, Manual, Automático and Link-Local
    [Tags]    robot:continue-on-failure    smoke
    There should be "4" network lan config types available
    IPv6 configuration type "Desactivado" should be available
    IPv6 configuration type "Manual" should be available
    IPv6 configuration type "Automático" should be available
    IPv6 configuration type "Link-Local" should be available
    [Teardown]    No operation

Revert all changes made in the DUT configuration screen's
    Discard saved settings
