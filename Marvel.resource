***Settings***
Library  RequestsLibrary
Variables  config.py

*** Keywords ***
Configuracao Inicial do Teste
    Create Session  requisicao_marvel  ${URL_MARVEL}  verify=true  headers=${HEADERS}

Realizar requisicao para API Char
    ${resposta}=  Get on Session  requisicao_marvel  /v1/public/characters  params=apikey=${API_KFY}
    Set Test Variable  ${resposta}

Validar os campos obrigatorios
    Request Should Be Successful  ${resposta}

Validar se a chave 'code' esta preenchida
    ${StatusCodeInt}=  Convert To Integer  200
    Should Be Equal  ${resposta.json()}[code]  ${StatusCodeInt}

Validar se a chave '"copyright" esta preenchida
    Should Be Equal  ${resposta.json()}[copyright]  © 2022 MARVEL