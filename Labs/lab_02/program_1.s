
         .data
	 
v1:      .double  1, 2, 3, 4, 5.2, 6, 7, 8, 9, 10
         .double  1, 2, 3, 4, 5.2, 6, 7, 8, 9, 10
         .double  1, 2, 3, 4, 5.2, 6, 7, 8, 9, 10
         .double  1, 2, 3, 4, 5.2, 6, 7, 8, 9, 10
         .double  1, 2, 3, 4, 5.2, 6, 7, 8, 9, 10
         .double  1, 2, 3, 4, 5.2, 6, 7, 8, 9, 10
		 
v2:      .double  1, 2, 3.14, 4, 5, 6, 7, 8, 9, 10
         .double  1, 2, 3.14, 4, 5, 6, 7, 8, 9, 10
         .double  1, 2, 3.14, 4, 5, 6, 7, 8, 9, 10
         .double  1, 2, 3.14, 4, 5, 6, 7, 8, 9, 10
         .double  1, 2, 3.14, 4, 5, 6, 7, 8, 9, 10
         .double  1, 2, 3.14, 4, 5, 6, 7, 8, 9, 10
		 
v3:      .double  1, 2, 34, 4, 5, 6, 7, 8, 9, 10
         .double  1, 2, 3.14, 4, 5, 6, 7, 8, 9, 10
         .double  1, 2, 3.14, 4, 5, 6, 7, 8, 9, 10
         .double  1, 2, 3.14, 4, 5, 6, 7, 8, 9, 10
         .double  1, 2, 3.14, 4, 5, 6, 7, 8, 9, 10
         .double  1, 2, 3.14, 4, 5, 6, 7, 8, 9, 10
		 
v4:      .double  1, 2, 3, 4, 5.2, 6, 7, 8, 9, 10
         .double  1, 2, 3, 4, 5.2, 6, 7, 8, 9, 10
         .double  1, 2, 3, 4, 5.2, 6, 7, 8, 9, 10
         .double  1, 2, 3, 4, 5.2, 6, 7, 8, 9, 10
         .double  1, 2, 3, 4, 5.2, 6, 7, 8, 9, 10
         .double  1, 2, 3, 4, 5.2, 6, 7, 8, 9, 10
		 
v5:      .space 240
		 
v6:      .space 240
		 
v7:      .space 240
		 
         .text
		
main:

         daddi r1, r0, 60   ;  FDEMW 
	     daddi r2, r0, 0     ;  FDEMW
		 
loop:

		 l.d f1, v1(r2)      ;   FDDEMW
		 l.d f2, v2(r2)       ;    FDEMW 
		 l.d f3, v3(r2)
		 l.d f4, v4(r2)
		 add.d f5, f1, f2
		 mul.d f5, f5, f3
		 add.d f5, f5, f4
		 s.d f5, v5(r2)
		 mul.d f6, f1, f4
		 div.d f6, f5, f6
		 s.d f6, v6(r2)
		 add.d f7, f2, f3
		 mul.d f7, f6, f7
		 s.d f7, v7(r2)
		 daddi r2, r2, 8
		 daddi r1, r1, -1
		 bnez r1, loop
		 
halt
