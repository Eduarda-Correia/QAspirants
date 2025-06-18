*** Settings ***
Library    Browser
Resource    ../base.resource

*** Keywords ***
Open users list
    [Arguments]    ${admin_user}
    Log To Console    ${admin_user}
    Login as Administrator    ${admin_user}
    Sleep    2
    Click        ${BUTTON_LIST_USERS}

Delete an user
    [Arguments]   ${admin_user}     ${email}
    Log To Console    ${email}
    Open users list    ${admin_user}
    ${xpath_button}    Set Variable    xpath=//td[normalize-space(text())='${email}']/parent::tr//button[contains(text(),'Excluir')]
    Scroll To Element    ${xpath_button}
    Click    ${xpath_button}
    Wait For Elements State    xpath=//td[normalize-space(text())='${email}']    hidden    timeout=5s