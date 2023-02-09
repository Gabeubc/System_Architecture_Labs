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
//exam declaration

volatile int step=0;
extern int count_negative_and_odd(int* VETT, unsigned int n); 
volatile int led04_on=0;

//end declaration




void RIT_IRQHandler (void)
{	
	static int J_select=0;
	static int J_down = 0;
	static int J_up = 0;
	static int VAR1;
	static int pos=0;
	static int VETT[N]={0};
	int res=0;
	int i;
	/////joystck
	
	//joystick select
		if((LPC_GPIO1->FIOPIN & (1<<25)) == 0){	
		
		J_select++;
		switch(J_select){
			case 1:
				if(step==0 && pos<N)
				{
					step=1;/// VAR1 is ready
					VETT[pos++]=VAR1;
					VAR1=0;
					step=0;
				}
				if(pos>=N)
				{
					step=1;
					res=count_negative_and_odd(VETT, pos);					///call assembly func
					if(res==0)
					{
						if(led04_on==0)
						{
							led04_on=1;
							LED_On(7);
							enable_timer(0);
							enable_timer(1);
						}
					}
					else
					{
						LED_Out(res);
						LED_Off(7);
						disable_timer(0);
						disable_timer(1);
					}
					for(i=0 ; i<N ; i++)
					VETT[i]=0;
					pos=0;
					step=0;
				}
			//handler
				break;
			default:
				break;
		}
	}
	else{
			J_select=0;
	}
	
		/// joystick Up
	if((LPC_GPIO1->FIOPIN & (1<<29)) == 0){	
		
		J_up++;
		switch(J_up){
			case 1:
				if(step==0)
				{
					VAR1+=12;
				}
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
				if(step==0)
				{
					VAR1-=8;
				}
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

	reset_RIT();
  LPC_RIT->RICTRL |= 0x1;	/* clear interrupt flag */
	
  return;
}

/******************************************************************************
**                            End Of File
******************************************************************************/
