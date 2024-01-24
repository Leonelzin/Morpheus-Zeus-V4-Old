*** Settings ***
Library     Browser
Library     String
Resource    ../../common.resource


*** Variables ***
${SIDEMENU_TOGGLE}                                                            xpath=//*[@id="sidebar_menu"]/div[1]/div[1]
${SIDEMENU_NETWORK_SUBMENU}                                                   xpath=//*[@id="sidebar-options-menu"]/div[2]/div
${SIDEMENU_NETWORK_QOS}                                                       xpath=//*[@id="sidebar-options-menu"]/div[2]/ul/div[7]/p

###

${NETWORK_QOS_PAGE_INNER_TITLE}                                               xpath=//*[@id="root"]/div[3]/div/div[1]/div[1]
${NETWORK_QOS_PAGE_INNER_SUBTITLE}                                            xpath=//*[@id="root"]/div[3]/div/div[1]/div[2]

${NETWORK_QOS_PAGE_ENABLED_TOGGLE}                                            xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div/label/input
${NETWORK_QOS_PAGE_ENABLED_TOGGLE_CLICKABLE}                                  xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div/label
${NETWORK_QOS_PAGE_ENABLED_TOGGLE_TEXT}                                       xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]

${NETWORK_QOS_PAGE_TYPE_SELECT_TITLE}                                         xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div/div
${NETWORK_QOS_PAGE_TYPE_SELECT}                                               xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div/div/div/input
${NETWORK_QOS_PAGE_TYPE_SELECT_OPTIONS_DROPDOWN}                              xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div/div/ul
${NETWORK_QOS_PAGE_TYPE_SELECT_OPTION_LIMIT_GUARANTEE}                        xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div/div/ul/li/div

${NETWORK_QOS_PAGE_INTERNET_LINK_TITLE}                                       xpath=//*[@id="root"]/div[3]/div/div[2]/div[3]/div[1]

${NETWORK_QOS_PAGE_UPLOAD_INPUT_TITLE}                                        xpath=//*[@id="root"]/div[3]/div/div[2]/div[3]/div[2]/div[1]
${NETWORK_QOS_PAGE_UPLOAD_INPUT}                                              xpath=//*[@id="root"]/div[3]/div/div[2]/div[3]/div[2]/div[1]/input

${NETWORK_QOS_PAGE_DOWNLOAD_INPUT_TITLE}                                      xpath=//*[@id="root"]/div[3]/div/div[2]/div[3]/div[2]/div[2]
${NETWORK_QOS_PAGE_DOWNLOAD_INPUT}                                            xpath=//*[@id="root"]/div[3]/div/div[2]/div[3]/div[2]/div[2]/input

${NETWORK_QOS_PAGE_SAVE_SETTINGS_BUTTON}                                      xpath=//*[@id="root"]/div[3]/div/div[2]/button


################################
#    Variables Table Limit     #     
################################


${NETWORK_QOS_PAGE_BANDWIDTH_LIMIT_TITLE}                                     xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[1]/div[1]

${NETWORK_QOS_PAGE_BANDWIDTH_LIMIT_TABLE}                                     xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[1]/div[2]/div[1]

${NETWORK_QOS_PAGE_HEADER_ENABLED_LIMIT_TABLE}                                xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[1]/div[2]/div[1]/div[1]
${NETWORK_QOS_PAGE_HEADER_SSID_LIMIT_TABLE}                                   xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[1]/div[2]/div[1]/div[2]
${NETWORK_QOS_PAGE_HEADER_BAND_LIMIT_TABLE}                                   xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[1]/div[2]/div[1]/div[3]
${NETWORK_QOS_PAGE_HEADER_UPLOAD_LIMIT_TABLE}                                 xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[1]/div[2]/div[1]/div[4]
${NETWORK_QOS_PAGE_HEADER_DOWNLOAD_LIMIT_TABLE}                               xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[1]/div[2]/div[1]/div[5]

${NETWORK_QOS_PAGE_ENABLED_TOGGLE_LIMIT_TABLE}                                id=0
${NETWORK_QOS_PAGE_ENABLED_TOGGLE_CLICKABLE_LIMIT_TABLE}                      xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[1]/div[2]/div[2]/div/div[1]/label

${NETWORK_QOS_PAGE_SSID_LIMIT_TABLE}                                          xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[1]/div[2]/div[2]/div/div[2]

