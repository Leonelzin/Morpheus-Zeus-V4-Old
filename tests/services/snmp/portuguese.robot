*** Settings ***
Library             Browser
Resource            ../../../resources/common.resource
Resource            ../../../resources/fiber.resource
Resource            ../../../resources/pages/services/snmp.resource

Suite Setup         Run keywords
...                     Setup browser    url=${DUT_LOGIN_WEBPAGE_URL}
...                     AND    Login to DUT (Portuguese)
Test Teardown       Run keyword if test failed
...                     Run keywords
...                     Clear browser storages
...                     Login to DUT (Portuguese)

Force Tags          lang-pt   snmp    smoke


*** Test Cases ***
SNMP default service (router)
    [Tags]    robot:continue-on-failure
    
    DUT in router mode
    Go to DUT snmp webpage

    SNMP client form title should be
        Get Text    
        ...    ${SNMP_PAGE_FORM_TITLE}    
        ...    ==    
        ...    SNMP
    SNMP client form subtitle should be 
        Get Text    
        ...    ${SNMP_PAGE_FORM_SUBTITLE}   
        ...    ==    
        ...    Protocolo Simples de Gerência de Rede para gerenciamento de dispositivos em redes IP\n
    
    SNMP Client toggle should be
    SNMP Client toggle text
        Get Text    
        ...    ${SNMP_PAGE_TOGGLE_ENABLE_CLIENT_TEXT}    
        ...    ==    
        ...    Habilitar SNMP

    SNMP Access WAN toggle should be
    SNMP Access WAN toggle text
        Get Text    
        ...    ${SNMP_PAGE_TOGGLE_ACCESS_WAN_TEXT}    
        ...    ==    
        ...    Acesso via WAN

    SNMP Community input title 
        Get Text    
        ...    ${SNMP_PAGE_COMMUNITY_INPUT_TITLE}    
        ...    ==    
        ...    Comunidade
    SNMP Community input should be enabled

    SNMP Port input title 
        Get Text    
        ...    ${SNMP_PAGE_PORT_INPUT_TITLE}    
        ...    ==    
        ...    Porta SNMP
    SNMP Port input should be enabled

    SNMP Location input title 
        Get Text    
        ...    ${SNMP_PAGE_LOCATION_INPUT_TITLE}    
        ...    ==
        ...    Localização
    SNMP Location input should be enabled

    SNMP Contact input title 
        Get Text    
        ...    ${SNMP_PAGE_CONTACT_INPUT_TITLE}    
        ...    ==    
        ...    Contato
    SNMP Contact input should be enabled

    SNMP Name input title 
        Get Text    
        ...    ${SNMP_PAGE_NAME_INPUT_TITLE}    
        ...    ==    
        ...    Nome
    SNMP Name input should be enabled

    View state snmp button save
        Get Text    
        ...    ${SNMP_PAGE_SAVE_BUTTON}    
        ...    ==    
        ...    SALVAR

SNMP default service (bridge)
    [Tags]    robot:continue-on-failure

    DUT in bridge mode
    Go to DUT snmp webpage

    SNMP client form title should be
        Get Text    
        ...    ${SNMP_PAGE_FORM_TITLE}    
        ...    ==    
        ...    SNMP
    SNMP client form subtitle should be 
        Get Text    
        ...    ${SNMP_PAGE_FORM_SUBTITLE}   
        ...    ==    
        ...    Protocolo Simples de Gerência de Rede para gerenciamento de dispositivos em redes IP\n
    
    SNMP Client toggle should be
    SNMP Client toggle text
        Get Text    
        ...    ${SNMP_PAGE_TOGGLE_ENABLE_CLIENT_TEXT}    
        ...    ==    
        ...    Habilitar SNMP
        
    SNMP Community input title 
        Get Text    
        ...    ${SNMP_PAGE_COMMUNITY_INPUT_TITLE}    
        ...    ==    
        ...    Comunidade
    SNMP Community input should be enabled

    SNMP Port input title 
        Get Text    
        ...    ${SNMP_PAGE_PORT_INPUT_TITLE}    
        ...    ==    
        ...    Porta SNMP
    SNMP Port input should be enabled

    SNMP Location input title 
        Get Text    
        ...    ${SNMP_PAGE_LOCATION_INPUT_TITLE}    
        ...    ==    
        ...    Localização
    SNMP Location input should be enabled

    SNMP Contact input title 
        Get Text    
        ...    ${SNMP_PAGE_CONTACT_INPUT_TITLE}    
        ...    ==    
        ...    Contato
    SNMP Contact input should be enabled

    SNMP Name input title 
        Get Text    
        ...    ${SNMP_PAGE_NAME_INPUT_TITLE}    
        ...    ==    
        ...    Nome
    SNMP Name input should be enabled

    View state snmp button save
        Get Text    
        ...    ${SNMP_PAGE_SAVE_BUTTON}    
        ...    ==    
        ...    SALVAR
