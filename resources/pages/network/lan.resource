*** Settings ***
Library     Browser
Library     String
Resource    ../../common.resource


*** Variables ***
${SIDEMENU_TOGGLE}                                                              xpath=//*[@id="sidebar_menu"]/div[1]/div[1]
${SIDEMENU_NETWORK_SUBMENU}                                                     xpath=//*[@id="sidebar-options-menu"]/div[2]/div
${SIDEMENU_NETWORK_LAN}                                                         xpath=//*[@id="sidebar-options-menu"]/div[2]/ul/div[3]/p

###

${NETWORK_LAN_PAGE_INNER_TITLE}                                                 xpath=//*[@id="root"]/div[3]/div/div[1]/div[1]
${NETWORK_LAN_PAGE_INNER_SUBTITLE}                                              xpath=//*[@id="root"]/div[3]/div/div[1]/div[2]

${NETWORK_LAN_PAGE_SAVE_SETTINGS_BUTTON}                                        xpath=//*[@id="root"]/div[3]/div/div[3]/button

##############
#    IPV4    #
##############
${NETWORK_LAN_PAGE_IPV4_SETTINGS_BUTTON}                                        xpath=//*[@id="root"]/div[3]/div/ul/li[1]/button

${NETWORK_LAN_PAGE_IPV4_AUTOMATIC_IP_ADDRESS_TOGGLE_TITLE}                      xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]
${NETWORK_LAN_PAGE_IPV4_AUTOMATIC_IP_ADDRESS_TOGGLE}                            xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div/label/input
${NETWORK_LAN_PAGE_IPV4_AUTOMATIC_IP_ADDRESS_TOGGLE_CLICKABLE}                  xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/label
${NETWORK_LAN_PAGE_IPV4_AUTOMATIC_IP_ADDRESS_TOGGLE_INFO_ICON}                  xpath=//*[@id="root"]/div[3]/div/div[2]/div[1] >> svg

${NETWORK_LAN_PAGE_IPV4_AUTOMATIC_IP_ADDRESS_TOGGLE_INFO_MODAL_TEXT}            xpath=//*[@id="overlay-cntse"]/div/div[2]/div
${NETWORK_LAN_PAGE_IPV4_AUTOMATIC_IP_ADDRESS_TOGGLE_INFO_MODAL_CLOSE_BUTTON}    xpath=//*[@id="overlay-cntse"]/div/div[3]/div/button

# ${NETWORK_LAN_PAGE_IPV4_STATIC_IP_ADDRESS_INPUT_TITLE}    ${EMPTY}
${NETWORK_LAN_PAGE_IPV4_STATIC_IP_ADDRESS_INPUT}                                xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/input[1]

# ${NETWORK_LAN_PAGE_IPV4_SUBNET_MASK_INPUT_TITLE}    ${EMPTY}
${NETWORK_LAN_PAGE_IPV4_SUBNET_MASK_INPUT}                                      xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/input[2]

# ${NETWORK_LAN_PAGE_IPV4_DEFAULT_GATEWAY_INPUT_TITLE}    ${EMPTY}
${NETWORK_LAN_PAGE_IPV4_DEFAULT_GATEWAY_INPUT}                                  xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/input[3]

##############
#    IPV6    #
##############
${NETWORK_LAN_PAGE_IPV6_SETTINGS_BUTTON}                                        xpath=//*[@id="root"]/div[3]/div/ul/li[2]/button

${NETWORK_LAN_PAGE_IPV6_CONFIG_TYPE_SELECT_TITLE}                               xpath=//*[@id="root"]/div[3]/div/div[2]/div/div/div[1]/div/div/div
${NETWORK_LAN_PAGE_IPV6_CONFIG_TYPE_SELECT_DROPDOWN}                            xpath=//*[@id="root"]/div[3]/div/div[2]/div/div/div[1]/div/div/div/ul
${NETWORK_LAN_PAGE_IPV6_CONFIG_TYPE_SELECT}                                     xpath=//*[@id="root"]/div[3]/div/div[2]/div/div/div[1]/div/div/div/div/input
${NETWORK_LAN_PAGE_IPV6_CONFIG_TYPE_SELECT_OPTION_DISABLED}                     xpath=//*[@id="root"]/div[3]/div/div[2]/div/div/div[1]/div/div/div/ul/li[1]/div
${NETWORK_LAN_PAGE_IPV6_CONFIG_TYPE_SELECT_OPTION_MANUAL}                       xpath=//*[@id="root"]/div[3]/div/div[2]/div/div/div[1]/div/div/div/ul/li[2]/div
${NETWORK_LAN_PAGE_IPV6_CONFIG_TYPE_SELECT_OPTION_AUTOMATIC}                    xpath=//*[@id="root"]/div[3]/div/div[2]/div/div/div[1]/div/div/div/ul/li[3]/div
${NETWORK_LAN_PAGE_IPV6_CONFIG_TYPE_SELECT_OPTION_LINK_LOCAL}                   xpath=//*[@id="root"]/div[3]/div/div[2]/div/div/div[1]/div/div/div/ul/li[4]/div

