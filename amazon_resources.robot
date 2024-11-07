*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.amazon.com.br
${MENU_ELETRONICOS}    css=div[id="nav-xshop"] a[href*="/Eletronicos-e-Tecnologia"]
${HEADER_ELETRONICOS}    css=div[id="s-refinements"] h2

*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar o navegador
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}

Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Wait Until Page Contains    text=Eletrônicos e Tecnologia
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}
    
Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}

Verficar se aparece a categoria "${CATEGORIA}"
    Element Should Be Visible    locator=//span[@class='a-truncate-cut'][contains(.,'${CATEGORIA}')]