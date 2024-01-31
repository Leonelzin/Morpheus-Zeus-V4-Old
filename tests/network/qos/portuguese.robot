*** Settings ***
Library             Browser
Library             String
Resource            ../../../resources/common.resource
Resource            ../../../resources/fiber.resource
Resource            ../../../resources/pages/network/qos.resource
Resource            ../../../resources/pages/network/operation_mode.resource


Suite Setup         Run keywords
...                     Setup browser    url=${DUT_LOGIN_WEBPAGE_URL}
...                     AND    Login to DUT    language=portuguese
...                     AND    Access QoS network settings page
Test Teardown       Run keyword if test failed
...                     Run keywords
...                     Clear browser storages
...                     AND    Login to DUT    language=portuguese
...                     AND    Access QoS network settings page

Force Tags          lang-pt    qos


*** Test Cases ***
Factory Default settings for QoS are correct
    [Tags]    robot:continue-on-failure    smoke
    Page inner title QoS page should be "QoS"
    Page inner subtitle QoS page should be "Controle o tráfego do dispositivo, classificando, priorizando ou limitando."
    
    QoS toggle should be visible
    QoS toggle text should be "Habilitar QoS"

    QoS type title should be "Tipo de QoS"

    Internet link title should be "Link da Internet"
    
    Upload input title should be "Upload (Mbps)"
    Upload input text should be "1000"

    Download input title should be "Download (Mbps)"
    Download input text should be "1000"

    Save QoS settings button text should be "SALVAR"
    [Teardown]    No operation

Limit/Guarantee limit table headers and other factory default elements should be
    [Tags]    smoke
    [Documentation]    
    ...    Headers Table Limit & Guarantee 
    Bandwidth Limit by SSID title should be "Limite de Banda por SSID"
    Bandwidth Limit by SSID table should be visible

    Enabled header should be visible in limit table
    Enabled header text should be "Habilitado" in limit table

    SSID header should be visible in limit table
    SSID header should be "SSID" in limit table
    
    Band header should be visible in limit table
    Band header should be "Frequência" in limit table

    Upload header should be visible in limit table
    Upload header should be "Upload (Mbps)" in limit table
    
    Download header should be visible in limit table
    Download header should be "Download (Mbps)" in limit table

    Bandwidth Guarantee by SSID title should be "Garantia de Banda por SSID"
    Bandwidth Guarantee by SSID table should be visible

    Enabled header should be visible in guarantee table
    Enabled header text should be "Habilitado" in guarantee table

    SSID header should be visible in guarantee table
    SSID header should be "SSID" in guarantee table

    Band header should be visible in guarantee table
    Band header should be "Frequência" in guarantee table

    Upload header should be visible in guarantee table
    Upload header should be "Upload (%)" in guarantee table

    Download header should be visible in guarantee table
    Download header should be "Download (%)" in guarantee table

Disabled factory default rules related to bandwidth limit/guarantee per SSID should be
    [Tags]    robot:continue-on-failure    smoke
    QoS toggle should be disabled

    QoS type select should be disabled

    Upload input should be disabled
    Download input should be disabled
    
    QoS toggle in limit table should be visible
    QoS toggle in limit table should be disabled
    SSID should be "AP5400AX_7069" in limit table

    Band frequency should be "Dual band" in limit table
    
    Upload input text should be "1000" in limit table
    Upload input should be disabled in limit table

    Download input text should be "1000" in limit table
    Download input should be disabled in limit table
    
    QoS toggle in guarantee table should be visible
    QoS toggle in guarantee table should be disabled
    
    SSID should be "AP5400AX_7069" in guarantee table

    Band frequency should be "Dual band" in guarantee table
   
    Upload input text should be "1" in guarantee table
    Upload input should be disabled in guarantee table

    Download input text should be "1" in guarantee table
    Download input should be disabled in guarantee table
    [Teardown]    No operation
 
Enabled factory default rules related to bandwidth limit/guarantee per SSID should be
    [Tags]    robot:continue-on-failure    smoke
    Enable QoS toggle
    QoS toggle should be enabled

    QoS type select option should be "Limite/Garantia de Banda por SSID"
    QoS type select should be enabled

    Upload input should be enabled
    Download input should be enabled

    QoS toggle in limit table should be visible
    QoS toggle in limit table should be enabled

    SSID should be "AP5400AX_7069" in limit table

    Band frequency should be "Dual band" in limit table

    Upload input text should be "1000" in limit table
    Upload input should be disabled in limit table

    Download input text should be "1000" in limit table
    Download input should be disabled in limit table
    
    Bandwidth Guarantee by SSID info should be visible
    Open Bandwidth Guarantee by SSID info
    Bandwidth Guarantee by SSID text info should be "Os campos Upload (%) e Download (%) devem ser configurados para garantir o mínimo de 1 Mbps do valor de link da Internet"
    Button info text should be "OK"
    Close Bandwidth Guarantee by SSID info

    QoS toggle in guarantee table should be visible
    QoS toggle in guarantee table should be enabled
    
    SSID should be "AP5400AX_7069" in guarantee table

    Band frequency should be "Dual band" in guarantee table

    Upload input text should be "1" in guarantee table
    Upload input should be disabled in guarantee table

    Download input text should be "1" in guarantee table
    Download input should be disabled in guarantee table
    [Teardown]    No operation