${NETWORK_LAN_PAGE_IPV6_LINK_LOCAL_TITLE}                                       xpath=//*[@id="root"]/div[3]/div/div[2]/div/div/div[1]
${NETWORK_LAN_PAGE_IPV6_LINK_LOCAL_INPUT}                                       xpath=//*[@id="root"]/div[3]/div/div[2]/div/div/div[1]/input

${NETWORK_LAN_PAGE_IPV6_IP_ADDRESS_TITLE}                                       xpath=//*[@id="root"]/div[3]/div/div[2]/div/div/div[4]
${NETWORK_LAN_PAGE_IPV6_IP_ADDRESS_INPUT}                                       xpath=//*[@id="root"]/div[3]/div/div[2]/div/div/div[4]/input[1]

${NETWORK_LAN_PAGE_IPV6_PREFIX_SIZE_TITLE}                                      xpath=//*[@id="root"]/div[3]/div/div[2]/div/div/div[4]
${NETWORK_LAN_PAGE_IPV6_PREFIX_SIZE_INPUT}                                      xpath=//*[@id="root"]/div[3]/div/div[2]/div/div/div[4]/input[2]

${NETWORK_LAN_PAGE_IPV6_DEFAULT_GATEWAY_TITLE}                                  xpath=//*[@id="root"]/div[3]/div/div[2]/div/div/div[5]
${NETWORK_LAN_PAGE_IPV6_DEFAULT_GATEWAY_INPUT}                                  xpath=//*[@id="root"]/div[3]/div/div[2]/div/div/div[5]/input


*** Keywords ***
Access LAN network settings page
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

    ${lan_option_is_visible}    Run keyword and return status
    ...    Get element states
    ...    ${SIDEMENU_NETWORK_LAN}
    ...    contains
    ...    visible

    IF    not ${lan_option_is_visible}
        Click    ${SIDEMENU_NETWORK_SUBMENU}
        Wait for elements state
        ...    ${SIDEMENU_NETWORK_LAN}
        ...    visible
        ...    5s
        ...    LAN network submenu option was not visible (5 seconds timeout).
    END

    Click    ${SIDEMENU_NETWORK_LAN}
    Sleep    1s
    Wait until network is idle    30s
    Wait for elements state
    ...    ${NETWORK_LAN_PAGE_SAVE_SETTINGS_BUTTON}
    ...    visible
    ...    30s

Page inner title LAN page should be "${text}"
    Get text    ${NETWORK_LAN_PAGE_INNER_TITLE}    ==    ${text}

Page inner subtitle LAN page should be "${text}"
    ${str}    Get text    ${NETWORK_LAN_PAGE_INNER_SUBTITLE}
    ${str_stripped}    Strip string    ${str}
    Should be equal as strings    ${str_stripped}    ${text}

Save settings button text should be "${text}"
    Get text    ${NETWORK_LAN_PAGE_SAVE_SETTINGS_BUTTON}    ==    ${text}

#########################
#    IPv4 - Keywords    #
#########################

IPv4 settings button text should be "${text}"
    Get text    ${NETWORK_LAN_PAGE_IPV4_SETTINGS_BUTTON}    ==    ${text}

Automatic IPv4 address toggle title should be "${text}"
    Get text    ${NETWORK_LAN_PAGE_IPV4_AUTOMATIC_IP_ADDRESS_TOGGLE_TITLE}    ==    ${text}

Automatic IPv4 address toggle switch should be on
    Get checkbox state    ${NETWORK_LAN_PAGE_IPV4_AUTOMATIC_IP_ADDRESS_TOGGLE}    ==    checked
    ...    Automatic IPv4 address (DHCP client) should be enabled.

