;
; Task3.asm
;
; Created: 13/11/2020 8:37:14 PM
; Author : imanz
;

.def temp = r16
.def led1 = r17
.def led2 = r18
.def led3 = r19
 
main:
   	LDI      	temp, 0xE3
   	OUT      	DDRC, temp	   			;set pinc (PC2, PC3, PC4) as input (push button pin)
   	LDI      	temp, 0b00011100    	
	OUT      	DDRD, temp	   			;set PD2,PD3,PD4 as output (led pin)
	OUT			PORTD, temp				;enable pull up
 
loop:  
	IN			temp, pinc
	mov			led1,temp
	mov			led2,temp
	mov			led3,temp
	andi		led1, 0b00000100		;check if PC1 press
	breq		GROUP1
	andi		led2, 0b00001000		;check if PC2 press
   	breq		group2					
	andi		led3,0b00010000			;check if PC3 press
	breq		group3
	rJMP		loop	            		;continuous loop
 
group1:
	cBI			portd,2				;light off led1 (PD2)
	CALL		delay				;delay before receive another input
	sbi			portd, 2			;light on again
	rJMP		loop			

group2:
	cBI			portd,3				;light off led2 (PD2)
	CALL		delay				;delay before receive another input
	sbi			portd, 3			;light on again
	rJMP		loop
	
group3:
	cBI			portd,4				;light off led3 (PD2)
	CALL		delay				;delay before receive another input
	sbi			portd, 4			;light on again
	rJMP		loop

delay:								;delay loop
	LDI	   	R24,100
   	LDI	   	R23,100
   	LDI	   	R22,150
 L1:
   	DEC	   	R22
   	BRNE    L1
   	DEC	   	R23
   	BRNE    L1
   	DEC	   	R24
   	BRNE    L1
   	NOP
   	RET
