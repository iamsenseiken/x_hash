/* 

   Hash table test file : 

          testhash.c 1.2 4/18/91  

*/

/*

This text in this file is copyright (c) 1991 by Kenneth Jamieson.

The author may be reached at the US MAIL address listed below, or
by sending unix mail to ...

           tron1@tronsbox.xei.com            or
	   ...!uunet!tronsbox.xei.com!tron1  or
	   yelling "Hey Ken!" if you happen to be close enough.


	   SEE THE FILE "sharew.h" for details before you
	   use this code !!!

*/

#include <copyr.h>
#include <x_hash.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Not C++ -- so test the regular C functions */

#define INITIAL 20
#define BIGGER 100

#ifndef __cplusplus

int main(){
  struct x_hash * test_xhash;
  int loop;
  int test;
  int * foo;
  char * testchar;

  printf("\ntestit - a testing program for the x_hash list\n");
  printf("         manager.  testhash.c 1.2 4/18/91  \n\n");

  test_xhash = init_xhash( INITIAL );
  if( test_xhash == NULL ){
    printf("ERROR! Cannot init_xhash of size %d.\n", INITIAL); 
    return( 0 );
  }else{
    printf("Ok.... Hash table initialized. \n");
  }

  if( hashsize( test_xhash ) != INITIAL ){
    printf("ERROR! Cannot hashsize error! Should be %d.\n", INITIAL); 
    return( 0 );
  }else{
    printf("Ok.... Hash table size correct. \n");
  }

  if( put_xhash( test_xhash, hashkey("Key1"), (void*)"Key1",
		HASH_REPLACE) != TRUE )
  {
    printf(" ERROR! Cannot store Key1 !\n");
    return( 0 );
  }else{
    printf("Ok.... Key1 stored in the hash table. \n");
  }

  if( put_xhash( test_xhash, hashkey("Key2"), (void*)"Key2",
		HASH_REPLACE) != TRUE )
  {
    printf(" ERROR! Cannot store Key2 !\n");
    return( 0 );
  }else{
    printf("Ok.... Key2 stored in the hash table. \n");
  }

  if( put_xhash( test_xhash, hashkey("Key3"), (void*)"Key3",
		HASH_REPLACE) != TRUE )
  {
    printf(" ERROR! Cannot store Key3 !\n");
    return( 0 );
  }else{
    printf("Ok.... Key3 stored in the hash table. \n");
  }

  if( put_xhash( test_xhash, hashkey("Key4"), (void*)"Key4",
		HASH_REPLACE) != TRUE )
  {
    printf(" ERROR! Cannot store Key4 !\n");
    return( 0 );
  }else{
    printf("Ok.... Key4 stored in the hash table. \n");
  }

  if( put_xhash( test_xhash, hashkey("Key4"), (void*)"Key4-2",
		HASH_NOREPLACE) != TRUE )
  {
    printf(" ERROR! Cannot use HASH_NOREPLACE !\n");
    return( 0 ); 
  }else{
    printf("Ok.... Replacement prevention works. \n");
  }

  if( put_xhash( test_xhash, hashkey("Key4"), (void*)"Key4",
		HASH_REPLACE) != TRUE )
  {
    printf(" ERROR! Cannot replace keys !\n");
    return( 0 );
  }else{
    printf("Ok.... Replacement of keys works. \n");
  }

  if( put_xhash( test_xhash, hashkey("zzz"), (void*)"zzz",
		HASH_NOADD) != FALSE )
  {
    printf(" ERROR! Cannot use HASH_NOADD !\n");
    return( 0 );
  }else{
    printf("Ok.... Replace only mode works. \n");
  }

  if( put_xhash( test_xhash, hashkey("Key4"), (void*)"Key4",
		HASH_NODUP) != FALSE )
  {
    printf(" ERROR! Cannot prevent key duplicates !\n");
    return( 0 );
  }else{
    printf("Ok.... Duplicate key prevention works. \n");
  }

  testchar = (char * )get_xhash( test_xhash, hashkey("Key4"), HASH_GET );
  if( testchar == NULL ){
    printf("ERROR: get_xhash failed with the HASH_GET flag!\n");
    return( 0 );
  }else{
    test = strcmp( "Key4", testchar );
    if( test == 0 ){
      printf("Ok.... Getting data from hash table works fine.\n");
    }else{
      printf("ERROR: get_xhash returned \"%s\" should have been \"Key4\" !\n");
      return( 0 );
    }
  }

  testchar = (char * )get_xhash( test_xhash, hashkey("Key4"),
				HASH_GET_NEXT );
  if( testchar == NULL ){
    printf("ERROR: get_xhash failed with the HASH_GET_NEXT flag!\n");
    return( 0 );
  }else{
    test = strcmp( "Key4-2", testchar );
    if( test == 0 ){
      printf("Ok.... Getting secondary data from hash table works fine.\n");
    }else{
      printf(
	  "ERROR: get_xhash returned \"%s\" should have been \"Key4-2\" !\n");
      return( 0 );
    }
  }

  if( del_xhash( test_xhash, hashkey("Key3"),HASH_DELETE) != TRUE ){
    printf(" ERROR! Cannot delete keys !\n");
    return( 0 );
  }else{
    testchar = (char * )get_xhash( test_xhash, hashkey("Key3"),
				HASH_GET_NEXT );
    if(testchar != NULL){
      printf(" ERROR! Cannot delete keys !\n");
      return( 0 );
    }
    printf("Ok.... Deletion of keys works. \n");
  }

  if( del_xhash( test_xhash, hashkey("Key4"), HASH_DELETE_ALL) == FALSE ){
    printf(" ERROR! Cannot delete multiple keys !\n");
    return( 0 );
  }else{
    testchar = (char * )get_xhash( test_xhash, hashkey("Key4"),
				HASH_GET );
    if(testchar != NULL){
      printf(" ERROR! Cannot delete multiple keys on read! %s\n", testchar);
      return( 0 );
    }
    printf("Ok.... Deletion of multiple keys works. \n");
  }


}