Open automatic IPv4 address info
    Click    ${NETWORK_LAN_PAGE_IPV4_AUTOMATIC_IP_ADDRESS_TOGGLE_INFO_ICON}

Close automatic IPv4 address info
    Click    ${NETWORK_LAN_PAGE_IPV4_AUTOMATIC_IP_ADDRESS_TOGGLE_INFO_MODAL_CLOSE_BUTTON}

Automatic IPv4 address info modal text should be "${text}"
    Get text    ${NETWORK_LAN_PAGE_IPV4_AUTOMATIC_IP_ADDRESS_TOGGLE_INFO_MODAL_TEXT}    ==    ${text}

Static IPv4 address input title should be "${text}"
    ${str}    Get Text    xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]
    @{str_list}    Split string    ${str}    \n
    Should be equal as strings    ${str_list}[0]    ${text}

Static IPv4 address input should be enabled
    Get element states
    ...    ${NETWORK_LAN_PAGE_IPV4_STATIC_IP_ADDRESS_INPUT}
    ...    contains
    ...    enabled
    ...    message=Static IPv4 address input should be enabled (editable).

Static IPv4 address should be "${text}"
    Get text    ${NETWORK_LAN_PAGE_IPV4_STATIC_IP_ADDRESS_INPUT}    ==    ${text}

Subnet mask input title should be "${text}"
    ${str}    Get Text    xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]
    @{str_list}    Split string    ${str}    \n
    Should be equal as strings    ${str_list}[1]    ${text}

Subnet mask input should be enabled
    Get element states
    ...    ${NETWORK_LAN_PAGE_IPV4_SUBNET_MASK_INPUT}
    ...    contains
    ...    enabled
    ...    message=Subnet mask input should be enabled (editable).

Subnet mask should be "${text}"
    Get text    ${NETWORK_LAN_PAGE_IPV4_SUBNET_MASK_INPUT}    ==    ${text}

Default gateway input title should be "${text}"
    ${str}    Get Text    xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]
    @{str_list}    Split string    ${str}    \n
    Should be equal as strings    ${str_list}[2]    ${text}

Default gateway input should be enabled
    Get element states
    ...    ${NETWORK_LAN_PAGE_IPV4_DEFAULT_GATEWAY_INPUT}
    ...    contains
    ...    enabled
    ...    message=Default gateway input should be enabled (editable).

Default gateway should be "${text}"
    Get text    ${NETWORK_LAN_PAGE_IPV4_DEFAULT_GATEWAY_INPUT}    ==    ${text}

#########################
#    IPv6 - Keywords    #
#########################

IPv6 settings button text should be "${text}"
    Get text    ${NETWORK_LAN_PAGE_IPV6_SETTINGS_BUTTON}    ==    ${text}

Open IPv6 settings
    Click    ${NETWORK_LAN_PAGE_IPV6_SETTINGS_BUTTON}

IPv6 link-local input should be visible
    Get element states
    ...    ${NETWORK_LAN_PAGE_IPV6_LINK_LOCAL_INPUT}
    ...    contains
    ...    visible
    ...    message=Link-local input should be visible.

IPv6 link-local input should be disabled
    Get element states
    ...    ${NETWORK_LAN_PAGE_IPV6_LINK_LOCAL_INPUT}
    ...    contains
    ...    disabled
    ...    message=Link-local input should be disabled (not editable).

IPv6 link-local should be "${text}"
    Get text    ${NETWORK_LAN_PAGE_IPV6_LINK_LOCAL_INPUT}    ==    ${text}

IPv6 configuration type select title should be "${text}"
    Get text    ${NETWORK_LAN_PAGE_IPV6_CONFIG_TYPE_SELECT_TITLE}    ==    ${text}

IPv6 configuration type select option should be "${text}"
    Get text    ${NETWORK_LAN_PAGE_IPV6_CONFIG_TYPE_SELECT}    ==    ${text}

Open IPv6 configuration type selection dropdown menu
    ${elem_states}    Get element states    ${NETWORK_LAN_PAGE_IPV6_CONFIG_TYPE_SELECT_DROPDOWN}
    IF    "hidden" in ${elem_states}
        Click    ${NETWORK_LAN_PAGE_IPV6_CONFIG_TYPE_SELECT}
    END

