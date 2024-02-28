*** Settings ***
Library     Browser
Library     String
Resource    ../../common.resource


*** Variables ***
${SIDEMENU_TOGGLE}                                                            xpath=//*[@id="sidebar_menu"]/div[1]/div[1]
${SIDEMENU_WIRELESS_SUBMENU}                                                  xpath=//*[@id="sidebar-options-menu"]/div[3]/div/div/div
${SIDEMENU_WIRELESS_SSID}                                                     xpath=//*[@id="sidebar-options-menu"]/div[3]/ul/div[1]/p


###


${WIRELESS_SSID_PAGE_INNER_TITLE}                                             xpath=//*[@id="root"]/div[3]/div/div[1]/div[1]
${WIRELESS_SSID_PAGE_INNER_SUBTITLE}                                          xpath=//*[@id="root"]/div[3]/div/div[1]/div[2]
${WIRELESS_SSID_PAGE_ADD_NEW_NETWORK_INNER_SUBTITLE}                          xpath=//*[@id="root"]/div[3]/div/div[1]/div[2]

${WIRELESS_SSID_PAGE_ADD_SSID_BUTTON_TEXT}                                    xpath=//*[@id="root"]/div[3]/div/div[2]
${WIRELESS_SSID_PAGE_ADD_SSID_BUTTON}                                         xpath=//*[@id="root"]/div[3]/div/div[2]/span/button


################################
#    Variables Table SSID      #     
################################


${WIRELESS_SSID_PAGE_TABLE}                                                   xpath=//*[@id="root"]/div[3]/div/div[3]/div[1]

${WIRELESS_SSID_PAGE_HEADER_NETWORK_NAME}                                     xpath=//*[@id="root"]/div[3]/div/div[3]/div[1]/div[1]
${WIRELESS_SSID_PAGE_HEADER_FREQUENCY}                                        xpath=//*[@id="root"]/div[3]/div/div[3]/div[1]/div[2]
${WIRELESS_SSID_PAGE_HEADER_EDIT}                                             xpath=//*[@id="root"]/div[3]/div/div[3]/div[1]/div[3]
${WIRELESS_SSID_PAGE_HEADER_DELETE}                                           xpath=//*[@id="root"]/div[3]/div/div[3]/div[1]/div[4]

${WIRELESS_SSID_PAGE_NETWORK_NAME}                                            xpath=//*[@id="root"]/div[3]/div/div[3]/div[2]/div/div[1]
${WIRELESS_SSID_PAGE_FREQUENCY}                                               xpath=//*[@id="root"]/div[3]/div/div[3]/div[2]/div/div[2]
${WIRELESS_SSID_PAGE_EDIT}                                                    xpath=//*[@id="root"]/div[3]/div/div[3]/div[2]/div/div[3]
${WIRELESS_SSID_PAGE_DELETE}                                                  xpath=//*[@id="root"]/div[3]/div/div[3]/div[2]/div/div[4]

${WIRELESS_SSID_PAGE_ADD_SETTINGS_BUTTON}                                     xpath=//*[@id="root"]/div[3]/div/div[2]/div[12]/button[2]
${WIRELESS_SSID_PAGE_CANCEL_SETTINGS_BUTTON}                                  xpath=//*[@id="root"]/div[3]/div/div[2]/div[12]/button[1]


###############################################
#    Variables Add SSID (open-system)         #     
###############################################


${WIRELESS_SSID_PAGE_NETWORK_NAME_INPUT_TITLE}                                xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div[1]/div/div[1]
${WIRELESS_SSID_PAGE_NETWORK_NAME_INPUT}                                      id=input-7

${WIRELESS_SSID_PAGE_AUTHENTICATION_SELECT_TITLE}                             xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div[2]/div/div
${WIRELESS_SSID_PAGE_AUTHENTICATION_SELECT}                                   xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div[2]/div/div/div/input
${WIRELESS_SSID_PAGE_AUTHENTICATION_SELECT_OPTIONS_DROPDOWN}                  xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div[2]/div/div/ul
${WIRELESS_SSID_PAGE_AUTHENTICATION_SELECT_OPTION_OPEN_SYSTEM}                xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div[2]/div/div/ul/li[1]
${WIRELESS_SSID_PAGE_AUTHENTICATION_SELECT_OPTION_WPA_PSK}                    xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div[2]/div/div/ul/li[2]
${WIRELESS_SSID_PAGE_AUTHENTICATION_SELECT_OPTION_WPA2_PSK}                   xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div[2]/div/div/ul/li[3]
${WIRELESS_SSID_PAGE_AUTHENTICATION_SELECT_OPTION_WPA}                        xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div[2]/div/div/ul/li[4]
${WIRELESS_SSID_PAGE_AUTHENTICATION_SELECT_OPTION_WPA2}                       xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div[2]/div/div/ul/li[5]

