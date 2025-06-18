*** Settings ***
Resource   env.resource
Resource   pages/components/Header.resource
Resource   pages/SignupPage.resource
Resource   pages/UserListPage.resource
Resource   pages/LoginPage.resource
Resource   pages/components/Header.resource
Resource   pages/ProductPage.resource
Resource    pages/ListPage.resource

Resource   ../resources/pages/components/Header.resource

Library    JSONLibrary
Library    Browser
Library    Collections


*** Keywords ***
Start Session
    New Browser    browser=${BROWSER}    headless=${False}
    New Page       ${BASE_URL}

Get fixture
    [Arguments]    ${file_name}    ${scenario}
    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/${file_name}.json    encoding=utf-8
    RETURN    ${data}[${scenario}]

Delete user if exists
    [Arguments]       ${admin_user}     ${email}
    Delete an user    ${admin_user}     ${email}

Signup as Administrator
    [Arguments]    ${user}
    Go to signup Page
    Submit signup form as administrator   ${user}
    Administrator should be logged in    ${user['nome']}

Signup as User
    [Arguments]    ${user}
    Go to signup Page
    Submit signup form as user    ${user}
    User should be logged in    ${user['nome']}

