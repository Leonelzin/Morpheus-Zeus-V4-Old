*** Settings ***
Library     Browser
Library     String
Resource    ../../common.resource


*** Variables ***
${SIDEMENU_TOGGLE}                                      xpath=//*[@id="sidebar_menu"]/div[1]/div[1]
${SIDEMENU_NETWORK_SUBMENU}                             xpath=//*[@id="sidebar-options-menu"]/div[2]/div
${SIDEMENU_NETWORK_OPMODE}                              xpath=//*[@id="sidebar-options-menu"]/div[2]/ul/div[1]/p

###

${NETWORK_OPMODE_PAGE_INNER_TITLE}                      xpath=//*[@id="root"]/div[3]/div/div[1]/div[1]
${NETWORK_OPMODE_PAGE_INNER_SUBTITLE}                   xpath=//*[@id="root"]/div[3]/div/div[1]/div[2]

# ${NETWORK_OPMODE_PAGE_EQUIPMENT_NAME_INPUT_TITLE}    xpath=//*[@id="root"]/div[3]/div/div[2]
${NETWORK_OPMODE_PAGE_EQUIPMENT_NAME_INPUT}             xpath=//*[@id="root"]/div[3]/div/div[2]/div/input

${NETWORK_OPMODE_PAGE_OPMODE_SELECT_TITLE}              xpath=//*[@id="root"]/div[3]/div/div[2]/div/div/div[1]
${NETWORK_OPMODE_PAGE_OPMODE_SELECT_DROPDOWN}           xpath=//*[@id="root"]/div[3]/div/div[2]/div/div/div[1]/div/div/ul 
${NETWORK_OPMODE_PAGE_OPMODE_SELECT}                    xpath=//*[@id="root"]/div[3]/div/div[2]/div/div/div[1]/div/div/div/input
${NETWORK_OPMODE_PAGE_OPMODE_SELECT_OPTION_BRIDGE}      xpath=//*[@id="root"]/div[3]/div/div[2]/div/div/div[1]/div/div/ul/li[1]/div
${NETWORK_OPMODE_PAGE_OPMODE_SELECT_OPTION_ROUTER}      xpath=//*[@id="root"]/div[3]/div/div[2]/div/div/div[1]/div/div/ul/li[2]/div

${NETWORK_OPMODE_PAGE_ENABLE_NAT_TOGGLE}                xpath=//*[@id="root"]/div[3]/div/div[2]/div/div[2]/label/input
${NETWORK_OPMODE_PAGE_ENABLE_NAT_TOGGLE_CLICKABLE}      xpath=//*[@id="root"]/div[3]/div/div[2]/div/div[2]/label/div
${NETWORK_OPMODE_PAGE_ENABLE_NAT_TOGGLE_TEXT}           xpath=//*[@id="root"]/div[3]/div/div[2]/div/div[2]/div

${NETWORK_OPMODE_PAGE_SAVE_SETTINGS_BUTTON}             xpath=//*[@id="root"]/div[3]/div/div[2]/div/div/div[2]/button
${NETWORK_OPMODE_PAGE_CONFIRM_SETTINGS_BUTTON}          xpath=//*[@id="overlay-cntse"]/div/div/div[3]/div/button[2]


*** Keywords ***
Access network operation mode settings page
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
    ...    ${SIDEMENU_NETWORK_OPMODE}
    ...    contains
    ...    visible

    IF    not ${ntp_option_is_visible}
        Click    ${SIDEMENU_NETWORK_SUBMENU}
        Wait for elements state
        ...    ${SIDEMENU_NETWORK_OPMODE}
        ...    visible
        ...    5s
        ...    Network operation mode submenu option was not visible (5 seconds timeout).
    END

    Click    ${SIDEMENU_NETWORK_OPMODE}

    Wait for elements state
    ...    ${NETWORK_OPMODE_PAGE_SAVE_SETTINGS_BUTTON}
    ...    visible
    ...    10s
    ...    Network operation mode page save settings button was not visible (10 seconds timeout).

Page inner title should be "${text}"
    Get text    ${NETWORK_OPMODE_PAGE_INNER_TITLE}    ==    ${text}

Page inner subtitle should be "${text}"
    ${str}    Get text    ${NETWORK_OPMODE_PAGE_INNER_SUBTITLE}
    ${str_stripped}    Strip string    ${str}
    Should be equal as strings    ${str_stripped}    ${text}

