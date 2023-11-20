*** Settings ***
Library     Browser
Resource    ../../common.resource


*** Variables ***
${WATCHDOG_PAGE_TITLE}                      xpath=//*[@id="root"]/div[3]/div/div[1]/div[1]
${WATCHDOG_PAGE_SUBTITLE}                   xpath=//*[@id="root"]/div[3]/div/div[1]/div[2]

${WATCHDOG_PAGE_TOGGLE_TEXT}                xpath=//*[@id="root"]/div[3]/div/div[2]/div
${WATCHDOG_PAGE_ENABLE_TOGGLE}              xpath=//*[@id="root"]/div[3]/div/div[2]
${WATCHDOG_PAGE_ENABLE_TOGGLE_CLICKABLE}    xpath=//*[@id="root"]/div[3]/div/div[2]/label/span

${WATCHDOG_PAGE_ADDRESS_1_TEXT}             xpath=//*[@id="root"]/div[3]/div/div[3]/div[1]
${WATCHDOG_PAGE_ADDRESS_1_INPUT}            xpath=//*[@id="root"]/div[3]/div/div[3]/div[1]/input

${WATCHDOG_PAGE_ADDRESS_2_TEXT}             xpath=//*[@id="root"]/div[3]/div/div[3]/div[2]
${WATCHDOG_PAGE_ADDRESS_2_INPUT}            xpath=//*[@id="root"]/div[3]/div/div[3]/div[2]/input

${WATCHDOG_PAGE_CHECK_TIME_TEXT}            xpath=//*[@id="root"]/div[3]/div/div[3]/div[3]
${WATCHDOG_PAGE_CHECK_TIME_INPUT}           xpath=//*[@id="root"]/div[3]/div/div[3]/div[3]/input

${WATCHDOG_PAGE_SAVE_BUTTON_TEXT}           xpath=//*[@id="root"]/div[3]/div/div[4]/button/span
${WATCHDOG_PAGE_SAVE_BUTTON}                xpath=//*[@id="root"]/div[3]/div/div[4]/button

${WATCHDOG_PAGE_SELECT_LANG}                xpath=//*[@id="root"]/div[2]/div[2]/div/div[3]/div[2]/div
${WATCHDOG_PAGE_SELECT_LANG_PT}             xpath=//*[@id="root"]/div[2]/div[2]/div/div[3]/div[3]/label[1]
${WATCHDOG_PAGE_SELECT_LANG_EN}             xpath=//*[@id="root"]/div[2]/div[2]/div/div[3]/div[3]/label[2]
${WATCHDOG_PAGE_SELECT_LANG_ES}             xpath=//*[@id="root"]/div[2]/div[2]/div/div[3]/div[3]/label[3]

${WATCHDOG_PAGE_DELAY_SECONDS}
...                                         5


*** Keywords ***
Access Side Menu Services
    Click    ${SIDEMENU_SERVICES}

Access Side Sub Menu Watchdog
    Click    ${SIDESUB_MENU_WATCHDOG}

Enable Toggle Watchdog
    ${checked}    Get checkbox state    ${WATCHDOG_PAGE_ENABLE_TOGGLE}
    IF    ${checked} == ${false}
        Click    ${WATCHDOG_PAGE_ENABLE_TOGGLE_CLICKABLE}
    END

Disable Toggle Watchdog
    ${checked}    Get checkbox state    ${WATCHDOG_PAGE_ENABLE_TOGGLE}
    IF    ${checked} == ${true}
        Click    ${WATCHDOG_PAGE_ENABLE_TOGGLE_CLICKABLE}
    END

Watchdog toggle should not be enable
    Get checkbox state
    ...    ${WATCHDOG_PAGE_ENABLE_TOGGLE}
    ...    !=    checked

Address 1 input should be disabled
    Get attribute
    ...    ${WATCHDOG_PAGE_ADDRESS_1_INPUT}
    ...    disabled

Address 2 input should be disabled
    Get attribute
    ...    ${WATCHDOG_PAGE_ADDRESS_2_INPUT}
    ...    disabled

Time 'seconds' input should be disabled
    Get attribute
    ...    ${WATCHDOG_PAGE_CHECK_TIME_INPUT}
    ...    disabled

View element state
    Wait for elements state
    ...    ${WATCHDOG_PAGE_SAVE_BUTTON}
    ...    visible