${NETWORK_QOS_PAGE_BAND_FREQUENCY_LIMIT_TABLE}                                xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[1]/div[2]/div[2]/div/div[3]

${NETWORK_QOS_PAGE_UPLOAD_INPUT_LIMIT_TABLE}                                  xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[1]/div[2]/div[2]/div/div[4]/div/input
${NETWORK_QOS_PAGE_DOWNLOAD_INPUT_LIMIT_TABLE}                                xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[1]/div[2]/div[2]/div/div[5]/div/input


################################
#   Variables Table Guarantee  #     
################################


${NETWORK_QOS_PAGE_BANDWIDTH_GUARANTEE_TITLE}                                 xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[2]/div[1]

${NETWORK_QOS_PAGE_BANDWIDTH_GUARANTEE_INFO}                                  xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[2]/div[1] >> svg
${NETWORK_QOS_PAGE_BANDWIDTH_GUARANTEE_INFO_TEXT}                             xpath=//*[@id="overlay-cntse"]/div/div[2]/div/div
${NETWORK_QOS_PAGE_BANDWIDTH_GUARANTEE_INFO_BUTTON}                           xpath=//*[@id="overlay-cntse"]/div/div[3]/div/button

${NETWORK_QOS_PAGE_BANDWIDTH_GUARANTEE_TABLE}                                 xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[2]/div[2]/div[1]

${NETWORK_QOS_PAGE_HEADER_ENABLED_GUARANTEE_TABLE}                            xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[2]/div[2]/div[1]/div[1]
${NETWORK_QOS_PAGE_HEADER_SSID_GUARANTEE_TABLE}                               xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[2]/div[2]/div[1]/div[2]
${NETWORK_QOS_PAGE_HEADER_BAND_GUARANTEE_TABLE}                               xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[2]/div[2]/div[1]/div[3]
${NETWORK_QOS_PAGE_HEADER_UPLOAD_GUARANTEE_TABLE}                             xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[2]/div[2]/div[1]/div[4]
${NETWORK_QOS_PAGE_HEADER_DOWNLOAD_GUARANTEE_TABLE}                           xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[2]/div[2]/div[1]/div[5]

${NETWORK_QOS_PAGE_ENABLED_TOGGLE_GUARANTEE_TABLE}                            xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[2]/div[2]/div[2]/div/div[1]/label/input
${NETWORK_QOS_PAGE_ENABLED_TOGGLE_CLICKABLE_GUARANTEE_TABLEE}                 xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[2]/div[2]/div[2]/div/div[1]/label

${NETWORK_QOS_PAGE_SSID_GUARANTEE_TABLE}                                      xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[2]/div[2]/div[2]/div/div[2]

${NETWORK_QOS_PAGE__BAND_FREQUENCY_GUARANTEE_TABLE}                           xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[2]/div[2]/div[2]/div/div[3]

${NETWORK_QOS_PAGE_UPLOAD_INPUT_GUARANTEE_TABLE}                              xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[2]/div[2]/div[2]/div/div[4]/div/input
${NETWORK_QOS_PAGE_DOWNLOAD_INPUT_GUARANTEE_TABLE}                            xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[2]/div[2]/div[2]/div/div[5]/div/input


*** Keywords ***
Access QoS network settings page
    ${submenu_is_visible}    Run keyword and return status
    ...    Get element states
    ...    ${SIDEMENU_NETWORK_SUBMENU}
    ...    contains
    ...    visible
    
    IF    not ${submenu_is_visible}
        Click    ${SIDEMENU_TOGGLE}
        Wait for elements state
        ...    ${SIDEMENU_NETWORK_SUBMENU}
        ...    visible
        ...    5s
        ...    Network submenu was not visible (5 seconds timeout).
    END

    ${ntp_option_is_visible}    Run keyword and return status
    ...    Get element states
    ...    ${SIDEMENU_NETWORK_QOS}
    ...    contains
    ...    visible

    IF    not ${ntp_option_is_visible}
        Click    ${SIDEMENU_NETWORK_SUBMENU}
        Wait for elements state
        ...    ${SIDEMENU_NETWORK_QOS}
        ...    visible
        ...    5s
        ...    QoS network submenu option was not visible (5 seconds timeout).
    END

    Click    ${SIDEMENU_NETWORK_QOS}
    Sleep    6

Page inner title QoS page should be "${text}"
    Get text    ${NETWORK_QOS_PAGE_INNER_TITLE}    ==    ${text}

