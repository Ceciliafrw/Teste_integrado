***Settings***
Library  RequestLibrary
Variables  config.py

***Keywords***
Criar Configuracao Inicial do Teste
    Create Session request_marvel_char  ${BASE_URL_MARVEL}  verify=true  headers=${HEADERS}

Realizar requisicao GET na /vl/public/characters
    ${response_char}=  Get on Session  request_marvel_char  /vl/public/characters  params=apikey=${API}
    Set Test Variables  ${response_char}

Validas se status code retornou 200
    Request Should Be Successful  ${response_char}

Validar se a chave 'code' esta preenchida
    ${StatusCodeInt}=  Convert To Integer 200
    Should Be Equal ${response_char_json()}[code]  ${StatusCodeInt}

Validar se a chave '"copyright" esta preenchida
     Should Be Equal ${response_char_json()}[copyright]  2022 Marvel