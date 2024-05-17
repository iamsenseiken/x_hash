#!/bin/sh
# this is x_hash.02 (part 2 of X_HASH)
# do not concatenate these parts, unpack them in order with /bin/sh
# file src/x_list.c continued
#
touch 2>&1 | fgrep '[-amc]' > /tmp/s3_touch$$
if [ -s /tmp/s3_touch$$ ]
then
    TOUCH=can
else
    TOUCH=cannot
fi
rm -f /tmp/s3_touch$$
CurArch=2
if test ! -r s3_seq_.tmp
then echo "Please unpack part 1 first!"
     exit 1; fi
( read Scheck
  if test "$Scheck" != $CurArch
  then echo "Please unpack part $Scheck next!"
       exit 1;
  else exit 0; fi
) < s3_seq_.tmp || exit 1
echo "x - Continuing file src/x_list.c"
sed 's/^X//' << 'SHAR_EOF' >> src/x_list.c
X}
X  
Xint get_count_xlist( struct x_list * xlist ){
X  if( xlist == NULL ){	                 /* If the list pointer is bad */
X    return( 0 );
X  }
X  return( xlist->count );		/* Return the current count    */
X}
X
Xint free_xlist( struct x_list * xlist ){
X  if( xlist == NULL ){	                 /* If the list pointer is bad */
X    return( (int)FALSE );
X  }
X  while( get_count_xlist( xlist ) != 0 ){
X    del_xlist( xlist );
X  }
X  free((char *) xlist );
X  return( (int)TRUE );
X}
X
Xint set_user_xlist( struct x_list * xlist, void * data ){
X  if( xlist == NULL ){	                 /* If the list pointer is bad */
X    return( (int)FALSE );
X  }
X  xlist->data = data;
X  return( (int)TRUE );
X}
X
Xvoid * get_user_xlist( struct x_list * xlist ){
X  if( xlist == NULL ){	                 /* If the list pointer is bad */
X    return( (int)FALSE );
X  }
X  return( xlist->data );
X}
X
Xint tail_xlist( struct x_list * xlist ){
X  if( xlist == NULL ){
X    return( (int)FALSE );			/* if list pointer is bad */
X  }						                            
X  if( xlist->last == NULL ){	                       
X    return( (int)FALSE );			/* if list is empty       */
X  }						                            
X  xlist->current = xlist->last;		/* reset the current pointer*/
X  xlist->node = xlist->count - 1;		/* Reset node number */
X  return( (int)TRUE );
X}
X
Xint get_nodenum_xlist( struct x_list * xlist ){
X  if( xlist == NULL ){	                 /* If the list pointer is bad */
X    return( (int)FALSE );
X  }  
X  return( xlist->node );
X}
X
Xint goto_xlist( struct x_list * xlist, int target ){
X  int count;
X  if( xlist == NULL ){	                 /* If the list pointer is bad */
X    return( (int)FALSE );
X  }
X  if( target < 0 ){
X    return( (int)FALSE );
X  }
X  count = get_count_xlist( xlist );
X  if( target > count ){
X    return( (int)FALSE );
X  }
X  count = get_nodenum_xlist( xlist );	/* Re-use the count integer */
X  if( target > count ){
X    while( target > get_nodenum_xlist( xlist ) ){
X      if( next_xlist( xlist ) == FALSE ){
X	return( (int)FALSE );		/* Error ? */
X      }
X    }
X    return( (int)TRUE );
X  }
X  if( target < count ){
X    while( target < get_nodenum_xlist( xlist ) ){
X      if( prev_xlist( xlist ) == FALSE ){
X	return( (int)FALSE );		/* Error ? */
X      }
X    }
X    return( (int)TRUE );
X  }
X  if( target == count ){
X    return( (int)TRUE );		/* Error ? */
X  }
X  return( (int)FALSE );			/* No idea what happened!          */
X                                        /* I mean, if it is not > < or = ! */
X}
X
X#ifdef __cplusplus
X
XX_List::X_List(){
X  list = init_xlist();
X}
X
XX_List::X_List( void * name ){
X  list = init_xlist();
X  set_user( name );
X}
X
Xint X_List::add( void * data ){
X  return( add_xlist( list, data ) );
X}
X
Xvoid * X_List::get(){
X  return( get_xlist( list ) );
X}
X
Xint X_List::head(){
X  return( head_xlist( list ) );
X}
X
Xint X_List::tail(){
X  return( tail_xlist( list ) );
X}
X
Xint X_List::put( void * data ){
X  return( put_xlist( list, data ) );
X}
X
Xint X_List::del(){
X  return( del_xlist( list ) );
X}
X
Xint X_List::next(){
X  return( next_xlist( list ) );
X}
X
Xint X_List::prev(){
X  return( prev_xlist( list ) );
X}
X
Xint X_List::count(){
X  return( get_count_xlist( list ) );
X}
X
Xint X_List::set_user( void * name ){
X  return( set_user_xlist( list, name ) );
X}
X
Xvoid * X_List::get_user(){
X  return( get_user_xlist( list ) );
X}
X
Xint X_List::nodenum(){
X  return( (int)get_nodenum_xlist( list ) );
X}
X
Xint X_List::goto_node( int target ){
X  return( goto_xlist( list, target ) );
X}
X
Xvoid * X_List::operator[]( int target ){
X  if( this->goto_node( target ) == FALSE ){
X    return( NULL );
X  }
X  return( this->get() );
X}
X
XX_List::~X_List(){
X  free_xlist( list );
X}
X
X
X
X#endif
X
X
SHAR_EOF
echo "File src/x_list.c is complete"
chmod 0440 src/x_list.c || echo "restore of src/x_list.c fails"
if [ $TOUCH = can ]
then
    touch -am 0418223391 src/x_list.c
