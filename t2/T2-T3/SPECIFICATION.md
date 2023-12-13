# Projeto de um Compilador

- Trabalho T2-T3: Análise Sintática com Construção de AST. Construção de um analisador sintático bottom-up para B-lite-minus que gera representação na forma de AST para programas válidos.

- Parte 1:
   - Adaptação do analisador léxico;
   - Escrever programa Bison (só gramática, sem ações) para a linguagem [B-lite-Minus](./lib/B-MINUS-DOCUMENTATION.md)
- Parte 2: A ser definido.
   - Inclusão de ações semânticas no analisador sintático para manipular árvore sintática abstrata (AST - Abstract Syntax Tree).

O trabalho T2-T3 completo inclui a implementação de um analisador sintático, construído com a ferramenta _Bison_ (parte 1), 
funções auxiliares para a construção da AST durante o processo de análise, 
uma função de _printAST_ para gerar uma representação externa para AST 
e o programa principal.

---

# Algumas Dicas para T2-T3

## Parte 1

- Revisar o blite.l para retornar tokens mais específicos, por exemplo,
%token PLUS, %token COMMA, etc., e se adequar à linguagem reduzida (B-Lite-Minus);
- Fazer o blite.y rodar sem conflitos (escrever a gramática sem ações semânticas);

## Parte 2
- Definir tipos de não-terminais e terminais no blite.y 
(usar %union, %type, e revisar declaração de alguns tokens), sem uso de ações semânticas nas regras ainda. Olhar o livro do Flex & Bison;
- Revisar o blite.l (usar tipos para ALGUNS tokens), por exemplo, yylval.d para 
token NUMBER, sendo _d_ do tipo _int_;
- Desenvolver __incrementalmente__, em especial, as ações semânticas 
para criação da AST. Por exemplo, desenvolver e testar _expression_ primeiro, etc. 
Explicações no video compartilhado - aula 30/10.

## Geral 
Pensar sobre como dividir trabalho entre os membros da equipe e usar efetivamente o GitHub,
controle de versões, commits, comentários sobre commits. Por exemplo, 
pensar em uma estratégia para trabalhar em declaration e expression em paralelo. 