Select IPv6 configuration type "${option}"
    ${language_map}    Create Dictionary
    ...    pt-BR=Tipo de Configuração
    ...    en=Configuration type
    ...    es=Tipo de configuración

    ${dut_language}    Local storage get item    lang

    ${select_div}    Get element by    text    ${language_map}[${dut_language}]
    ${select_div_input}    Get element    ${select_div} >> div >> input

    Click    ${select_div_input}
    Wait for elements state    ${select_div} >> ul    visible

    ${elements}    Get elements    ${select_div} >> ul >> li

    FOR    ${element}    IN    @{elements}
        ${element_text}    Get text    ${element} >> div
        ${normalized_element_text}    Set variable    ${element_text.lower().strip()}
        ${normalized_option}    Set variable    ${option.lower().strip()}
        IF    "${normalized_element_text}" == "${normalized_option}"
            Click    ${element}
            BREAK
        END
    END

There should be "${number}" LAN IPv6 configuration types available
    Open IPv6 configuration type selection dropdown menu

    ${language_map}    Create Dictionary
    ...    pt-BR=Tipo de Configuração
    ...    en=Configuration Type
    ...    es=Tipo de Configuración
    ${dut_language}    Local Storage Get Item    lang
    Log To Console    ${dut_language}

    ${select_div}    Get element by    text    ${language_map}[${dut_language}]
    ${select_div_input}    Get element    ${select_div} >> div >> input

    Click    ${select_div_input}
    Wait for elements state    ${select_div} >> ul    visible

    ${elements}    Get elements    ${select_div} >> ul >> li

    ${actual_count}    Get length    ${elements}

    Should be equal as integers
    ...    ${actual_count}
    ...    ${number}
    ...    msg=There should be ${number} Network lan ipv6 config types available, but there were ${actual_count}.
    ...    values=${false}

IPv6 configuration type "${text}" should be available
    Select IPv6 configuration type "${text}"

Link Local bridge IPv6 input title should be "${text}"
    Get text    ${NETWORK_LAN_PAGE_IPV6_LINK_LOCAL_TITLE}    ==    ${text}

Link Local bridge IPv6 input should be ${text}
    Get element states
    ...    ${NETWORK_LAN_PAGE_IPV6_LINK_LOCAL_INPUT}
    ...    contains
    ...    disabled
    ...    message=Link Local router input should be disabled (not editable).

Link Local router IPv6 input title should be "${text}"
    Get text    ${NETWORK_LAN_PAGE_IPV6_LINK_LOCAL_TITLE}    ==    ${text}

Link Local router IPv6 input should be ${text}
    Get element states
    ...    ${NETWORK_LAN_PAGE_IPV6_LINK_LOCAL_INPUT}
    ...    contains
    ...    disabled
    ...    message=Link Local router input should be disabled (not editable).

IP address bridge IPv6 input title should be "${text}"
    ${str}    Get Text    ${NETWORK_LAN_PAGE_IPV6_IP_ADDRESS_TITLE}
    @{str_list}    Split string    ${str}    \n
    Should be equal as strings    ${str_list}[0]    ${text}

IP address bridge IPv6 input should be "${text}"
    Get text    ${NETWORK_LAN_PAGE_IPV6_IP_ADDRESS_INPUT}    ==    ${text}

IP address bridge IPv6 input should be enabled
    Wait for elements state
    ...    ${NETWORK_LAN_PAGE_IPV6_IP_ADDRESS_INPUT}
    ...    visible
    ...    10s
    ...    IP address input was visible (10 seconds timeout).

    Get element states
    ...    ${NETWORK_LAN_PAGE_IPV6_IP_ADDRESS_INPUT}
    ...    contains
    ...    enabled
    ...    message=IP address input should be enabled (editable).

IP address router IPv6 input title should be "${text}"
    ${str}    Get Text    ${NETWORK_LAN_PAGE_IPV6_IP_ADDRESS_TITLE}
    @{str_list}    Split string    ${str}    \n
    Should be equal as strings    ${str_list}[0]    ${text}

IP address router IPv6 input should be "${text}"
    Get text    ${NETWORK_LAN_PAGE_IPV6_IP_ADDRESS_INPUT}    ==    ${text}

IP address router IPv6 input should be enabled
    Wait for elements state
    ...    ${NETWORK_LAN_PAGE_IPV6_IP_ADDRESS_INPUT}
    ...    visible
    ...    10s
    ...    IP address input was visible (10 seconds timeout).

    Get element states
    ...    ${NETWORK_LAN_PAGE_IPV6_IP_ADDRESS_INPUT}
    ...    contains
    ...    enabled
    ...    message=IP address input should be enabled (editable).