fi
# ============= src/x_list.h ==============
echo "x - extracting src/x_list.h (Text)"
sed 's/^X//' << 'SHAR_EOF' > src/x_list.h &&
X/* 
X
X   Doubly linked list header file : 
X
X         x_list.h 1.1 4/18/91 
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
X
X#ifndef _x_list_h	/* To solve any double defined errors */
X#define _x_list_h 
X
X#ifndef TRUE		/* Just a standard define of mine */
X#define TRUE 1
X#endif
X#ifndef FALSE		/* Just a standard define of mine */
X#define FALSE 0
X#endif
X
X/* Below, we will define the structures we need for this code.... */
X
Xstruct x_list_entry {	         /* Just a generic entry in out list  */
X  void * data;			 /* The data pointer to store         */
X  struct x_list_entry * prev;    /* The pointer to the previous entry */
X  struct x_list_entry * next;    /* The pointer to the next entry     */
X};
X
Xstruct x_list {			 /* The header that will start every list */
X  void * data;			 /* A user pointer so you can name it     */
X  struct x_list_entry * first;	 /* Pointer to the first entry in list    */
X  struct x_list_entry * current; /* Pointer to the current entry in list  */
X  struct x_list_entry * last;    /* Pointer to the last entry in the list */
X  int node;			 /* The number of the current node        */
X  int count;			 /* A count of the number of nodes in list*/
X};
X
X
Xstruct x_list_entry * init_xlist_entry();			
X/* Create and init a new entry struct */
X
Xstruct x_list * init_xlist();					
X/* create and init a new list head    */
X
Xint add_xlist( struct x_list * xlist , void * new_data );	
X/* Add a new data item to the list    */
X
Xvoid * get_xlist(struct x_list * xlist );			
X/* Get the data pointer from current entry in the list */
X
Xint head_xlist( struct x_list * xlist );			
X/* Go to the top of the list          */
X
Xint put_xlist( struct x_list * xlist, void * new_data );	
X/* Replace data for current node      */
X
Xint del_xlist( struct x_list * xlist );				
X/* Kill the current item and re-weave the list   */
X
Xint next_xlist( struct x_list * xlist );			
X/* Goto next node		      */
X
Xint prev_xlist( struct x_list * xlist );			
X/* Go to prev node		      */
X
Xint get_count_xlist( struct x_list * xlist );			
X/* get the counter 		      */
X
Xint free_xlist( struct x_list * xlist );
X/* Delete the entire list             */
X
Xint set_user_xlist( struct x_list * xlist, void * data );
X/* Set the user pointer for a xlist   */
X
Xvoid * get_user_xlist( struct x_list * xlist );
X/* Get the user pointer for a xlist   */
X
Xint tail_xlist( struct x_list * );
X/* Sets the current node to the last node in list */
X
Xint goto_xlist( struct x_list * xlist, int target );
X/* Sets the current node to the target'th node in list if possible */
X
Xint get_nodenum_xlist( struct x_list * xlist );
X/* Gives you the node number of the node you are on */
X
X#ifdef __cplusplus
X
Xclass X_List {
X  struct x_list * list;
X public:
X  X_List();
X  X_List( void * name );
X  int add( void * data );
X  void * get();
X  int head();
X  int tail();
X  int put( void * data);
X  int del();
X  int next();
X  int prev();
X  int count();
X  int set_user( void * name );
X  void * get_user();
X  int nodenum();
X  int goto_node( int target );
X  void * operator[](int);
X  ~X_List();
X};
X
X
X#endif
X
X#endif
X
X
SHAR_EOF
chmod 0440 src/x_list.h || echo "restore of src/x_list.h fails"
if [ $TOUCH = can ]
then
    touch -am 0418223391 src/x_list.h
