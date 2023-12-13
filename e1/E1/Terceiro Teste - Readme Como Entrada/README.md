1 - Abra um terminal neste repositório.
2 - Execute o flex com o comando "flex mywc.l". 
	2.1 - Isso irá gerar um programa flex chamado "lex.yy.c".
3 - Execute o comando "cc lex.yy.c -lfl" para gerar o executável em c do seu programa.
	3.1 - Isso irá gerar o programa executável "a.out".
4 - Execute o executável com o comando "./a.out < ../README.md > output_readme.txt".
	4.1 - Desta forma, o programa irá executar sozinho tomando como entrada o conteúdo de "README.md" do diretório E1 e gravando o resultado da execução em "output_readme.txt".
5 - Agora vamos executar o wc do linux para comparar o resultado com o resultado gerado pelo mywc.
	5.1 - Para isso, execute o comando "wc ../README.md > output_readme_wc_linux.txt".
	5.2 - Com isso, o resultado do wc do linux será gravado em um arquivo chamado "output_readme_wc_linux.txt", facilitando posterior comparação.