Validation of upload / download inputs and select QoS type when the table checkboxs are checked
    [Tags]    smoke
    Enable QoS toggle

    Enable QoS toggle in limit table
    Upload input text should be "1000" in limit table
    Upload input should be enabled in limit table

    Download input should be enabled in limit table
    Download input text should be "1000" in limit table
    
    Enable QoS toggle in guarantee table
    Upload input text should be "1" in guarantee table
    Upload input should be enabled in guarantee table

    Download input text should be "1" in guarantee table
    Download input should be enabled in guarantee table

    QoS type select should be disabled

DUT configuration for router mode
    [Tags]    robot:continue-on-failure    smoke
    Access network operation mode settings page
    Select network operation mode "Roteador"
    Save settings
    Confirm saved settings

MAC-IP limit table headers and other factory default elements should be
    [Tags]    smoke
    [Documentation]    Headers Table Limit
    Access QoS network settings page
    Enable QoS toggle
    Select QoS type "Limite de Banda por IP/MAC"

    Bandwidth Limit MAC-IP table should be visible

    Add rules MAC-IP settings button text should be "Adicionar"

    Enabled header should be visible in limit MAC-IP table
    Enabled header text should be "Habilitado" in limit MAC-IP table
    
    Description header should be visible in limit MAC-IP table
    Description header should be "Descrição" in limit MAC-IP table

    Network IP header should be visible in limit MAC-IP table
    Network IP header should be "IP / Rede" in limit MAC-IP table

    MAC header should be visible in limit MAC-IP table
    MAC header should be "MAC" in limit MAC-IP table

    Upload (Mbps) header should be visible in limit MAC-IP table
    Upload (Mbps) header should be "Upload (Mbps)" in limit MAC-IP table

    Download (Mbps) header should be visible in limit MAC-IP table
    Download (Mbps) header should be "Download (Mbps)" in limit MAC-IP table

Disabled factory default rules related to bandwidth limit per MAC-IP should be
    [Tags]    robot:continue-on-failure    smoke
    Disable QoS toggle
    QoS toggle should be disabled

    QoS type select should be disabled

    Upload input should be disabled
    Download input should be disabled
    
    Add badwidth MAC-IP rule in table

    QoS toggle in limit MAC-IP table should be visible
    QoS toggle MAC-IP table limit is disabled should be but checked
    
    Description input should be disabled in limit MAC-IP table 

    Network IP input should be disabled in limit MAC-IP table

    MAC input should be disabled in limit MAC-IP table

    Upload (Mbps) input text should be "1" in limit MAC-IP table
    Upload (Mbps) input should be disabled in limit MAC-IP table
    
    Download (Mbps) input text should be "1" in limit MAC-IP table
    Download (Mbps) input should be disabled in limit MAC-IP table

    Delete rules MAC-IP settings button should be visible
    Delete bandwidth MAC-IP rule in table
    
    Table text when no rules are registered should be "Nenhum regra de QoS cadastrada"
    [Teardown]    No operation
    
Enabled factory default rules related to bandwidth limit per MAC-IP should be
    [Tags]    robot:continue-on-failure    smoke
    Enable QoS toggle

    QoS toggle should be enabled

    QoS type select should be enabled
    Select QoS type "Limite de Banda por IP/MAC"

    Upload input should be enabled
    Download input should be enabled

    Add badwidth MAC-IP rule in table

    QoS toggle in limit MAC-IP table should be visible
    QoS toggle in limit MAC-IP table should be enabled

    Description input text should be "" in limit MAC-IP table
    Description input should be enabled in limit MAC-IP table

    Network IP input text should be "" in limit MAC-IP table
    Network IP input should be enabled in limit MAC-IP table
    
    MAC input text should be "" in limit MAC-IP table
    MAC input should be enabled in limit MAC-IP table
    
    Upload (Mbps) input text should be "1" in limit MAC-IP table
    Upload (Mbps) input should be enabled in limit MAC-IP table

    Download (Mbps) input text should be "1" in limit MAC-IP table
    Download (Mbps) input should be enabled in limit MAC-IP table

    Delete rules MAC-IP settings button should be visible
    Delete bandwidth MAC-IP rule in table
    
    Table text when no rules are registered should be "Nenhum regra de QoS cadastrada"
    [Teardown]    No operation

Two QoS type are available: Bandwidth Limit/Guarantee by SSID & Bandwidth limit per IP/MAC
    [Tags]    smoke
    There should be "2" network QoS type available
    QoS type "Limite/Garantia de Banda por SSID" should be available
    QoS type "Limite de Banda por IP/MAC" should be available
    Discard saved settings
    [Teardown]    No operation
