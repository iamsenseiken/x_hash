#!/bin/sh
# This is X_HASH, a shell archive (shar 3.10)
# made 04/20/1991 04:00 UTC by tron1@tronsbox
# Source directory /u1/home/tron1/src/tron1/shareware/x_hash
#
# existing files WILL be overwritten
#
# This is part 1 of a multipart archive                                    
# do not concatenate these parts, unpack them in order with /bin/sh        
#
# This shar contains:
# length  mode       name
# ------ ---------- ------------------------------------------
#   2791 -rw-r----- README
#    241 -r--r----- src/copyr.h
#   1826 -r--r----- src/make.unx
#   3482 -r--r----- src/sharew.h
#   8935 -r--r----- src/testhash.c
#   9141 -r--r----- src/testlist.c
#  10500 -r--r----- src/x_hash.c
#   2075 -r--r----- src/x_hash.h
#   9460 -r--r----- src/x_list.c
#   3415 -r--r----- src/x_list.h
#   1826 -r--r----- src/Makefile
#    107 -rw-r----- text/install
#   9661 -rw-r----- text/lists
#   2856 -rw-r----- text/readme
#   1311 -rw-r----- text/WHATIS
#
touch 2>&1 | fgrep '[-amc]' > /tmp/s3_touch$$
if [ -s /tmp/s3_touch$$ ]
then
	TOUCH=can
else
	TOUCH=cannot
fi
rm -f /tmp/s3_touch$$
if test -r s3_seq_.tmp
then echo "Must unpack archives in sequence!"
     next=`cat s3_seq_.tmp`; echo "Please unpack part $next next"
     exit 1; fi
# ============= README ==============
echo "x - extracting README (Text)"
sed 's/^X//' << 'SHAR_EOF' > README &&
X
X			    **************
X			    * X_HASH 1.0 *
X			    **************
X
X			    NOTICE ! ! ! !
X
X	X_HASH IS >SHAREWARE< ! YOU MUST READ AND COMPLY WITH THE TERMS
X	IN THIS FILE IF YOU WISH TO USE THIS DATA IN ANY WAY!!!
X
X		X_HASH IS (C)1991 BY KENNETH JAMIESON
X
X			 ALL RIGHTS RESERVED
X
X
XNOTICE:
X
X	THE TERM CODE SHALL BE USED TO MEAN ALL DATA AND SOURCE TEXT
X	PROVIDED WITH THIS PACKAGE. THIS INCLUDES ALL DOC FILES.
X
X	THIS CODE IS "AS IS" , AND NO WARRANTY IS IMPLIED OR GIVEN ABOUT
X	IT BEING ACCURATE OR USEFUL IN ANY WAY FOR ANY PURPOSE. TO THE
X	EXTENT ALLOWED BY LAW THAT AUTHOR CLAIMS NO RESPONSIBILITY FOR
X	DAMAGES, REAL OR PERCEIVED, SUSTAINED FROM THE USE OF THIS CODE OR 
X	THE IDEAS EXPRESSED IN THIS CODE.
X
X	THIS DISCLAIMER APPLIES TO REGISTERED AND UNREGISTERED COPIES
X	OF THIS CODE. PAYMENT TO THE AUTHOR DOES NOT CHANGE THE LACK OF
X	WARRANTY.
X
X
XSHAREWARE TERMS:
X
X	* You will not violate, help to violate, or fail to report the
X	  violation of the copyright notice that protects this code.
X
X	* You may not use this code, in whole or part, in any commercial
X	  program without the permission of the author. A commercial
X	  program is any code, source or object, that the author has
X	  asked payment for. This includes shareware.
X
X	* This code must be distributed in it's original form.
X
X	* No special fee may be charged for distributing this code. This
X	  means that, for instance, and online service may charge for 
X	  downloading programs, but that charge cannot change base on if 
X	  it is THIS code that is being accessed.
X
X	* You may use this code for thirty (30) days before payment is
X	  due. This evaluation period begins when you first access this
X	  code. After that time, you must register this code.
X
X	* Registration allows you to use this code for an unlimited
X	  period of time. Not: registration does NOT remove the 
X	  restriction on use in commercial code.
X
X	* Contact the author to arrange for use in commercial code.
X
X	* To register, send 15$ to the author:
X
X		Kenneth Jamieson
X		P.o. Box 840 B 
X		Kearny NJ 07032
X
X
X
X		      **************************
X
X	Whew! Well, now that that is out of the way I feel better!
X
X	You can reach me at the address above, or at 201-957-2438 (day).
X
X	Also....
X
X	uunet!tronsbox!tron1 
X	tron1@tronsbox 
X	uunet!fdurt1!wisdom!tronsbox!tron1
X
X	See the "text" directory for more info.
X
X========[ Xanadu Enterprises Inc. Amiga & Unix Software Development]=======
X= "I know how you feel, you don't know if you want to hit me or kiss me - =
X=  --- I get a lot of that."  Madonna as Breathless Mahoney (Dick Tracy)  =
X=========== Ken Jamieson: uunet!tronsbox.xei.com!tron1  ===================
X=     NONE of the opinions represented here are endorsed by anybody.      =
X=== The Romantic Encounters BBS 201-759-8450(PEP) / 201-759-8568(2400) ==== 
SHAR_EOF
chmod 0640 README || echo "restore of README fails"
if [ $TOUCH = can ]
then
    touch -am 0419234191 README
fi
# ============= src/copyr.h ==============
if test ! -d 'src' ; then
    echo "x - creating directory src"
    mkdir 'src'
fi
echo "x - extracting src/copyr.h (Text)"
sed 's/^X//' << 'SHAR_EOF' > src/copyr.h &&
X/* 
X         Copyright include notice :    
X	 
X	 copyr.h 1.1 4/18/91
X
X*/
X
X/* 
XAll text in this file is copyright (c) 1991 by Kenneth Jamieson
X*/
X#ifndef X_COPYRIGHT
X#define X_COPYRIGHT "Compiled from source (c) 1991 Kenneth Jamieson"
X#endif
SHAR_EOF
chmod 0440 src/copyr.h || echo "restore of src/copyr.h fails"
if [ $TOUCH = can ]
then
    touch -am 0418223391 src/copyr.h