Page inner subtitle QoS page should be "${text}"
    ${str}    Get text    ${NETWORK_QOS_PAGE_INNER_SUBTITLE}
    ${str_stripped}    Strip string    ${str}
    Should be equal as strings    ${str_stripped}    ${text}

QoS toggle text should be "${text}"
    Get text    ${NETWORK_QOS_PAGE_ENABLED_TOGGLE_TEXT}     ==    ${text}

QoS toggle should be visible
    Get element states
    ...    ${NETWORK_QOS_PAGE_ENABLED_TOGGLE_CLICKABLE}
    ...    contains
    ...    visible

QoS toggle should be enabled
    ${element_states}    Get element states    ${NETWORK_QOS_PAGE_ENABLED_TOGGLE}
    Should Contain    ${element_states}    checked    QoS toggle should be enabled (editable).

QoS toggle should be disabled
    Get checkbox state    ${NETWORK_QOS_PAGE_ENABLED_TOGGLE}    ==    unchecked
    ...    QoS toggle should be disabled.

Enable QoS toggle
    ${checked}    Get checkbox state    ${NETWORK_QOS_PAGE_ENABLED_TOGGLE}
    IF    ${checked} == ${false}
        Click    ${NETWORK_QOS_PAGE_ENABLED_TOGGLE_CLICKABLE}
    END
    Wait for elements state    ${NETWORK_QOS_PAGE_ENABLED_TOGGLE}    checked

QoS type title should be "${text}"
    Get text    ${NETWORK_QOS_PAGE_TYPE_SELECT_TITLE}    ==    ${text}

QoS type select option should be "${text}"
    Get text    ${NETWORK_QOS_PAGE_TYPE_SELECT}    ==    ${text}
   
QoS type select should be enabled
    Get element states
    ...    ${NETWORK_QOS_PAGE_TYPE_SELECT}
    ...    contains
    ...    enabled
    ...    message=QoS type select should be enabled (editable).

QoS type select should be disabled
    Get element states
    ...    ${NETWORK_QOS_PAGE_TYPE_SELECT}
    ...    contains
    ...    readonly
    ...    message=QoS type select should be disabled (not editable).

Open QoS type selection dropdown menu
    ${elem_states}    Get element states    ${NETWORK_QOS_PAGE_TYPE_SELECT_OPTIONS_DROPDOWN}
    IF    "hidden" in ${elem_states}    
        Click    ${NETWORK_QOS_PAGE_TYPE_SELECT}
    END

Select QoS type "${option}"
    ${language_map}    Create Dictionary    pt-BR=Tipo de QoS    en=QoS Type    es=Tipo de QoS
    ${dut_language}   Local Storage Get Item    lang
    Log To Console    ${dut_language}
    
    ${select_div}    Get element by    text    ${language_map}[${dut_language}]
    ${select_div_input}    Get element    ${select_div} >> div >> input

    Click    ${select_div_input}
    Wait for elements state    ${select_div} >> ul    visible

    ${elements}    Get elements    ${select_div} >> ul >> li

    FOR    ${element}    IN    @{elements}
        ${element_text}    Get text    ${element} >> div
        ${normalized_element_text}    Set Variable    ${element_text.lower().strip()} 
        ${normalized_option}    Set Variable    ${option.lower().strip()}  
        IF    "${normalized_element_text}" == "${normalized_option}"
            Click    ${element}    
            BREAK
        END
    END

There should be "${number}" network QoS type available
    Open QoS type selection dropdown menu

    ${language_map}    Create Dictionary    pt-BR=Tipo de QoS    en=QoS Type    es=Tipo de QoS
    ${dut_language}   Local Storage Get Item    lang
    Log To Console    ${dut_language}

    ${select_div}    Get element by    text    ${language_map}[${dut_language}]
    ${select_div_input}    Get element    ${select_div} >> div >> input

    Click    ${select_div_input}
    Wait for elements state    ${select_div} >> ul    visible

    ${elements}    Get elements    ${select_div} >> ul >> li

    ${actual_count}=    Get length    ${elements}

    Should be equal as integers
    ...    ${actual_count}
    ...    ${number}
    ...    msg=There should be ${number} Network QoS type available, but there were ${actual_count}.
    ...    values=${false}

QoS type "${text}" should be available
    Select QoS type "${text}"

Internet link title should be "${text}"
    Get text    ${NETWORK_QOS_PAGE_INTERNET_LINK_TITLE}    ==    ${text}