All Watchdogs on-screen smoke tests in English
    [Documentation]
    #These keywords refer to the mapping of elements on the watchdog's screen in English.
    #This general keyword is not suitable for running in a test, it is only useful for use in other test cases.

    Get Text
    ...    ${WATCHDOG_PAGE_TITLE}
    ...    ==
    ...    Watchdog
    Get Text
    ...    ${WATCHDOG_PAGE_SUBTITLE}
    ...    ==
    ...    Timer that triggers a system check in seconds due to supposed error condition.\n

    Get checkbox state
    ...    ${WATCHDOG_PAGE_ENABLE_TOGGLE}
    ...    !=
    ...    checked

    Get Text
    ...    ${WATCHDOG_PAGE_TOGGLE_TEXT}
    ...    ==
    ...    Enable Watchdog

    Get Text
    ...    ${WATCHDOG_PAGE_ADDRESS_1_TEXT}
    ...    ==
    ...    Address 1
    Get Text
    ...    ${WATCHDOG_PAGE_ADDRESS_1_INPUT}
    ...    ==
    ...    192.168.1.1

    Get Text
    ...    ${WATCHDOG_PAGE_ADDRESS_2_TEXT}
    ...    ==
    ...    Address 2

    Get Text
    ...    ${WATCHDOG_PAGE_CHECK_TIME_TEXT}
    ...    ==
    ...    Check time (seconds)
    Get Text
    ...    ${WATCHDOG_PAGE_CHECK_TIME_INPUT}
    ...    ==
    ...    30

    ${checked}    Get checkbox state    ${WATCHDOG_PAGE_ENABLE_TOGGLE}
    IF    ${checked} == ${false}
        Click    ${WATCHDOG_PAGE_ENABLE_TOGGLE_CLICKABLE}
    END

    Clear Text    ${WATCHDOG_PAGE_ADDRESS_1_INPUT}
    Get attribute
    ...    ${WATCHDOG_PAGE_ADDRESS_1_INPUT}
    ...    placeholder
    ...    ==
    ...    Domain or IP address

    Get attribute
    ...    ${WATCHDOG_PAGE_ADDRESS_2_INPUT}
    ...    placeholder
    ...    ==
    ...    Domain or IP address

    Clear Text    ${WATCHDOG_PAGE_CHECK_TIME_INPUT}
    Get attribute
    ...    ${WATCHDOG_PAGE_CHECK_TIME_INPUT}
    ...    placeholder
    ...    ==
    ...    20 to 99999

    Get Text
    ...    ${WATCHDOG_PAGE_SAVE_BUTTON_TEXT}
    ...    ==
    ...    SAVE

All Watchdogs on-screen smoke tests in Spanish
    [Documentation]
    #Estas palabras clave se refieren al mapeo de elementos en la pantalla del watchdog's en spanish.
    #Esta palabra clave general no es adecuada para ejecutarse en una prueba, solo es útil para usarla en otros casos de prueba.

    Get Text
    ...    ${WATCHDOG_PAGE_TITLE}
    ...    ==
    ...    Watchdog
    Get Text
    ...    ${WATCHDOG_PAGE_SUBTITLE}
    ...    ==
    ...    Temporizador que activa una verificación del sistema en segundos debido a una supuesta condición de error.\n

    Get checkbox state
    ...    ${WATCHDOG_PAGE_ENABLE_TOGGLE}
    ...    !=
    ...    checked

    Get Text
    ...    ${WATCHDOG_PAGE_TOGGLE_TEXT}
    ...    ==
    ...    Habilitar Watchdog

    Get Text
    ...    ${WATCHDOG_PAGE_ADDRESS_1_TEXT}
    ...    ==
    ...    Dirección 1
    Get Text
    ...    ${WATCHDOG_PAGE_ADDRESS_1_INPUT}
    ...    ==
    ...    192.168.1.1

    Get Text
    ...    ${WATCHDOG_PAGE_ADDRESS_2_TEXT}
    ...    ==
    ...    Dirección 2

    Get Text
    ...    ${WATCHDOG_PAGE_CHECK_TIME_TEXT}
    ...    ==
    ...    Comprobar el tiempo (segundos)
    Get Text
    ...    ${WATCHDOG_PAGE_CHECK_TIME_INPUT}
    ...    ==
    ...    30

    ${checked}    Get checkbox state    ${WATCHDOG_PAGE_ENABLE_TOGGLE}
    IF    ${checked} == ${false}
        Click    ${WATCHDOG_PAGE_ENABLE_TOGGLE_CLICKABLE}
    END

    Clear Text    ${WATCHDOG_PAGE_ADDRESS_1_INPUT}
    Get attribute
    ...    ${WATCHDOG_PAGE_ADDRESS_1_INPUT}
    ...    placeholder
    ...    ==
    ...    Dominio o dirección IP

    Get attribute
    ...    ${WATCHDOG_PAGE_ADDRESS_2_INPUT}
    ...    placeholder
    ...    ==
    ...    Dominio o dirección IP

    Clear Text    ${WATCHDOG_PAGE_CHECK_TIME_INPUT}
    Get attribute
    ...    ${WATCHDOG_PAGE_CHECK_TIME_INPUT}
    ...    placeholder
    ...    ==
    ...    20 a 99999

    Get Text
    ...    ${WATCHDOG_PAGE_SAVE_BUTTON_TEXT}
    ...    ==
    ...    AHORRAR

Select Portuguese language on the watchdog screen
    Click
    ...    ${WATCHDOG_PAGE_SELECT_LANG}
    Click
    ...    ${WATCHDOG_PAGE_SELECT_LANG_PT}

Select English language on the watchdog screen
    Click
    ...    ${WATCHDOG_PAGE_SELECT_LANG}
    Click
    ...    ${WATCHDOG_PAGE_SELECT_LANG_EN}

Select Spanish language on the watchdog screen
    Click
    ...    ${WATCHDOG_PAGE_SELECT_LANG}
    Click
    ...    ${WATCHDOG_PAGE_SELECT_LANG_ES}
