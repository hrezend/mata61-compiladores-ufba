install:
	sudo apt-get install -f flex
	sudo apt-get install bison

compile:
	bison -d e8.y
	flex e8.l
	cc -o avalia lex.yy.c e8.tab.c main.c

test:
	./run_tests.sh

all:
	make install
	make compile
	make test

clean: 
	rm e8.tab.*
