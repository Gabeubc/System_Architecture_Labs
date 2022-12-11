# include <math.h>
#include <rt_fp.h>
#include <stdlib.h>

extern char _COLUMNS ;

extern char _ROWS 	;

extern int _Matrix_Coordinates[11][22];

extern int CHECK_SQUARE(int, int, int);

extern float MY_DIVISION(float, float);

int main(void){

	int i=0, j=0, rows=  _ROWS, columns= _COLUMNS;
	//int  **matrix= _Matrix_Coordinates;
	float pi=0, radius_sqr=25.0;
	volatile int area=0;
	
	
			for(i=0 ; i<rows ; i++)
				{
					 for(j=0 ; j<columns ; j+=2)
						{
							 area+=CHECK_SQUARE(_Matrix_Coordinates[i][j], _Matrix_Coordinates[i][j+1], 5);
						}
				}
				pi= MY_DIVISION((float) area, radius_sqr);
				
	while(1);
}
