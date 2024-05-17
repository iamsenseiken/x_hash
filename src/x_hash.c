/* 

   Hash table function file : 

         x_hash.c 1.1 4/18/91 

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


#include <string.h>
#include <malloc.h>
#include <memory.h>
#include <x_hash.h>

long hashkey( char * key ){
  long hash = 0;
  long i = 0;
  long slen = 0;

  slen = strlen( key );

  if( key == NULL || slen == 0 ){
    return( (long)NULL );
  }

  for( i = 0; i < slen; i++ ){
    hash = hash - (int)*(key+i);
    hash = hash << 1;
  }
  if( hash < 0 ){
    hash = hash * -1;
  }
  return( hash );
}
    
long indexhash( long key, long range ){
  long index;

  if( key == 0 || range == 0 ){
    return( NULL );
  }
  index = key % range;
  return( index );
}

long hashsize( struct x_hash * table ){
  if( table == NULL ){
    return( FALSE );
  }
  return( table->table_size );
}

struct x_hash * init_xhash( long initial_size ){
  struct x_hash * tmp1;
  struct x_list ** tmp2;
  int loop;

  tmp1 = (struct x_hash *)malloc( sizeof( struct x_hash ) );
  if( tmp1 == NULL ){
    return( NULL );
  }

  tmp2 = (struct x_list **)malloc( (unsigned int)initial_size*sizeof(struct x_list *) );
  if( tmp2 == NULL ){
    return( NULL );
  }

  for( loop = 0; loop < initial_size; loop ++){
    tmp2[loop] = init_xlist();
  }
  tmp1->table_size = initial_size;
  tmp1->table_pointer = tmp2;
  tmp1->additions = 0;
  tmp1->collisions = 0;
  tmp1->replaces = 0;
  
  return( tmp1 );
}

struct x_hash_entry * init_xhash_entry(){
  struct x_hash_entry * foo;
  foo = (struct x_hash_entry *)malloc( sizeof(struct x_hash_entry) );
  foo->key_value = 0;
  foo->data = NULL;
  return( foo );
}

int put_xhash( struct x_hash * table, long key, void * data, int hash_flag ){
  struct x_hash_entry *entry;
  struct x_hash_entry *buffer;
  long foo;
  long subscript;

  if( table == NULL ){
    return( FALSE );
  }

  entry = init_xhash_entry();
  if( entry == NULL ){
    return( FALSE );
  }
  entry->key_value = key;
                         /* Set key value of new data	*/
  entry->data = data;		
                         /* Set data pointer to data	*/

  subscript = indexhash( key, table->table_size );

  switch( hash_flag ){
    case HASH_NOREPLACE:  return( 
				 add_xlist( table->table_pointer[subscript], 
					   (void *)entry ) 
				 );
                          break;

    case HASH_REPLACE:    head_xlist( table->table_pointer[subscript] );
                          buffer = (struct x_hash_entry *)
			    get_xlist( table->table_pointer[subscript] );
                          while( 1 ){
			    if( buffer == NULL ){
			          /* No table entries ! add it */
			      return( add_xlist( 
					table->table_pointer[subscript], 
						(void *)entry ) );
			    }
			    if( buffer->key_value == entry->key_value ){
			      /* Replace it !!!            */
			      return( put_xlist( 
					table->table_pointer[subscript], 
						(void *)entry ) );
			    }
			    foo = next_xlist(table->table_pointer[subscript] );
			    if( foo == FALSE ){
					  /* End of list!   */
			      return(add_xlist(table->table_pointer[subscript],
					       (void *)entry ) );
			    }
			  }
                          break;

    case HASH_NODUP:    head_xlist( table->table_pointer[subscript] );
                          buffer = 
			    (struct x_hash_entry *)
			      get_xlist( table->table_pointer[subscript] );
                          while( 1 ){
			    if( buffer == NULL ){
			          /* No table entries ! add it */
			      return(add_xlist(table->table_pointer[subscript],
					       (void *)entry ) );
			    }
			    if( buffer->key_value == entry->key_value ){
			      /* Replace it !!!            */
			      return( FALSE );
			    }
			    foo = next_xlist(table->table_pointer[subscript] );
			    if( foo == FALSE ){
					  /* End of list!   */
			      return(add_xlist(table->table_pointer[subscript],
					       (void *)entry ) );
			    }
			  }
                          break;

    case HASH_NOADD:    head_xlist( table->table_pointer[subscript] );
                          buffer = (struct x_hash_entry *)
			    get_xlist( table->table_pointer[subscript] );
                          while( 1 ){
			    if( buffer == NULL ){
			          /* No table entries ! add it */
			      return( FALSE );
			    }
			    if( buffer->key_value == entry->key_value ){
			      /* Replace it !!!            */
			      return(put_xlist(table->table_pointer[subscript],
					       (void *)entry ) );
			    }
			    foo = next_xlist(table->table_pointer[subscript] );
			    if( foo == FALSE ){
			      /* End of list!   */
			      return( FALSE );
			    }
			  }
                          break;

    default:		return( FALSE );
                        break;
    }

}

