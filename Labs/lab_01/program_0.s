           .data
		   
a:         .byte 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
           .byte 10, 11, 12, 13, 14, 15, 16, 17, 18, 19
	       .byte 20, 21, 22, 23, 24, 25, 26, 27, 28, 29
	       .byte 30, 31, 32, 33, 34, 35, 36, 37, 38, 39
	       .byte 40, 41, 42, 43, 44, 45, 46, 47, 48, 49
        
b:         .byte 50, 51, 52, 53, 54, 55, 56, 57, 58, 59
           .byte 60, 61, 62, 63, 64, 65, 66, 67, 68, 69
	       .byte 70, 71, 72, 73, 74, 75, 76, 77, 78, 79
	       .byte 80, 81, 82, 83, 84, 85, 86, 87, 88, 89
	       .byte 90, 91, 92, 93, 94, 95, 96, 97, 98, 99

c:         .byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
           .byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 0           
		   .byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 0           
		   .byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 0           
		   .byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
		   
max:       .byte 0
min:       .byte 0

           .text

main:
           daddi r1, r0, 6 
		   daddi r2, r0, 0 
		   daddi r7, r0, 9
		   lb r3, a(r2)
		   lb r4, b(r2)
		   dadd r4, r4, r3
		   sd r4, c(r2)
		   sb r4, max(r0)
		   sb r4, min(r0)
		   daddi r2, r2, 1
           daddi r1, r1, -1
					 
		   loop:
		             lb r3, a(r2)
		             lb r4, b(r2)
		             dadd r4, r4, r3
		             sb r4, c(r2)
					 lb r5, max(r0)
					 slt r6, r5, r4
					 bnez r6, setMaximum
				endSetMaximum:
					 lb r5, min(r0)
					 slt r6, r5, r4
					 beqz r6, setMinimum
			    endSetMinimum:
                     daddi r7, r7, -1
					 beqz r7, newRow
					 daddi r2, r2, 1
				endNewRow:					 
					 bnez  r1, loop
			j endLoop
			
           setMaximum:
		             sb r4, max(r0)
					 j endSetMaximum
					 
		   setMinimum:
		             sb r4, min(r0)
					 j endSetMinimum	

           newRow:
		             daddi r7, r0, 9
					 daddi r2, r2, 8
					 daddi r1, r1, -1
					 j endNewRow
           endLoop: 	
		   
		   halt
		   