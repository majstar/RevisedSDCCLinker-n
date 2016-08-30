#!/bin/make
# -- setup of the Revised SDCC Linker

.PHONY: all clean install uninstall

all: 
	make -C src all
	make -C doc all

clean:
	make -C src clean
	make -C doc clean

install:
	make -C src install
	make -C doc install

uninstall:
	make -C src uninstall
	make -C doc uninstall
