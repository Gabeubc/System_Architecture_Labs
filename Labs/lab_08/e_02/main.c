# include <math.h>
#include <rt_fp.h>
#include <stdio.h>

extern char _COLUMNS ;

extern char _ROWS 	;

extern int _Matrix_Coordinates[11][22];

extern int CHECK_SQUARE(int, int, int);

extern float MY_DIVISION(float, float);

extern Stack_Process;

extern char Opt_M_Coordinates[11][22];

int main(void){

	int i=0, j=0, rows=  _ROWS, columns= _COLUMNS;
	//int  **matrix= _Matrix_Coordinates;
	float pi=0, radius=5.0, radius_sqrt;
	volatile int area=0;
	
	
			for(i=0 ; i<rows ; i++)
				{
					 for(j=0 ; j<columns ; j+=2)
						{
							 area+=CHECK_SQUARE(_Matrix_Coordinates[i][j], _Matrix_Coordinates[i][j+1], 2);
						}
				}
				radius_sqrt= radius*radius;
				pi= MY_DIVISION((float) area, radius_sqrt);
				__asm__("mov R0, #3");
				__asm__("msr control, R0");
				__asm__("LDR SP, =Stack_Process");
				__asm__("nop");
				__asm__("svc 0xca");
				__asm__("svc 0xfe");
				
	while(1);
}
