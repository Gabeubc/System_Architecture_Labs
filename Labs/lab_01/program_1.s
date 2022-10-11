        .data
		
a:      .byte -3, 11, 11, 12, 11, 15, 10, 5, 10, 15, 11, 12, 11, 11, -3
		
flag:   .byte 1

        .text
		
main: 
        daddi r1, r0, 14
		daddi r2, r0, 0
		
loop:
        lb r4, a(r2)
		lb r5, a(r1)
		bne r4, r5, notPalidrom
		slt r3, r2, r1
		beqz r3, endLoop
		daddi r1, r1, -1
		daddi r2, r2, 1
		bnez r1, loop
		j endLoop
notPalidrom:
        sb r0, flag(r0)
endLoop:
		
halt