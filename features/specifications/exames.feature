#language: pt
@exame
Funcionalidade: Realizar cadastro de exame
Como um usuário do sistema
Eu quero realizar as requisições na API
A fim de realizar cadastro de um exame

@cadastro-exame-sucesso
Cenário: Cadastrar um exame com sucesso
    Quando executo a chamada no servico de exame informando um equipamento "cadastrado"
    Então devo receber o codigo 200 do servico de exame
    E a mensagem de exame inserido com sucesso

@cadastro-exame-equip-invalido
Cenário: Cadastrar um exame com equipamento nao cadastrado
    Quando executo a chamada no servico de exame informando um equipamento "não cadastrado"
    Então devo receber o codigo 412 do servico de exame
    E a mensagem informando que equipamento não existe