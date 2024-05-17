# UNIX Makefile for the x_list library
#
# 	Unix Makefile for x_list functions. 
#
#	make.unx 1.1 4/18/91 
#
# Set the CC variable to any compiler that can take ANSI C
CC=CC

# Set any other flags you want the compiler to honor
CFLAGS=-O -I.. -I. -I../../include -L. -L../../lib

# The command that is used to make an archive 
# BSD and SUNOS
# ARCHIVE=ar cr 
# System V
ARCHIVE=ar -cr 

all: testlist testhash
	@echo " "
	@echo "======================================================="
	@echo "= Done building x_hash list manager system...         ="
	@echo "= Run the program 'testit' to see if it works.        ="
	@echo "= Remember to type 'make install' if all went well.   ="
	@echo "= Then you can 'make clean' to get rid of temp files. ="
	@echo "= - - - - - - - - - - - - - - - - - - - - - - - - - - ="
	@echo "= Please don't forget that this is is shareware!      ="
	@echo "======================================================="
	@echo " "

install:
	cp libx_list.a ../../lib
	chmod 644 ../../lib/libx_list.a
	cp x_list.h ../../include
	chmod 644 ../../include/x_list.h
	cp libx_hash.a ../../lib
	chmod 644 ../../lib/libx_hash.a
	cp x_hash.h ../../include
	chmod 644 ../../include/x_hash.h

libx_list.a: x_list.o 
	$(ARCHIVE) libx_list.a x_list.o
	-ranlib libx_list.a

x_list.o: x_list.c x_list.h 
	$(CC) $(CFLAGS) -c x_list.c

testlist: testlist.c libx_list.a x_list.h 
	$(CC) $(CFLAGS) -o testlist testlist.c -lx_list 

libx_hash.a: x_hash.o 
	$(ARCHIVE) libx_hash.a x_hash.o
	-ranlib libx_hash.a

x_hash.o: x_hash.c x_hash.h x_list.h
	$(CC) $(CFLAGS) -c x_hash.c

testhash: testhash.c libx_hash.a libx_list.a x_hash.h 
	$(CC) $(CFLAGS)  -o testhash testhash.c -lx_hash -lx_list

clean: 
	-rm x_hash.o
	-rm libx_hash.a
	-rm x_list.o
	-rm libx_list.a
	-rm testlist.o
	-rm testlist
	-rm testhash.o
	-rm testhash

