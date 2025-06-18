*** Settings ***
Documentation    Cenários de testes da remoção de usuários
Resource         ../../resources/base.resource


Test Setup       Start Session
Test Teardown    Take Screenshot
Library    Collections

*** Test Cases ***
Should delete an user
    ${data}=     Get fixture    user    create
    ${user2}=    Get From Dictionary    ${data}    admin_to_delete_other_users
    Set Test Variable     ${admin_to_delete}    ${user2}
    ${data}    Get fixture    user    create

    ${email}=    Get From Dictionary    ${data['user']}    email
    Delete user if exists    ${user2}     ${email}
    ${user_email}=    Set Variable   xpath=//td[normalize-space(text())='${email}']
