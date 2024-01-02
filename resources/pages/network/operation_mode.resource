*** Settings ***
Library     Browser
Library     String
Resource    ../../common.resource


*** Variables ***
${SIDEMENU_TOGGLE}                                       xpath=//*[@id="sidebar_menu"]/div[1]/div[1]
${SIDEMENU_NETWORK_SUBMENU}                              xpath=//*[@id="sidebar-options-menu"]/div[2]/div
${SIDEMENU_NETWORK_OPERATION_MODE}                       xpath=//*[@id="sidebar-options-menu"]/div[2]/ul/div[1]/p

###

${OPERATION_MODE_PAGE_INNER_TITLE}                       xpath=//*[@id="root"]/div[3]/div/div[1]/div[1]
${OPERATION_MODE_PAGE_INNER_SUBTITLE}                    xpath=//*[@id="root"]/div[3]/div/div[1]/div[2]

${OPERATION_MODE_PAGE_EQUIPMENT_NAME_INPUT_TITLE}        xpath=//*[@id="root"]/div[3]/div/div[2]
${OPERATION_MODE_PAGE_EQUIPMENT_NAME_INPUT}              xpath=//*[@id="root"]/div[3]/div/div[2]/div/input

${OPERATION_MODE_PAGE_SELECT_NETWORK_TITLE}              xpath=//*[@id="root"]/div[3]/div/div[2]/div/div/div[1]
${OPERATION_MODE_PAGE_SELECT_NETWORK_DROPDOWN}           xpath=//*[@id="root"]/div[3]/div/div[2]/div/div/div[1]/div/div/ul
${OPERATION_MODE_PAGE_SELECT}                            xpath=//*[@id="root"]/div[3]/div/div[2]/div/div/div[1]/div/div/div/input
${OPERATION_MODE_PAGE_SELECT_NETWORK_BRIDGE}             xpath=//*[@id="root"]/div[3]/div/div[2]/div/div/div[1]/div/div/ul/li[1]/div
${OPERATION_MODE_PAGE_SELECT_NETWORK_ROUTER}             xpath=//*[@id="root"]/div[3]/div/div[2]/div/div/div[1]/div/div/ul/li[2]/div

${OPERATION_MODE_PAGE_ENABLE_NAT_TOGGLE}                 xpath=//*[@id="root"]/div[3]/div/div[2]/div/div[2]/label/input
${OPERATION_MODE_PAGE_ENABLE_NAT_TOGGLE_CLICKABLE}       xpath=//*[@id="root"]/div[3]/div/div[2]/div/div[2]/label/div
${OPERATION_MODE_PAGE_ENABLE_NAT_TOGGLE_TEXT}            xpath=//*[@id="root"]/div[3]/div/div[2]/div/div[2]/div

${OPERATION_MODE_PAGE_SAVE_BUTTON}                       xpath=//*[@id="root"]/div[3]/div/div[2]/div/div[1]/div[2]/button
${OPERATION_MODE_PAGE_CONFIRM_BUTTON}                    xpath=//*[@id="overlay-cntse"]/div/div/div[3]/div/button[2]


*** Keywords ***
Access Operation Mode network settings page
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
    ...    ${SIDEMENU_NETWORK_OPERATION_MODE}
    ...    contains
    ...    visible

    IF    not ${ntp_option_is_visible}
        Click    ${SIDEMENU_NETWORK_SUBMENU}
        Wait for elements state
        ...    ${SIDEMENU_NETWORK_OPERATION_MODE}
        ...    visible
        ...    5s
        ...    Operation Mode network submenu option was not visible (5 seconds timeout).
    END

    Click    ${SIDEMENU_NETWORK_OPERATION_MODE}
    
Page inner title should be "${text}"
    Get text    ${OPERATION_MODE_PAGE_INNER_TITLE}    ==    ${text}

Page inner subtitle should be "${text}"
    ${str}    Get text    ${OPERATION_MODE_PAGE_INNER_SUBTITLE}
    ${str_stripped}    Strip string    ${str}
    Should be equal as strings    ${str_stripped}    ${text}

Equipment name input title should be "${text}"
    Get text    ${OPERATION_MODE_PAGE_EQUIPMENT_NAME_INPUT_TITLE}    ==    ${text}

