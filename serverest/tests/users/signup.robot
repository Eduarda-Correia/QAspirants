*** Settings ***
Documentation    Cenários de testes do cadastro de usuários
Resource         ../../resources/base.resource
Library          Collections

Test Setup       Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Should signup a new administrator
    [Tags]       POST    User    Positivo
    ${data}=     Get fixture    user    create
    ${user}=     Get From Dictionary    ${data}    user
    ${user2}=    Get From Dictionary    ${data}    admin_to_delete_other_users
    Set Global Variable     ${admin_to_delete}    ${user2}
    ${email}=    Get From Dictionary    ${user}    email
    Run Keyword And Ignore Error    Delete user if exists      ${user2}  ${email}
    Signup as Administrator    ${user}    

Should signup a new user
    [Tags]       POST    User    Positivo
    ${data}=     Get fixture    user    create
    ${user}=     Get From Dictionary    ${data}    normal_user
    ${email}=    Get From Dictionary    ${user}    email
    Run Keyword And Ignore Error    Delete user if exists      ${admin_to_delete}  ${email}
    Signup as User    ${user}
   