fi
# ============= src/make.unx ==============
echo "x - extracting src/make.unx (Text)"
sed 's/^X//' << 'SHAR_EOF' > src/make.unx &&
X# UNIX Makefile for the x_list library
X#
X# 	Unix Makefile for x_list functions. 
X#
X#	make.unx 1.1 4/18/91 
X#
X# Set the CC variable to any compiler that can take ANSI C
XCC=CC
X
X# Set any other flags you want the compiler to honor
XCFLAGS=-O -I.. -I. -I../../include -L. -L../../lib
X
X# The command that is used to make an archive 
X# BSD and SUNOS
X# ARCHIVE=ar cr 
X# System V
XARCHIVE=ar -cr 
X
Xall: testlist testhash
X	@echo " "
X	@echo "======================================================="
X	@echo "= Done building x_hash list manager system...         ="
X	@echo "= Run the program 'testit' to see if it works.        ="
X	@echo "= Remember to type 'make install' if all went well.   ="
X	@echo "= Then you can 'make clean' to get rid of temp files. ="
X	@echo "= - - - - - - - - - - - - - - - - - - - - - - - - - - ="
X	@echo "= Please don't forget that this is is shareware!      ="
X	@echo "======================================================="
X	@echo " "
X
Xinstall:
X	cp libx_list.a ../../lib
X	chmod 644 ../../lib/libx_list.a
X	cp x_list.h ../../include
X	chmod 644 ../../include/x_list.h
X	cp libx_hash.a ../../lib
X	chmod 644 ../../lib/libx_hash.a
X	cp x_hash.h ../../include
X	chmod 644 ../../include/x_hash.h
X
Xlibx_list.a: x_list.o 
X	$(ARCHIVE) libx_list.a x_list.o
X	-ranlib libx_list.a
X
Xx_list.o: x_list.c x_list.h 
X	$(CC) $(CFLAGS) -c x_list.c
X
Xtestlist: testlist.c libx_list.a x_list.h 
X	$(CC) $(CFLAGS) -o testlist testlist.c -lx_list 
X
Xlibx_hash.a: x_hash.o 
X	$(ARCHIVE) libx_hash.a x_hash.o
X	-ranlib libx_hash.a
X
Xx_hash.o: x_hash.c x_hash.h x_list.h
X	$(CC) $(CFLAGS) -c x_hash.c
X
Xtesthash: testhash.c libx_hash.a libx_list.a x_hash.h 
X	$(CC) $(CFLAGS)  -o testhash testhash.c -lx_hash -lx_list
X
Xclean: 
X	-rm x_hash.o
X	-rm libx_hash.a
X	-rm x_list.o
X	-rm libx_list.a
X	-rm testlist.o
X	-rm testlist
X	-rm testhash.o
X	-rm testhash
X
SHAR_EOF
chmod 0440 src/make.unx || echo "restore of src/make.unx fails"
if [ $TOUCH = can ]
then
    touch -am 0418223391 src/make.unx
fi
# ============= src/sharew.h ==============
echo "x - extracting src/sharew.h (Text)"
sed 's/^X//' << 'SHAR_EOF' > src/sharew.h &&
X/* 
X         Shareware license document : 
X
X	 sharew.h 1.1 4/18/91
X
X*/
X/*
X
XThis text in this file is copyright (c) 1991 by Kenneth Jamieson.
X
XThe author may be reached at the US MAIL address listed below, or
Xby sending unix mail to ...
X
X           tron1@tronsbox.xei.com            or
X	   ...!uunet!tronsbox.xei.com!tron1  or
X	   yelling "Hey Ken!" if you happen to be close enough.
X
X
XAll rights are reserved by Kenneth Jamieson.
X
XYou are granted permission to use this code under the following 
Xrestrictions:
X
XNOTE: All occurrences of the word "code" below will apply to
X      all files, text, program source code and documentation.
X
X1) This code cannot be used in any program that is to be distributed 
X   to anyone other than that program's author without the
X   written permission of Kenneth Jamieson. This permission will be granted 
X   under the terms of registration listed below.
X
X2) This code may be used for a trial period of thirty (30) days.
X   At that time, you mus either register the code as below or
X   discontinue it's use.
X   
X3) UNDER NO CIRCUMSTANCES may this code (registered or not) be used or 
X   distributed in any way that will prevent it's future distribution 
X   under the terms of this license.
X
X   This specifically includes (but is not limited to) any code that
X   is to be distributed under the terms of the Free Software 
X   Foundation's General Public License.
X
X4) Kenneth Jamieson reserves all rights to this code.
X
X5) NO WARRANTY is given or implied as to the usefulness or correctness of 
X   this code for any purpose at all, whether this code is registered or not.
X
X
XREGISTRATION:
X
X   You are encouraged to register this code no matter what you use it for,
X   but you MUST register this code if you need written permission under
X   the terms above for distribution or intend to use it after the
X   trial period expires.
X
X   In order to register this code, just send $15 US to the author at the
X   address listed below. 
X
X   Kenneth Jamieson
X   P.o. Box 387 
X   Kearny NJ 07023
X   USA
X   
X   Once registered you will receive permission to use this code in your own
X   programs under the following restrictions:
X
X   1) Your program or documentation must mention that this code is in use,
X      and provide your user with information about where to obtain this
X      code. This information must be provided as part of the initial
X      cost (if any) of your software.
X
X   2) If you distribute the source to your program, then the source 
X      for this code must accompany your code complete and unaltered.
X
X   3) UNDER NO CIRCUMSTANCES may this code (registered or not) be used or 
X      distributed in any way that will prevent it's future distribution 
X      under the terms of this license except by Kenneth Jamieson.
X
X      This specifically includes (but is not limited to) any code that
X      is to be distributed under the terms of the Free Software 
X      Foundation's General Public License.
X
X   4) Kenneth Jamieson reserves all rights to this code.
X
X   5) NO WARRANTY is given or implied as to the usefulness or correctness of 
X      this code for any purpose at all, whether this code is registered or not.
X
X   In addition, you will get a list of any known bugs and work-arounds,
X   notice of the next update (if any), and at least one "thank you".
X
X
X
X-----------------------------------------------------
X* UNIX is a trademark of AT&T
X* Amiga is a trademark of Commodore Business Machines
X* MS-DOS is a trademark of Microsoft Inc 
X
X*/
SHAR_EOF
chmod 0440 src/sharew.h || echo "restore of src/sharew.h fails"
if [ $TOUCH = can ]
then
    touch -am 0418223391 src/sharew.h