${WIRELESS_SSID_PAGE_FREQUENCY_TOGGLE}                                        xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div/div/label/input
${WIRELESS_SSID_PAGE_FREQUENCY_TOGGLE_CLICKABLE}                              xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div/div/label
${WIRELESS_SSID_PAGE_FREQUENCY_TOGGLE_TEXT}                                   xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]

${WIRELESS_SSID_PAGE_FREQUENCY_2GHZ_CHECKBOX}                                 id=wifi0
${WIRELESS_SSID_PAGE_FREQUENCY_2GHZ_CHECKBOX_CLICKABLE}                       xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div/div[2]/div/label[1]
${WIRELESS_SSID_PAGE_FREQUENCY_2GHZ_CHECKBOX_TEXT}                            xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div/div[2]

${WIRELESS_SSID_PAGE_FREQUENCY_5GHZ_CHECKBOX}                                 id=wifi1
${WIRELESS_SSID_PAGE_FREQUENCY_5GHZ_CHECKBOX_CLICKABLE}                       xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div/div[3]/div/label[1]
${WIRELESS_SSID_PAGE_FREQUENCY_5GHZ_CHECKBOX_TEXT}                            xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div/div[3]

${WIRELESS_SSID_PAGE_ADVANCED_SETTING_TITLE}                                  xpath=//*[@id="root"]/div[3]/div/div[2]/div[5]/div[1]

${WIRELESS_SSID_PAGE_ISOLATE_SSID_CHECKBOX}                                   xpath=//*[@id="root"]/div[3]/div/div[2]/div[5]/div[2]/div[1]/div/label/input
${WIRELESS_SSID_PAGE_ISOLATE_SSID_CHECKBOX_CLICKABLE}                         xpath=//*[@id="root"]/div[3]/div/div[2]/div[5]/div[2]/div[1]/div/label
${WIRELESS_SSID_PAGE_ISOLATE_SSID_CHECKBOX_TEXT}                              xpath=//*[@id="root"]/div[3]/div/div[2]/div[5]/div[2]/div[1]

${WIRELESS_SSID_PAGE_ONLY_INTERNET_CHECKBOX}                                  xpath=//*[@id="root"]/div[3]/div/div[2]/div[5]/div[2]/div[2]/div/label/input
${WIRELESS_SSID_PAGE_ONLY_INTERNET_CHECKBOX_CLICKABLE}                        xpath=//*[@id="root"]/div[3]/div/div[2]/div[5]/div[2]/div[2]/div/label
${WIRELESS_SSID_PAGE_ONLY_INTERNET_CHECKBOX_TEXT}                             xpath=//*[@id="root"]/div[3]/div/div[2]/div[5]/div[2]/div[2]

${WIRELESS_SSID_PAGE_HIDE_SSID_CHECKBOX}                                      xpath=//*[@id="root"]/div[3]/div/div[2]/div[5]/div[2]/div[3]/div/label/input
${WIRELESS_SSID_PAGE_HIDE_SSID_CHECKBOX_CLICKABLE}                            xpath=//*[@id="root"]/div[3]/div/div[2]/div[5]/div[2]/div[3]/div/label
${WIRELESS_SSID_PAGE_HIDE_SSID_CHECKBOX_TEXT}                                 xpath=//*[@id="root"]/div[3]/div/div[2]/div[5]/div[2]/div[3]

${WIRELESS_SSID_PAGE_ISOLATE_CUSTOMERS_CHECKBOX}                              xpath=//*[@id="root"]/div[3]/div/div[2]/div[5]/div[2]/div[4]/div/label/input
${WIRELESS_SSID_PAGE_ISOLATE_CUSTOMERS_CHECKBOX_CLICKABLE}                    xpath=//*[@id="root"]/div[3]/div/div[2]/div[5]/div[2]/div[4]/div/label
${WIRELESS_SSID_PAGE_ISOLATE_CUSTOMERS_CHECKBOX_TEXT}                         xpath=//*[@id="root"]/div[3]/div/div[2]/div[5]/div[2]/div[4]

