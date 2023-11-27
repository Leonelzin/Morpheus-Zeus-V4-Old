*** Settings ***
Library     Browser
Resource    ../../common.resource


*** Variables ***
${NTP_PAGE_FORM_TITLE}                                      xpath=//*[@id="root"]/div[3]/div/div[1]/div[1]
${NTP_PAGE_FORM_SUBTITLE}                                   xpath=//*[@id="root"]/div[3]/div/div[1]/div[2]

${NTP_PAGE_TOGGLE_ENABLE_CLIENT_TEXT}                       xpath=//*[@id="root"]/div[3]/div/div[2]/div
${NTP_PAGE_TOGGLE_ENABLE_CLIENT}                            xpath=//*[@id="root"]/div[3]/div/div[2]
${NTP_PAGE_TOGGLE_ENABLE_CLIENT_CLICKABLE}                  xpath=//*[@id="root"]/div[3]/div/div[2]/label/span

${NTP_PAGE_SERVER_1_INPUT_TITLE}                            xpath=//*[@id="root"]/div[3]/div/div[3]/div[1]
${NTP_PAGE_SERVER_1_INPUT}                                  xpath=//*[@id="root"]/div[3]/div/div[3]/div[1]/input

${NTP_PAGE_SERVER_2_INPUT_TITLE}                            xpath=//*[@id="root"]/div[3]/div/div[3]/div[2]
${NTP_PAGE_SERVER_2_INPUT}                                  xpath=//*[@id="root"]/div[3]/div/div[3]/div[2]/input

${NTP_PAGE_ZONE_SELECT_TITLE}                               xpath=//*[@id="root"]/div[3]/div/div[4]/div[1]/div/div
${NTP_PAGE_ZONE_SELECT_OPTIONS_DROPDOWN}                    xpath=//*[@id="root"]/div[3]/div/div[4]/div[1]/div/div/ul
${NTP_PAGE_ZONE_SELECT}                                     xpath=//*[@id="root"]/div[3]/div/div[4]/div[1]/div/div/div/input
${NTP_PAGE_ZONE_SELECT_OPTION_BG}                           xpath=//*[@id="root"]/div[3]/div/div[4]/div[1]/div/div/ul/li[1]/div
${NTP_PAGE_ZONE_SELECT_OPTION_MN}                           xpath=//*[@id="root"]/div[3]/div/div[4]/div[1]/div/div/ul/li[2]/div
${NTP_PAGE_ZONE_SELECT_OPTION_SP}                           xpath=//*[@id="root"]/div[3]/div/div[4]/div[1]/div/div/ul/li[3]/div
${NTP_PAGE_ZONE_SELECT_OPTION_FN}                           xpath=//*[@id="root"]/div[3]/div/div[4]/div[1]/div/div/ul/li[4]/div

${NTP_PAGE_TOGGLE_DST_TEXT}                                 xpath=//*[@id="root"]/div[3]/div/div[4]/div[2]/div/div
${NTP_PAGE_TOGGLE_DST}                                      xpath=//*[@id="root"]/div[3]/div/div[4]/div[2]
${NTP_PAGE_TOGGLE_DST_CLICKABLE}                            xpath=//*[@id="root"]/div[3]/div/div[4]/div[2]/div/label/span

${NTP_PAGE_SAVE_BUTTON_TEXT}                                xpath=//*[@id="root"]/div[3]/div/div[5]/button/span
${NTP_PAGE_SAVE_BUTTON}                                     xpath=//*[@id="root"]/div[3]/div/div[5]/button


*** Keywords ***
Access Side Menu Services
    Click    ${SIDEMENU_SERVICES}

Access Side Sub Menu NTP
    Click    ${SIDESUB_MENU_NTP}

NTP client form title should be
    Get Text    
    ...    ${NTP_PAGE_FORM_TITLE}    

NTP client form subtitle should be
    Get Text    
    ...    ${NTP_PAGE_FORM_SUBTITLE}    

Enable and Disable NTP Client Toggle
    ${checked}    Get Checkbox State    ${NTP_PAGE_TOGGLE_ENABLE_CLIENT}
    IF    '${checked}' == 'False'
        Click    ${NTP_PAGE_TOGGLE_ENABLE_CLIENT_CLICKABLE}
    ELSE IF    '${checked}' == 'True'
        Click    ${NTP_PAGE_TOGGLE_ENABLE_CLIENT_CLICKABLE}
    END
    
