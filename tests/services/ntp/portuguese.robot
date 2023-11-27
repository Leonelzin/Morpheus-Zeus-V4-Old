*** Settings ***
Library             Browser
Resource            ../../../resources/common.resource
Resource            ../../../resources/fiber.resource
Resource            ../../../resources/pages/services/ntp.resource

Suite Setup         Run keywords
...                     Setup browser    url=${DUT_LOGIN_WEBPAGE_URL}
...                     AND    Login to DUT (Portuguese)
...                     AND    Go to DUT ntp webpage
Test Teardown       Run keyword if test failed
...                     Run keywords
...                     Clear browser storages
...                     Login to DUT (Portuguese)
...                     Go to DUT ntp webpage

Force Tags          lang-pt   ntp    smoke


*** Test Cases ***
NTP client service disable default
    [Tags]    robot:continue-on-failure
    NTP client form title should be
        Get Text    
        ...    ${NTP_PAGE_FORM_TITLE}    
        ...    ==    
        ...    Data e Hora
    NTP client form subtitle should be 
        Get Text    
        ...    ${NTP_PAGE_FORM_SUBTITLE}    
        ...    ==    
        ...    O dispositivo mantém a hora certa a partir da sincronização com servidores NTP\n
    
    Enable and Disable NTP Client Toggle
    NTP Client toggle should be
        Get checkbox state
        ...    ${NTP_PAGE_TOGGLE_ENABLE_CLIENT}
        ...    !=    checked
        Get Text    
        ...    ${NTP_PAGE_TOGGLE_ENABLE_CLIENT_TEXT}    
        ...    ==    
        ...    Habilitar cliente NTP
        
    NTP Server 1 input title
        Get Text    
        ...    ${NTP_PAGE_SERVER_1_INPUT_TITLE}    
        ...    ==    
        ...    Servidor NTP 1
    
    NTP Server 2 input title
    Get Text    
        ...    ${NTP_PAGE_SERVER_2_INPUT_TITLE}    
        ...    ==    
        ...    Servidor NTP 2
    
    NTP Server 1 input should be disabled
    NTP Server 2 input should be disabled

    Validation zone selection dropdown title
       Get Text    
        ...    ${NTP_PAGE_ZONE_SELECT_TITLE}  
        ...    ==
        ...    Zona
    Validation zone selection dropdown disabled

    DST toggle should be disabled
        Get Text    
        ...    ${NTP_PAGE_TOGGLE_DST_TEXT}    
        ...    ==    
        ...    Horário de Verão
    
    View state button save
        Get Text    
        ...    ${NTP_PAGE_SAVE_BUTTON_TEXT}    
        ...    ==    
        ...    SALVAR

NTP client service enable default
    [Tags]    robot:continue-on-failure
    NTP client form title should be
        Get Text    
        ...    ${NTP_PAGE_FORM_TITLE}    
        ...    ==    
        ...    Data e Hora
    NTP client form subtitle should be 
        Get Text    
        ...    ${NTP_PAGE_FORM_SUBTITLE}    
        ...    ==    
        ...    O dispositivo mantém a hora certa a partir da sincronização com servidores NTP\n
        
    Enable and Disable NTP Client Toggle
    NTP Client toggle should be
        Get checkbox state
        ...    ${NTP_PAGE_TOGGLE_ENABLE_CLIENT}
        ...    !=    checked
        Get Text    
        ...    ${NTP_PAGE_TOGGLE_ENABLE_CLIENT_TEXT}    
        ...    ==    
        ...    Habilitar cliente NTP
        
    NTP Server 1 input title
        Get Text    
        ...    ${NTP_PAGE_SERVER_1_INPUT_TITLE}    
        ...    ==    
        ...    Servidor NTP 1
        
    NTP Server 2 input title
    Get Text    
        ...    ${NTP_PAGE_SERVER_2_INPUT_TITLE}    
        ...    ==    
        ...    Servidor NTP 2
        
    NTP Server 1 input should be enabled
    NTP Server 2 input should be enabled

    Validation zone selection dropdown title
       Get Text    
        ...    ${NTP_PAGE_ZONE_SELECT_TITLE}  
        ...    ==
        ...    Zona
    Validation zone selection dropdown enabled

    DST toggle should be disabled
        Get Text    
        ...    ${NTP_PAGE_TOGGLE_DST_TEXT}    
        ...    ==    
        ...    Horário de Verão
    
    View state button save
        Get Text    
        ...    ${NTP_PAGE_SAVE_BUTTON_TEXT}    
        ...    ==    
        ...    SALVAR