#endif
  
#ifdef __cplusplus

int main(){
  X_Hash *test_xhash;
  int test;
  char * testchar;

  printf("\ntesthash - a testing program for the x_hash list\n");
  printf("         manager. testhash.c 1.2 4/18/91  \n\n");
  printf("         TESTING C++ INTERFACE\n\n");

  test_xhash = new X_Hash( INITIAL );
  if( test_xhash == NULL ){
    printf("ERROR! Cannot construct a hash of size %d.\n", INITIAL); 
    return( 0 );
  }else{
    printf("Ok.... Hash table initialized. \n");
  }

  if( test_xhash->size() != INITIAL ){
    printf("ERROR! Cannot hashsize error! Should be %d.\n", INITIAL); 
    return( 0 );
  }else{
    printf("Ok.... Hash table size correct. \n");
  }

  if( test_xhash->put( hashkey("Key1"), (void*)"Key1",
		HASH_REPLACE) != TRUE )
  {
    printf(" ERROR! Cannot store Key1 !\n");
    return( 0 );
  }else{
    printf("Ok.... Key1 stored in the hash table. \n");
  }

  if( test_xhash->put( hashkey("Key2"), (void*)"Key2",
		HASH_REPLACE) != TRUE )
  {
    printf(" ERROR! Cannot store Key2 !\n");
    return( 0 );
  }else{
    printf("Ok.... Key2 stored in the hash table. \n");
  }

  if( test_xhash->put( hashkey("Key3"), (void*)"Key3",
		HASH_REPLACE) != TRUE )
  {
    printf(" ERROR! Cannot store Key3 !\n");
    return( 0 );
  }else{
    printf("Ok.... Key3 stored in the hash table. \n");
  }

  if( test_xhash->put( hashkey("Key4"), (void*)"Key4",
		HASH_REPLACE) != TRUE )
  {
    printf(" ERROR! Cannot store Key4 !\n");
    return( 0 );
  }else{
    printf("Ok.... Key4 stored in the hash table. \n");
  }

  if( test_xhash->put( hashkey("Key4"), (void*)"Key4-2",
		HASH_NOREPLACE) != TRUE )
  {
    printf(" ERROR! Cannot use HASH_NOREPLACE !\n");
    return( 0 ); 
  }else{
    printf("Ok.... Replacement prevention works. \n");
  }

  if( test_xhash->put( hashkey("Key4"), (void*)"Key4",
		HASH_REPLACE) != TRUE )
  {
    printf(" ERROR! Cannot replace keys !\n");
    return( 0 );
  }else{
    printf("Ok.... Replacement of keys works. \n");
  }

  if( test_xhash->put( hashkey("zzz"), (void*)"zzz",
		HASH_NOADD) != FALSE )
  {
    printf(" ERROR! Cannot use HASH_NOADD !\n");
    return( 0 );
  }else{
    printf("Ok.... Replace only mode works. \n");
  }

  if( test_xhash->put( hashkey("Key4"), (void*)"Key4",
		HASH_NODUP) != FALSE )
  {
    printf(" ERROR! Cannot prevent key duplicates !\n");
    return( 0 );
  }else{
    printf("Ok.... Duplicate key prevention works. \n");
  }

  testchar = (char * )test_xhash->get( hashkey("Key4"), HASH_GET );
  if( testchar == NULL ){
    printf("ERROR: get_xhash failed with the HASH_GET flag!\n");
    return( 0 );
  }else{
    test = strcmp( "Key4", testchar );
    if( test == 0 ){
      printf("Ok.... Getting data from hash table works fine.\n");
    }else{
      printf("ERROR: get() returned \"%s\" should have been \"Key4\" !\n");
      return( 0 );
    }
  }

  testchar = (char * )test_xhash->get( hashkey("Key4"),	HASH_GET_NEXT );
  if( testchar == NULL ){
    printf("ERROR: get_xhash failed with the HASH_GET_NEXT flag!\n");
    return( 0 );
  }else{
    test = strcmp( "Key4-2", testchar );
    if( test == 0 ){
      printf("Ok.... Getting secondary data from hash table works fine.\n");
    }else{
      printf(
	  "ERROR: get_xhash returned \"%s\" should have been \"Key4-2\" !\n");
      return( 0 );
    }
  }

  if( test_xhash->del( hashkey("Key3"),HASH_DELETE) != TRUE ){
    printf(" ERROR! Cannot delete keys !\n");
    return( 0 );
  }else{
    testchar = (char * )test_xhash->get( hashkey("Key3"),HASH_GET_NEXT );
    if(testchar != NULL){
      printf(" ERROR! Cannot delete keys !\n");
      return( 0 );
    }
    printf("Ok.... Deletion of keys works. \n");
  }

  if( test_xhash->del( hashkey("Key4"), HASH_DELETE_ALL) == FALSE ){
    printf(" ERROR! Cannot delete multiple keys !\n");
    return( 0 );
  }else{
    testchar = (char * )test_xhash->get( hashkey("Key4"),HASH_GET );
    if(testchar != NULL){
      printf(" ERROR! Cannot delete multiple keys on read! %s\n", testchar);
      return( 0 );
    }
    printf("Ok.... Deletion of multiple keys works. \n");
  }

}

#endif 






