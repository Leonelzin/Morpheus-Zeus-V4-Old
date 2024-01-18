*** Settings ***
Library     Browser
Library     String
Resource    ../../common.resource


*** Variables ***
${SIDEMENU_TOGGLE}                                                      xpath=//*[@id="sidebar_menu"]/div[1]/div[1]
${SIDEMENU_NETWORK_SUBMENU}                                             xpath=//*[@id="sidebar-options-menu"]/div[2]/div
${SIDEMENU_NETWORK_DHCP}                                                xpath=//*[@id="sidebar-options-menu"]/div[2]/ul/div[4]/p
${SIDEMENU_NETWORK_LAN}                                                 xpath=//*[@id="sidebar-options-menu"]/div[2]/ul/div[3]/p

###

${NETWORK_DHCP_PAGE_INNER_TITLE}                                        xpath=//*[@id="root"]/div[3]/div/div[1]/div[1]
${NETWORK_DHCP_PAGE_INNER_SUBTITLE}                                     xpath=//*[@id="root"]/div[3]/div/div[1]/div[2]

${NETWORK_DHCP_PAGE_ENABLE_DHCP_TOGGLE}                                 xpath=//*[@id="root"]/div[3]/div/div[3]/div[1]/label/input
${NETWORK_DHCP_PAGE_ENABLE_DHCP_TOGGLE_CLICKABLE}                       xpath=//*[@id="root"]/div[3]/div/div[3]/div[1]/label/span
${NETWORK_DHCP_PAGE_ENABLE_DHCP_TOGGLE_TEXT}                            xpath=//*[@id="root"]/div[3]/div/div[3]/div[1]/div

${NETWORK_DHCP_PAGE_ENABLE_DNS_REBIND_PROTECTION_TOGGLE}                xpath=//*[@id="root"]/div[3]/div/div[3]/div[2]/label/input
${NETWORK_DHCP_PAGE_ENABLE_DNS_REBIND_PROTECTION_TOGGLE_CLICKABLE}      xpath=//*[@id="root"]/div[3]/div/div[3]/div[2]/label/span
${NETWORK_DHCP_PAGE_ENABLE_DNS_REBIND_PROTECTION_TOGGLE_TEXT}           xpath=//*[@id="root"]/div[3]/div/div[3]/div[2]/div

${NETWORK_DHCP_PAGE_SAVE_SETTINGS_BUTTON}                               xpath=//*[@id="root"]/div[3]/div/div[2]/div/div/div[2]/button


*** Keywords ***
Access network DHCP settings page
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

    ${dhcp_option_is_visible}    Run keyword and return status
    ...    Get element states
    ...    ${SIDEMENU_NETWORK_DHCP}
    ...    contains
    ...    visible

    IF    not ${dhcp_option_is_visible}
        Click    ${SIDEMENU_NETWORK_SUBMENU}
        Wait for elements state
        ...    ${SIDEMENU_NETWORK_DHCP}
        ...    visible
        ...    5s
        ...    Network DHCP submenu option was not visible (5 seconds timeout).
    END

    Click    ${SIDEMENU_NETWORK_DHCP}

    Wait until network is idle

    # Wait for elements state
    # ...    xpath=//*[@id="overlay-cntse"]/div/div[3]/div/button
    # ...    visible
    # ...    20s
    # ...    Network DHCP page close modal button was not visible (20 seconds timeout).

Access network LAN settings page
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
        ...    Network LAN submenu option was not visible (5 seconds timeout).
    END

    Click    ${SIDEMENU_NETWORK_LAN}

    Wait until network is idle

    Wait for elements state
    ...    xpath=//*[@id="root"]/div[3]/div/div[3]/button
    ...    visible
    ...    15s
    ...    Network LAN page save settings button was not visible (15 seconds timeout).

Check dynamic IPv4 addressing checkbox
    ${checked}    Get checkbox state    xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div/label/input
    IF    ${checked} == ${false}
        Click    xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div/label/div
    END
    Wait for elements state    xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div/label/input    checked

Uncheck dynamic IPv4 addressing checkbox
    ${checked}    Get checkbox state    xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div/label/input
    IF    ${checked} == ${true}
        Click    xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div/label/div
    END
    Wait for elements state    xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div/label/input    unchecked

