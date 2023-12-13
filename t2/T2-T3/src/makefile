install:
	sudo apt-get install -f flex
	sudo apt-get install bison

compile:
	bison -d bminus.y
	flex bminus.l
	cc -o bminus lex.yy.c bminus.tab.c main.c

test:
	make compile
	./run_tests.sh

all:
	make install
	make compile
	make test

clean: 
	rm bminus
	rm bminus.tab.*
	rm lex.yy.c