${WIRELESS_SSID_PAGE_VLAN_TOGGLE}                                             xpath=//*[@id="root"]/div[3]/div/div[2]/div[6]/div[1]/div/label/input
${WIRELESS_SSID_PAGE_VLAN_TOGGLE_CLICKABLE}                                   xpath=//*[@id="root"]/div[3]/div/div[2]/div[6]/div/div/label
${WIRELESS_SSID_PAGE_VLAN_TOGGLE_TEXT}                                        xpath=//*[@id="root"]/div[3]/div/div[2]/div[6]

${WIRELESS_SSID_PAGE_VLAN_SLIDER_INPUT}                                       xpath=/html/body/div/div[3]/div/div[2]/div[6]/div[2]/div[1]/div/div/input
${WIRELESS_SSID_PAGE_VLAN_SLIDER}                                             xpath=/html/body/div/div[3]/div/div[2]/div[6]/div[2]/div[2]/div[2]/div[1]/div
${WIRELESS_SSID_PAGE_VLAN_MINIMUM_VALUE_SLIDER}                               xpath=/html/body/div/div[3]/div/div[2]/div[6]/div[2]/div[2]/div[1]
${WIRELESS_SSID_PAGE_VLAN_MAXIMUM_VALUE_SLIDER}                               xpath=/html/body/div/div[3]/div/div[2]/div[6]/div[2]/div[2]/div[3]
    
${WIRELESS_SSID_PAGE_ACL_TITLE}                                               xpath=//*[@id="root"]/div[3]/div/div[2]/div[7]
${WIRELESS_SSID_PAGE_ACL_SELECT_TITLE}                                        xpath=//*[@id="root"]/div[3]/div/div[2]/div[8]
${WIRELESS_SSID_PAGE_ACL_SELECT}                                              xpath=//*[@id="root"]/div[3]/div/div[2]/div[8]/div/div/div/input
${WIRELESS_SSID_PAGE_ACL_SELECT_OPTIONS_DROPDOWN}                             xpath=//*[@id="root"]/div[3]/div/div[2]/div[8]/div/div/ul
${WIRELESS_SSID_PAGE_ACL_SELECT_OPTION_DISABLED}                              xpath=//*[@id="root"]/div[3]/div/div[2]/div[8]/div/div/ul/li[1]
${WIRELESS_SSID_PAGE_ACL_SELECT_OPTION_ALLOW_LISTINGS}                        xpath=//*[@id="root"]/div[3]/div/div[2]/div[8]/div/div/ul/li[2]
${WIRELESS_SSID_PAGE_ACL_SELECT_OPTION_LISTED_BLOCKS}                         xpath=//*[@id="root"]/div[3]/div/div[2]/div[8]/div/div/ul/li[3]

${WIRELESS_SSID_PAGE_ADD_ACL_RULE_BUTTON_TEXT}                                xpath=//*[@id="root"]/div[3]/div/div[2]/div[8]
${WIRELESS_SSID_PAGE_ADD_ACL_RULE_BUTTON}                                     xpath=//*[@id="root"]/div[3]/div/div[2]/div[8]/span/button

${WIRELESS_SSID_PAGE_DELETE_ACL_RULE_BUTTON}                                  xpath=//*[@id="root"]/div[3]/div/div[2]/div[9]/div/div[1]/div[2]/div/div[3]

${WIRELESS_SSID_PAGE_ACL_TABLE}                                               xpath=//*[@id="root"]/div[3]/div/div[2]/div[9]/div/div[1]/div[1]

${WIRELESS_SSID_PAGE_HEADER_DESCRIPTION}                                      xpath=//*[@id="root"]/div[3]/div/div[2]/div[9]/div/div[1]/div[1]/div[1]
${WIRELESS_SSID_PAGE_HEADER_MAC}                                              xpath=//*[@id="root"]/div[3]/div/div[2]/div[9]/div/div[1]/div[1]/div[2]

${WIRELESS_SSID_PAGE_DESCRIPTION_INPUT}                                       xpath=//*[@id="root"]/div[3]/div/div[2]/div[9]/div/div[1]/div[2]/div/div[1]/div/div/div/input
${WIRELESS_SSID_PAGE_MAC_INPUT}                                               xpath=//*[@id="root"]/div[3]/div/div[2]/div[9]/div/div[1]/div[2]/div/div[2]/div/div/div/input

