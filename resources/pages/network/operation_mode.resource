*** Settings ***
Library     Browser
Resource    ../../common.resource


*** Variables ***
${OPERATION_MODE_PAGE_SELECT_NETWORK_DROPDOWN}           xpath=//*[@id="root"]/div[3]/div/div[2]/div/div/div[1]/div/div/ul
${OPERATION_MODE_PAGE_SELECT}                            xpath=//*[@id="root"]/div[3]/div/div[2]/div/div/div[1]/div/div/div/input
${OPERATION_MODE_PAGE_SELECT_NETWORK_BRIDGE}             xpath=//*[@id="root"]/div[3]/div/div[2]/div/div/div[1]/div/div/ul/li[1]/div
${OPERATION_MODE_PAGE_SELECT_NETWORK_ROUTER}             xpath=//*[@id="root"]/div[3]/div/div[2]/div/div/div[1]/div/div/ul/li[2]/div

${OPERATION_MODE_PAGE_SAVE_BUTTON}                       xpath=//*[@id="root"]/div[3]/div/div[2]/div/div[1]/div[2]/button
${OPERATION_MODE_PAGE_CONFIRM_BUTTON}                    xpath=//*[@id="overlay-cntse"]/div/div/div[3]/div/button[2]


*** Keywords ***
Select bridge operating mode
    ${elem_states}    Get element states    ${OPERATION_MODE_PAGE_SELECT_NETWORK_DROPDOWN}
    IF    "hidden" in ${elem_states}
        Click    ${OPERATION_MODE_PAGE_SELECT}
        Click    ${OPERATION_MODE_PAGE_SELECT_NETWORK_BRIDGE}
        Click    ${OPERATION_MODE_PAGE_SAVE_BUTTON}  
        Click    ${OPERATION_MODE_PAGE_CONFIRM_BUTTON}
        Sleep    1
    END

Select router operating mode
    ${elem_states}    Get element states    ${OPERATION_MODE_PAGE_SELECT_NETWORK_DROPDOWN}
    IF    "hidden" in ${elem_states}
        Click    ${OPERATION_MODE_PAGE_SELECT}
        Click    ${OPERATION_MODE_PAGE_SELECT_NETWORK_ROUTER}
        Click    ${OPERATION_MODE_PAGE_SAVE_BUTTON}  
        Click    ${OPERATION_MODE_PAGE_CONFIRM_BUTTON}
        Sleep    1
    END