fi
# ============= src/testhash.c ==============
echo "x - extracting src/testhash.c (Text)"
sed 's/^X//' << 'SHAR_EOF' > src/testhash.c &&
X/* 
X
X   Hash table test file : 
X
X          testhash.c 1.2 4/18/91  
X
X*/
X
X/*
X
XThis text in this file is copyright (c) 1991 by Kenneth Jamieson.
X
XThe author may be reached at the US MAIL address listed below, or
Xby sending unix mail to ...
X
X           tron1@tronsbox.xei.com            or
X	   ...!uunet!tronsbox.xei.com!tron1  or
X	   yelling "Hey Ken!" if you happen to be close enough.
X
X
X	   SEE THE FILE "sharew.h" for details before you
X	   use this code !!!
X
X*/
X
X#include <copyr.h>
X#include <x_hash.h>
X#include <stdio.h>
X#include <stdlib.h>
X#include <string.h>
X
X/* Not C++ -- so test the regular C functions */
X
X#define INITIAL 20
X#define BIGGER 100
X
X#ifndef __cplusplus
X
Xint main(){
X  struct x_hash * test_xhash;
X  int loop;
X  int test;
X  int * foo;
X  char * testchar;
X
X  printf("\ntestit - a testing program for the x_hash list\n");
X  printf("         manager.  testhash.c 1.2 4/18/91  \n\n");
X
X  test_xhash = init_xhash( INITIAL );
X  if( test_xhash == NULL ){
X    printf("ERROR! Cannot init_xhash of size %d.\n", INITIAL); 
X    return( 0 );
X  }else{
X    printf("Ok.... Hash table initialized. \n");
X  }
X
X  if( hashsize( test_xhash ) != INITIAL ){
X    printf("ERROR! Cannot hashsize error! Should be %d.\n", INITIAL); 
X    return( 0 );
X  }else{
X    printf("Ok.... Hash table size correct. \n");
X  }
X
X  if( put_xhash( test_xhash, hashkey("Key1"), (void*)"Key1",
X		HASH_REPLACE) != TRUE )
X  {
X    printf(" ERROR! Cannot store Key1 !\n");
X    return( 0 );
X  }else{
X    printf("Ok.... Key1 stored in the hash table. \n");
X  }
X
X  if( put_xhash( test_xhash, hashkey("Key2"), (void*)"Key2",
X		HASH_REPLACE) != TRUE )
X  {
X    printf(" ERROR! Cannot store Key2 !\n");
X    return( 0 );
X  }else{
X    printf("Ok.... Key2 stored in the hash table. \n");
X  }
X
X  if( put_xhash( test_xhash, hashkey("Key3"), (void*)"Key3",
X		HASH_REPLACE) != TRUE )
X  {
X    printf(" ERROR! Cannot store Key3 !\n");
X    return( 0 );
X  }else{
X    printf("Ok.... Key3 stored in the hash table. \n");
X  }
X
X  if( put_xhash( test_xhash, hashkey("Key4"), (void*)"Key4",
X		HASH_REPLACE) != TRUE )
X  {
X    printf(" ERROR! Cannot store Key4 !\n");
X    return( 0 );
X  }else{
X    printf("Ok.... Key4 stored in the hash table. \n");
X  }
X
X  if( put_xhash( test_xhash, hashkey("Key4"), (void*)"Key4-2",
X		HASH_NOREPLACE) != TRUE )
X  {
X    printf(" ERROR! Cannot use HASH_NOREPLACE !\n");
X    return( 0 ); 
X  }else{
X    printf("Ok.... Replacement prevention works. \n");
X  }
X
X  if( put_xhash( test_xhash, hashkey("Key4"), (void*)"Key4",
X		HASH_REPLACE) != TRUE )
X  {
X    printf(" ERROR! Cannot replace keys !\n");
X    return( 0 );
X  }else{
X    printf("Ok.... Replacement of keys works. \n");
X  }
X
X  if( put_xhash( test_xhash, hashkey("zzz"), (void*)"zzz",
X		HASH_NOADD) != FALSE )
X  {
X    printf(" ERROR! Cannot use HASH_NOADD !\n");
X    return( 0 );
X  }else{
X    printf("Ok.... Replace only mode works. \n");
X  }
X
X  if( put_xhash( test_xhash, hashkey("Key4"), (void*)"Key4",
X		HASH_NODUP) != FALSE )
X  {
X    printf(" ERROR! Cannot prevent key duplicates !\n");
X    return( 0 );
X  }else{
X    printf("Ok.... Duplicate key prevention works. \n");
X  }
X
X  testchar = (char * )get_xhash( test_xhash, hashkey("Key4"), HASH_GET );
X  if( testchar == NULL ){
X    printf("ERROR: get_xhash failed with the HASH_GET flag!\n");
X    return( 0 );
X  }else{
X    test = strcmp( "Key4", testchar );
X    if( test == 0 ){
X      printf("Ok.... Getting data from hash table works fine.\n");
X    }else{
X      printf("ERROR: get_xhash returned \"%s\" should have been \"Key4\" !\n");
X      return( 0 );
X    }
X  }
X
X  testchar = (char * )get_xhash( test_xhash, hashkey("Key4"),
X				HASH_GET_NEXT );
X  if( testchar == NULL ){
X    printf("ERROR: get_xhash failed with the HASH_GET_NEXT flag!\n");
X    return( 0 );
X  }else{
X    test = strcmp( "Key4-2", testchar );
X    if( test == 0 ){
X      printf("Ok.... Getting secondary data from hash table works fine.\n");
X    }else{
X      printf(
X	  "ERROR: get_xhash returned \"%s\" should have been \"Key4-2\" !\n");
X      return( 0 );
X    }
X  }
X
X  if( del_xhash( test_xhash, hashkey("Key3"),HASH_DELETE) != TRUE ){
X    printf(" ERROR! Cannot delete keys !\n");
X    return( 0 );
X  }else{
X    testchar = (char * )get_xhash( test_xhash, hashkey("Key3"),
X				HASH_GET_NEXT );
X    if(testchar != NULL){
X      printf(" ERROR! Cannot delete keys !\n");
X      return( 0 );
X    }
X    printf("Ok.... Deletion of keys works. \n");
X  }
X
X  if( del_xhash( test_xhash, hashkey("Key4"), HASH_DELETE_ALL) == FALSE ){
X    printf(" ERROR! Cannot delete multiple keys !\n");
X    return( 0 );
X  }else{
X    testchar = (char * )get_xhash( test_xhash, hashkey("Key4"),
X				HASH_GET );
X    if(testchar != NULL){
X      printf(" ERROR! Cannot delete multiple keys on read! %s\n", testchar);
X      return( 0 );
X    }
X    printf("Ok.... Deletion of multiple keys works. \n");
X  }
X
X
X}
X
X#endif
X  
X#ifdef __cplusplus
X
Xint main(){
X  X_Hash *test_xhash;
X  int test;
X  char * testchar;
X
X  printf("\ntesthash - a testing program for the x_hash list\n");
X  printf("         manager. testhash.c 1.2 4/18/91  \n\n");
X  printf("         TESTING C++ INTERFACE\n\n");
X
X  test_xhash = new X_Hash( INITIAL );
X  if( test_xhash == NULL ){
X    printf("ERROR! Cannot construct a hash of size %d.\n", INITIAL); 
X    return( 0 );
X  }else{
X    printf("Ok.... Hash table initialized. \n");
X  }
X
X  if( test_xhash->size() != INITIAL ){
X    printf("ERROR! Cannot hashsize error! Should be %d.\n", INITIAL); 
X    return( 0 );
X  }else{
X    printf("Ok.... Hash table size correct. \n");
X  }
X
X  if( test_xhash->put( hashkey("Key1"), (void*)"Key1",
X		HASH_REPLACE) != TRUE )
X  {
X    printf(" ERROR! Cannot store Key1 !\n");
X    return( 0 );
X  }else{
X    printf("Ok.... Key1 stored in the hash table. \n");
X  }
X
X  if( test_xhash->put( hashkey("Key2"), (void*)"Key2",
X		HASH_REPLACE) != TRUE )
X  {
X    printf(" ERROR! Cannot store Key2 !\n");
X    return( 0 );
X  }else{
X    printf("Ok.... Key2 stored in the hash table. \n");
X  }
X
X  if( test_xhash->put( hashkey("Key3"), (void*)"Key3",
X		HASH_REPLACE) != TRUE )
X  {
X    printf(" ERROR! Cannot store Key3 !\n");
X    return( 0 );
X  }else{
X    printf("Ok.... Key3 stored in the hash table. \n");
X  }
X
X  if( test_xhash->put( hashkey("Key4"), (void*)"Key4",
X		HASH_REPLACE) != TRUE )
X  {
X    printf(" ERROR! Cannot store Key4 !\n");
X    return( 0 );
X  }else{
X    printf("Ok.... Key4 stored in the hash table. \n");
X  }
X
X  if( test_xhash->put( hashkey("Key4"), (void*)"Key4-2",
X		HASH_NOREPLACE) != TRUE )
X  {
X    printf(" ERROR! Cannot use HASH_NOREPLACE !\n");
X    return( 0 ); 
X  }else{
X    printf("Ok.... Replacement prevention works. \n");
X  }
X
X  if( test_xhash->put( hashkey("Key4"), (void*)"Key4",
X		HASH_REPLACE) != TRUE )
X  {
X    printf(" ERROR! Cannot replace keys !\n");
X    return( 0 );
X  }else{
X    printf("Ok.... Replacement of keys works. \n");
X  }
X
X  if( test_xhash->put( hashkey("zzz"), (void*)"zzz",
X		HASH_NOADD) != FALSE )
X  {
X    printf(" ERROR! Cannot use HASH_NOADD !\n");
X    return( 0 );
X  }else{
X    printf("Ok.... Replace only mode works. \n");
X  }
X
X  if( test_xhash->put( hashkey("Key4"), (void*)"Key4",
X		HASH_NODUP) != FALSE )
X  {
X    printf(" ERROR! Cannot prevent key duplicates !\n");
X    return( 0 );
X  }else{
X    printf("Ok.... Duplicate key prevention works. \n");
X  }
X
X  testchar = (char * )test_xhash->get( hashkey("Key4"), HASH_GET );
X  if( testchar == NULL ){
X    printf("ERROR: get_xhash failed with the HASH_GET flag!\n");
X    return( 0 );
X  }else{
X    test = strcmp( "Key4", testchar );
X    if( test == 0 ){
X      printf("Ok.... Getting data from hash table works fine.\n");
X    }else{
X      printf("ERROR: get() returned \"%s\" should have been \"Key4\" !\n");
X      return( 0 );
X    }
X  }
X
X  testchar = (char * )test_xhash->get( hashkey("Key4"),	HASH_GET_NEXT );
X  if( testchar == NULL ){
X    printf("ERROR: get_xhash failed with the HASH_GET_NEXT flag!\n");
X    return( 0 );
X  }else{
X    test = strcmp( "Key4-2", testchar );
X    if( test == 0 ){
X      printf("Ok.... Getting secondary data from hash table works fine.\n");
X    }else{
X      printf(
X	  "ERROR: get_xhash returned \"%s\" should have been \"Key4-2\" !\n");
X      return( 0 );
X    }
X  }
X
X  if( test_xhash->del( hashkey("Key3"),HASH_DELETE) != TRUE ){
X    printf(" ERROR! Cannot delete keys !\n");
X    return( 0 );
X  }else{
X    testchar = (char * )test_xhash->get( hashkey("Key3"),HASH_GET_NEXT );
X    if(testchar != NULL){
X      printf(" ERROR! Cannot delete keys !\n");
X      return( 0 );
X    }
X    printf("Ok.... Deletion of keys works. \n");
X  }
X
X  if( test_xhash->del( hashkey("Key4"), HASH_DELETE_ALL) == FALSE ){
X    printf(" ERROR! Cannot delete multiple keys !\n");
X    return( 0 );
X  }else{
X    testchar = (char * )test_xhash->get( hashkey("Key4"),HASH_GET );
X    if(testchar != NULL){
X      printf(" ERROR! Cannot delete multiple keys on read! %s\n", testchar);
X      return( 0 );
X    }
X    printf("Ok.... Deletion of multiple keys works. \n");
X  }
X
X}
X
X#endif 
X
X
X
X
X
X
SHAR_EOF
chmod 0440 src/testhash.c || echo "restore of src/testhash.c fails"
if [ $TOUCH = can ]
then
    touch -am 0418223391 src/testhash.c