fi
# ============= src/Makefile ==============
echo "x - extracting src/Makefile (Text)"
sed 's/^X//' << 'SHAR_EOF' > src/Makefile &&
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
chmod 0440 src/Makefile || echo "restore of src/Makefile fails"
if [ $TOUCH = can ]
then
    touch -am 0419235091 src/Makefile
fi
# ============= text/install ==============
if test ! -d 'text' ; then
    echo "x - creating directory text"
    mkdir 'text'
fi
echo "x - extracting text/install (Text)"
sed 's/^X//' << 'SHAR_EOF' > text/install &&
X
X	1) Go into the source directory.
X
X	2) type "make"
X
X	3) type "testlist"
X
X	4) type "testhash"
X
X	have fun!
X
SHAR_EOF
chmod 0640 text/install || echo "restore of text/install fails"
if [ $TOUCH = can ]
then
    touch -am 0419234991 text/install
fi
# ============= text/lists ==============
echo "x - extracting text/lists (Text)"
sed 's/^X//' << 'SHAR_EOF' > text/lists &&
X				   
X			      *********
X			      * LISTS *
X			      *********
X
X
X	     Let's get this legal stuff out of the way !
X				   
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
X	Ok, now, about lists.... This will be a simple text to
Xintroduce some of the basic list theory so that you can use the
Xroutines in this library.
X
X	I am using a "doubly linked list", this is a list where
Xevery piece of data knows where to find every other one... consider the 
Xchart below. (I will number the "nodes" for clarity):
X
X	1-2-3-4-5
X
X	That is a 5 node list, where the node on the left is the parent
Xor previous node, and the one on the right is the child or next node.
X
X	Now, lets store some data here, and introduce a concept or two.
XI am going to stand the list on it's side this time.
X
X	*1	(red)
X	 |
X	 2	(green)
X	 |
X	 3	(blue)
X	 |
X	 4	(yellow)
X	 |
X	 5	(orange)
X
X	See the "*" ? I am going to use that to show the "current" node in
Xthe list. Now, we have put colors "in" the nodes. We can move that
X"*" up or down the list, to the next and previous nodes.
X
X	We can replace the data that is in the current node, and we can
Xadd nodes to the end. Also, we can delete a node completely. 
X
X	Any list that you can move "previous: and "next" in is 
Xdoubly-linked. A singly-linked list only lest you move "next". 
X
X
X
XWHY USE LISTS AS A PROGRAMMER ?
X
X
X	With respect to "C" programming, why do we use lists at all ?
X
X	Let's say you are going to get a list of names from a user,
Xand you don't know how many names you will get. You have 2 choices if you
Xhave to keep those names in memory...
X
X	1) Allocate more space than you will "EVER" need.
X
X	   Advantage - You don't have to worry about lists! It is just
X		       an array for you!
X
X	   Disadvantage - You often allocate MUCH more space than you
X			really use. Thus, you waste memory. Also, it is
X		 	generally good to avoid putting limits into a program
X			like "You can only enter 1000 names". A lack of
X			limits makes your code efficient (space wise) and
X			more flexible.
X
X	2) Use lists!
X
X	   Advantage - You never waste space (a bit on the list 
X		       overhead .. but not that much usually). You can
X		       adapt to almost anything.
X
X	   Disadvantage - Lists are a pain! De-bugging list code
X			  can drive you up a wall! 
X
X
X	Since I obviously feel you will want to use lists, let's talk
X	more about them....
X
X
X
X
XHOW TO IMPLEMENT A DOUBLY-LINKED LIST FOR C and C++:
X
X	I am not going to go into great detail of all the low level code here,
Xbecause you can just go look at the source in x_list.c to see most of that.
XHere, we will take a look at the design considerations we should have for C
Xand C++.
X
X	The natural thing to build a linked list of is pointers. This
Xallows us a lot of flexibility.  Consider the example below....
X
Xstruct node{
X	struct node * prev;
X	struct node * next;
X	void * data;
X}
X
X	This structure will for the basis for our list. Because we want
Xa doubly-linked list, we have two list pointers here, on that points to the
Xaddress of the next node, and one to the previous node. The void * that
Xis there is the data we are going to store in the list. It is nice to
Xstore a pointer as the data of the list so that we do not
Xlimit the things we can use the list for.
X
X	We can actually make a list out of these things. They are
Xcomplete to form a simple list. Consider the program below:
X
Xmain(){
X	struct node node1;
X	struct node node2;
X
X	node1.prev = NULL;
X	node1.next = &node2;
X	node2.prev = &node1;
X	node2.next = NULL;
X}
X
X
X	That programs forms a list. Node1 knows where to find node2 and
Xthe opposite is true. There IS no previous node for node1 so that is
XNULL. In the same manner, there is no next node from node2 so that is also
Xset to NULL. 
X
X	That's it ! Thats the magic of lists. If I have a pointer to
Xnode2, I can find node one at &node2->prev and so on.
X
X	Now, that is not EVERYTHING about it (it never is .. :-) ).
XThe whole point of the list is that we want to make it bigger as we
Xgo along, not declare it at the start of the program like we did above.
X
X	So let's look at a minor variation:
X	(I will show only the code here, assume that the structure
X	"node" is defined for this program in a header file or something)
X	
X
X1   #include <malloc.h>		/* Get the memory stuff */
X2   main(){
X3	struct node * node1;
X4
X5	node1 = (struct node *)malloc( sizeof(struct node) );
X6	node1->prev = NULL;
X7
X8	node1->next = (struct node *)malloc( sizeof( struct node ) );
X9	node1->next->next = NULL;
X10	node1->next->prev = node1;
X11  }
X
X	WHAT HAPPENED!! you say ?
X
X	Trust me, it isn't that bad. Let's take it step by step.
X
X	First, obviously it would not compile with those line numbers.
XOk.. second, you will see that we only declared one pointer. The
Xpointer for the first node. That is the ONLY pointer we cannot infer
Xfrom the list. YOU WILL ALWAYS HAVE AT LEAST ONE POINTER declared as
Xa "base" for the list.
X
X	Step by step then....
X
XLINE 1 : We included the file for the malloc() call because we 
X	 use that call this time.
X
XLINE 2 : Start the program :-).
X
XLINE 3 : Declare a place to store the pointer for node1.
X
XLINE 5 : We allocate space for our first node, and store the 
X	 pointer for it in the variable node1.
X
XLINE 6 : There will never be a node BEFORE node1. So the
X	 address of the previous node in NULL. It is
X	 important that you PUT a NULL there yourself
X	 because you are not sure of it's value.
X
X	 The DEFINITION of the "head" or "top" of
X	 a list is "the node with no previous node". There
X	 will only ever be one node like this in a list.
X
XLINE 8 : We are going to save a step here. We are going to
X	 allocate space for another node, and store it's 
X	 pointer right into the space for it in node1. In this
X	 manner, we do NOT need to declare another variable.
X
X	 While this looks confusing, it really isn't. The only
X	 place that the address of node2 is relevant from
X	 at this time is node1.
X
XLINE 9 : We are at the end of the list (we only have 
X	 two nodes at this time) .. so there is no
X	 "next" node. Since we don't have a
X	 pointer for node2, we need to say "node1->next" every
X	 time we want to talk about node2, but there are ways to
X	 solve this problem in later examples.
X
XLINE 10: Now, to complete the list, we need to tell
X	 node2 about node1's address.
X
X	 So, we set the pervious node pointer in node2
X	 to be node1's pointer.
X
X
X	The weave is now complete and we have a linked
Xlist. You can see though, that we need some better way to 
Xmove from node to node. Because it would be a real pain
Xabout 5 nodes in ... could you imagine : 
X
X	node1->next->next->next->next
X	
X	It would get silly real fast!
X	
X	So, what I have done in this library is just 
Xkeep another structure for each list. It has a pointer to the
Xfirst node in that list, a pointer to the last node, and a
Xpointer to the current node.
X
X	The current node makes the list act a LOT like a
Xloose leaf notebook. If you think of an empty list, you have
Xa notebook with nothing in it at all. In this analogy, you 
Xmust add a piece of paper before you can write anything into the
Xlist. You do that as I showed you above, by adding a new node.
X
X	The current node is just a marker, an indication of
Xwhere the notebook is open to right now. If we continue or
Xexample above, we have the pointer to the first node in the
Xlist stored as "node1" ... we will want to deal with node2 to
Xfor a while, so we can just say ...
X
X	current_node = node1->next;
X
X	Get it ?? This way, we don't have to say "node1->next"
Xall the time. When the time comes to deal with node1 again, we can
Xjust say ...
X
X	current_node = node1;
X	
X	And there we are.
X
X	Now, in a list with many nodes, it is even more important
Xbecause to get to node 5 it is tough to say ..
X
X	current-node = node1->next->next->next->next;
X
X	But it is EASY to say ....
X
X	current_node = node1;
X	for( x = 0; x < 4; x++ ){
X		current_node = current_node->next;
X	}
X
X	THAT code can take us to the 5 node in the list as well, 
Xbecause we can just keep advancing. If we are at node 5, and want 
Xto get to node 4, we can just say ..
X
X	current_node = current_node->prev;
X
X	So, you see that if you have the concept of a current node,
Xand the pointer to the first node in the list, you are capable
Xof going forward and backwards in the list.
X
X	Since the last node of a list is the only node with a 
Xnext pointer of NULL, we can find it very easy now.
X
X	if( current_node->next |= NULL ){
X		current_node = current_node->next;
X	}
X
X	That will leave current_node set to the last node in the
Xlist without any trouble at all, no matter where you happen to
Xbe.
X
X	The last thing I will show you about is how to delete a
Xnode. Suppose we want to remove the current_node from the list
Xcompletely. What do we have to do ???? Well, the parent of the
Xcurrent node has to be pointed to the child of the current
Xnode so that the chain is not broken..
X
X	current_node->prev->next = current_node->next;
X
X	And the child of the current node has to be told of
Xit's new parent (since it isn't us any more!)..
X
X	current_node->next->prev = current_node->prev;
X
X	Now, the chain is intact, and the ONLY place there is a
Xpointer to the current node is in the current_node variable! We
Xwant to free that memory, so we should say ...
X
X	free(current_node);
X	current_node = node1;
X
X	That de-allocates that memory, and leaves us with a 
Xvalid current node pointer.
X
X	Now you should be able to look at my code and have
Xsome idea what it is doing. Have fun!
X
X 
SHAR_EOF
chmod 0640 text/lists || echo "restore of text/lists fails"
if [ $TOUCH = can ]
then
    touch -am 0419234791 text/lists
