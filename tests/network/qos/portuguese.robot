*** Settings ***
Library             Browser
Library             String
Resource            ../../../resources/common.resource
Resource            ../../../resources/fiber.resource
Resource            ../../../resources/pages/network/qos.resource


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
Factory default QoS disabled settings are correct
    [Tags]    robot:continue-on-failure    smoke
    Page inner title QoS page should be "QoS"
    Page inner subtitle QoS page should be "Controle o tráfego do dispositivo, classificando, priorizando ou limitando."

    QoS toggle should be visible
    QoS toggle text should be "Habilitar QoS"
    QoS toggle should be disabled

    QoS type title should be "Tipo de QoS"
    QoS type select should be disabled

    Internet link title should be "Link da Internet"

    Upload input title should be "Upload (Mbps)"
    Upload input text should be "1000"
    Upload input should be disabled

    Download input title should be "Download (Mbps)"
    Download input text should be "1000"
    Download input should be disabled

    Bandwidth Limit by SSID title should be "Limite de Banda por SSID"
    Bandwidth Limit by SSID table should be visible

    Enabled header should be visible in limit table
    Enabled header text should be "Habilitado" in limit table
    QoS toggle in limit table should be visible
    QoS toggle in limit table should be disabled

    SSID header should be visible in limit table
    SSID header should be "SSID" in limit table
    SSID should be "AP5400AX_7069" in limit table

    Band header should be visible in limit table
    Band header should be "Frequência" in limit table
    Band frequency should be "Dual band" in limit table

    Upload header should be visible in limit table
    Upload header should be "Upload (Mbps)" in limit table
    Upload input text should be "1000" in limit table
    Upload input should be disabled in limit table

    Download header should be visible in limit table
    Download header should be "Download (Mbps)" in limit table
    Download input text should be "1000" in limit table
    Download input should be disabled in limit table

    Bandwidth Guarantee by SSID title should be "Garantia de Banda por SSID"
    Bandwidth Guarantee by SSID table should be visible
    
    Enabled header should be visible in guarantee table
    Enabled header text should be "Habilitado" in guarantee table
    QoS toggle in guarantee table should be visible
    QoS toggle in guarantee table should be disabled
    
    SSID header should be visible in guarantee table
    SSID header should be "SSID" in guarantee table
    SSID should be "AP5400AX_7069" in guarantee table

    Band header should be visible in guarantee table
    Band header should be "Frequência" in guarantee table
    Band frequency should be "Dual band" in guarantee table

    Upload header should be visible in guarantee table
    Upload header should be "Upload (%)" in guarantee table
    Upload input text should be "1" in guarantee table
    Upload input should be disabled in guarantee table

    Download header should be visible in guarantee table
    Download header should be "Download (%)" in guarantee table
    Download input text should be "1" in guarantee table
    Download input should be disabled in guarantee table

    Save settings button text should be "SALVAR"
 
Factory default QoS enabled settings are correct
    [Tags]    robot:continue-on-failure    smoke
    Enable QoS toggle

    Page inner title QoS page should be "QoS"
    Page inner subtitle QoS page should be "Controle o tráfego do dispositivo, classificando, priorizando ou limitando."
    
    QoS toggle should be visible
    QoS toggle text should be "Habilitar QoS"
    QoS toggle should be enabled

    QoS type title should be "Tipo de QoS"
    QoS type select option should be "Limite/Garantia de Banda por SSID"
    QoS type select should be enabled
    
    Internet link title should be "Link da Internet"
    
    Upload input title should be "Upload (Mbps)"
    Upload input text should be "1000"
    Upload input should be enabled

    Download input title should be "Download (Mbps)"
    Download input text should be "1000"
    Download input should be enabled

    Bandwidth Limit by SSID title should be "Limite de Banda por SSID"
    Bandwidth Limit by SSID table should be visible

    Enabled header should be visible in limit table
    Enabled header text should be "Habilitado" in limit table
    QoS toggle in limit table should be visible
    QoS toggle in limit table should be enabled

    SSID header should be visible in limit table
    SSID header should be "SSID" in limit table
    SSID should be "AP5400AX_7069" in limit table

    Band header should be visible in limit table
    Band header should be "Frequência" in limit table
    Band frequency should be "Dual band" in limit table

    Upload header should be visible in limit table
    Upload header should be "Upload (Mbps)" in limit table
    Upload input text should be "1000" in limit table
    Upload input should be disabled in limit table

    Download header should be visible in limit table
    Download header should be "Download (Mbps)" in limit table
    Download input text should be "1000" in limit table
    Download input should be disabled in limit table

    Bandwidth Guarantee by SSID title should be "Garantia de Banda por SSID"
    Bandwidth Guarantee by SSID table should be visible
    
    Bandwidth Guarantee by SSID info should be visible
    Open Bandwidth Guarantee by SSID info
    Bandwidth Guarantee by SSID text info should be "Os campos Upload (%) e Download (%) devem ser configurados para garantir o mínimo de 1 Mbps do valor de link da Internet"
    Button info text should be "OK"
    Close Bandwidth Guarantee by SSID info

    Enabled header should be visible in guarantee table
    Enabled header text should be "Habilitado" in guarantee table
    QoS toggle in guarantee table should be visible
    QoS toggle in guarantee table should be enabled
    
    SSID header should be visible in guarantee table
    SSID header should be "SSID" in guarantee table
    SSID should be "AP5400AX_7069" in guarantee table

    Band header should be visible in guarantee table
    Band header should be "Frequência" in guarantee table
    Band frequency should be "Dual band" in guarantee table

    Upload header should be visible in guarantee table
    Upload header should be "Upload (%)" in guarantee table
    Upload input text should be "1" in guarantee table
    Upload input should be disabled in guarantee table

    Download header should be visible in guarantee table
    Download header should be "Download (%)" in guarantee table
    Download input text should be "1" in guarantee table
    Download input should be disabled in guarantee table

    Save settings button text should be "SALVAR"

One QoS Type are available: Bandwidth Limit/Guarantee by SSID
    [Tags]    robot:continue-on-failure    smoke
    There should be "1" network QoS type available
    QoS type "Limite/Garantia de Banda por SSID" should be available

Validation of upload / download inputs and select QoS type when the table checkboxs are checked
    [Tags]    robot:continue-on-failure    smoke
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
