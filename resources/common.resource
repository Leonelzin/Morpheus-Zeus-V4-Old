*** Settings ***
Library     Browser
Library     ../libraries/ImageCompareLibrary.py
Resource    fiber.resource


*** Variables ***
# BROWSER
${GLOBAL_DEBUG_BROWSER}                 ${false}

# DUT
${DUT_MGMT_IPV4_ADDRESS}                192.168.10.101
${DUT_MGMT_HTTP_PORT}                   80
${DUT_MGMT_HTTP_PROTOCOL}               http
${DUT_MGMT_URL}                         ${DUT_MGMT_HTTP_PROTOCOL}://${DUT_MGMT_IPV4_ADDRESS}:${DUT_MGMT_HTTP_PORT}
${DUT_MGMT_USER}                        admin
${DUT_MGMT_PASSWORD}                    M0rpheus01!
${DUT_MGMT_FIRST_ACCESS_PASSWORD}       kH9N$UwP
${DUT_LOGIN_WEBPAGE_URL}                ${DUT_MGMT_URL}/login

# SIDEBAR MENU
${SIDEMENU}                             id=sidebar_menu
${SIDEMENU_DASHBOARD}                   xpath=//*[@id="sidebar-options-menu"]/div[1]/div


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
