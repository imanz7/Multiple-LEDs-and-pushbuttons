;
; Task3.asm
;
; Created: 13/11/2020 8:37:14 PM
; Author : imanz
;

.def temp = r16
 
main:
   	LDI      	temp, 0xE3
   	OUT      	DDRC, temp	   			;set pinc (PC2, PC3, PC4) as input (push button pin)
   	LDI      	temp, 0b00011100    	
	OUT      	DDRD, temp	   			;set PD2,PD3,PD4 as output (led pin)
 
loop:  
   	CALL		group1					;check status 1
	CALL		group2					;check status 2
	CALL		group3					;check status 3
   	RJMP      	loop            		;continuous loop
 
group1:
	IN			temp,pinc      		;read current state pinc (PC2)
	OUT			portd,temp			;light up led1 (PD2)
	CALL		delay				;delay before receive another input
	rJMP		loop			

group2:
	IN			temp,pinc      		;read current state pinc (PC3)
	OUT			portd,temp			;light up led1 (PD2)
	CALL		delay				;delay before receive another input
	rjmp		loop

group3:
	IN			temp,PINc      		;read current state pinc (PC4)
	OUT			portd,temp			;light up led1 (PD4)
	CALL		delay				;delay before receive another input
	rjmp		loop

delay:								;delay loop
	LDI	   	R24,100
   	LDI	   	R23,100
   	LDI	   	R22,10
 L1:
   	DEC	   	R22
   	BRNE    L1
   	DEC	   	R23
   	BRNE    L1
   	DEC	   	R24
   	BRNE    L1
   	NOP
   	RET