Equipment name input title should be "${text}"
    ${str}    Get Text    xpath=/html/body/div/div[3]/div/div[2]/div
    @{str_list}    Split String    ${str}    \n
    Should be equal as strings    ${str_list}[0]    ${text}

Equipment name should be "${text}"
    Get text    ${NETWORK_OPMODE_PAGE_EQUIPMENT_NAME_INPUT}    ==    ${text}

Equipment name input should be enabled
    Wait for elements state
    ...    ${NETWORK_OPMODE_PAGE_EQUIPMENT_NAME_INPUT}
    ...    visible
    ...    10s
    ...    Equipment name input was visible (10 seconds timeout).

    Get element states
    ...    ${NETWORK_OPMODE_PAGE_EQUIPMENT_NAME_INPUT}
    ...    contains
    ...    enabled
    ...    message=Equipment name input should be enabled (editable).

Network operation mode select title should be "${text}"
    Get text    ${NETWORK_OPMODE_PAGE_OPMODE_SELECT_TITLE}    ==    ${text}

Network operation mode select option should be "${text}"
    Get text    ${NETWORK_OPMODE_PAGE_OPMODE_SELECT}    ==    ${text}

Open network operation selection dropdown menu
    ${elem_states}    Get element states    ${NETWORK_OPMODE_PAGE_OPMODE_SELECT_DROPDOWN}
    IF    "hidden" in ${elem_states}
        Click    ${NETWORK_OPMODE_PAGE_OPMODE_SELECT}
    END

NAT enable toggle should be visible
    Get element states
    ...    ${NETWORK_OPMODE_PAGE_ENABLE_NAT_TOGGLE_CLICKABLE}
    ...    contains
    ...    visible

    Get element states
    ...    ${NETWORK_OPMODE_PAGE_ENABLE_NAT_TOGGLE_TEXT}
    ...    contains
    ...    visible

NAT enable toggle should not be visible
    Get element states
    ...    ${NETWORK_OPMODE_PAGE_ENABLE_NAT_TOGGLE_CLICKABLE}
    ...    not contains
    ...    visible

    Get element states
    ...    ${NETWORK_OPMODE_PAGE_ENABLE_NAT_TOGGLE_TEXT}
    ...    not contains
    ...    visible

    Get element states
    ...    ${NETWORK_OPMODE_PAGE_ENABLE_NAT_TOGGLE}
    ...    not contains
    ...    visible

NAT enable toggle switch text should be "${text}"
    Get text    ${NETWORK_OPMODE_PAGE_ENABLE_NAT_TOGGLE_TEXT}    ==    ${text}

NAT enable toggle switch should be on
    Get checkbox state    ${NETWORK_OPMODE_PAGE_ENABLE_NAT_TOGGLE}    ==    checked
    ...    Operation NAT should be enabled.

Save settings button text should be "${text}"
    Get text    ${NETWORK_OPMODE_PAGE_SAVE_SETTINGS_BUTTON}    ==    ${text}

Select network operation mode "${text}"
    Open network operation selection dropdown menu

    ${opmodes_elem_list}    Get elements    ${NETWORK_OPMODE_PAGE_OPMODE_SELECT_DROPDOWN}/li
    FOR    ${opmode_elem}    IN    @{opmodes_elem_list}
        ${opmode_text}    Get text    ${opmode_elem}
        IF    "${opmode_text}" == "${text}"
            Click    ${opmode_elem}
            Get element states
            ...    ${NETWORK_OPMODE_PAGE_OPMODE_SELECT_DROPDOWN}
            ...    not contains
            ...    visible
            ...    message=Network operation mode dropdown did not automatically close upon selection.
            RETURN
        END
    END
    Fail    Network operation mode ${text} is not available.

There should be "${number}" network operation modes available
    Open network operation selection dropdown menu

    ${timezones_elem_list}    Get elements    ${NETWORK_OPMODE_PAGE_OPMODE_SELECT_DROPDOWN}/li
    ${list_length}    Get length    ${timezones_elem_list}

    Should be equal as integers
    ...    ${list_length}
    ...    ${number}
    ...    msg=There should be ${number} network operation modes available, but there was ${list_length}.
    ...    values=${false}

Network operation mode "${text}" should be available
    Select network operation mode "${text}"
