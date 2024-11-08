*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.amazon.com.br
${MENU_ELETRONICOS}    css=div[id="nav-xshop"] a[href*="/Eletronicos-e-Tecnologia"]
${HEADER_ELETRONICOS}    css=div[id="s-refinements"] h2
${SEARCH}    css=input[id="twotabsearchtextbox"]
${BUTTON_SEARCH}    css=span[id="nav-search-submit-text"]
${TEXT_SEARCH}    css=span[class="a-color-state a-text-bold"]

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

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=${SEARCH}    text=${PRODUTO}

Clicar no botão de pesquisa
    Click Element    locator=${BUTTON_SEARCH}

Verificar o resultado da pesquisa, listando o produto "${PRODUTO}"
    Wait Until Element Is Enabled    locator=${TEXT_SEARCH}
    Element Should Contain    locator=${TEXT_SEARCH}    expected=${PRODUTO}