fi
# ============= text/readme ==============
echo "x - extracting text/readme (Text)"
sed 's/^X//' << 'SHAR_EOF' > text/readme &&
X
X		    :*:*:*:*: IMPORTANT :*:*:*:*:
X
X	      READ THE FILE "distrib" BEFORE TO BEGIN TO
X		      USE OR COMPILE THIS CODE!
X
X
X	Hi ! X_List stands for "Xanadu List", it is a project that I have been
Xplaying with on and off for over a year. While there is not much code,
Xit has been a long road to understanding this stuff enough that I was
Xhappy with the results.
X
X	I have always, as programmer, had a great fear of pointers. Well,
Xmaybe fear is to strong a word by I was certainly not fond of the little
Xdevils.  And NOTHING will bring you face to face with pointers faster than
Xa good doubly linked list.
X
X	I sat there. Oh, I could use some canned list routines, but
XI wanted to KNOW what was happening in there. I wanted to be able to
Xlook at the source and say "AHA!". Well, I couldn't. The routines I could
Xget the source to were way over my head, and not commented well.
X
X	So what I have done is look at what MY needs for list processing
Xwere, under both C and C++, and write the routines to do them. Along the way,
XI have tried to comment the code pretty well, and in the file "lists" you will
Xfind a mini-tutorial about what a list is and why we use them. The code in
Xhere is probably not as commented as you would like (or me!) but it is better
Xthan most, and combined with "lists" you should be fine.
X
X	This code is shareware, and so you should read the "distrib" file
Xbefore you use this code. It is pretty lenient I feel, and hopefully you
Xwon't find it restrictive. In addition, hopefully I can make some money for
Xa new hard drive ;-). Also, please upload this archive unaltered to any
XBBS or network to would like. Shareware lives by being spread!
X
X	This code was developed with Turbo C++ 1.0 under the VP/ix emulator
Xof Interactive Systems Unix SysV3.2.
X
X	Every attempt has been made to make this code run under the
Xfollowing environments:
X
X	1: Unix. Any ANSI C or C++ 2.0 variant. SYSV, BSD and SUNOS.
X		(can anyone confirm g++?)
X
X	2: Ms-Dos. Turbo C++ and Turbo C.
X		(can anyone confirm MSC?)
X
X	3: Amiga.  Lattice C++ 1.0 and SAS/C 5.10
X		Note: I used SAS/C 5.10 as the C back end to the
X		      Lattice C++ compiler.
X		
X
X	I personally run it under all three, in both C and C++ programs so
Xyou should be ok.
X
X	Have fun! Read "distrib" and "install" next, "lists" for a 
Xoverview of linked lists, and "docs" for the documentation for the routines 
Xhere and happy listing!
X
X
XNOTE FOR UNIX USERS:
X
X	Forgive the fact that these text files have dos format CR-LF line
Xterminators in them, there was no reason to have two versions and stripping
Xthem is easy enough.
X
X	- Kenneth Jamieson
X 
X
X
X-----------------------------------------------------
X* UNIX is a trademark of AT&T
X* Amiga is a trademark of Commodore Business Machines
X* MS-DOS is a trademark of Microsoft Inc 
X
X
SHAR_EOF
chmod 0640 text/readme || echo "restore of text/readme fails"
if [ $TOUCH = can ]
then
    touch -am 0417205791 text/readme