${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_2GHZ_SLIDER_TITLE}                     xpath=//*[@id="root"]/div[3]/div/div[2]/div[9]
${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_2GHZ_SLIDER_INPUT}                     xpath=/html/body/div/div[3]/div/div[2]/div[9]/div/div[1]/div/div/input
${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_2GHZ_SLIDER}                           xpath=/html/body/div/div[3]/div/div[2]/div[9]/div/div[2]/div[2]/div[1]/div
${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_2GHZ_MINIMUM_VALUE_SLIDER}             xpath=/html/body/div/div[3]/div/div[2]/div[9]/div/div[2]/div[1]
${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_2GHZ_MAXIMUM_VALUE_SLIDER}             xpath=/html/body/div/div[3]/div/div[2]/div[9]/div/div[2]/div[3]

${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_5GHZ_SLIDER_TITLE}                     xpath=//*[@id="root"]/div[3]/div/div[2]/div[10]
${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_5GHZ_SLIDER_INPUT}                     xpath=/html/body/div/div[3]/div/div[2]/div[10]/div/div[1]/div/div/input
${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_5GHZ_SLIDER}                           xpath=/html/body/div/div[3]/div/div[2]/div[10]/div/div[2]/div[2]/div[1]/div
${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_5GHZ_MINIMUM_VALUE_SLIDER}             xpath=/html/body/div/div[3]/div/div[2]/div[10]/div/div[2]/div[1]
${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_5GHZ_MAXIMUM_VALUE_SLIDER}             xpath=/html/body/div/div[3]/div/div[2]/div[10]/div/div[2]/div[3]

${WIRELESS_SSID_PAGE_CLIENTS_SIGNAL_DBM_SLIDER_TITLE}                         xpath=//*[@id="root"]/div[3]/div/div[2]/div[11]
${WIRELESS_SSID_PAGE_CLIENTS_SIGNAL_DBM_SLIDER_INPUT}                         xpath=/html/body/div/div[3]/div/div[2]/div[11]/div/div[1]/div/div/input
${WIRELESS_SSID_PAGE_CLIENTS_SIGNAL_DBM_SLIDER}                               xpath=/html/body/div/div[3]/div/div[2]/div[11]/div/div[2]/div[2]/div[1]/div
${WIRELESS_SSID_PAGE_CLIENTS_SIGNAL_DBM_MINIMUM_VALUE_SLIDER}                 xpath=/html/body/div/div[3]/div/div[2]/div[11]/div/div[2]/div[1]
${WIRELESS_SSID_PAGE_CLIENTS_SIGNAL_DBM_MAXIMUM_VALUE_SLIDER}                 xpath=/html/body/div/div[3]/div/div[2]/div[11]/div/div[2]/div[3]


*** Keywords ***
Access Wireless SSID settings page
    ${submenu_is_visible}    Run keyword and return status
    ...    Get element states
    ...    ${SIDEMENU_WIRELESS_SUBMENU}
    ...    contains
    ...    visible
    
    IF    not ${submenu_is_visible}
        Click    ${SIDEMENU_TOGGLE}
        Wait for elements state
        ...    ${SIDEMENU_WIRELESS_SUBMENU}
        ...    visible
        ...    5s
        ...    Network submenu was not visible (5 seconds timeout).
    END

    ${ntp_option_is_visible}    Run keyword and return status
    ...    Get element states
    ...    ${SIDEMENU_WIRELESS_SSID}
    ...    contains
    ...    visible

    IF    not ${ntp_option_is_visible}
        Click    ${SIDEMENU_WIRELESS_SUBMENU}
        Wait for elements state
        ...    ${SIDEMENU_WIRELESS_SSID}
        ...    visible
        ...    5s
        ...    Wireless SSID submenu option was not visible (5 seconds timeout).
    END

    Click    ${SIDEMENU_WIRELESS_SSID}
    Sleep    6

Page inner title Wireless SSID should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_INNER_TITLE}    ==    ${text}

Page inner subtitle Wireless SSID should be "${text}"
    ${str}    Get text    ${WIRELESS_SSID_PAGE_INNER_SUBTITLE}
    ${str_stripped}    Strip string    ${str}
    Should be equal as strings    ${str_stripped}    ${text}