Upload input title should be "${text}"
    Get text    ${NETWORK_QOS_PAGE_UPLOAD_INPUT_TITLE}    ==    ${text}

Upload input text should be "${text}"
    Get text    ${NETWORK_QOS_PAGE_UPLOAD_INPUT}    ==    ${text}

Upload input should be enabled
    Get element states
    ...    ${NETWORK_QOS_PAGE_UPLOAD_INPUT}
    ...    contains
    ...    enabled
    ...    message=Upload (Mbps) input should be enabled (editable).

Upload input should be disabled
    Get element states
    ...    ${NETWORK_QOS_PAGE_UPLOAD_INPUT}
    ...    contains
    ...    disabled
    ...    message=Upload (Mbps) input should be disabled (not editable).

Download input title should be "${text}"
    Get text    ${NETWORK_QOS_PAGE_DOWNLOAD_INPUT_TITLE}    ==    ${text}

Download input text should be "${text}"
    Get text    ${NETWORK_QOS_PAGE_DOWNLOAD_INPUT}    ==    ${text}

Download input should be enabled
    Get element states
    ...    ${NETWORK_QOS_PAGE_DOWNLOAD_INPUT}
    ...    contains
    ...    enabled
    ...    message=Download (Mbps) input should be enabled (editable).

Download input should be disabled
    Get element states
    ...    ${NETWORK_QOS_PAGE_DOWNLOAD_INPUT}
    ...    contains
    ...    disabled
    ...    message=Download (Mbps) input should be disabled (not editable).

Save settings button text should be "${text}"
    Get text    ${NETWORK_QOS_PAGE_SAVE_SETTINGS_BUTTON}    ==    ${text}


################################
#    Keywords Table Limit      #     
################################


Bandwidth Limit by SSID title should be "${text}"
    Get text    ${NETWORK_QOS_PAGE_BANDWIDTH_LIMIT_TITLE}    ==    ${text}

Bandwidth Limit by SSID table should be visible
    Get element states
    ...    ${NETWORK_QOS_PAGE_BANDWIDTH_LIMIT_TABLE}
    ...    contains
    ...    visible

Enabled header should be visible in limit table
    Get element states
    ...    ${NETWORK_QOS_PAGE_HEADER_ENABLED_LIMIT_TABLE}
    ...    contains
    ...    visible
    
Enabled header text should be "${text}" in limit table
    Get text    ${NETWORK_QOS_PAGE_HEADER_ENABLED_LIMIT_TABLE}    ==    ${text}

QoS toggle in limit table should be visible
    Get element states
    ...    ${NETWORK_QOS_PAGE_ENABLED_TOGGLE_CLICKABLE_LIMIT_TABLE}
    ...    contains
    ...    visible

QoS toggle in limit table should be enabled
    ${element_states}    Get element states    ${NETWORK_QOS_PAGE_ENABLED_TOGGLE_LIMIT_TABLE}
    Should Contain    ${element_states}    enabled    QoS toggle limit should be enabled (editable).

QoS toggle in limit table should be disabled
    Get checkbox state    ${NETWORK_QOS_PAGE_ENABLED_TOGGLE_LIMIT_TABLE}    ==    unchecked
    ...    QoS toggle should be disabled.

Enable QoS toggle in limit table
    ${checked}    Get checkbox state    ${NETWORK_QOS_PAGE_ENABLED_TOGGLE_LIMIT_TABLE}
    IF    ${checked} == ${false}
        Click    ${NETWORK_QOS_PAGE_ENABLED_TOGGLE_CLICKABLE_LIMIT_TABLE}
    END
    Wait for elements state    ${NETWORK_QOS_PAGE_ENABLED_TOGGLE_LIMIT_TABLE}    checked

SSID header should be visible in limit table
    Get element states
    ...    ${NETWORK_QOS_PAGE_HEADER_SSID_LIMIT_TABLE}
    ...    contains
    ...    visible
    
SSID header should be "${text}" in limit table
    Get text    ${NETWORK_QOS_PAGE_HEADER_SSID_LIMIT_TABLE}    ==    ${text}

SSID should be "${text}" in limit table
    Get text    ${NETWORK_QOS_PAGE_SSID_LIMIT_TABLE}    ==    ${text}

Band header should be visible in limit table
    Get element states
    ...    ${NETWORK_QOS_PAGE_HEADER_BAND_LIMIT_TABLE}
    ...    contains
    ...    visible
    