fi
# ============= src/testlist.c ==============
echo "x - extracting src/testlist.c (Text)"
sed 's/^X//' << 'SHAR_EOF' > src/testlist.c &&
X/* 
X
X   Doubly linked list test file : 
X
X	testlist.c 4/18/91 1.4
X
X*/
X
X/*
X
XThis text in this file is copyright (c) 1991 by Kenneth Jamieson.
X
XThe author may be reached at the US MAIL address listed below, or
Xby sending unix mail to ...
X
X           tron1@tronsbox.xei.com            or
X	   ...!uunet!tronsbox.xei.com!tron1  or
X	   yelling "Hey Ken!" if you happen to be close enough.
X
X
X	   SEE THE FILE "sharew.h" for details before you
X	   use this code !!!
X
X*/
X
X#include <copyr.h>
X#include <x_list.h>
X#include <stdio.h>
X#include <stdlib.h>
X
X#ifndef __cplusplus
X
X/* Not C++ -- so test the regular C functions */
X
Xint main(){
X  struct x_list * test_xlist;
X  int loop;
X  int * foo;
X
X  printf("\ntestit - a testing program for the x_list list\n");
X  printf("         manager. testit.c  testit.c 1.3 3/3/91 \n\n");
X
X
X  /* Let's create the list that we will play with */
X  test_xlist = init_xlist();
X  if( test_xlist == NULL ){
X    fprintf(stderr,"There is an error in the init_xlist() function!\n");
X    return( FALSE );
X  }else{
X    printf("\nOk.... init_xlist() seems to be working ok!\n");
X  }
X
X  /* Let's set the user pointer just to play with !	*/
X  if( set_user_xlist( test_xlist, "User data test!" ) == FALSE ){
X    fprintf(stderr,"Error in the set_user_xlist() function!\n");
X  }else{
X    printf("Ok.... set_user_xlist() seems to be working ok!\n");
X  }
X
X  /* Let's get the user pointer just to play with !	*/
X  if( get_user_xlist( test_xlist ) == NULL ){
X    fprintf(stderr,"Error in the get_user_xlist() function!\n");
X    return( FALSE );
X  }else{
X    printf("Ok.... get_user_xlist() seems to be working ok!\n");
X  }
X
X  /* Add 100 integers to the list just for fun !	*/
X  for( loop = 0; loop < 100; loop++ ){
X    foo = (int *)malloc( sizeof(int) );
X    if( foo == NULL ){
X      fprintf(stderr,"Malloc error on test insert #%d !\n", loop);
X      return( FALSE );
X    }
X    *foo = loop;
X    if( add_xlist( test_xlist, foo ) == FALSE ){
X      fprintf(stderr,"add_xlist() error on test insert #%d !\n", loop);
X      return( FALSE );
X    }
X  }
X  
X  /* Now .. see that the counter got set right! */
X  if( get_count_xlist( test_xlist ) != 100 ){
X    fprintf(stderr,"get_count_xlist() error! Said #%d, should be 100 !\n",
X	    get_count_xlist( test_xlist ) );
X    return( FALSE );
X  }else{
X    printf("Ok.... get_count_xlist() seams to be working ok!\n");
X  }
X
X  /* Now, reset the list to the end ! */
X  if( tail_xlist( test_xlist ) == FALSE ){
X    fprintf(stderr,"tail_xlist() error !\n", loop);
X    return( FALSE );
X  }else{
X    printf("Ok.... tail_xlist() seems to be working!\n");
X  }
X
X  /* Now, reset the list to the top ! */
X  if( head_xlist( test_xlist ) == FALSE ){
X    fprintf(stderr,"head_xlist() error !\n", loop);
X    return( FALSE );
X  }else{
X    printf("Ok.... head_xlist() seems to be working!\n");
X  }
X
X  /* Now, let's retrieve all that data and make sure that it is right ! */
X  for( loop = 0; loop < 100; loop++ ){
X    foo = (int *)get_xlist( test_xlist ); 
X    if( foo == NULL ){
X      fprintf(stderr,"get_xlist() error on test retrieve #%d !\n", loop);
X      return( FALSE );
X    }
X    if( *foo != loop ){
X      fprintf(stderr,"get_xlist() error on test retrieve #%d !\n", loop);
X      return( FALSE );
X    }
X    if( get_nodenum_xlist( test_xlist ) != loop ){
X      fprintf(stderr,
X	      "get_nodenum_xlist() error on test retrieve #%d !\n", loop);
X    }
X    if( next_xlist( test_xlist ) == FALSE && loop != 99 ){
X      fprintf(stderr,"next_xlist() error on test retrieve #%d !\n", loop);
X      return( FALSE );
X    }
X  }
X  
X  printf("Ok.... 100 retrieves went ok, next_xlist() is working fine !\n");
X
X  /* Now, let's retrieve all that data and make sure that it is right ! */
X  for( loop = 99; loop > -1; loop-- ){
X    foo = (int *)get_xlist( test_xlist ); 
X    if( foo == NULL ){
X      fprintf(stderr,"get_xlist() error on test retrieve #%d !\n", loop);
X      return( FALSE );
X    }
X    if( *foo != loop ){
X      fprintf(stderr,"get_xlist() error on test retrieve #%d !\n", loop);
X      return( FALSE );
X    }
X    if( get_nodenum_xlist( test_xlist ) != loop ){
X      fprintf(stderr,
X	      "get_nodenum_xlist() error on test retrieve #%d !\n", loop);
X    }
X    if( prev_xlist( test_xlist ) == FALSE && loop != 0 ){
X      fprintf(stderr,"prev_xlist() error on test retrieve #%d !\n", loop);
X      return( FALSE );
X    }
X  }
X  
X  printf("Ok.... 100 retrieves went ok, prev_xlist() is working fine !\n");
X
X  if( goto_xlist( test_xlist, 50 ) == FALSE ){
X      fprintf(stderr,"goto_xlist() error  !\n");
X      return( FALSE );    
X  }
X  foo = (int *)get_xlist( test_xlist ); 
X  if( foo == NULL ){
X    fprintf(stderr,
X	    "get_xlist() error on retrieve for goto_xlist() !\n");
X    return( FALSE );
X  }
X  if( *foo != 50 ){
X    fprintf(stderr,
X	    "get_xlist() error on retrieve for goto_xlist() !\n");
X    return( FALSE );
X  }  
X  printf("Ok.... goto_xlist() seems to be working fine !\n");
X
X  if( get_nodenum_xlist( test_xlist ) != 50 ){
X    fprintf(stderr,
X	    "get_nodenum_xlist() error (does not match)! \n");
X    return( FALSE );
X  }
X  printf("Ok.... get_nodenum_xlist() seems to be working ok! \n");
X
X
X  if( free_xlist( test_xlist ) == FALSE ){
X    fprintf(stderr,"free_xlist() error !!! \n");
X    return( FALSE );
X  }else{
X    printf("Ok.... free_xlist() seems to be working! \n");
X  }
X
X  printf("\nAll tests passed ! Congratulations !\n\n");
X  return( TRUE );
X}
X
X#endif
X
X#ifdef __cplusplus
X
X/*  C++ -- so test the C++ functions */
X
Xint main(){
X  X_List test_xlist;
X  int loop;
X  int * foo;
X
X  printf("\ntestit - a testing program for the x_list list\n");
X  printf("         manager (C++ version). testit.c testit.c 1.3 3/3/91\n\n");
X
X  /* Let's set the user pointer just to play with !	*/
X  if( test_xlist.set_user( "User data test!" ) == FALSE ){
X    fprintf(stderr,"Error in the X_List.set_user() function!\n");
X  }else{
X    printf("Ok.... X_List.set_user() seems to be working ok!\n");
X  }
X
X  /* Let's get the user pointer just to play with !	*/
X  if( test_xlist.get_user() == NULL ){
X    fprintf(stderr,"Error in the X_List.get_user() function!\n");
X    return( FALSE );
X  }else{
X    printf("Ok.... X_List.get_user() seems to be working ok!\n");
X  }
X
X  /* Add 100 integers to the list just for fun !	*/
X  for( loop = 0; loop < 100; loop++ ){
X    foo = (int *)malloc( sizeof(int) );
X    if( foo == NULL ){
X      fprintf(stderr,"Malloc error on test insert #%d !\n", loop);
X      return( FALSE );
X    }
X    *foo = loop;
X    if( test_xlist.add( foo ) == FALSE ){
X      fprintf(stderr,"X_List.add() error on test insert #%d !\n", loop);
X      return( FALSE );
X    }
X  }
X  
X  /* Now .. see that the counter got set right! */
X  if( test_xlist.count() != 100 ){
X    fprintf(stderr,"X_List.count() error! Said #%d, should be 100 !\n",
X	    test_xlist.count() );
X    return( FALSE );
X  }else{
X    printf("Ok.... X_List.count() seams to be working ok!\n");
X  }
X
X  /* Now, reset the list to the top ! */
X  if( test_xlist.head() == FALSE ){
X    fprintf(stderr,"X_List.head() error !\n", loop);
X    return( FALSE );
X  }else{
X    printf("Ok.... X_List.head() seems to be working!\n");
X  }
X
X  /* Now, let's retrieve all that data and make sure that it is right ! */
X  for( loop = 0; loop < 100; loop++ ){
X    foo = (int *)test_xlist.get(); 
X    if( foo == NULL ){
X      fprintf(stderr,"X_List.get() error on test retrieve #%d !\n", loop);
X      return( FALSE );
X    }
X    if( *foo != loop ){
X      fprintf(stderr,"X_List.get() error on test retrieve #%d !\n", loop);
X      return( FALSE );
X    }
X    if( test_xlist.next() == FALSE && loop != 99 ){
X      fprintf(stderr,"X_List.next() error on test retrieve #%d !\n", loop);
X      return( FALSE );
X    }
X  }
X  
X  printf("Ok.... 100 retrieves went ok, X_List.next() is working fine !\n");
X
X  /* Now, let's retrieve all that data and make sure that it is right ! */
X  for( loop = 99; loop > -1; loop-- ){
X    foo = (int *)test_xlist.get(); 
X    if( foo == NULL ){
X      fprintf(stderr,"X_List.get() error on test retrieve #%d !\n", loop);
X      return( FALSE );
X    }
X    if( *foo != loop ){
X      fprintf(stderr,"X_List.get() error on test retrieve #%d !\n", loop);
X      return( FALSE );
X    }
X    if( test_xlist.prev() == FALSE && loop != 0 ){
X      fprintf(stderr,"X_List.prev() error on test retrieve #%d !\n", loop);
X      return( FALSE );
X    }
X  }
X  
X  printf("Ok.... 100 retrieves went ok, X_List.prev() is working fine !\n");
X
X  /* Now, let's retrieve it with the [] operator ! */
X  for( loop = 99; loop > -1; loop-- ){
X    foo = (int *)test_xlist[loop]; 
X    if( foo == NULL ){
X      fprintf(stderr,"X_List operator [] error on #%d !\n", loop);
X      return( FALSE );
X    }
X    if( *foo != loop ){
X      fprintf(stderr,"X_List operator [] error on #%d !\n", loop);
X      return( FALSE );
X    }
X    if( test_xlist.nodenum() != loop ){
X      fprintf(stderr,"X_List.nodenum() error on #%d!\n", loop);
X    }
X  }
X  printf("Ok.... X_List.goto_node() seems to work ok!\n");
X  printf("Ok.... X_List.nodenum() seems to work ok!\n");
X  printf("Ok.... the operator [] seems to work ok!\n");
X  
X  printf("\nAll tests passed ! Congratulations !\n\n");
X  return( TRUE );
X}
X
X#endif
X
X
SHAR_EOF
chmod 0440 src/testlist.c || echo "restore of src/testlist.c fails"
if [ $TOUCH = can ]
then
    touch -am 0418223391 src/testlist.c
