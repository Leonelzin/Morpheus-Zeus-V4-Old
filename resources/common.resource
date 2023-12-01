*** Settings ***
Library     Browser
Library     ../libraries/ImageCompareLibrary.py
Resource    fiber.resource
Resource    ../resources/pages/login/login.resource
Resource    ../resources/pages/network/operation_mode.resource

*** Variables ***
# BROWSER
${GLOBAL_DEBUG_BROWSER}                 ${false}

# DUT
${DUT_MGMT_IPV4_ADDRESS}                192.168.0.3
${DUT_MGMT_HTTP_PORT}                   80
${DUT_MGMT_HTTP_PROTOCOL}               http
${DUT_MGMT_URL}                         ${DUT_MGMT_HTTP_PROTOCOL}://${DUT_MGMT_IPV4_ADDRESS}:${DUT_MGMT_HTTP_PORT}
${DUT_MGMT_USER}                        admin
${DUT_MGMT_PASSWORD}                    Lockzeus@1
${DUT_MGMT_FIRST_ACCESS_PASSWORD}       M9w3#EH3

# DUT PAGES
${DUT_LOGIN_WEBPAGE_URL}                ${DUT_MGMT_URL}/login
${DUT_OPERATION_MODE_WEBPAGE_URL}       ${DUT_MGMT_URL}/operation_mode
${DUT_WATCHDOG_WEBPAGE_URL}             ${DUT_MGMT_URL}/watchdog
${DUT_NTP_WEBPAGE_URL}                  ${DUT_MGMT_URL}/ntp
${DUT_SNMP_WEBPAGE_URL}                 ${DUT_MGMT_URL}/snmp

# SIDEBAR MENU
${SIDEMENU}                             id=sidebar_menu
${SIDE_MENU_DASHBOARD}                  xpath=//*[@id="sidebar-options-menu"]/div[1]/div

#SIDEBAR NETWORK MENU
${SIDE_MENU_NETWORK}                    xpath=//*[@id="sidebar-options-menu"]/div[2]/div/div/i

#SIDEBAR NETWORK SUBMENU                                     
${SIDE_SUBMENU_OPERATION_MODE}          xpath=//*[@id="sidebar-options-menu"]/div[2]/ul/div[1]

# SIDEBAR SERVICE MENU
${SIDE_MENU_SERVICES}                   xpath=//*[@id="sidebar-options-menu"]/div[5]/div/div/i

# SIDEBAR SERVICE SUBMENU
${SIDE_SUBMENU_WATCHDOG}                xpath=//*[@id="sidebar-options-menu"]/div[5]/ul/div[4]
${SIDE_SUBMENU_NTP}                     xpath=//*[@id="sidebar-options-menu"]/div[5]/ul/div[3]
${SIDE_SUBMENU_SNMP}                    xpath=//*[@id="sidebar-options-menu"]/div[5]/ul/div[4]

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

Login to DUT (Portuguese)
    AND Go to DUT login webpage
    AND Open language selection dropdown menu
    AND Select Portuguese language
    AND Enter username "${DUT_MGMT_USER}"
    AND Enter password "${DUT_MGMT_PASSWORD}"
    AND Click login button
    AND Dashboard webpage should be displayed

Login to DUT (English)
    AND Go to DUT login webpage
    AND Open language selection dropdown menu
    AND Select English language
    AND Enter username "${DUT_MGMT_USER}"
    AND Enter password "${DUT_MGMT_PASSWORD}"
    AND Click login button
    AND Dashboard webpage should be displayed

Login to DUT (Spanish)
    AND Go to DUT login webpage
    AND Open language selection dropdown menu
    AND Select Spanish language
    AND Enter username "${DUT_MGMT_USER}"
    AND Enter password "${DUT_MGMT_PASSWORD}"
    AND Click login button
    AND Dashboard webpage should be displayed
    
###############
#   DUT MODE  #
###############

DUT in bridge mode
    Go to    ${DUT_OPERATION_MODE_WEBPAGE_URL}
    Wait until network is idle
    Select bridge operating mode

DUT in router mode
    Go to    ${DUT_OPERATION_MODE_WEBPAGE_URL}
    Wait until network is idle
    Select router operating mode

###############
#   Watchdog  #
###############

Go to DUT watchdog webpage
    Go to    ${DUT_WATCHDOG_WEBPAGE_URL}

###############
#     NTP     #
###############

Go to DUT ntp webpage
    Go to    ${DUT_NTP_WEBPAGE_URL}
    
###############
#     SNMP    #
###############

Go to DUT snmp webpage
    Go to    ${DUT_SNMP_WEBPAGE_URL}
