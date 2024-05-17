/* 

   Doubly linked list test file : 

	testlist.c 4/18/91 1.4

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
#include <x_list.h>
#include <stdio.h>
#include <stdlib.h>

#ifndef __cplusplus

/* Not C++ -- so test the regular C functions */

int main(){
  struct x_list * test_xlist;
  int loop;
  int * foo;

  printf("\ntestit - a testing program for the x_list list\n");
  printf("         manager. testit.c  testit.c 1.3 3/3/91 \n\n");


  /* Let's create the list that we will play with */
  test_xlist = init_xlist();
  if( test_xlist == NULL ){
    fprintf(stderr,"There is an error in the init_xlist() function!\n");
    return( FALSE );
  }else{
    printf("\nOk.... init_xlist() seems to be working ok!\n");
  }

  /* Let's set the user pointer just to play with !	*/
  if( set_user_xlist( test_xlist, "User data test!" ) == FALSE ){
    fprintf(stderr,"Error in the set_user_xlist() function!\n");
  }else{
    printf("Ok.... set_user_xlist() seems to be working ok!\n");
  }

  /* Let's get the user pointer just to play with !	*/
  if( get_user_xlist( test_xlist ) == NULL ){
    fprintf(stderr,"Error in the get_user_xlist() function!\n");
    return( FALSE );
  }else{
    printf("Ok.... get_user_xlist() seems to be working ok!\n");
  }

  /* Add 100 integers to the list just for fun !	*/
  for( loop = 0; loop < 100; loop++ ){
    foo = (int *)malloc( sizeof(int) );
    if( foo == NULL ){
      fprintf(stderr,"Malloc error on test insert #%d !\n", loop);
      return( FALSE );
    }
    *foo = loop;
    if( add_xlist( test_xlist, foo ) == FALSE ){
      fprintf(stderr,"add_xlist() error on test insert #%d !\n", loop);
      return( FALSE );
    }
  }
  
  /* Now .. see that the counter got set right! */
  if( get_count_xlist( test_xlist ) != 100 ){
    fprintf(stderr,"get_count_xlist() error! Said #%d, should be 100 !\n",
	    get_count_xlist( test_xlist ) );
    return( FALSE );
  }else{
    printf("Ok.... get_count_xlist() seams to be working ok!\n");
  }

  /* Now, reset the list to the end ! */
  if( tail_xlist( test_xlist ) == FALSE ){
    fprintf(stderr,"tail_xlist() error !\n", loop);
    return( FALSE );
  }else{
    printf("Ok.... tail_xlist() seems to be working!\n");
  }

  /* Now, reset the list to the top ! */
  if( head_xlist( test_xlist ) == FALSE ){
    fprintf(stderr,"head_xlist() error !\n", loop);
    return( FALSE );
  }else{
    printf("Ok.... head_xlist() seems to be working!\n");
  }

  /* Now, let's retrieve all that data and make sure that it is right ! */
  for( loop = 0; loop < 100; loop++ ){
    foo = (int *)get_xlist( test_xlist ); 
    if( foo == NULL ){
      fprintf(stderr,"get_xlist() error on test retrieve #%d !\n", loop);
      return( FALSE );
    }
    if( *foo != loop ){
      fprintf(stderr,"get_xlist() error on test retrieve #%d !\n", loop);
      return( FALSE );
    }
    if( get_nodenum_xlist( test_xlist ) != loop ){
      fprintf(stderr,
	      "get_nodenum_xlist() error on test retrieve #%d !\n", loop);
    }
    if( next_xlist( test_xlist ) == FALSE && loop != 99 ){
      fprintf(stderr,"next_xlist() error on test retrieve #%d !\n", loop);
      return( FALSE );
    }
  }
  
  printf("Ok.... 100 retrieves went ok, next_xlist() is working fine !\n");

  /* Now, let's retrieve all that data and make sure that it is right ! */
  for( loop = 99; loop > -1; loop-- ){
    foo = (int *)get_xlist( test_xlist ); 
    if( foo == NULL ){
      fprintf(stderr,"get_xlist() error on test retrieve #%d !\n", loop);
      return( FALSE );
    }
    if( *foo != loop ){
      fprintf(stderr,"get_xlist() error on test retrieve #%d !\n", loop);
      return( FALSE );
    }
    if( get_nodenum_xlist( test_xlist ) != loop ){
      fprintf(stderr,
	      "get_nodenum_xlist() error on test retrieve #%d !\n", loop);
    }
    if( prev_xlist( test_xlist ) == FALSE && loop != 0 ){
      fprintf(stderr,"prev_xlist() error on test retrieve #%d !\n", loop);
      return( FALSE );
    }
  }
  
  printf("Ok.... 100 retrieves went ok, prev_xlist() is working fine !\n");

  if( goto_xlist( test_xlist, 50 ) == FALSE ){
      fprintf(stderr,"goto_xlist() error  !\n");
      return( FALSE );    
  }
  foo = (int *)get_xlist( test_xlist ); 
  if( foo == NULL ){
    fprintf(stderr,
	    "get_xlist() error on retrieve for goto_xlist() !\n");
    return( FALSE );
  }
  if( *foo != 50 ){
    fprintf(stderr,
	    "get_xlist() error on retrieve for goto_xlist() !\n");
    return( FALSE );
  }  
  printf("Ok.... goto_xlist() seems to be working fine !\n");

  if( get_nodenum_xlist( test_xlist ) != 50 ){
    fprintf(stderr,
	    "get_nodenum_xlist() error (does not match)! \n");
    return( FALSE );
  }
  printf("Ok.... get_nodenum_xlist() seems to be working ok! \n");


  if( free_xlist( test_xlist ) == FALSE ){
    fprintf(stderr,"free_xlist() error !!! \n");
    return( FALSE );
  }else{
    printf("Ok.... free_xlist() seems to be working! \n");
  }

  printf("\nAll tests passed ! Congratulations !\n\n");
  return( TRUE );
}

