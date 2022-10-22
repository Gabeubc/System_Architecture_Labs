             .data

ifmap: 		.byte	1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
kernel: 	.byte	1,1,1,1,1,1,1,1,1
ofmap:		.space   9

             .text

main:
 
     daddi r1, r0, 0 ; i
	 daddi r2, r0, 0 ; l
	 daddi r3, r0, 0 ; k
	 daddi r4, r0, 0 ; pos
	 daddi r5, r0, 0 ; countForOfMap
	 daddi r6, r0, 3 ; kernelEdgeLength
	 daddi r7, r0, 13; endForAllStartUsefullPointFromIfMap
	 daddi r8, r0, 9 ; kernelLength
	 daddi r9, r0, 0 ; sum
	 daddi r10, r0, 0; j
	 
loop_1:
     
	 dadd r4, r0, r1
	 
	 loop_2:
	     
		 daddi r3, r4, 3
		 
		 loop_3:
			 daddi r8, r8, -1
	         lb r11, ifmap(r4)         
		     lb r12, kernel(r10)
			 dmul r11, r11, r12
			 dadd r9, r9, r11
			 daddi r4, r4, 1
			 daddi r10, r10, 1
			 bne r4, r3, loop_3
         
         daddi r4, r4, 2
         bnez r8, loop_2
		 
	 daddi r10, r0, 0	 
	 daddi r8, r0, 9
	 sb r9, ofmap(r5)
	 daddi r5, r5, 1
	 daddi r9, r0, 0
	 daddi r2, r2, 1
	 daddi r1, r1, 1
	 bne r2, r6, nextStep
	 
	 daddi r1, r1, 2
	 daddi r2, r0, 0
	 
	 nextStep:
	     slt r13, r1, r7
	     bnez r13, loop_1
		 
halt
			 