Page inner title should be "${text}"
    Get text    ${NETWORK_DHCP_PAGE_INNER_TITLE}    ==    ${text}

Page inner subtitle should be "${text}"
    ${str}    Get text    ${NETWORK_DHCP_PAGE_INNER_SUBTITLE}
    ${str_stripped}    Strip string    ${str}
    Should be equal as strings    ${str_stripped}    ${text}

Wait until DHCP server modal is displayed
    Wait for elements state    xpath=//*[@id="overlay-cntse"]/div    visible    20s
    Wait for elements state    xpath=//*[@id="overlay-cntse"]/div/div[2]/div/div    visible    20s
    Wait for elements state    xpath=//*[@id="overlay-cntse"]/div/div[3]/div/button    visible    20s

Close DHCP server modal
    Click    xpath=//*[@id="overlay-cntse"]/div/div[3]/div/button
    Wait for elements state    xpath=//*[@id="overlay-cntse"]/div    hidden
    Wait for elements state    xpath=//*[@id="overlay-cntse"]/div/div[2]/div/div    hidden
    Wait for elements state    xpath=//*[@id="overlay-cntse"]/div/div[3]/div/button    hidden

DHCP enable toggle switch text should be "${text}"
    Get text    ${NETWORK_DHCP_PAGE_ENABLE_DHCP_TOGGLE_TEXT}    ==    ${text}

DHCP enable toggle switch should be on
    Get checkbox state    ${NETWORK_DHCP_PAGE_ENABLE_DHCP_TOGGLE}    ==    checked
    ...    DHCP server should be on.

DHCP enable toggle switch should be off
    Get checkbox state    ${NETWORK_DHCP_PAGE_ENABLE_DHCP_TOGGLE}    ==    unchecked
    ...    DHCP server should be off.

DNS rebind attack protection toggle switch text should be "${text}"
    Get text    ${NETWORK_DHCP_PAGE_ENABLE_DNS_REBIND_PROTECTION_TOGGLE_TEXT}    ==    ${text}

DNS rebind attack protection toggle switch should be on
    Get checkbox state    ${NETWORK_DHCP_PAGE_ENABLE_DNS_REBIND_PROTECTION_TOGGLE}    ==    checked
    ...    DNS rebind attack protection should be on.

DNS rebind attack protection toggle switch should be off
    Get checkbox state    ${NETWORK_DHCP_PAGE_ENABLE_DNS_REBIND_PROTECTION_TOGGLE}    ==    unchecked
    ...    DNS rebind attack protection should be off.

DNS rebind attack protection toggle switch should not be visible
    Get element states
    ...    xpath=//*[@id="root"]/div[3]/div/div[3]/div[2]/label/span
    ...    contains
    ...    hidden
    ...    message=DNS rebind attack protection toggle switch should not be visible.

DHCP pool initial IPv4 address input should not be visible
    Get element states
    ...    xpath=//*[@id="root"]/div[3]/div/div[4]/div[1]/input
    ...    contains
    ...    hidden
    ...    message=DHCP pool initial IPv4 address input should not be visible.

DHCP pool final IPv4 address input should not be visible
    Get element states
    ...    xpath=//*[@id="root"]/div[3]/div/div[4]/div[2]/input
    ...    contains
    ...    hidden
    ...    message=DHCP pool final IPv4 address input should not be visible.

DHCP pool lease time input should not be visible
    Get element states
    ...    xpath=//*[@id="root"]/div[3]/div/div[4]/div[3]/input
    ...    contains
    ...    hidden
    ...    message=DHCP pool lease time input should not be visible.

MAC-IP bind table should not be visible
    Get element states
    ...    xpath=//*[@id="form_row"]
    ...    contains
    ...    hidden
    ...    message=MAC-IP bind table should not be visible.

    Get element states
    ...    xpath=//*[@id="form_row"]/div[1]/span/button
    ...    contains
    ...    hidden
    ...    message=Button to add MAC-IP bind rule should not be visible.

Save settings button text should be "${text}"
    Get text    ${NETWORK_DHCP_PAGE_SAVE_SETTINGS_BUTTON}    ==    ${text}
