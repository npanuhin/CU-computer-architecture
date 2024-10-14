// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed,
// the screen should be cleared.

(LOOP)
    @KBD
    D=M

    @FILL
    D;JNE

    @COLOR
    M=0

    @DRAW
    0;JMP

(FILL)
    @COLOR
    M=-1

(DRAW)
    @SCREEN
    D=A
    @8192
    D=D+A
    @i
    M=D

(DRAWLOOP)
    @cur_pixel
    D=M             // Load cur_pixel (current screen address)

    @24576       // 16384 + 8192 == 24576
    D=D-A           // Subtract SCREEN+8192 (24576) from cur_pixel to check if we've reached the end of the screen

    @LOOP
    D;JGE           // If cur_pixel >= SCREEN+8192, jump back to the main loop

    @COLOR
    D=M             // Load the current color (black or white)
    @cur_pixel
    A=M             // Set A to the current screen address (cur_pixel)
    M=D             // Set the pixel at address cur_pixel to the current color

    @cur_pixel
    M=M+1           // Increment cur_pixel to the next screen address

@DRAWLOOP
0;JMP