Page inner subtitle Add new network should be "${text}"
    ${str}    Get text    ${WIRELESS_SSID_PAGE_ADD_NEW_NETWORK_INNER_SUBTITLE} 
    ${str_stripped}    Strip string    ${str}
    Should be equal as strings    ${str_stripped}    ${text}

Add SSID settings button text should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_ADD_SSID_BUTTON_TEXT}    ==    ${text}

Add SSID settings button should be visible in table
    Get element states
    ...    ${WIRELESS_SSID_PAGE_ADD_SSID_BUTTON} 
    ...    contains
    ...    visible

Add SSID in table
    Click    ${WIRELESS_SSID_PAGE_ADD_SSID_BUTTON}

Add New Network settings button text should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_ADD_SETTINGS_BUTTON}    ==    ${text}

Cancel settings button text should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_CANCEL_SETTINGS_BUTTON}    ==    ${text}


################################
#    Keywords Table SSID       #     
################################


Wireless SSID table should be visible
    Get element states
    ...    ${WIRELESS_SSID_PAGE_TABLE} 
    ...    contains
    ...    visible
    
SSID header should be "${text}" in table
    Get text    ${WIRELESS_SSID_PAGE_HEADER_NETWORK_NAME}     ==    ${text}

SSID should be "${text}" in table
    Get text    ${WIRELESS_SSID_PAGE_NETWORK_NAME}    ==    ${text}
    
Frequency header should be "${text}" in table
    Get text    ${WIRELESS_SSID_PAGE_HEADER_FREQUENCY}    ==    ${text}

Frequency should be "${text}" in table
    Get text    ${WIRELESS_SSID_PAGE_FREQUENCY}    ==    ${text}
    
Delete header should be visible in table
    Get element states
    ...    ${WIRELESS_SSID_PAGE_HEADER_DELETE} 
    ...    contains
    ...    visible


###############################################
#       Keywords Add SSID (open-system)       #     
###############################################


SSID input title should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_NETWORK_NAME_INPUT_TITLE}    ==    ${text}

SSID input text should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_NETWORK_NAME_INPUT}    ==    ${text}

SSID placeholder should be "${text}"
    Get attribute
    ...    ${WIRELESS_SSID_PAGE_NETWORK_NAME_INPUT}
    ...    placeholder    ==    ${text}

SSID input should be enabled
    Get element states
    ...    ${WIRELESS_SSID_PAGE_NETWORK_NAME_INPUT}
    ...    contains
    ...    enabled
    ...    message=SSID input should be enabled (editable).

Authentication SSID title should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_AUTHENTICATION_SELECT_TITLE}    ==    ${text}

Authentication SSID select option should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_AUTHENTICATION_SELECT}    ==    ${text}
   
Authentication SSID select should be enabled
    Get element states
    ...    ${WIRELESS_SSID_PAGE_AUTHENTICATION_SELECT}
    ...    contains
    ...    enabled
    ...    message=Wireless SSID Authentication select should be enabled (editable).

Open Authentication SSID selection dropdown menu
    ${elem_states}    Get element states    ${WIRELESS_SSID_PAGE_AUTHENTICATION_SELECT_OPTIONS_DROPDOWN}
    IF    "hidden" in ${elem_states}    
        Click    ${WIRELESS_SSID_PAGE_AUTHENTICATION_SELECT}
    END

Select Authentication SSID "${option}"
    ${language_map}    Create Dictionary    pt-BR=Autenticação    en=Authentication    es=Autenticación
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

There should be "${number}" authentication SSID available
    Open Authentication SSID selection dropdown menu

    ${language_map}    Create Dictionary    pt-BR=Autenticação    en=Authentication    es=Autenticación
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
    ...    msg=There should be ${number} Wireless SSID Authentication available, but there were ${actual_count}.
    ...    values=${false}

Authentication SSID "${text}" should be available
    Select Authentication SSID "${text}"

Frequency toggle text should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_FREQUENCY_TOGGLE_TEXT}     ==    ${text}

Frequency toggle should be enabled
    ${element_states}    Get element states    ${WIRELESS_SSID_PAGE_FREQUENCY_TOGGLE}
    Should Contain    ${element_states}    checked    Frequency toggle should be enabled (editable).

Frequency toggle should be disabled
    Get checkbox state    ${WIRELESS_SSID_PAGE_FREQUENCY_TOGGLE}    ==    unchecked
    ...    Frequency toggle should be disabled.