#endif

#ifdef __cplusplus

/*  C++ -- so test the C++ functions */

int main(){
  X_List test_xlist;
  int loop;
  int * foo;

  printf("\ntestit - a testing program for the x_list list\n");
  printf("         manager (C++ version). testit.c testit.c 1.3 3/3/91\n\n");

  /* Let's set the user pointer just to play with !	*/
  if( test_xlist.set_user( "User data test!" ) == FALSE ){
    fprintf(stderr,"Error in the X_List.set_user() function!\n");
  }else{
    printf("Ok.... X_List.set_user() seems to be working ok!\n");
  }

  /* Let's get the user pointer just to play with !	*/
  if( test_xlist.get_user() == NULL ){
    fprintf(stderr,"Error in the X_List.get_user() function!\n");
    return( FALSE );
  }else{
    printf("Ok.... X_List.get_user() seems to be working ok!\n");
  }

  /* Add 100 integers to the list just for fun !	*/
  for( loop = 0; loop < 100; loop++ ){
    foo = (int *)malloc( sizeof(int) );
    if( foo == NULL ){
      fprintf(stderr,"Malloc error on test insert #%d !\n", loop);
      return( FALSE );
    }
    *foo = loop;
    if( test_xlist.add( foo ) == FALSE ){
      fprintf(stderr,"X_List.add() error on test insert #%d !\n", loop);
      return( FALSE );
    }
  }
  
  /* Now .. see that the counter got set right! */
  if( test_xlist.count() != 100 ){
    fprintf(stderr,"X_List.count() error! Said #%d, should be 100 !\n",
	    test_xlist.count() );
    return( FALSE );
  }else{
    printf("Ok.... X_List.count() seams to be working ok!\n");
  }

  /* Now, reset the list to the top ! */
  if( test_xlist.head() == FALSE ){
    fprintf(stderr,"X_List.head() error !\n", loop);
    return( FALSE );
  }else{
    printf("Ok.... X_List.head() seems to be working!\n");
  }

  /* Now, let's retrieve all that data and make sure that it is right ! */
  for( loop = 0; loop < 100; loop++ ){
    foo = (int *)test_xlist.get(); 
    if( foo == NULL ){
      fprintf(stderr,"X_List.get() error on test retrieve #%d !\n", loop);
      return( FALSE );
    }
    if( *foo != loop ){
      fprintf(stderr,"X_List.get() error on test retrieve #%d !\n", loop);
      return( FALSE );
    }
    if( test_xlist.next() == FALSE && loop != 99 ){
      fprintf(stderr,"X_List.next() error on test retrieve #%d !\n", loop);
      return( FALSE );
    }
  }
  
  printf("Ok.... 100 retrieves went ok, X_List.next() is working fine !\n");

  /* Now, let's retrieve all that data and make sure that it is right ! */
  for( loop = 99; loop > -1; loop-- ){
    foo = (int *)test_xlist.get(); 
    if( foo == NULL ){
      fprintf(stderr,"X_List.get() error on test retrieve #%d !\n", loop);
      return( FALSE );
    }
    if( *foo != loop ){
      fprintf(stderr,"X_List.get() error on test retrieve #%d !\n", loop);
      return( FALSE );
    }
    if( test_xlist.prev() == FALSE && loop != 0 ){
      fprintf(stderr,"X_List.prev() error on test retrieve #%d !\n", loop);
      return( FALSE );
    }
  }
  
  printf("Ok.... 100 retrieves went ok, X_List.prev() is working fine !\n");

  /* Now, let's retrieve it with the [] operator ! */
  for( loop = 99; loop > -1; loop-- ){
    foo = (int *)test_xlist[loop]; 
    if( foo == NULL ){
      fprintf(stderr,"X_List operator [] error on #%d !\n", loop);
      return( FALSE );
    }
    if( *foo != loop ){
      fprintf(stderr,"X_List operator [] error on #%d !\n", loop);
      return( FALSE );
    }
    if( test_xlist.nodenum() != loop ){
      fprintf(stderr,"X_List.nodenum() error on #%d!\n", loop);
    }
  }
  printf("Ok.... X_List.goto_node() seems to work ok!\n");
  printf("Ok.... X_List.nodenum() seems to work ok!\n");
  printf("Ok.... the operator [] seems to work ok!\n");
  
  printf("\nAll tests passed ! Congratulations !\n\n");
  return( TRUE );
}

#endif


