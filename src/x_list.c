/* 

   Doubly linked list function file : 

         x_list.c 1.1 4/18/91 

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
#include <sharew.h>
#include <x_list.h>
#include <stdlib.h>

struct x_list_entry * init_xlist_entry(){
  struct x_list_entry * foo;
  foo = (struct x_list_entry *)malloc( sizeof(struct x_list_entry) );
  if( foo == NULL ){
    return( foo );
  }
  foo->data = NULL;
  foo->prev = NULL;
  foo->next = NULL;
  
  return( foo );
}

struct x_list * init_xlist(){
  struct x_list * foo;
  foo = (struct x_list *)malloc( sizeof(struct x_list) );
  if( foo == NULL ){
    return( foo );
  }
  foo->data = NULL;
  foo->first = NULL;
  foo->current = NULL;
  foo->last = NULL;
  foo->count = 0;
  foo->node = 0;

  return( foo );
}

int add_xlist( struct x_list * xlist, void * new_data ){
  if( xlist == NULL ){
    return( (int)FALSE );
  }
  if( xlist->first == NULL ){		/* Is this the first entry ??? */
    xlist->first = init_xlist_entry();  /* Create a entry to add to list */
    if( xlist->first == NULL ){         
      return( (int)FALSE );                  /* If we can't, fail             */
    }
    xlist->first->data = new_data;	/* Set the data pointer for the user */
    xlist->current = xlist->first;	/* The first item is the current one!*/
    xlist->last = xlist->first;		/* It is also the last !! 	     */
    xlist->count = 1;			/* There is one item in the list     */
    xlist->node = 0;			/* Just to be sure !		     */
    return( (int)TRUE );
  }

  xlist->last->next = init_xlist_entry(); /* Add a new node at end of list */
  if( xlist->first == NULL ){
    return( (int)FALSE );			  /* If we can't, fail */
  }  
  xlist->last->next->prev = xlist->last;	/* Set parent of new node */
  xlist->last->next->data = new_data;		/* Set data of new node   */
  xlist->last = xlist->last->next;		/* Set pointer to last node*/
  xlist->current = xlist->last;			/* Set the current pointer */
  xlist->count = xlist->count+1;		/* Set the counter      */
  xlist->node = xlist->count - 1;		/* Hehehehe		*/
  return( (int)TRUE );
}

void * get_xlist( struct x_list * xlist ){
  if( xlist == NULL ){
    return( NULL );				/* if list pointer is bad */
  }
  if( xlist->current == NULL ){
    return( NULL );				/* if list is empty       */
  }
  return( xlist->current->data );               /* Return the data        */
}

int head_xlist( struct x_list * xlist ){
  if( xlist == NULL ){
    return( (int)FALSE );				/* if list pointer is bad */
  }						                            
  if( xlist->first == NULL ){			                            
    return( (int)FALSE );				/* if list is empty       */
  }						                            
  xlist->current = xlist->first;		/* reset the current pointer*/
  xlist->node = 0;				/* Reset node number */
  return( (int)TRUE );
}

int put_xlist( struct x_list * xlist, void * new_data ){
  if( xlist == NULL ){
    return( (int)FALSE );				/* if list pointer is bad */
  }						                            
  if( xlist->current == NULL ){			                            
    return( (int)FALSE );				/* if list is empty       */
  }						                            
  xlist->current->data = new_data;		/* replace the data        */
  return( (int)TRUE );
}

int del_xlist( struct x_list * xlist ){
  struct x_list_entry * foo;
  if( xlist == NULL ){
    return( (int)FALSE );	                    /* if list pointer is bad */
  }					                                
  if( xlist->current == NULL ){		                                
    return( (int)FALSE );			    /* if list is empty       */
  }					                                
  foo = xlist->current;			    
  if( foo->prev != NULL ){			/* Is this the head ? */
    foo->prev->next = foo->next; /* Set the child of our parent to pur child */
  }else{			
    xlist->first = foo->next;    /* We are the head, reset first when we go  */
  }
  if( foo->next != NULL ){		/* Are we the tail ?  */
    foo->next->prev = foo->prev;	/* Set childs parent to our parent  */
    xlist->current = foo->next;		/* Set the current to our child	    */
  }else{
    xlist->current = foo->prev;		/* Set current to parent if no child*/
    xlist->last = foo->next;		/* Reset the last pointer           */
  }
  xlist->count = xlist->count -1;	/* Decrement the counter            */
  free((char *)foo);				/* Free the data		    */
  return( (int)TRUE );
}

int next_xlist( struct x_list * xlist ){
  if( xlist == NULL ){
    return( (int)FALSE );			 /* if list pointer is bad */
  }					                             
  if( xlist->current == NULL ){		                             
    return( (int)FALSE );			 /* if list is empty       */
  }
  if( xlist->current->next == NULL ){
    return( (int)FALSE );		 /* At end of list, can't advance */
  }
  xlist->current = xlist->current->next; /* Advance current pointer       */
  xlist->node = xlist->node + 1; 
  return( (int)TRUE );
}