Enable Frequency toggle
    ${checked}    Get checkbox state    ${WIRELESS_SSID_PAGE_FREQUENCY_TOGGLE}
    IF    ${checked} == ${false}
        Click    ${WIRELESS_SSID_PAGE_FREQUENCY_TOGGLE_CLICKABLE}
    END
    Wait for elements state    ${WIRELESS_SSID_PAGE_FREQUENCY_TOGGLE}    checked

Disable Frequency toggle
    ${checked}    Get checkbox state    ${WIRELESS_SSID_PAGE_FREQUENCY_TOGGLE}
    IF    ${checked} == ${true}
        Click    ${WIRELESS_SSID_PAGE_FREQUENCY_TOGGLE_CLICKABLE}
    END
    Wait for elements state    ${WIRELESS_SSID_PAGE_FREQUENCY_TOGGLE}    unchecked

Frequency 2.4GHz checkbox text should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_FREQUENCY_2GHZ_CHECKBOX_TEXT}    ==    ${text}

Frequency 2.4GHz checkbox should be visible
    Get element states
    ...    ${WIRELESS_SSID_PAGE_FREQUENCY_2GHZ_CHECKBOX_CLICKABLE}
    ...    contains
    ...    visible

Frequency 2.4GHz checkbox should be enabled
    Get checkbox state    ${WIRELESS_SSID_PAGE_FREQUENCY_2GHZ_CHECKBOX}    ==    checked
    ...    Frequency 2.4GHz checkbox should be enabled.

Frequency 5GHz checkbox text should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_FREQUENCY_5GHZ_CHECKBOX_TEXT}    ==    ${text}

Frequency 5GHz checkbox should be visible
    Get element states
    ...    ${WIRELESS_SSID_PAGE_FREQUENCY_5GHZ_CHECKBOX_CLICKABLE}
    ...    contains
    ...    visible

Frequency 5GHz checkbox should be disabled
    Get checkbox state    ${WIRELESS_SSID_PAGE_FREQUENCY_5GHZ_CHECKBOX}    ==    unchecked
    ...    Frequency 5GHz checkbox should be disabled.

Advanced setting title should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_ADVANCED_SETTING_TITLE}    ==    ${text}

Isolate SSID checkbox text should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_ISOLATE_SSID_CHECKBOX_TEXT}     ==    ${text}

Isolate SSID checkbox should be disabled
    Get checkbox state    ${WIRELESS_SSID_PAGE_ISOLATE_SSID_CHECKBOX}    ==    unchecked
    ...    Isolate SSID checkbox should be disabled.

Only Internet checkbox text should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_ONLY_INTERNET_CHECKBOX_TEXT}     ==    ${text}

Only Internet checkbox should be disabled
    Get checkbox state    ${WIRELESS_SSID_PAGE_ONLY_INTERNET_CHECKBOX}    ==    unchecked
    ...    Only Internet checkbox should be disabled.
    
Hide SSID checkbox text should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_HIDE_SSID_CHECKBOX_TEXT}     ==    ${text}

Hide SSID checkbox should be disabled
    Get checkbox state    ${WIRELESS_SSID_PAGE_HIDE_SSID_CHECKBOX}    ==    unchecked
    ...    Hide SSID checkbox should be disabled.

Isolate customers checkbox text should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_ISOLATE_CUSTOMERS_CHECKBOX_TEXT}     ==    ${text}

Isolate customers checkbox should be disabled
    Get checkbox state    ${WIRELESS_SSID_PAGE_ISOLATE_CUSTOMERS_CHECKBOX}    ==    unchecked
    ...    Isolate customers checkbox should be disabled.

VLAN toggle text should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_VLAN_TOGGLE_TEXT}    ==    ${text}

VLAN toggle should be enabled
    ${element_states}    Get element states    ${WIRELESS_SSID_PAGE_VLAN_TOGGLE}
    Should Contain    ${element_states}    checked    VLAN toggle should be enabled (editable).

VLAN toggle should be disabled
    Get checkbox state    ${WIRELESS_SSID_PAGE_VLAN_TOGGLE}    ==    unchecked
    ...    VLAN toggle should be disabled.

Enable VLAN toggle
    ${checked}    Get checkbox state    ${WIRELESS_SSID_PAGE_VLAN_TOGGLE}
    IF    ${checked} == ${false}
        Click    ${WIRELESS_SSID_PAGE_VLAN_TOGGLE_CLICKABLE}
    END
    Wait for elements state    ${WIRELESS_SSID_PAGE_VLAN_TOGGLE}    checked