fi
# ============= src/x_hash.c ==============
echo "x - extracting src/x_hash.c (Text)"
sed 's/^X//' << 'SHAR_EOF' > src/x_hash.c &&
X/* 
X
X   Hash table function file : 
X
X         x_hash.c 1.1 4/18/91 
X
X*/
X
X/*
X
XThis text in this file is copyright (c) 1991 by Kenneth Jamieson.
X
XThe author may be reached at the US MAIL address listed below, or
Xby sending unix mail to ...
X
X           tron1@tronsbox.xei.com            or
X	   ...!uunet!tronsbox.xei.com!tron1  or
X	   yelling "Hey Ken!" if you happen to be close enough.
X
X
X	   SEE THE FILE "sharew.h" for details before you
X	   use this code !!!
X
X*/
X
X
X#include <string.h>
X#include <malloc.h>
X#include <memory.h>
X#include <x_hash.h>
X
Xlong hashkey( char * key ){
X  long hash = 0;
X  long i = 0;
X  long slen = 0;
X
X  slen = strlen( key );
X
X  if( key == NULL || slen == 0 ){
X    return( (long)NULL );
X  }
X
X  for( i = 0; i < slen; i++ ){
X    hash = hash - (int)*(key+i);
X    hash = hash << 1;
X  }
X  if( hash < 0 ){
X    hash = hash * -1;
X  }
X  return( hash );
X}
X    
Xlong indexhash( long key, long range ){
X  long index;
X
X  if( key == 0 || range == 0 ){
X    return( NULL );
X  }
X  index = key % range;
X  return( index );
X}
X
Xlong hashsize( struct x_hash * table ){
X  if( table == NULL ){
X    return( FALSE );
X  }
X  return( table->table_size );
X}
X
Xstruct x_hash * init_xhash( long initial_size ){
X  struct x_hash * tmp1;
X  struct x_list ** tmp2;
X  int loop;
X
X  tmp1 = (struct x_hash *)malloc( sizeof( struct x_hash ) );
X  if( tmp1 == NULL ){
X    return( NULL );
X  }
X
X  tmp2 = (struct x_list **)malloc( (unsigned int)initial_size*sizeof(struct x_list *) );
X  if( tmp2 == NULL ){
X    return( NULL );
X  }
X
X  for( loop = 0; loop < initial_size; loop ++){
X    tmp2[loop] = init_xlist();
X  }
X  tmp1->table_size = initial_size;
X  tmp1->table_pointer = tmp2;
X  tmp1->additions = 0;
X  tmp1->collisions = 0;
X  tmp1->replaces = 0;
X  
X  return( tmp1 );
X}
X
Xstruct x_hash_entry * init_xhash_entry(){
X  struct x_hash_entry * foo;
X  foo = (struct x_hash_entry *)malloc( sizeof(struct x_hash_entry) );
X  foo->key_value = 0;
X  foo->data = NULL;
X  return( foo );
X}
X
Xint put_xhash( struct x_hash * table, long key, void * data, int hash_flag ){
X  struct x_hash_entry *entry;
X  struct x_hash_entry *buffer;
X  long foo;
X  long subscript;
X
X  if( table == NULL ){
X    return( FALSE );
X  }
X
X  entry = init_xhash_entry();
X  if( entry == NULL ){
X    return( FALSE );
X  }
X  entry->key_value = key;
X                         /* Set key value of new data	*/
X  entry->data = data;		
X                         /* Set data pointer to data	*/
X
X  subscript = indexhash( key, table->table_size );
X
X  switch( hash_flag ){
X    case HASH_NOREPLACE:  return( 
X				 add_xlist( table->table_pointer[subscript], 
X					   (void *)entry ) 
X				 );
X                          break;
X
X    case HASH_REPLACE:    head_xlist( table->table_pointer[subscript] );
X                          buffer = (struct x_hash_entry *)
X			    get_xlist( table->table_pointer[subscript] );
X                          while( 1 ){
X			    if( buffer == NULL ){
X			          /* No table entries ! add it */
X			      return( add_xlist( 
X					table->table_pointer[subscript], 
X						(void *)entry ) );
X			    }
X			    if( buffer->key_value == entry->key_value ){
X			      /* Replace it !!!            */
X			      return( put_xlist( 
X					table->table_pointer[subscript], 
X						(void *)entry ) );
X			    }
X			    foo = next_xlist(table->table_pointer[subscript] );
X			    if( foo == FALSE ){
X					  /* End of list!   */
X			      return(add_xlist(table->table_pointer[subscript],
X					       (void *)entry ) );
X			    }
X			  }
X                          break;
X
X    case HASH_NODUP:    head_xlist( table->table_pointer[subscript] );
X                          buffer = 
X			    (struct x_hash_entry *)
X			      get_xlist( table->table_pointer[subscript] );
X                          while( 1 ){
X			    if( buffer == NULL ){
X			          /* No table entries ! add it */
X			      return(add_xlist(table->table_pointer[subscript],
X					       (void *)entry ) );
X			    }
X			    if( buffer->key_value == entry->key_value ){
X			      /* Replace it !!!            */
X			      return( FALSE );
X			    }
X			    foo = next_xlist(table->table_pointer[subscript] );
X			    if( foo == FALSE ){
X					  /* End of list!   */
X			      return(add_xlist(table->table_pointer[subscript],
X					       (void *)entry ) );
X			    }
X			  }
X                          break;
X
X    case HASH_NOADD:    head_xlist( table->table_pointer[subscript] );
X                          buffer = (struct x_hash_entry *)
X			    get_xlist( table->table_pointer[subscript] );
X                          while( 1 ){
X			    if( buffer == NULL ){
X			          /* No table entries ! add it */
X			      return( FALSE );
X			    }
X			    if( buffer->key_value == entry->key_value ){
X			      /* Replace it !!!            */
X			      return(put_xlist(table->table_pointer[subscript],
X					       (void *)entry ) );
X			    }
X			    foo = next_xlist(table->table_pointer[subscript] );
X			    if( foo == FALSE ){
X			      /* End of list!   */
X			      return( FALSE );
X			    }
X			  }
X                          break;
X
X    default:		return( FALSE );
X                        break;
X    }
X
X}
X
Xvoid * get_xhash( struct x_hash * table, long key, int hash_flag ){
X  struct x_hash_entry *buffer;
X  long foo;
X  long subscript;
X
X  if( table == NULL ){
X    return( NULL );
X  }
X
X  subscript = indexhash( key, table->table_size );
X
X  switch( hash_flag ){
X    case HASH_GET:    head_xlist( table->table_pointer[subscript] );
X                          buffer = (struct x_hash_entry *)
X			    get_xlist( table->table_pointer[subscript] );
X                          while( 1 ){
X			    if( buffer == NULL ){
X			          /* No table entries ! */
X			      return( NULL );
X			    }
X			    if( buffer->key_value == key ){
X			      /* Return  it !!!     */
X			      return( buffer->data );
X			    }
X			    foo = next_xlist(table->table_pointer[subscript] );
X			    if( foo == FALSE ){	
X				  /* End of list!   */
X			      return( NULL );
X			    }
X			  }
X                          break;
X
X    case HASH_GET_NEXT:	  /*NOTICE: We do NOT reset the list this time !!!!! */
X			  foo = next_xlist( table->table_pointer[subscript] );
X                          while( 1 ){
X			    if( foo == FALSE ){
X					  /* End of list!   */
X			      return( NULL );
X			    }
X                            buffer = (struct x_hash_entry *)
X			      get_xlist( table->table_pointer[subscript] );
X			    if( buffer == NULL ){
X			          /* No table entries ! */
X			      return( NULL );
X			    }
X			    if( buffer->key_value == key ){
X			      /* Return  it !!!     */
X			      return( buffer->data );
X			    }
X			    foo = next_xlist(table->table_pointer[subscript] );
X			  }
X                          break;
X
X    default:		return( NULL );
X                        break;
X    }
X
X}
X
Xstruct x_hash * resize_xhash( struct x_hash * table, long new_size ){
X  struct x_hash * new_table;
X  struct x_hash_entry * buffer;
X  long loop;
X
X  new_table = init_xhash( new_size );
X  if( new_table == NULL ){
X    return( NULL );
X  }
X  for( loop = 0; loop < table->table_size ; loop++ ){
X    if( head_xlist( table->table_pointer[loop] ) != FALSE ){
X      buffer = (struct x_hash_entry *)get_xlist( table->table_pointer[loop] );
X      if( buffer == NULL ){	/* Should never happen! */
X	return( NULL );
X      }
X      if( put_xhash(new_table,buffer->key_value, 
X		    buffer->data, HASH_NOREPLACE ) == FALSE ){
X	return( NULL );
X      }
X      while( next_xlist( table->table_pointer[loop] ) == TRUE ){
X	buffer = (struct x_hash_entry *)get_xlist(table->table_pointer[loop]);
X	if( buffer == NULL ){
X	  return( NULL );
X	}      
X	if( put_xhash( new_table, buffer->key_value, 
X		      buffer->data, HASH_NOREPLACE ) == FALSE ){
X	  return( NULL );
X	}      
X      }
X    }  /* If reset_xhash != FALSE .. this list has at least one entry */
X  }
X  return( new_table );
X}
X
Xint del_xhash( struct x_hash * table, long key, int hash_flag ){
X  int retval;
X  struct x_hash_entry *buffer;
X  long foo;
X  long subscript;
X
X  retval = FALSE;
X  if( table == NULL ){
X    return( FALSE );
X  }
X  subscript = indexhash( key, table->table_size );
X  switch( hash_flag ){
X    case HASH_DELETE:    head_xlist( table->table_pointer[subscript] );
X                          buffer = (struct x_hash_entry *)
X			    get_xlist( table->table_pointer[subscript] );
X                          while( 1 ){
X			    if( buffer == NULL ){
X			          /* No table entries ! */
X			      return( FALSE );
X			    }
X			    if( buffer->key_value == key ){
X			      /* Delete  it !!!     */
X			      return( 
X				     del_xlist(table->table_pointer[subscript])
X				     );
X			    }
X			    foo = next_xlist(table->table_pointer[subscript] );
X			    if( foo == FALSE ){	
X				  /* End of list!   */
X			      return( FALSE );
X			    }
X			  }
X                          break;
X    case HASH_DELETE_ALL:  
X                          while( del_xhash( table, key, HASH_DELETE )
X				== TRUE ){
X			    retval++;
X			  }
X                          return( retval );
X                          break;
X    default:	return( FALSE );
X                break;
X    }
X}
X
Xint set_user_xhash( struct x_hash * table, void * user_data){
X  if( table == NULL ){
X    return( NULL );
X  }
X  table->user = user_data;
X  return(TRUE);
X}
X
Xvoid *get_user_xhash( struct x_hash * table ){
X  if( table == NULL ){
X    return( NULL );
X  }
X  return( table->user );
X}
X
X#ifdef __cplusplus
X
XX_Hash::X_Hash( long isize ){
X  hash = init_xhash( isize );
X}
X
XX_Hash::X_Hash( void * name, long isize ){
X  hash = init_xhash( isize );
X  if( hash != NULL ){
X    set_user_xhash( hash, name );
X  }
X}
X
Xlong X_Hash::size(){
X  if( hash != NULL ){
X     return( hashsize( hash ) );
X  }
X  return( NULL );
X}
X
Xint X_Hash::resize( long new_size ){
X  if( hash != NULL ){
X    hash = resize_xhash( hash, new_size );
X    if( hash != NULL ){
X      return( TRUE );
X    }
X  }
X  return( FALSE );
X}
X
Xvoid * X_Hash::get( long key, int hash_flag ){
X  if( hash != NULL ){
X    return( get_xhash( hash, key, hash_flag ) );
X  }
X  return( NULL );
X}
X
Xint X_Hash::put(  long key, void * new_data, int hash_flag ){
X  if( hash != NULL ){
X    return( put_xhash( hash, key, new_data, hash_flag ) );
X  }
X  return( FALSE );
X}
X
Xint X_Hash::del( long key, int hash_flag ){
X  if( hash != NULL ){
X    return( del_xhash( hash, key, hash_flag ) );
X  }
X    return( FALSE );
X}
X
Xint X_Hash::set_user( void * user_data ){
X  if( hash != NULL ){
X    return( set_user_xhash( hash, user_data ) );
X  }
X  return( FALSE );
X}
X
Xvoid *X_Hash::get_user(){
X  if( hash != NULL ){
X    return( get_user_xhash( hash ) );
X  }
X  return( FALSE );
X}
X
X#endif
X
X
X
X
X
X
X
X
X
X
X
X
X
X
X
X
SHAR_EOF
chmod 0440 src/x_hash.c || echo "restore of src/x_hash.c fails"
if [ $TOUCH = can ]
then
    touch -am 0418223391 src/x_hash.c
