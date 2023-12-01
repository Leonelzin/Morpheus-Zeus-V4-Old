*** Settings ***
Library             Browser
Resource            ../../../resources/common.resource
Resource            ../../../resources/fiber.resource
Resource            ../../../resources/pages/services/snmp.resource

Suite Setup         Run keywords
...                     Setup browser    url=${DUT_LOGIN_WEBPAGE_URL}
...                     AND    Login to DUT (English)
Test Teardown       Run keyword if test failed
...                     Run keywords
...                     Clear browser storages
...                     Login to DUT (English)
...                     Go to DUT snmp webpage

Force Tags          lang-en   snmp    smoke


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
        ...    Simple Network Management Protocol for managing devices on IP networks\n
    
    SNMP Client toggle should be
    SNMP Client toggle text
        Get Text    
        ...    ${SNMP_PAGE_TOGGLE_ENABLE_CLIENT_TEXT}    
        ...    ==    
        ...    Enable SNMP

    SNMP Access WAN toggle should be
    SNMP Access WAN toggle text
        Get Text    
        ...    ${SNMP_PAGE_TOGGLE_ACCESS_WAN_TEXT}    
        ...    ==    
        ...    Access via WAN

    SNMP Community input title 
        Get Text    
        ...    ${SNMP_PAGE_COMMUNITY_INPUT_TITLE}    
        ...    ==    
        ...    Community
    SNMP Community input should be enabled

    SNMP Port input title 
        Get Text    
        ...    ${SNMP_PAGE_PORT_INPUT_TITLE}    
        ...    ==    
        ...    SNMP Port
    SNMP Port input should be enabled

    SNMP Location input title 
        Get Text    
        ...    ${SNMP_PAGE_LOCATION_INPUT_TITLE}    
        ...    ==
        ...    Location
    SNMP Location input should be enabled

    SNMP Contact input title 
        Get Text    
        ...    ${SNMP_PAGE_CONTACT_INPUT_TITLE}    
        ...    ==    
        ...    Contact
    SNMP Contact input should be enabled

    SNMP Name input title 
        Get Text    
        ...    ${SNMP_PAGE_NAME_INPUT_TITLE}    
        ...    ==    
        ...    Name
    SNMP Name input should be enabled

    View state snmp button save
        Get Text    
        ...    ${SNMP_PAGE_SAVE_BUTTON}    
        ...    ==    
        ...    SAVE

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
        ...    Simple Network Management Protocol for managing devices on IP networks\n
    
    SNMP Client toggle should be
    SNMP Client toggle text
        Get Text    
        ...    ${SNMP_PAGE_TOGGLE_ENABLE_CLIENT_TEXT}    
        ...    ==    
        ...    Enable SNMP
        
    SNMP Community input title 
        Get Text    
        ...    ${SNMP_PAGE_COMMUNITY_INPUT_TITLE}    
        ...    ==    
        ...    Community
    SNMP Community input should be enabled

    SNMP Port input title 
        Get Text    
        ...    ${SNMP_PAGE_PORT_INPUT_TITLE}    
        ...    ==    
        ...    SNMP Port
    SNMP Port input should be enabled

    SNMP Location input title 
        Get Text    
        ...    ${SNMP_PAGE_LOCATION_INPUT_TITLE}    
        ...    ==    
        ...    Location
    SNMP Location input should be enabled

    SNMP Contact input title 
        Get Text    
        ...    ${SNMP_PAGE_CONTACT_INPUT_TITLE}    
        ...    ==    
        ...    Contact
    SNMP Contact input should be enabled

    SNMP Name input title 
        Get Text    
        ...    ${SNMP_PAGE_NAME_INPUT_TITLE}    
        ...    ==    
        ...    Name
    SNMP Name input should be enabled

    View state snmp button save
        Get Text    
        ...    ${SNMP_PAGE_SAVE_BUTTON}    
        ...    ==    
        ...    SAVE
