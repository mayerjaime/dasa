#language: pt
@ordens
Funcionalidade: Realizar cadastro de uma ordem
Como um usuário do sistema
Eu quero realizar as requisições na API
A fim de realizar cadastro de uma ordem

@cadastro-ordem-sucesso
Cenário: Cadastrar uma ordem com sucesso
    Quando executo a chamada no servico de ordens informando um exame "cadastrado"
    Então devo receber o codigo 200 do servico de ordens
    E a mensagem de ordem inserido com sucesso

@cadastro-ordem-exame-nao-cadastrado
Cenário: Cadastrar uma ordem com exame nao cadastrado
    Quando executo a chamada no servico de ordens informando um exame "nao cadastrado"
    Então devo receber o codigo 412 do servico de ordens
    E a mensagem informando que o exame nao foi encontrado

@cadastro-ordem-exames-distintos
Cenário: Cadastrar uma ordem com 2 exames do mesmo material e 2 exames de materiais distintos
    Dado que faco o cadastro da orderm com o seguintes exames
    | Exame1 | Exame2 | Exame3  | Exame4    |
    | GLICO  | TSH    | EXAMEJM | EXAME2JM  |
    Então devo receber o codigo 200 do servico de ordens
    E o response deve retornar o codigo de barras dos exames cadastrados