int prev_xlist( struct x_list * xlist ){
  if( xlist == NULL ){
    return( (int)FALSE );			 /* if list pointer is bad */
  }					                             
  if( xlist->current == NULL ){		                             
    return( (int)FALSE );			 /* if list is empty       */
  }
  if( xlist->current->prev == NULL ){
    return( (int)FALSE );			 /* If we are at the start */
  }
  xlist->current = xlist->current->prev; /* Move the pointer back  */
  xlist->node = xlist->node - 1;		 /* Decrement the node */
  return( (int)TRUE );
}
  
int get_count_xlist( struct x_list * xlist ){
  if( xlist == NULL ){	                 /* If the list pointer is bad */
    return( 0 );
  }
  return( xlist->count );		/* Return the current count    */
}

int free_xlist( struct x_list * xlist ){
  if( xlist == NULL ){	                 /* If the list pointer is bad */
    return( (int)FALSE );
  }
  while( get_count_xlist( xlist ) != 0 ){
    del_xlist( xlist );
  }
  free((char *) xlist );
  return( (int)TRUE );
}

int set_user_xlist( struct x_list * xlist, void * data ){
  if( xlist == NULL ){	                 /* If the list pointer is bad */
    return( (int)FALSE );
  }
  xlist->data = data;
  return( (int)TRUE );
}

void * get_user_xlist( struct x_list * xlist ){
  if( xlist == NULL ){	                 /* If the list pointer is bad */
    return( (int)FALSE );
  }
  return( xlist->data );
}

int tail_xlist( struct x_list * xlist ){
  if( xlist == NULL ){
    return( (int)FALSE );			/* if list pointer is bad */
  }						                            
  if( xlist->last == NULL ){	                       
    return( (int)FALSE );			/* if list is empty       */
  }						                            
  xlist->current = xlist->last;		/* reset the current pointer*/
  xlist->node = xlist->count - 1;		/* Reset node number */
  return( (int)TRUE );
}

int get_nodenum_xlist( struct x_list * xlist ){
  if( xlist == NULL ){	                 /* If the list pointer is bad */
    return( (int)FALSE );
  }  
  return( xlist->node );
}

int goto_xlist( struct x_list * xlist, int target ){
  int count;
  if( xlist == NULL ){	                 /* If the list pointer is bad */
    return( (int)FALSE );
  }
  if( target < 0 ){
    return( (int)FALSE );
  }
  count = get_count_xlist( xlist );
  if( target > count ){
    return( (int)FALSE );
  }
  count = get_nodenum_xlist( xlist );	/* Re-use the count integer */
  if( target > count ){
    while( target > get_nodenum_xlist( xlist ) ){
      if( next_xlist( xlist ) == FALSE ){
	return( (int)FALSE );		/* Error ? */
      }
    }
    return( (int)TRUE );
  }
  if( target < count ){
    while( target < get_nodenum_xlist( xlist ) ){
      if( prev_xlist( xlist ) == FALSE ){
	return( (int)FALSE );		/* Error ? */
      }
    }
    return( (int)TRUE );
  }
  if( target == count ){
    return( (int)TRUE );		/* Error ? */
  }
  return( (int)FALSE );			/* No idea what happened!          */
                                        /* I mean, if it is not > < or = ! */
}

#ifdef __cplusplus

X_List::X_List(){
  list = init_xlist();
}

X_List::X_List( void * name ){
  list = init_xlist();
  set_user( name );
}

int X_List::add( void * data ){
  return( add_xlist( list, data ) );
}

void * X_List::get(){
  return( get_xlist( list ) );
}

int X_List::head(){
  return( head_xlist( list ) );
}

int X_List::tail(){
  return( tail_xlist( list ) );
}

int X_List::put( void * data ){
  return( put_xlist( list, data ) );
}

int X_List::del(){
  return( del_xlist( list ) );
}

int X_List::next(){
  return( next_xlist( list ) );
}

int X_List::prev(){
  return( prev_xlist( list ) );
}

int X_List::count(){
  return( get_count_xlist( list ) );
}

int X_List::set_user( void * name ){
  return( set_user_xlist( list, name ) );
}

void * X_List::get_user(){
  return( get_user_xlist( list ) );
}

int X_List::nodenum(){
  return( (int)get_nodenum_xlist( list ) );
}

int X_List::goto_node( int target ){
  return( goto_xlist( list, target ) );
}

void * X_List::operator[]( int target ){
  if( this->goto_node( target ) == FALSE ){
    return( NULL );
  }
  return( this->get() );
}

X_List::~X_List(){
  free_xlist( list );
}



#endif


