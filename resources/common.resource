*** Settings ***
Library     Browser
Library     ../libraries/ImageCompareLibrary.py
Resource    ../resources/pages/login/login.resource


*** Variables ***
# BROWSER
${GLOBAL_DEBUG_BROWSER}                                     ${false}

# DUT
${DUT_MGMT_IPV4_ADDRESS}                                    10.0.0.1
${DUT_MGMT_HTTP_PORT}                                       80
${DUT_MGMT_HTTP_PROTOCOL}                                   http
${DUT_MGMT_URL}                                             ${DUT_MGMT_HTTP_PROTOCOL}://${DUT_MGMT_IPV4_ADDRESS}:${DUT_MGMT_HTTP_PORT}
${DUT_MGMT_USER}                                            admin
${DUT_MGMT_PASSWORD}                                        M0rpheus01!
${DUT_MGMT_FIRST_ACCESS_PASSWORD}                           kH9N$UwP

# HEADER
${HEADER_SETTINGS_ICON}                                     xpath=//*[@id="root"]/div[2]/div[2]/div/div[3]/div[2]/div[2]
${HEADER_SETTINGS_DROPDOWN}                                 xpath=//*[@id="root"]/div[2]/div[2]/div/div[3]/div[3]
${HEADER_SETTINGS_DISCARD_SETTINGS_BUTTON}                  xpath=//*[@id="root"]/div[2]/div[2]/div/div[3]/div[3]/div/a[6]
${HEADER_SETTINGS_DISCARD_SETTINGS_MODAL_CONFIRM_BUTTON}    xpath=//*[@id="overlay-cntse"]/div/div/div[3]/div/button[2]

# DUT PAGES
${DUT_LOGIN_WEBPAGE_URL}                                    ${DUT_MGMT_URL}/login

# SIDEBAR MENU
${SIDEMENU}                                                 id=sidebar_menu
${SIDE_MENU_DASHBOARD}                                      xpath=//*[@id="sidebar-options-menu"]/div[1]/div

# SIDEBAR NETWORK MENU
${SIDE_MENU_NETWORK}                                        xpath=//*[@id="sidebar-options-menu"]/div[2]/div/div/i

# SIDEBAR NETWORK SUBMENU
${SIDE_SUBMENU_OPERATION_MODE}                              xpath=//*[@id="sidebar-options-menu"]/div[2]/ul/div[1]

# SIDEBAR SERVICE MENU
${SIDE_MENU_SERVICES}                                       xpath=//*[@id="sidebar-options-menu"]/div[5]/div/div/i

# SIDEBAR SERVICE SUBMENU
${SIDE_SUBMENU_WATCHDOG}                                    xpath=//*[@id="sidebar-options-menu"]/div[5]/ul/div[4]
${SIDE_SUBMENU_NTP}                                         xpath=//*[@id="sidebar-options-menu"]/div[5]/ul/div[3]
${SIDE_SUBMENU_SNMP}                                        xpath=//*[@id="sidebar-options-menu"]/div[5]/ul/div[4]


*** Keywords ***
#################
#    Browser    #
#################

Setup browser
    [Arguments]    ${url}=${none}
    ${GLOBAL_DEBUG_BROWSER}    Convert to boolean    ${GLOBAL_DEBUG_BROWSER}
    IF    not ${GLOBAL_DEBUG_BROWSER}
        New page    ${url}
    ELSE
        Open browser    ${url}    pause_on_failure=${false}
    END

Clear browser storages
    Localstorage clear
    Sessionstorage clear

################
#    Images    #
################

Take HTML element screenshot and check if it matches reference image
    [Arguments]    ${elem_selector}    ${ref_img_path}
    ${elem_screenshot_img_path}    Take screenshot    elem_screenshot    ${elem_selector}
    Images are similar
    ...    ${elem_screenshot_img_path}
    ...    ${ref_img_path}

Wait until HTML element screenshot matches reference image
    [Arguments]    ${elem_selector}    ${ref_img_path}
    Wait until keyword succeeds
    ...    10s
    ...    0.5s
    ...    Take HTML element screenshot and check if it matches reference image
    ...    ${elem_selector}
    ...    ${ref_img_path}

#################
#    Strings    #
#################

Text should contain
    [Tags]    robot:continue-on-failure
    [Arguments]    ${text}    @{strings}
    FOR    ${string}    IN    @{strings}
        Should contain    ${text}    ${string}
    END

###############
#    Login    #
###############

Go to DUT login webpage
    Go to    ${DUT_LOGIN_WEBPAGE_URL}
    Wait until network is idle

Login to DUT
    [Arguments]    ${language}=portuguese

    Go to DUT login webpage
    Open language selection dropdown menu

    IF    "${language}" == "portuguese"
        Select Portuguese language
    ELSE IF    "${language}" == "english"
        Select English language
    ELSE IF    "${language}" == "spanish"
        Select Spanish language
    END

    Enter username "${DUT_MGMT_USER}"
    Enter password "${DUT_MGMT_PASSWORD}"
    Click login button
    Wait until network is idle
    Wait until keyword succeeds    3x    1s    Side menu is opened

Side menu is opened
    Get element states
    ...    xpath=//*[@id="sidebar-options-menu"]/div[1]/div/div/div/div
    ...    contains
    ...    visible

Save settings
    # get DUT current language from session storage
    ${dut_language}    Localstorage get item    lang

    IF    "${dut_language}" == "pt-BR"
        ${save_settings_button_text}    Set variable    Salvar
        ${save_settings_success_msg}    Set variable    Configurações salvas com sucesso.
    ELSE IF    "${dut_language}" == "en"
        ${save_settings_button_text}    Set variable    Save
        ${save_settings_success_msg}    Set variable    Settings saved successfully.
    ELSE IF    "${dut_language}" == "es"
        ${save_settings_button_text}    Set variable    Guardar
        ${save_settings_success_msg}    Set variable    Configuraciones guardadas exitosamente.
    ELSE
        Fail
        ...    message=It was not possible to save settings. DUT language could not be determined from local storage key 'lang'.
    END

    ${save_settings_button}    Get element by    text    ${save_settings_button_text}    exact=${true}

    ${el_states}    Get element states    ${save_settings_button}
    IF    "disabled" not in ${el_states}
        Log    Save settings button is enabled (settings are going to be discarded).
        Click    ${save_settings_button}
        Wait until message "${save_settings_success_msg}" is displayed
    ELSE
        Log    Save settings button is disabled (no settings to discard).
    END

Discard saved settings
    Click    ${HEADER_SETTINGS_ICON}
    Wait for elements state    ${HEADER_SETTINGS_DROPDOWN}    visible
    Click    ${HEADER_SETTINGS_DISCARD_SETTINGS_BUTTON}
    Wait for elements state    ${HEADER_SETTINGS_DISCARD_SETTINGS_MODAL_CONFIRM_BUTTON}    visible
    Click    ${HEADER_SETTINGS_DISCARD_SETTINGS_MODAL_CONFIRM_BUTTON}
    Sleep    1s
    Wait until network is idle    30s
