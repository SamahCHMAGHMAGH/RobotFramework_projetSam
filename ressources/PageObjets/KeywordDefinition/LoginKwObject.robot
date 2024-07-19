*** Settings ***
Documentation      Definition the keyword for Page User's Login
Library            SeleniumLibrary
Resource           ../Locators/LoginPage.resource
Resource            ../Variables/LoginPage.resource
Resource            ./AcceuilByProfilPage.robot


*** Variables ***
${mess_invalide}        Identifiants invalides


*** Keywords ***
Login_by_identifiant_CA
    [Documentation]    user enter username to input identifiant, password
    ...                user click button 'Se connecter'
    [Arguments]        ${identifiant}
    #    [Arguments]        ${username_str}   ${password_str}
    Input Text      ${txt_username}   ${identifiant}[user]
    Input Text      ${txt_password}   ${identifiant}[pswd]
    Click Button    ${btn_connecter}


Message error identifant display
    [Documentation]    verify message "Identifiants invalides" display
    Element Should Be Enabled   ${div_id_invalid}
    Page Should Contain         ${mess_invalide}