fi
# ============= src/x_hash.h ==============
echo "x - extracting src/x_hash.h (Text)"
sed 's/^X//' << 'SHAR_EOF' > src/x_hash.h &&
X/* 
X
X   Hash table header file : 
X
X         x_hash.h 1.1 4/18/91 
X
X*/
X
X/*
X
XThis text in this file is copyright (c) 1991 by Kenneth Jamieson.
X
XThe author may be reached at the US MAIL address listed below, or
Xby sending unix mail to ...
X
X           tron1@tronsbox.xei.com            or
X	   ...!uunet!tronsbox.xei.com!tron1  or
X	   yelling "Hey Ken!" if you happen to be close enough.
X
X
X	   SEE THE FILE "sharew.h" for details before you
X	   use this code !!!
X
X*/
X
X
X#ifndef _xei_hash_h
X#define _xei_hash_h
X
X#include <string.h>
X#include <stdio.h>
X#include <x_list.h>
X
X#define HASH_NODUP 1
X#define HASH_REPLACE 2
X#define HASH_NOREPLACE 3
X#define HASH_NOADD 4
X#define HASH_GET 5
X#define HASH_GET_NEXT 6
X#define HASH_DELETE 7
X#define HASH_DELETE_ALL 8
X
Xstruct x_hash_entry {
X  long key_value;
X  void * data;
X};
X
Xstruct x_hash {
X  void * data;	
X  void * user;
X  long table_size;
X  struct x_list ** table_pointer;
X  long additions;
X  long collisions;
X  long replaces;
X};
X
Xlong hashkey( char * key );
Xlong indexhash( long key, long range );
Xlong hashsize( struct x_hash * table );
Xstruct x_hash * init_xhash( long initial_size );
Xstruct x_hash_entry * init_xhash_entry();
Xstruct x_hash * resize_xhash( struct x_hash * table, long new_size );
Xvoid * get_xhash( struct x_hash * table, long key, int hash_flag );
Xint put_xhash( struct x_hash * table, long key, void * data, int hash_flag);
Xint del_xhash( struct x_hash * table, long key, int hash_flag );
Xint set_user_xhash( struct xhash * table, void * user_data );
Xvoid * get_user_xhash( struct x_hash * table );
X
X#ifdef __cplusplus
X/* C++ Header files here -- class definitions and so on */
X
Xclass X_Hash{
X  struct x_hash * hash;		/* The private hash structure */
X public:
X  X_Hash( long isize = 1001 );
X  X_Hash( void * name , long isize = 1001);
X  long size();
X  int resize( long new_size );
X  void * get( long key, int hash_flag = HASH_GET );
X  int put( long key, void * new_data, int hash_flag = HASH_REPLACE );
X  int del( long key, int hash_flag );
X  int set_user( void * user_data );
X  void *get_user();
X};
X
X#endif  
X
X#endif
X
X
X
SHAR_EOF
chmod 0440 src/x_hash.h || echo "restore of src/x_hash.h fails"
if [ $TOUCH = can ]
then
    touch -am 0418223391 src/x_hash.h