Band header should be "${text}" in limit table
    Get text    ${NETWORK_QOS_PAGE_HEADER_BAND_LIMIT_TABLE}    ==    ${text}

Band frequency should be "${text}" in limit table
    Get text    ${NETWORK_QOS_PAGE_BAND_FREQUENCY_LIMIT_TABLE}    ==    ${text}

Upload header should be visible in limit table
    Get element states
    ...    ${NETWORK_QOS_PAGE_HEADER_UPLOAD_LIMIT_TABLE}
    ...    contains
    ...    visible
    
Upload header should be "${text}" in limit table
    Get text    ${NETWORK_QOS_PAGE_HEADER_UPLOAD_LIMIT_TABLE}    ==    ${text}

Upload input text should be "${text}" in limit table
    Get text    ${NETWORK_QOS_PAGE_UPLOAD_INPUT_LIMIT_TABLE}    ==    ${text}

Upload input should be enabled in limit table
    Get element states
    ...    ${NETWORK_QOS_PAGE_UPLOAD_INPUT_LIMIT_TABLE}
    ...    contains
    ...    enabled
    ...    message=Upload (Mbps) input should be enabled (editable).

Upload input should be disabled in limit table
    Get element states
    ...    ${NETWORK_QOS_PAGE_UPLOAD_INPUT_LIMIT_TABLE}
    ...    contains
    ...    disabled
    ...    message=Upload (Mbps) input should be disabled (not editable).

Download header should be visible in limit table
    Get element states
    ...    ${NETWORK_QOS_PAGE_HEADER_DOWNLOAD_LIMIT_TABLE}
    ...    contains
    ...    visible
    
Download header should be "${text}" in limit table
    Get text    ${NETWORK_QOS_PAGE_HEADER_DOWNLOAD_LIMIT_TABLE}    ==    ${text}

Download input text should be "${text}" in limit table
    Get text    ${NETWORK_QOS_PAGE_DOWNLOAD_INPUT_LIMIT_TABLE}    ==    ${text}

Download input should be enabled in limit table
    Get element states
    ...    ${NETWORK_QOS_PAGE_DOWNLOAD_INPUT_LIMIT_TABLE}
    ...    contains
    ...    enabled
    ...    message=Download (Mbps) input should be enabled (editable).

Download input should be disabled in limit table
    Get element states
    ...    ${NETWORK_QOS_PAGE_DOWNLOAD_INPUT_LIMIT_TABLE}
    ...    contains
    ...    disabled
    ...    message=Download (Mbps) input should be disabled (not editable).


################################
#    Keywords Table Guarantee  #     
################################


Bandwidth Guarantee by SSID title should be "${text}"
    Get text    ${NETWORK_QOS_PAGE_BANDWIDTH_GUARANTEE_TITLE}    ==    ${text}

Open Bandwidth Guarantee by SSID info
    Click    ${NETWORK_QOS_PAGE_BANDWIDTH_GUARANTEE_INFO}

Close Bandwidth Guarantee by SSID info
    Click    ${NETWORK_QOS_PAGE_BANDWIDTH_GUARANTEE_INFO_BUTTON}

Bandwidth Guarantee by SSID info should be visible
    Get element states
    ...    ${NETWORK_QOS_PAGE_BANDWIDTH_GUARANTEE_INFO}
    ...    contains
    ...    visible

Bandwidth Guarantee by SSID text info should be "${text}"
    Get text    ${NETWORK_QOS_PAGE_BANDWIDTH_GUARANTEE_INFO_TEXT}    ==    ${text}

Button info text should be "${text}"
    Get text    ${NETWORK_QOS_PAGE_BANDWIDTH_GUARANTEE_INFO_BUTTON}    ==    ${text}

Bandwidth Guarantee by SSID table should be visible
    Get element states
    ...    ${NETWORK_QOS_PAGE_BANDWIDTH_GUARANTEE_TABLE}
    ...    contains
    ...    visible
   
Enabled header should be visible in guarantee table
    Get element states
    ...    ${NETWORK_QOS_PAGE_HEADER_ENABLED_GUARANTEE_TABLE}
    ...    contains
    ...    visible
    
Enabled header text should be "${text}" in guarantee table
    Get text    ${NETWORK_QOS_PAGE_HEADER_ENABLED_GUARANTEE_TABLE}    ==    ${text}

QoS toggle in guarantee table should be visible
    Get element states
    ...    ${NETWORK_QOS_PAGE_ENABLED_TOGGLE_CLICKABLE_LIMIT_TABLE}
    ...    contains
    ...    visible

