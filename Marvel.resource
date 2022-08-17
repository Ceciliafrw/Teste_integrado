***Settings***
Library  RequestLibrary
Variables  config.py

***Keywords***
Configurar Sessao
    Create Session requisicao_marvel  ${URL_MARVEL}  verify=true  headers=${HEADERS}

Realizar requisicao para API Char
    ${resposta}=  Get on Session  requisicao_marvel  /v1/public/characters  params=apikey=${API_KFY}
    Set Test Variables  ${resposta}

Validar os campos obrigatorios
    Request Should Be Successful  ${resposta}

Validar se a chave 'code' esta preenchida
    ${StatusCodeInt}=  Convert To Integer 200
    Should Be Equal ${response_char_json()}[code]  ${StatusCodeInt}

Validar se a chave '"copyright" esta preenchida
     Should Be Equal ${response_char_json()}[copyright]  © 2022 MARVEL