fi
# ============= text/WHATIS ==============
echo "x - extracting text/WHATIS (Text)"
sed 's/^X//' << 'SHAR_EOF' > text/WHATIS &&
X			*********************
X			*WHAT IS X_HASH ????*
X			*********************
X
X	X_HASH is a collection of two libraries, X_List and X_Hash. 
X
X	You will need a ANSI C compiler or a C++ compiler.
X
X
X	1) X_List is a stand-alone library for C and C++ that will
X	   allow for the simple, efficient management of doubly linked
X	   lists of pointers in a logical form. This is one of the most
X	   often used programming constructs.
X
X	2) X_Hash allows for a list of pointers to be stored by a 
X	   key value. A function is provided to turn a text string into
X	   this key value. Thus, a pointer may be stored much like in a
X	   database.
X
X	   X_Hash needs X_List available to operate.
X
X	3) DOCUMENTATION is on the way, for now, the sample "test" programs
X	   should get you started, mail me any questions!
X
X	   (HINT) FULL DOCS available to registered users!
X
X========[ Xanadu Enterprises Inc. Amiga & Unix Software Development]=======
X= "I know how you feel, you don't know if you want to hit me or kiss me - =
X=  --- I get a lot of that."  Madonna as Breathless Mahoney (Dick Tracy)  =
X=========== Ken Jamieson: uunet!tronsbox.xei.com!tron1  ===================
X=     NONE of the opinions represented here are endorsed by anybody.      =
X=== The Romantic Encounters BBS 201-759-8450(PEP) / 201-759-8568(2400) ==== 
X
X
X
X
X
X
SHAR_EOF
chmod 0640 text/WHATIS || echo "restore of text/WHATIS fails"
if [ $TOUCH = can ]
then
    touch -am 0419234791 text/WHATIS
fi
rm -f s3_seq_.tmp
echo "You have unpacked the last part"
exit 0
