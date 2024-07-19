*** Settings ***
Documentation      Definition the keyword for page AcceuilProfilPage
Library            SeleniumLibrary
Resource           ../Locators/AcceuilByProfilPage.resource

*** Variables ***
#parametres pour keywords
${mess_bienvenue}       Bienvenue sur l'application Crédit Auto



*** Keywords ***
Check_Message_Welcome_CA
    [Documentation]    verify element "bienvenue" is displayed
    ...  verify contain text "Bienvenue"
    #Wait Until Element Is Visible    ${div_bienvenue}
    #Page Should Contain    ${mess_bienvenue}
    Wait Until Page Contains     ${mess_bienvenue}


Check_Name_User_Display
    [Documentation]    verify username is displayed in menu
    ...  verify username in
    [Arguments]    ${identifiant}
    #Element Text Should Be   ${div_b_username}   ${username_val}
    #Element Text Should Be   ${div_i_username}   ${username_val}
    Element Should Contain    ${div_b_username}   ${identifiant}[user]
    Element Should Contain    ${div_i_username}   ${identifiant}[user]


Check_Menu_User_Display
    [Documentation]    verify menu of profil user is display
    [Arguments]    ${username_val}

    IF    '${username_val}' == "acd"
        #list de lien doivent etre vérifier
        Element Should Be Visible    ${lnk_verifierAdmis}
        Element Should Be Visible    ${lnk_consulter_liste_credit}
        Element Should Be Visible    ${lnk_simulation}
        Element Should Be Visible    ${lnk_recherche_contrat}
        Element Should Be Visible    ${lnk_liste_credit}
        Element Should Be Visible    ${lnk_rapport_production}
        Element Should Be Visible    ${lnk_emmetttrer_conditions}
        Element Should Be Visible    ${lnk_taux}
        Element Should Be Visible    ${lnk_conditions_loueurs}
    END
    IF    '${username_val}' == "gcd"
        Element Should Be Visible    ${lnk_verifierAdmis}
        Element Should Be Visible    ${lnk_simulation}
        Element Should Be Visible    ${lnk_consulter_liste_credit}
    END
    IF    '${username_val}' == "rcd"
        Element Should Be Visible    ${lnk_recherche_contrat}
        Element Should Be Visible    ${lnk_rapport_production}
        Element Should Be Visible    ${lnk_liste_credit}
    END
    IF    '${username_val}' == "lcd"
         Element Should Be Visible    ${lnk_emmetttrer_conditions}
    END


Deconnexion_CA
    [Documentation]    user click button Deconnexion
    Click Link    ${btn_deconnexion}
