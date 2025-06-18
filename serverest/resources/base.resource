*** Settings ***
Resource   env.resource
Resource   ../resources/pages/components/Header.resource

Resource    pages/SignupPage.resource
Resource    pages/ListPage.resource

Library    Browser

*** Keywords ***
Start Session
    New Browser    browser=${BROWSER}    headless=${False}
    New Page       ${BASE_URL}