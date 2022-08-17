# Criar um arquivo .robot
# - Criar um arquivo .resource
# - Escolha uma rota da API da Marvel para testar
# - No arquivo .robot deve ser criado pelo menos 3 cenários de testes.
# - No arquivo .resource utilize para colocar as keywords e montar a lógica das chamadas.

*** Settings ***

Resource        Marvel.resource
Suite Setup     Criar Configuracao Inicial do Teste

*** Test Cases ***
Testar API Char da Marvel
    Configurar Sessao
    Realizar requisicao para API Char
    Validar os campos obrigatorios
    Validar se a chave 'code' esta preenchida
    Validar se a chave '"copyright" esta preenchida

