*** Settings ***
Library     Browser
Resource    ../../common.resource


*** Variables ***
${SNMP_PAGE_FORM_TITLE}                                      xpath=//*[@id="root"]/div[3]/div/div[1]/div[1]
${SNMP_PAGE_FORM_SUBTITLE}                                   xpath=//*[@id="root"]/div[3]/div/div[1]/div[2]

${SNMP_PAGE_TOGGLE_ENABLE_CLIENT_TEXT}                       xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div
${SNMP_PAGE_TOGGLE_ENABLE_CLIENT}                            xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]
${SNMP_PAGE_TOGGLE_ENABLE_CLIENT_CLICKABLE}                  xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div/label/span

${SNMP_PAGE_TOGGLE_ACCESS_WAN_TEXT}                          xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div
${SNMP_PAGE_TOGGLE_ACCESS_WAN}                               xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]
${SNMP_PAGE_TOGGLE_ACCESS_WAN_CLICKABLE}                     xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div/label/span

${SNMP_PAGE_COMMUNITY_INPUT_TITLE}                           xpath=//*[@id="root"]/div[3]/div/div[3]/div[1]
${SNMP_PAGE_COMMUNITY_INPUT}                                 xpath=//*[@id="root"]/div[3]/div/div[3]/div[1]/input

${SNMP_PAGE_PORT_INPUT_TITLE}                                xpath=//*[@id="root"]/div[3]/div/div[3]/div[2]
${SNMP_PAGE_PORT_INPUT}                                      xpath=//*[@id="root"]/div[3]/div/div[3]/div[2]/input

${SNMP_PAGE_LOCATION_INPUT_TITLE}                            xpath=//*[@id="root"]/div[3]/div/div[4]/div[1]
${SNMP_PAGE_LOCATION_INPUT}                                  xpath=//*[@id="root"]/div[3]/div/div[4]/div[1]/input

${SNMP_PAGE_CONTACT_INPUT_TITLE}                             xpath=//*[@id="root"]/div[3]/div/div[4]/div[2]
${SNMP_PAGE_CONTACT_INPUT}                                   xpath=//*[@id="root"]/div[3]/div/div[4]/div[2]/input

${SNMP_PAGE_NAME_INPUT_TITLE}                                xpath=//*[@id="root"]/div[3]/div/div[5]
${SNMP_PAGE_NAME_INPUT}                                      xpath=//*[@id="root"]/div[3]/div/div[5]/input

${SNMP_PAGE_SAVE_BUTTON}                                     xpath=//*[@id="root"]/div[3]/div/button


*** Keywords ***
Access Side Menu Services
    Click    ${SIDEMENU_SERVICES}

Access Side Sub Menu SNMP
    Click    ${SIDESUB_MENU_SNMP}

SNMP client form title should be
    Get Text    
    ...    ${SNMP_PAGE_FORM_TITLE}   
    
SNMP client form subtitle should be  
    Get Text    
    ...    ${SNMP_PAGE_FORM_SUBTITLE}  

Enable and Disable SNMP Client Toggle
    ${checked}    Get Checkbox State    ${SNMP_PAGE_TOGGLE_ENABLE_CLIENT}
    IF    '${checked}' == 'False'
        Click    ${SNMP_PAGE_TOGGLE_ENABLE_CLIENT_CLICKABLE} 
    ELSE IF    '${checked}' == 'True'
        Click    ${SNMP_PAGE_TOGGLE_ENABLE_CLIENT_CLICKABLE} 
    END
    
SNMP Client toggle should be
    Get checkbox state
    ...    ${SNMP_PAGE_TOGGLE_ENABLE_CLIENT}
    ...    !=    checked
    
SNMP Client toggle text
    Get Text    
    ...    ${SNMP_PAGE_TOGGLE_ENABLE_CLIENT_TEXT} 
    
    
Enable and Disable SNMP Access via WAN
    ${checked}    Get Checkbox State    ${SNMP_PAGE_TOGGLE_ACCESS_WAN}
    IF    '${checked}' == 'False'
        Click    ${SNMP_PAGE_TOGGLE_ACCESS_WAN_CLICKABLE} 
    ELSE IF    '${checked}' == 'True'
        Click    ${SNMP_PAGE_TOGGLE_ACCESS_WAN_CLICKABLE} 
    END
    
SNMP Access WAN toggle should be
    Get checkbox state
    ...    ${SNMP_PAGE_TOGGLE_ACCESS_WAN}
    ...    !=    checked
    
SNMP Access WAN toggle text
    Get Text    
    ...    ${SNMP_PAGE_TOGGLE_ACCESS_WAN_TEXT} 

SNMP Community input title 
    Get Text    
    ...    ${SNMP_PAGE_COMMUNITY_INPUT_TITLE} 
    
SNMP Community input should be enabled
    Get Text    
    ...    ${SNMP_PAGE_COMMUNITY_INPUT}   
    ...    ==    
    ...    public
    Clear Text    
    ...    ${SNMP_PAGE_COMMUNITY_INPUT}
    Get attribute    
    ...    ${SNMP_PAGE_COMMUNITY_INPUT}    
    ...    something    
    ...    evaluate    
    ...    value is not None

SNMP Port input title 
    Get Text    
    ...    ${SNMP_PAGE_PORT_INPUT_TITLE} 
    
SNMP Port input should be enabled
    Get Text    
    ...    ${SNMP_PAGE_PORT_INPUT}   
    ...    ==    
    ...    161
    Clear Text    
    ...    ${SNMP_PAGE_PORT_INPUT}
    Get attribute    
    ...    ${SNMP_PAGE_PORT_INPUT}    
    ...    something    
    ...    evaluate    
    ...    value is not None

SNMP Location input title 
    Get Text    
    ...    ${SNMP_PAGE_LOCATION_INPUT_TITLE} 

SNMP Location input should be enabled
    Get Text    
    ...    ${SNMP_PAGE_LOCATION_INPUT}   
    ...    ==    
    ...    Intelbras - SC - Brasil
    Clear Text    
    ...    ${SNMP_PAGE_LOCATION_INPUT}
    Get attribute    
    ...    ${SNMP_PAGE_LOCATION_INPUT}    
    ...    something    
    ...    evaluate    
    ...    value is not None
    ...    
SNMP Contact input title 
    Get Text    
    ...    ${SNMP_PAGE_CONTACT_INPUT_TITLE} 

SNMP Contact input should be enabled
    Get Text    
    ...    ${SNMP_PAGE_CONTACT_INPUT}   
    ...    ==    
    ...    admin@meu_dominio.com.br
    Clear Text    
    ...    ${SNMP_PAGE_CONTACT_INPUT}
    Get attribute    
    ...    ${SNMP_PAGE_CONTACT_INPUT}    
    ...    something    
    ...    evaluate    
    ...    value is not None

SNMP Name input title 
    Get Text    
    ...    ${SNMP_PAGE_NAME_INPUT_TITLE} 

SNMP Name input should be enabled
    Get Text    
    ...    ${SNMP_PAGE_NAME_INPUT}   
    ...    ==    
    ...    AP 1800 AX
    Clear Text    
    ...    ${SNMP_PAGE_NAME_INPUT}
    Get attribute    
    ...    ${SNMP_PAGE_NAME_INPUT}    
    ...    something    
    ...    evaluate    
    ...    value is not None

View state snmp button save
    Wait for elements state
    ...    ${SNMP_PAGE_SAVE_BUTTON}
    ...    visible
