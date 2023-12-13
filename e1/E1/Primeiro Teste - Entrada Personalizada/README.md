1 - Abra um terminal neste repositório.
2 - Execute o flex com o comando "flex mywc.l". 
	2.1 - Isso irá gerar um programa flex chamado "lex.yy.c".
3 - Execute o comando "cc lex.yy.c -lfl" para gerar o executável em c do seu programa.
	3.1 - Isso irá gerar o programa executável "a.out".
4 - Execute o executável com o comando "./a.out < input1.txt > output1.txt".
	4.1 - Desta forma, o programa irá executar sozinho tomando como entrada o conteúdo de "input1.txt" e gravando o resultado da execução em "output1.txt".
