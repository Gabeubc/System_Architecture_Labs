           .data
		   
a:         .byte 0, 1, 2, 3, 4, 5, 6, 7
           .byte 8, 9, 10, 11, 12, 13, 14, 15
	       .byte 16, 17, 18, 19, 20, 21, 22, 23
	       .byte 24, 25, 26, 27, 28, 29, 30, 31
	       .byte 32, 33, 34, 35, 36, 37, 38, 39
		   .byte 40, 41, 44, 43, 44, 45, 46, 47
		   .byte 48, 49
        
b:         .byte 50, 51, 52, 53, 54, 55, 56, 57
           .byte 58, 59, 60, 61, 62, 63, 64, 65
	       .byte 66, 67, 68, 69, 70, 71, 72, 73
	       .byte 74, 75, 76, 77, 78, 79, 80, 81
	       .byte 82, 83, 84, 85, 86, 87, 88, 89
		   .byte 90, 91, 92, 93, 94, 95, 96, 97
		   .byte 98, 99

c:         .byte 0, 0, 0, 0, 0, 0, 0, 0
           .byte 0, 0, 0, 0, 0, 0, 0, 0
	       .byte 0, 0, 0, 0, 0, 0, 0, 0
	       .byte 0, 0, 0, 0, 0, 0, 0, 0
	       .byte 0, 0, 0, 0, 0, 0, 0, 0
		   .byte 0, 0, 0, 0, 0, 0, 0, 0
		   .byte 0, 0
		   
max:       .byte 0
min:       .byte 0

           .text

main:
           daddi r1, r0, 50
		   daddi r2, r0, 0 
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
                     daddi r1, r1, -1
					 daddi r2, r2, 1
				;endNewRow:					 
					 bnez  r1, loop
			j endLoop
			
           setMaximum:
		             sb r4, max(r0)
					 j endSetMaximum
					 
		   setMinimum:
		             sb r4, min(r0)
					 j endSetMinimum
					 
           endLoop: 	
		   
		   halt
		   