Disable VLAN toggle
    ${checked}    Get checkbox state    ${WIRELESS_SSID_PAGE_VLAN_TOGGLE}
    IF    ${checked} == ${true}
        Click    ${WIRELESS_SSID_PAGE_VLAN_TOGGLE_CLICKABLE}
    END
    Wait for elements state    ${WIRELESS_SSID_PAGE_VLAN_TOGGLE}    unchecked

Slider input VLAN should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_VLAN_SLIDER_INPUT}    ==    ${text}

Slider input VLAN should be enabled
    Get element states
    ...    ${WIRELESS_SSID_PAGE_VLAN_SLIDER_INPUT}
    ...    contains
    ...    enabled
    ...    message=Slider input VLAN should be enabled (editable).

Slider input VLAN should be visible
    Get element states
    ...    ${WIRELESS_SSID_PAGE_VLAN_SLIDER_INPUT}
    ...    contains
    ...    visible
    ...    message=Slider input VLAN should be visible (editable).

Slider VLAN should be visible
    Get element states
    ...    ${WIRELESS_SSID_PAGE_VLAN_SLIDER}
    ...    contains
    ...    visible

Minimum value of the slider VLAN should be ${text}
    Get text    ${WIRELESS_SSID_PAGE_VLAN_MINIMUM_VALUE_SLIDER}    ==    ${text}

Maximum value of the slider VLAN should be ${text}
    Get text    ${WIRELESS_SSID_PAGE_VLAN_MAXIMUM_VALUE_SLIDER}    ==    ${text}

ACL title should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_ACL_SELECT_TITLE}    ==    ${text}

ACL select option should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_ACL_SELECT}    ==    ${text}
   
ACL select should be enabled
    Get element states
    ...    ${WIRELESS_SSID_PAGE_ACL_SELECT}
    ...    contains
    ...    enabled
    ...    message=ACL select should be enabled (editable).

Open ACL selection dropdown menu
    ${elem_states}    Get element states    ${WIRELESS_SSID_PAGE_ACL_SELECT_OPTIONS_DROPDOWN}
    IF    "hidden" in ${elem_states}    
        Click    ${WIRELESS_SSID_PAGE_ACL_SELECT}
    END

Select ACL "${option}"
    ${language_map}    Create Dictionary    pt-BR=Modo de controle de acesso    en=Access control mode    es=Modo de control de acceso
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

There should be "${number}" ACL available
    Open ACL selection dropdown menu

    ${language_map}    Create Dictionary    pt-BR=Modo de controle de acesso    en=Access control mode    es=Modo de control de acceso
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
    ...    msg=There should be ${number} ACL available, but there were ${actual_count}.
    ...    values=${false}

ACL "${text}" should be available
    Select ACL "${text}"

Add settings ACL rules button text should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_ADD_ACL_RULE_BUTTON_TEXT}    ==    ${text}

Add settings ACL rules button should be visible in table
    Get element states
    ...    ${WIRELESS_SSID_PAGE_ADD_ACL_RULE_BUTTON} 
    ...    contains
    ...    visible

Add ACL rule in table
    Click    ${WIRELESS_SSID_PAGE_ADD_ACL_RULE_BUTTON}

Wireless SSID ACL table should be visible
    Get element states
    ...    ${WIRELESS_SSID_PAGE_ACL_TABLE}
    ...    contains
    ...    visible

Description header should be visible in table
    Get element states
    ...    ${WIRELESS_SSID_PAGE_HEADER_DESCRIPTION} 
    ...    contains
    ...    visible
    
Description header should be "${text}" in table
    Get text    ${WIRELESS_SSID_PAGE_HEADER_DESCRIPTION}    ==    ${text}

Description input text should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_DESCRIPTION_INPUT}    ==    ${text}

Description input should be enabled
    Get element states
    ...    ${WIRELESS_SSID_PAGE_DESCRIPTION_INPUT}
    ...    contains
    ...    enabled
    ...    message=Description input should be enabled (editable).

MAC header should be visible in table
    Get element states
    ...    ${WIRELESS_SSID_PAGE_HEADER_MAC} 
    ...    contains
    ...    visible
    
MAC header should be "${text}" in table
    Get text    ${WIRELESS_SSID_PAGE_HEADER_MAC}    ==    ${text}

MAC input text should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_MAC_INPUT}    ==    ${text}