QoS toggle in guarantee table should be enabled
    ${element_states}    Get element states    ${NETWORK_QOS_PAGE_ENABLED_TOGGLE_GUARANTEE_TABLE}
    Should Contain    ${element_states}    enabled    QoS toggle guarantee should be enabled (editable).

QoS toggle in guarantee table should be disabled
    Get checkbox state    ${NETWORK_QOS_PAGE_ENABLED_TOGGLE_GUARANTEE_TABLE}    ==    unchecked
    ...    QoS toggle should be disabled.

Enable QoS toggle in guarantee table
    ${checked}    Get checkbox state    ${NETWORK_QOS_PAGE_ENABLED_TOGGLE_GUARANTEE_TABLE}
    IF    ${checked} == ${false}
        Click    ${NETWORK_QOS_PAGE_ENABLED_TOGGLE_CLICKABLE_GUARANTEE_TABLEE}
    END
    Wait for elements state    ${NETWORK_QOS_PAGE_ENABLED_TOGGLE_GUARANTEE_TABLE}    checked

SSID header should be visible in guarantee table
    Get element states
    ...    ${NETWORK_QOS_PAGE_HEADER_SSID_GUARANTEE_TABLE}
    ...    contains
    ...    visible
    
SSID header should be "${text}" in guarantee table
    Get text    ${NETWORK_QOS_PAGE_HEADER_SSID_GUARANTEE_TABLE}    ==    ${text}

SSID should be "${text}" in guarantee table
    Get text    ${NETWORK_QOS_PAGE_SSID_GUARANTEE_TABLE}    ==    ${text}

Band header should be visible in guarantee table
    Get element states
    ...    ${NETWORK_QOS_PAGE_HEADER_BAND_GUARANTEE_TABLE}
    ...    contains
    ...    visible
    
Band header should be "${text}" in guarantee table
    Get text    ${NETWORK_QOS_PAGE_HEADER_BAND_GUARANTEE_TABLE}    ==    ${text}

Band frequency should be "${text}" in guarantee table
    Get text    ${NETWORK_QOS_PAGE__BAND_FREQUENCY_GUARANTEE_TABLE}    ==    ${text}

Upload header should be visible in guarantee table
    Get element states
    ...    ${NETWORK_QOS_PAGE_HEADER_UPLOAD_GUARANTEE_TABLE}
    ...    contains
    ...    visible
    
Upload header should be "${text}" in guarantee table
    Get text    ${NETWORK_QOS_PAGE_HEADER_UPLOAD_GUARANTEE_TABLE}    ==    ${text}

Upload input text should be "${text}" in guarantee table
    Get text    ${NETWORK_QOS_PAGE_UPLOAD_INPUT_GUARANTEE_TABLE}    ==    ${text}

Upload input should be enabled in guarantee table
    Get element states
    ...    ${NETWORK_QOS_PAGE_UPLOAD_INPUT_GUARANTEE_TABLE}
    ...    contains
    ...    enabled
    ...    message=Upload (%) input should be enabled (editable).

Upload input should be disabled in guarantee table
    Get element states
    ...    ${NETWORK_QOS_PAGE_UPLOAD_INPUT_LIMIT_TABLE}
    ...    contains
    ...    disabled
    ...    message=Upload (%) input should be disabled (not editable).

Download header should be visible in guarantee table
    Get element states
    ...    ${NETWORK_QOS_PAGE_HEADER_DOWNLOAD_GUARANTEE_TABLE}
    ...    contains
    ...    visible
    
Download header should be "${text}" in guarantee table
    Get text    ${NETWORK_QOS_PAGE_HEADER_DOWNLOAD_GUARANTEE_TABLE}    ==    ${text}

Download input text should be "${text}" in guarantee table
    Get text    ${NETWORK_QOS_PAGE_DOWNLOAD_INPUT_GUARANTEE_TABLE}    ==    ${text}

Download input should be enabled in guarantee table
    Get element states
    ...    ${NETWORK_QOS_PAGE_DOWNLOAD_INPUT_GUARANTEE_TABLE}
    ...    contains
    ...    enabled
    ...    message=Download (%) input should be enabled (editable).

Download input should be disabled in guarantee table
    Get element states
    ...    ${NETWORK_QOS_PAGE_DOWNLOAD_INPUT_LIMIT_TABLE}
    ...    contains
    ...    disabled
    ...    message=Download (%) input should be disabled (not editable).