NTP Client toggle should be
    Get checkbox state
    ...    ${NTP_PAGE_TOGGLE_ENABLE_CLIENT}
    ...    !=    checked
    ...    
NTP Client toggle text
    Get Text    
    ...    ${NTP_PAGE_TOGGLE_ENABLE_CLIENT_TEXT}   

NTP Server 1 input title 
    Get Text    
    ...    ${NTP_PAGE_SERVER_1_INPUT_TITLE}    

NTP Server 2 input title 
    Get Text    
    ...    ${NTP_PAGE_SERVER_2_INPUT_TITLE}    

NTP Server 1 input should be enabled
    Get Text    
    ...    ${NTP_PAGE_SERVER_1_INPUT}   
    ...    ==    
    ...    a.ntp.br
    ...    
    Clear Text    
    ...    ${NTP_PAGE_SERVER_1_INPUT}
    Get attribute    
    ...    ${NTP_PAGE_SERVER_1_INPUT}    
    ...    something    
    ...    evaluate    
    ...    value is not None

NTP Server 2 input should be enabled
    Get Text    
    ...    ${NTP_PAGE_SERVER_2_INPUT}   
    ...    ==    
    ...    b.ntp.br
    ...    
    Clear Text    
    ...    ${NTP_PAGE_SERVER_2_INPUT}
    Get attribute    
    ...    ${NTP_PAGE_SERVER_2_INPUT}    
    ...    something    
    ...    evaluate    
    ...    value is not None
       
NTP Server 1 input should be disabled
    Get Attribute  
    ...    ${NTP_PAGE_SERVER_1_INPUT}  
    ...    disabled
    Get Text   
    ...    ${NTP_PAGE_SERVER_1_INPUT}  
    ...    ==
    ...    a.ntp.br

NTP Server 2 input should be disabled
    Get Attribute  
    ...    ${NTP_PAGE_SERVER_2_INPUT}  
    ...    disabled
    Get Text   
    ...    ${NTP_PAGE_SERVER_2_INPUT}  
    ...    ==
    ...    b.ntp.br

Validation zone selection dropdown title
    Get Text    
        ...    ${NTP_PAGE_ZONE_SELECT_TITLE}    

Validation zone selection dropdown enabled
    ${elem_states}    Get element states    ${NTP_PAGE_ZONE_SELECT_OPTIONS_DROPDOWN}
    IF    "hidden" in ${elem_states}
        Click    ${NTP_PAGE_ZONE_SELECT}
    END

    Get Text  
    ...    ${NTP_PAGE_ZONE_SELECT_OPTION_SP}       
    ...    ==    
    ...    (GMT-03:00) São Paulo
    ...    
    Get Text  
    ...    ${NTP_PAGE_ZONE_SELECT_OPTION_BG}       
    ...    ==    
    ...    (GMT-05:00) Bogota
    ...    
    Get Text  
    ...    ${NTP_PAGE_ZONE_SELECT_OPTION_MN}     
    ...    ==    
    ...    (GMT-04:00) Manaus
    ...    
    Get Text  
    ...    ${NTP_PAGE_ZONE_SELECT_OPTION_FN}       
    ...    ==    
    ...    (GMT-02:00) Fernando de Noronha
    
Validation zone selection dropdown disabled
    Get Text  
    ...    ${NTP_PAGE_ZONE_SELECT_OPTION_SP}       
    ...    ==    
    ...    (GMT-03:00) São Paulo
    
Select Bogota Zone
    Click    ${NTP_PAGE_ZONE_SELECT_OPTION_BG}

Select Manaus Zone
    Click    ${NTP_PAGE_ZONE_SELECT_OPTION_MN}

Select São Paulo Zone
    Click    ${NTP_PAGE_ZONE_SELECT_OPTION_SP}

Select Fernando de Noronha Zone
    Click    ${NTP_PAGE_ZONE_SELECT_OPTION_FN}

Enable and Disable Daylight Savings Time Toggle NTP
    ${checked}    Get Checkbox State    ${NTP_PAGE_TOGGLE_DST}
    IF    '${checked}' == 'False'
        Click    ${NTP_PAGE_TOGGLE_DST_CLICKABLE}
    ELSE IF    '${checked}' == 'True'
        Click    ${NTP_PAGE_TOGGLE_DST_CLICKABLE}
    END

DST toggle should be disabled
    Get checkbox state
    ...    ${NTP_PAGE_TOGGLE_DST}
    ...    !=    checked
   
View state button save
    Wait for elements state
    ...    ${NTP_PAGE_SAVE_BUTTON}
    ...    visible
