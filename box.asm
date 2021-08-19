.model small

MOV AH, 0  ; INT 10h / AH = 0 - set video mode.
MOV AL, 13h  ; for graphical mode , 13h - graphical mode. 320x200 pixels
INT 10h   

MOV AH, 0CH ;  INT 10h / AH = 0Ch - change color for a pixel.
MOV AL, 4 ; AL = pixel color , 4 = red color (BIOS Color Attribute)
MOV CX, 50 ; horizontal move 50 pixels
MOV DX, 60 ;  verticle move 60 pixels
INT 10h  ; print 

MOV BL, 70 ; BL- for loop,(because we are printing one-one pixel), 70 length of the side (pixels)
firstside: ; label
INT 10H ; print 
INC CX ; increment one pixel right side <= 70 pixels
DEC BL ; decrement BL to exit the loop 
JNZ firstside ; jumping 

MOV BL, 70 
secondside:
INT 10H 
INC DX ; increment one pixel down side <= 70 pixels
DEC BL
JNZ secondside

MOV BL, 70
thirdside:
INT 10h
DEC CX  ; decrement one pixel left side >= 70 pixels
DEC BL
JNZ thirdside 

MOV BL, 70
fourthside:
INT 10h
DEC DX  ; decrement one pixel up side >=  70 pixels
DEC BL
JNZ fourthside 

ret