fi
# ============= src/x_list.c ==============
echo "x - extracting src/x_list.c (Text)"
sed 's/^X//' << 'SHAR_EOF' > src/x_list.c &&
X/* 
X
X   Doubly linked list function file : 
X
X         x_list.c 1.1 4/18/91 
X
X*/
X
X/*
X
XThis text in this file is copyright (c) 1991 by Kenneth Jamieson.
X
XThe author may be reached at the US MAIL address listed below, or
Xby sending unix mail to ...
X
X           tron1@tronsbox.xei.com            or
X	   ...!uunet!tronsbox.xei.com!tron1  or
X	   yelling "Hey Ken!" if you happen to be close enough.
X
X
X	   SEE THE FILE "sharew.h" for details before you
X	   use this code !!!
X
X*/
X
X
X#include <copyr.h>
X#include <sharew.h>
X#include <x_list.h>
X#include <stdlib.h>
X
Xstruct x_list_entry * init_xlist_entry(){
X  struct x_list_entry * foo;
X  foo = (struct x_list_entry *)malloc( sizeof(struct x_list_entry) );
X  if( foo == NULL ){
X    return( foo );
X  }
X  foo->data = NULL;
X  foo->prev = NULL;
X  foo->next = NULL;
X  
X  return( foo );
X}
X
Xstruct x_list * init_xlist(){
X  struct x_list * foo;
X  foo = (struct x_list *)malloc( sizeof(struct x_list) );
X  if( foo == NULL ){
X    return( foo );
X  }
X  foo->data = NULL;
X  foo->first = NULL;
X  foo->current = NULL;
X  foo->last = NULL;
X  foo->count = 0;
X  foo->node = 0;
X
X  return( foo );
X}
X
Xint add_xlist( struct x_list * xlist, void * new_data ){
X  if( xlist == NULL ){
X    return( (int)FALSE );
X  }
X  if( xlist->first == NULL ){		/* Is this the first entry ??? */
X    xlist->first = init_xlist_entry();  /* Create a entry to add to list */
X    if( xlist->first == NULL ){         
X      return( (int)FALSE );                  /* If we can't, fail             */
X    }
X    xlist->first->data = new_data;	/* Set the data pointer for the user */
X    xlist->current = xlist->first;	/* The first item is the current one!*/
X    xlist->last = xlist->first;		/* It is also the last !! 	     */
X    xlist->count = 1;			/* There is one item in the list     */
X    xlist->node = 0;			/* Just to be sure !		     */
X    return( (int)TRUE );
X  }
X
X  xlist->last->next = init_xlist_entry(); /* Add a new node at end of list */
X  if( xlist->first == NULL ){
X    return( (int)FALSE );			  /* If we can't, fail */
X  }  
X  xlist->last->next->prev = xlist->last;	/* Set parent of new node */
X  xlist->last->next->data = new_data;		/* Set data of new node   */
X  xlist->last = xlist->last->next;		/* Set pointer to last node*/
X  xlist->current = xlist->last;			/* Set the current pointer */
X  xlist->count = xlist->count+1;		/* Set the counter      */
X  xlist->node = xlist->count - 1;		/* Hehehehe		*/
X  return( (int)TRUE );
X}
X
Xvoid * get_xlist( struct x_list * xlist ){
X  if( xlist == NULL ){
X    return( NULL );				/* if list pointer is bad */
X  }
X  if( xlist->current == NULL ){
X    return( NULL );				/* if list is empty       */
X  }
X  return( xlist->current->data );               /* Return the data        */
X}
X
Xint head_xlist( struct x_list * xlist ){
X  if( xlist == NULL ){
X    return( (int)FALSE );				/* if list pointer is bad */
X  }						                            
X  if( xlist->first == NULL ){			                            
X    return( (int)FALSE );				/* if list is empty       */
X  }						                            
X  xlist->current = xlist->first;		/* reset the current pointer*/
X  xlist->node = 0;				/* Reset node number */
X  return( (int)TRUE );
X}
X
Xint put_xlist( struct x_list * xlist, void * new_data ){
X  if( xlist == NULL ){
X    return( (int)FALSE );				/* if list pointer is bad */
X  }						                            
X  if( xlist->current == NULL ){			                            
X    return( (int)FALSE );				/* if list is empty       */
X  }						                            
X  xlist->current->data = new_data;		/* replace the data        */
X  return( (int)TRUE );
X}
X
Xint del_xlist( struct x_list * xlist ){
X  struct x_list_entry * foo;
X  if( xlist == NULL ){
X    return( (int)FALSE );	                    /* if list pointer is bad */
X  }					                                
X  if( xlist->current == NULL ){		                                
X    return( (int)FALSE );			    /* if list is empty       */
X  }					                                
X  foo = xlist->current;			    
X  if( foo->prev != NULL ){			/* Is this the head ? */
X    foo->prev->next = foo->next; /* Set the child of our parent to pur child */
X  }else{			
X    xlist->first = foo->next;    /* We are the head, reset first when we go  */
X  }
X  if( foo->next != NULL ){		/* Are we the tail ?  */
X    foo->next->prev = foo->prev;	/* Set childs parent to our parent  */
X    xlist->current = foo->next;		/* Set the current to our child	    */
X  }else{
X    xlist->current = foo->prev;		/* Set current to parent if no child*/
X    xlist->last = foo->next;		/* Reset the last pointer           */
X  }
X  xlist->count = xlist->count -1;	/* Decrement the counter            */
X  free((char *)foo);				/* Free the data		    */
X  return( (int)TRUE );
X}
X
Xint next_xlist( struct x_list * xlist ){
X  if( xlist == NULL ){
X    return( (int)FALSE );			 /* if list pointer is bad */
X  }					                             
X  if( xlist->current == NULL ){		                             
X    return( (int)FALSE );			 /* if list is empty       */
X  }
X  if( xlist->current->next == NULL ){
X    return( (int)FALSE );		 /* At end of list, can't advance */
X  }
X  xlist->current = xlist->current->next; /* Advance current pointer       */
X  xlist->node = xlist->node + 1; 
X  return( (int)TRUE );
X}
X
Xint prev_xlist( struct x_list * xlist ){
X  if( xlist == NULL ){
X    return( (int)FALSE );			 /* if list pointer is bad */
X  }					                             
X  if( xlist->current == NULL ){		                             
X    return( (int)FALSE );			 /* if list is empty       */
X  }
X  if( xlist->current->prev == NULL ){
X    return( (int)FALSE );			 /* If we are at the start */
X  }
X  xlist->current = xlist->current->prev; /* Move the pointer back  */
X  xlist->node = xlist->node - 1;		 /* Decrement the node */
X  return( (int)TRUE );
SHAR_EOF
echo "End of X_HASH part 1"
echo "File src/x_list.c is continued in part 2"
echo "2" > s3_seq_.tmp
exit 0
