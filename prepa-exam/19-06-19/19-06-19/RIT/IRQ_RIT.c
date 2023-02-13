/*********************************************************************************************************
**--------------File Info---------------------------------------------------------------------------------
** File name:           IRQ_RIT.c
** Last modified Date:  2014-09-25
** Last Version:        V1.00
** Descriptions:        functions to manage T0 and T1 interrupts
** Correlated files:    RIT.h
**--------------------------------------------------------------------------------------------------------
*********************************************************************************************************/
#include "lpc17xx.h"
#include "RIT.h"
#include "../led/led.h"
#include "../timer/timer.h"
#include "stdlib.h"


/******************************************************************************
** Function name:		RIT_IRQHandler
**
** Descriptions:		REPETITIVE INTERRUPT TIMER handler
**
** parameters:			None
** Returned value:		None
**
******************************************************************************/


#define N 5
#define max 100
#define min -100

//exam declaration

volatile int DATA_IN[N]={0};
volatile int step=0;

//end declaration



volatile int down_0 = 0;
volatile int down_1 = 0;
volatile int down_2 = 0;


void RIT_IRQHandler (void)
{	
	static int J_select=0;
	static int J_down = 0;
	static int J_left = 0;
	static int J_right = 0;
	static int J_up = 0;
	extern int BEST_3[3];
	extern int find_best_3 (int DATA_IN[], int L, int BEST_3[]);
	int res;
	int i;
	
	
	/////joystck
	
	//joystick select
		if((LPC_GPIO1->FIOPIN & (1<<25)) == 0){	
		
		J_select++;
		switch(J_select){
			case 1:
			//handler
				break;
			default:
				break;
		}
	}
	else{
			J_select=0;
	}
	
	/// joystick Left
	if((LPC_GPIO1->FIOPIN & (1<<27)) == 0){	
		
		J_left++;
		switch(J_left){
			case 1:
				//handler
			break;
			default:
				break;
		}
	}
	else{
			J_left=0;
	}
	
	
		/// joystick Right
	if((LPC_GPIO1->FIOPIN & (1<<28)) == 0){	
	
		
		J_right++;
		switch(J_right){
			case 1:
				//handler
				break;
			default:
				break;
		}
	}
	else{
			J_right=0;
	}	
	
		/// joystick Up
	if((LPC_GPIO1->FIOPIN & (1<<29)) == 0){	
		
		J_up++;
		switch(J_up){
			case 1:
				//handler
			break;
			default:
				break;
		}
	}
	else{
			J_up=0;
	}	
	
	
		//joystick down
	if((LPC_GPIO1->FIOPIN & (1<<26)) == 0){	
		
		J_down++;
		switch(J_down){
			case 1:
				//handler
				break;
			default:
				break;
		}
	}
	else{
			J_down=0;
	}
	
	///end joystick
	
	
	
	//button debouncing
	
	
			//int0
	if(down_0!=0){  
			down_0 ++;  
		if((LPC_GPIO2->FIOPIN & (1<<10)) == 0){

			switch(down_0){
			case 2:
			///handler
				break;
			default:
				break;
		}
	}
	else {	/* button released */
		down_0=0;			
		NVIC_EnableIRQ(EINT0_IRQn);							 /* enable Button interrupts			*/
		LPC_PINCON->PINSEL4    |= (1 << 20);     /* External interrupt 0 pin selection */
	}
	}	
	
	
		//key1
	if(down_1!=0){  
			down_1 ++;  
		if((LPC_GPIO2->FIOPIN & (1<<11)) == 0){

			switch(down_1){
			case 2:
			///handler
			if(step==0)
			{
	
			for (i=0 ; i<N ; i++)
			{	
					DATA_IN[i]=min + rand() % (max - min + 1);
			}
				res=find_best_3(DATA_IN, N, BEST_3);
				step=1;
				enable_timer(2);
			}
			else{
				step=0;
			}
				break;
			default:
				break;
		}
	}
	else {	/* button released */
		down_1=0;			
		NVIC_EnableIRQ(EINT1_IRQn);							 /* enable Button interrupts			*/
		LPC_PINCON->PINSEL4    |= (1 << 22);     /* External interrupt 0 pin selection */
	}
	}
	
			//key2
	if(down_2!=0){  
			down_2 ++;  
		if((LPC_GPIO2->FIOPIN & (1<<12)) == 0){
			switch(down_2){
			case 2:
			///handler
				break;
			default:
			
				break;
		}
	}
	else {	/* button released */
		down_2=0;			
		NVIC_EnableIRQ(EINT2_IRQn); 							 /* enable Button interrupts			*/
		LPC_PINCON->PINSEL4    |= (1 << 24);     /* External interrupt 0 pin selection */
	}
	}
		
	reset_RIT();
  LPC_RIT->RICTRL |= 0x1;	/* clear interrupt flag */
	
  return;
}

/******************************************************************************
**                            End Of File
******************************************************************************/
