#Makefile for MyCalendar
#

INPUTS := $(wildcard src/Modules/*.hs)
OUTPUTS := $(patsubst src/Modules/%.hs,src/Modules/%.o, $(INPUTS))

all: src/Main/main.hs $(OUTPUTS)
	ghc -isrc/Modules src/Main/main.hs
	cp src/Main/main bin/DEnCrypt
	sudo cp bin/DEnCrypt /usr/local/bin/DEnCrypt

src/Modules/%.o: src/Modules/%.hs 
	ghc -isrc/Modules $< 


