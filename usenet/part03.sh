#!/bin/sh
# This is a shell archive (shar 3.10)
# made 04/20/1991 22:45 UTC by tron1@tronsbox
# Source directory /u1/home/tron1/src/tron1/shareware/x_hash
#
# existing files WILL be overwritten
#
# This shar contains:
# length  mode       name
# ------ ---------- ------------------------------------------
#   2823 -rw-r----- README
#   3085 -r--r----- src/sharew.h
#
touch 2>&1 | fgrep '[-amc]' > /tmp/s3_touch$$
if [ -s /tmp/s3_touch$$ ]
then
	TOUCH=can
else
	TOUCH=cannot
fi
rm -f /tmp/s3_touch$$
# ============= README ==============
sed 's/^X//' << 'SHAR_EOF' > README &&
X
X			    **************
X			    * X_HASH 1.0 *
X			    **************
X
X			ALL RIGHTS ARE RESERVED
X
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
X	  due. This evaluation period begins when you first get a 
X	  successful compile. After that time, you must register or
X	  stop using this code.
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
    touch -am 0420183991 README
fi
# ============= src/sharew.h ==============
if test ! -d 'src' ; then
    mkdir 'src'
fi
sed 's/^X//' << 'SHAR_EOF' > src/sharew.h &&
X/* 
X         Shareware license document : 
X
X	 sharew.h 1.2 4/20/91
X
X*/
X/*
X
X
X			    **************
X			    * X_HASH 1.0 *
X			    **************
X
X			ALL RIGHTS ARE RESERVED
X
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
X	  due. This evaluation period begins when you first get a 
X	  successful compile. After that time, you must register or
X	  stop using this code.
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
    touch -am 0420184291 src/sharew.h
fi
exit 0