Prefix Size bridge IPv6 input title should be "${text}"
    ${str}    Get Text    ${NETWORK_LAN_PAGE_IPV6_PREFIX_SIZE_TITLE}
    @{str_list}    Split string    ${str}    \n
    Should be equal as strings    ${str_list}[1]    ${text}

Prefix Size bridge IPv6 input should be "${text}"
    Get text    ${NETWORK_LAN_PAGE_IPV6_IP_ADDRESS_INPUT}    ==    ${text}

Prefix Size bridge IPv6 input should be enabled
    Wait for elements state
    ...    ${NETWORK_LAN_PAGE_IPV6_PREFIX_SIZE_INPUT}
    ...    visible
    ...    10s
    ...    Prefix Size input was visible (10 seconds timeout).

    Get element states
    ...    ${NETWORK_LAN_PAGE_IPV6_PREFIX_SIZE_INPUT}
    ...    contains
    ...    enabled
    ...    message=Prefix Size input should be enabled (editable).

Prefix Size router IPv6 input title should be "${text}"
    ${str}    Get Text    ${NETWORK_LAN_PAGE_IPV6_PREFIX_SIZE_TITLE}
    @{str_list}    Split string    ${str}    \n
    Should be equal as strings    ${str_list}[1]    ${text}

Prefix Size router IPv6 input should be "${text}"
    Get text    ${NETWORK_LAN_PAGE_IPV6_IP_ADDRESS_INPUT}    ==    ${text}

Prefix Size router IPv6 input should be enabled
    Wait for elements state
    ...    ${NETWORK_LAN_PAGE_IPV6_PREFIX_SIZE_INPUT}
    ...    visible
    ...    10s
    ...    Prefix Size input was visible (10 seconds timeout).

    Get element states
    ...    ${NETWORK_LAN_PAGE_IPV6_PREFIX_SIZE_INPUT}
    ...    contains
    ...    enabled
    ...    message=Prefix Size input should be enabled (editable).

Default Gateway bridge IPv6 input title should be "${text}"
    Get text    ${NETWORK_LAN_PAGE_IPV6_DEFAULT_GATEWAY_TITLE}    ==    ${text}

Default Gateway bridge IPv6 input should be "${text}"
    Get text    ${NETWORK_LAN_PAGE_IPV6_IP_ADDRESS_INPUT}    ==    ${text}

Default Gateway bridge IPv6 input should be enabled
    Wait for elements state
    ...    ${NETWORK_LAN_PAGE_IPV6_DEFAULT_GATEWAY_INPUT}
    ...    visible
    ...    10s
    ...    Default Gateway input was visible (10 seconds timeout).

    Get element states
    ...    ${NETWORK_LAN_PAGE_IPV6_DEFAULT_GATEWAY_INPUT}
    ...    contains
    ...    enabled
    ...    message=Default Gateway input should be enabled (editable).

Default Gateway bridge IPv6 input should not be visible
    Get element states
    ...    ${NETWORK_LAN_PAGE_IPV6_DEFAULT_GATEWAY_INPUT}
    ...    not contains
    ...    disabled

Default Gateway router IPv6 input title should be "${text}"
    Get text    ${NETWORK_LAN_PAGE_IPV6_DEFAULT_GATEWAY_TITLE}    ==    ${text}

Default Gateway router IPv6 input should be "${text}"
    Get text    ${NETWORK_LAN_PAGE_IPV6_IP_ADDRESS_INPUT}    ==    ${text}

Default Gateway router IPv6 input should be enabled
    Wait for elements state
    ...    ${NETWORK_LAN_PAGE_IPV6_DEFAULT_GATEWAY_INPUT}
    ...    visible
    ...    10s
    ...    Default Gateway input was visible (10 seconds timeout).

    Get element states
    ...    ${NETWORK_LAN_PAGE_IPV6_DEFAULT_GATEWAY_INPUT}
    ...    contains
    ...    enabled
    ...    message=Default Gateway input should be enabled (editable).

Default Gateway router IPv6 input should not be visible
    Get element states
    ...    ${NETWORK_LAN_PAGE_IPV6_DEFAULT_GATEWAY_INPUT}
    ...    not contains
    ...    visible