Equipment name should be "${text}"
    Get text    ${OPERATION_MODE_PAGE_EQUIPMENT_NAME_INPUT}    ==    ${text}

Equipment name input should be enabled
    Wait for elements state
    ...    ${OPERATION_MODE_PAGE_EQUIPMENT_NAME_INPUT}
    ...    visible
    ...    10s
    ...    Equipment name input was visible (10 seconds timeout).
    Get element states
    ...    ${OPERATION_MODE_PAGE_EQUIPMENT_NAME_INPUT}
    ...    contains
    ...    enabled
    ...    message=Equipment name input should be enabled (editable).

Network operation select title should be "${text}"
    Get text    ${OPERATION_MODE_PAGE_SELECT_NETWORK_TITLE}    ==    ${text}

Network operation select option should be "${text}"
    Get text    ${OPERATION_MODE_PAGE_SELECT}    ==    ${text}

Open network operation selection dropdown menu
    ${elem_states}    Get element states    ${OPERATION_MODE_PAGE_SELECT_NETWORK_DROPDOWN}
    IF    "hidden" in ${elem_states}    Click    ${OPERATION_MODE_PAGE_SELECT}

There should be "${number}" network operation available
    Open network operation selection dropdown menu

    ${timezones_elem_list}    Get elements    ${OPERATION_MODE_PAGE_SELECT_NETWORK_DROPDOWN}/li
    ${list_length}    Get length    ${timezones_elem_list}

    Should be equal as integers
    ...    ${list_length}
    ...    ${number}
    ...    msg=There should be ${number} network operation available, but there was ${list_length}.
    ...    values=${false}

Network Operation "${text}" should be available
    Open network operation selection dropdown menu

    ${timezones_elem_list}    Get elements    ${OPERATION_MODE_PAGE_SELECT_NETWORK_DROPDOWN}/li
    FOR    ${timezone_elem}    IN    @{timezones_elem_list}
        ${timezone_text}    Get text    ${timezone_elem}
        IF    "${timezone_text}" == "${text}"
            Click    ${timezone_elem}
            Get element states
            ...    ${OPERATION_MODE_PAGE_SELECT_NETWORK_DROPDOWN}
            ...    not contains
            ...    visible
            ...    message=Network operation did not automatically close upon selection.
            RETURN
        END
    END
    Fail    Network Operation ${text} is not available.

Operation NAT toggle switch text should be "${text}"
    Get text    ${OPERATION_MODE_PAGE_ENABLE_NAT_TOGGLE_TEXT}    ==    ${text}

Operation NAT toggle switch should be on
    Get checkbox state    ${OPERATION_MODE_PAGE_ENABLE_NAT_TOGGLE}    ==    checked
    ...    Operation NAT should be enabled.

Save settings button text should be "${text}"
    Get text    ${OPERATION_MODE_PAGE_SAVE_BUTTON}    ==    ${text}

Select bridge operating mode
    ${elem_states}    Get element states    ${OPERATION_MODE_PAGE_SELECT_NETWORK_DROPDOWN}
    IF    "hidden" in ${elem_states}
        Click    ${OPERATION_MODE_PAGE_SELECT}
        Click    ${OPERATION_MODE_PAGE_SELECT_NETWORK_BRIDGE}
        Click    ${OPERATION_MODE_PAGE_SAVE_BUTTON}  
        Click    ${OPERATION_MODE_PAGE_CONFIRM_BUTTON}
    Wait for elements state
    ...    ${OPERATION_MODE_PAGE_SELECT}
    ...    visible
    ...    10s
    ...    Operation Mode Select was visible (10 seconds timeout).
    END

Select router operating mode
    ${elem_states}    Get element states    ${OPERATION_MODE_PAGE_SELECT_NETWORK_DROPDOWN}
    IF    "hidden" in ${elem_states}
        Click    ${OPERATION_MODE_PAGE_SELECT}
        Click    ${OPERATION_MODE_PAGE_SELECT_NETWORK_ROUTER}
        Click    ${OPERATION_MODE_PAGE_SAVE_BUTTON}  
        Click    ${OPERATION_MODE_PAGE_CONFIRM_BUTTON}
    Wait for elements state
    ...    ${OPERATION_MODE_PAGE_SELECT}
    ...    visible
    ...    10s
    ...    Operation Mode Select was visible (10 seconds timeout).
    END