MAC input should be enabled
    Get element states
    ...    ${WIRELESS_SSID_PAGE_MAC_INPUT}
    ...    contains
    ...    enabled
    ...    message=MAC input should be enabled (editable).

Delete settings ACL rules button should be visible in table
    Get element states
    ...    ${WIRELESS_SSID_PAGE_DELETE_ACL_RULE_BUTTON} 
    ...    contains
    ...    visible

Slider title for clients connected on the 2.4GHz frequency should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_2GHZ_SLIDER_TITLE}    ==    ${text}

Slider input for clients connected on the 2.4GHz frequency should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_2GHZ_SLIDER_INPUT}    ==    ${text}

Slider input for clients connected on the 2.4GHz frequency should be enabled
    Get element states
    ...    ${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_2GHZ_SLIDER_INPUT}
    ...    contains
    ...    enabled
    ...    message=Slider input for clients connected on the 2.4GHz frequency should be enabled (editable).

Slider input for clients connected on the 2.4GHz frequency should be visible
    Get element states
    ...    ${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_2GHZ_SLIDER_INPUT}
    ...    contains
    ...    visible
    ...    message=Slider input for clients connected on the 2.4GHz frequency should be visible (editable).

Slider clients connected on the 2.4GHz frequency should be visible
    Get element states
    ...    ${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_2GHZ_SLIDER}
    ...    contains
    ...    visible

Minimum value of the slider for 2.4GHz clients connected should be ${text}
    Get text    ${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_2GHZ_MINIMUM_VALUE_SLIDER}    ==    ${text}

Maximum value of the slider for 2.4GHz clients connected should be ${text}
    Get text    ${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_2GHZ_MAXIMUM_VALUE_SLIDER}    ==    ${text}

Slider title for clients connected on the 5GHz frequency should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_5GHZ_SLIDER_TITLE}    ==    ${text}
    
Slider input for clients connected on the 5GHz frequency should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_5GHZ_SLIDER_INPUT}    ==    ${text}

Slider input for clients connected on the 5GHz frequency should be enabled
    Get element states
    ...    ${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_5GHZ_SLIDER_INPUT}
    ...    contains
    ...    enabled
    ...    message=Slider input for clients connected on the 5GHz frequency should be enabled (editable).

Slider input for clients connected on the 5GHz frequency should be not visible
    Get element states
    ...    ${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_5GHZ_SLIDER_INPUT}
    ...    not contains
    ...    detached
    ...    message=Slider input for clients connected on the 5GHz frequency should be not visible (not editable).

Slider clients connected on the 5GHz frequency should be visible
    Get element states
    ...    ${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_5GHZ_SLIDER}
    ...    contains
    ...    visible

Slider clients connected on the 5GHz frequency should be not visible
    Get element states
    ...    ${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_5GHZ_SLIDER}
    ...    not contains
    ...    detached

Minimum value of the slider for 5GHz clients connected should be ${text}
    Get text    ${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_5GHZ_MINIMUM_VALUE_SLIDER}    ==    ${text}

Maximum value of the slider for 5GHz clients connected should be ${text}
    Get text    ${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_5GHZ_MAXIMUM_VALUE_SLIDER}    ==    ${text}

Slider title for clients signal dBm should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_CLIENTS_SIGNAL_DBM_SLIDER_TITLE}    ==    ${text}

Slider input for clients signal dBm should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_CLIENTS_SIGNAL_DBM_SLIDER_INPUT}    ==    ${text}

Slider input for clients signal dBm should be enabled
    Get element states
    ...    ${WIRELESS_SSID_PAGE_CLIENTS_SIGNAL_DBM_SLIDER_INPUT}
    ...    contains
    ...    enabled
    ...    message=Slider input for clients signal dBm should be enabled (editable).

Slider clients signal dBm should be visible
    Get element states
    ...    ${WIRELESS_SSID_PAGE_CLIENTS_SIGNAL_DBM_SLIDER}
    ...    contains
    ...    visible
    
Minimum value of the slider for clients signal dBm should be ${text}
    Get text    ${WIRELESS_SSID_PAGE_CLIENTS_SIGNAL_DBM_MINIMUM_VALUE_SLIDER}    ==    ${text}

Maximum value of the slider for clients signal dBm should be ${text}
    Get text    ${WIRELESS_SSID_PAGE_CLIENTS_SIGNAL_DBM_MAXIMUM_VALUE_SLIDER}    ==    ${text}