void * get_xhash( struct x_hash * table, long key, int hash_flag ){
  struct x_hash_entry *buffer;
  long foo;
  long subscript;

  if( table == NULL ){
    return( NULL );
  }

  subscript = indexhash( key, table->table_size );

  switch( hash_flag ){
    case HASH_GET:    head_xlist( table->table_pointer[subscript] );
                          buffer = (struct x_hash_entry *)
			    get_xlist( table->table_pointer[subscript] );
                          while( 1 ){
			    if( buffer == NULL ){
			          /* No table entries ! */
			      return( NULL );
			    }
			    if( buffer->key_value == key ){
			      /* Return  it !!!     */
			      return( buffer->data );
			    }
			    foo = next_xlist(table->table_pointer[subscript] );
			    if( foo == FALSE ){	
				  /* End of list!   */
			      return( NULL );
			    }
			  }
                          break;

    case HASH_GET_NEXT:	  /*NOTICE: We do NOT reset the list this time !!!!! */
			  foo = next_xlist( table->table_pointer[subscript] );
                          while( 1 ){
			    if( foo == FALSE ){
					  /* End of list!   */
			      return( NULL );
			    }
                            buffer = (struct x_hash_entry *)
			      get_xlist( table->table_pointer[subscript] );
			    if( buffer == NULL ){
			          /* No table entries ! */
			      return( NULL );
			    }
			    if( buffer->key_value == key ){
			      /* Return  it !!!     */
			      return( buffer->data );
			    }
			    foo = next_xlist(table->table_pointer[subscript] );
			  }
                          break;

    default:		return( NULL );
                        break;
    }

}

struct x_hash * resize_xhash( struct x_hash * table, long new_size ){
  struct x_hash * new_table;
  struct x_hash_entry * buffer;
  long loop;

  new_table = init_xhash( new_size );
  if( new_table == NULL ){
    return( NULL );
  }
  for( loop = 0; loop < table->table_size ; loop++ ){
    if( head_xlist( table->table_pointer[loop] ) != FALSE ){
      buffer = (struct x_hash_entry *)get_xlist( table->table_pointer[loop] );
      if( buffer == NULL ){	/* Should never happen! */
	return( NULL );
      }
      if( put_xhash(new_table,buffer->key_value, 
		    buffer->data, HASH_NOREPLACE ) == FALSE ){
	return( NULL );
      }
      while( next_xlist( table->table_pointer[loop] ) == TRUE ){
	buffer = (struct x_hash_entry *)get_xlist(table->table_pointer[loop]);
	if( buffer == NULL ){
	  return( NULL );
	}      
	if( put_xhash( new_table, buffer->key_value, 
		      buffer->data, HASH_NOREPLACE ) == FALSE ){
	  return( NULL );
	}      
      }
    }  /* If reset_xhash != FALSE .. this list has at least one entry */
  }
  return( new_table );
}

int del_xhash( struct x_hash * table, long key, int hash_flag ){
  int retval;
  struct x_hash_entry *buffer;
  long foo;
  long subscript;

  retval = FALSE;
  if( table == NULL ){
    return( FALSE );
  }
  subscript = indexhash( key, table->table_size );
  switch( hash_flag ){
    case HASH_DELETE:    head_xlist( table->table_pointer[subscript] );
                          buffer = (struct x_hash_entry *)
			    get_xlist( table->table_pointer[subscript] );
                          while( 1 ){
			    if( buffer == NULL ){
			          /* No table entries ! */
			      return( FALSE );
			    }
			    if( buffer->key_value == key ){
			      /* Delete  it !!!     */
			      return( 
				     del_xlist(table->table_pointer[subscript])
				     );
			    }
			    foo = next_xlist(table->table_pointer[subscript] );
			    if( foo == FALSE ){	
				  /* End of list!   */
			      return( FALSE );
			    }
			  }
                          break;
    case HASH_DELETE_ALL:  
                          while( del_xhash( table, key, HASH_DELETE )
				== TRUE ){
			    retval++;
			  }
                          return( retval );
                          break;
    default:	return( FALSE );
                break;
    }
}

int set_user_xhash( struct x_hash * table, void * user_data){
  if( table == NULL ){
    return( NULL );
  }
  table->user = user_data;
  return(TRUE);
}

void *get_user_xhash( struct x_hash * table ){
  if( table == NULL ){
    return( NULL );
  }
  return( table->user );
}

#ifdef __cplusplus

X_Hash::X_Hash( long isize ){
  hash = init_xhash( isize );
}

X_Hash::X_Hash( void * name, long isize ){
  hash = init_xhash( isize );
  if( hash != NULL ){
    set_user_xhash( hash, name );
  }
}

long X_Hash::size(){
  if( hash != NULL ){
     return( hashsize( hash ) );
  }
  return( NULL );
}

int X_Hash::resize( long new_size ){
  if( hash != NULL ){
    hash = resize_xhash( hash, new_size );
    if( hash != NULL ){
      return( TRUE );
    }
  }
  return( FALSE );
}

void * X_Hash::get( long key, int hash_flag ){
  if( hash != NULL ){
    return( get_xhash( hash, key, hash_flag ) );
  }
  return( NULL );
}

int X_Hash::put(  long key, void * new_data, int hash_flag ){
  if( hash != NULL ){
    return( put_xhash( hash, key, new_data, hash_flag ) );
  }
  return( FALSE );
}

int X_Hash::del( long key, int hash_flag ){
  if( hash != NULL ){
    return( del_xhash( hash, key, hash_flag ) );
  }
    return( FALSE );
}

int X_Hash::set_user( void * user_data ){
  if( hash != NULL ){
    return( set_user_xhash( hash, user_data ) );
  }
  return( FALSE );
}

void *X_Hash::get_user(){
  if( hash != NULL ){
    return( get_user_xhash( hash ) );
  }
  return( FALSE );
}

#endif
















