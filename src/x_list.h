/* 

   Doubly linked list header file : 

         x_list.h 1.1 4/18/91 

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



#ifndef _x_list_h	/* To solve any double defined errors */
#define _x_list_h 

#ifndef TRUE		/* Just a standard define of mine */
#define TRUE 1
#endif
#ifndef FALSE		/* Just a standard define of mine */
#define FALSE 0
#endif

/* Below, we will define the structures we need for this code.... */

struct x_list_entry {	         /* Just a generic entry in out list  */
  void * data;			 /* The data pointer to store         */
  struct x_list_entry * prev;    /* The pointer to the previous entry */
  struct x_list_entry * next;    /* The pointer to the next entry     */
};

struct x_list {			 /* The header that will start every list */
  void * data;			 /* A user pointer so you can name it     */
  struct x_list_entry * first;	 /* Pointer to the first entry in list    */
  struct x_list_entry * current; /* Pointer to the current entry in list  */
  struct x_list_entry * last;    /* Pointer to the last entry in the list */
  int node;			 /* The number of the current node        */
  int count;			 /* A count of the number of nodes in list*/
};


struct x_list_entry * init_xlist_entry();			
/* Create and init a new entry struct */

struct x_list * init_xlist();					
/* create and init a new list head    */

int add_xlist( struct x_list * xlist , void * new_data );	
/* Add a new data item to the list    */

void * get_xlist(struct x_list * xlist );			
/* Get the data pointer from current entry in the list */

int head_xlist( struct x_list * xlist );			
/* Go to the top of the list          */

int put_xlist( struct x_list * xlist, void * new_data );	
/* Replace data for current node      */

int del_xlist( struct x_list * xlist );				
/* Kill the current item and re-weave the list   */

int next_xlist( struct x_list * xlist );			
/* Goto next node		      */

int prev_xlist( struct x_list * xlist );			
/* Go to prev node		      */

int get_count_xlist( struct x_list * xlist );			
/* get the counter 		      */

int free_xlist( struct x_list * xlist );
/* Delete the entire list             */

int set_user_xlist( struct x_list * xlist, void * data );
/* Set the user pointer for a xlist   */

void * get_user_xlist( struct x_list * xlist );
/* Get the user pointer for a xlist   */

int tail_xlist( struct x_list * );
/* Sets the current node to the last node in list */

int goto_xlist( struct x_list * xlist, int target );
/* Sets the current node to the target'th node in list if possible */

int get_nodenum_xlist( struct x_list * xlist );
/* Gives you the node number of the node you are on */

#ifdef __cplusplus

class X_List {
  struct x_list * list;
 public:
  X_List();
  X_List( void * name );
  int add( void * data );
  void * get();
  int head();
  int tail();
  int put( void * data);
  int del();
  int next();
  int prev();
  int count();
  int set_user( void * name );
  void * get_user();
  int nodenum();
  int goto_node( int target );
  void * operator[](int);
  ~X_List();
};


#endif

#endif


