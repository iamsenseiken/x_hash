/* 

   Hash table header file : 

         x_hash.h 1.1 4/18/91 

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


#ifndef _xei_hash_h
#define _xei_hash_h

#include <string.h>
#include <stdio.h>
#include <x_list.h>

#define HASH_NODUP 1
#define HASH_REPLACE 2
#define HASH_NOREPLACE 3
#define HASH_NOADD 4
#define HASH_GET 5
#define HASH_GET_NEXT 6
#define HASH_DELETE 7
#define HASH_DELETE_ALL 8

struct x_hash_entry {
  long key_value;
  void * data;
};

struct x_hash {
  void * data;	
  void * user;
  long table_size;
  struct x_list ** table_pointer;
  long additions;
  long collisions;
  long replaces;
};

long hashkey( char * key );
long indexhash( long key, long range );
long hashsize( struct x_hash * table );
struct x_hash * init_xhash( long initial_size );
struct x_hash_entry * init_xhash_entry();
struct x_hash * resize_xhash( struct x_hash * table, long new_size );
void * get_xhash( struct x_hash * table, long key, int hash_flag );
int put_xhash( struct x_hash * table, long key, void * data, int hash_flag);
int del_xhash( struct x_hash * table, long key, int hash_flag );
int set_user_xhash( struct xhash * table, void * user_data );
void * get_user_xhash( struct x_hash * table );

#ifdef __cplusplus
/* C++ Header files here -- class definitions and so on */

class X_Hash{
  struct x_hash * hash;		/* The private hash structure */
 public:
  X_Hash( long isize = 1001 );
  X_Hash( void * name , long isize = 1001);
  long size();
  int resize( long new_size );
  void * get( long key, int hash_flag = HASH_GET );
  int put( long key, void * new_data, int hash_flag = HASH_REPLACE );
  int del( long key, int hash_flag );
  int set_user( void * user_data );
  void *get_user();
};

#endif  

#endif



