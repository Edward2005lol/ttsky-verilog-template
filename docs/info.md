<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

My Slot Machine project features 3 slots which all display 1 of 4 symbols. My project features 4 symbols. The symbols are: The number seven, a crown, a horseshoe, and a money sign. Initially, the slots will display a random flashing of symbols. After the start button is pressed, that is when the slots will start spinning (flashing the symbols faster) and then after around 2 seconds the first slot will stop spinning and the first symbol will be decided, then after around 1 second the second slot will stop spinning and the second symbol will be decided, and after around another second the third slot will stop spinning and the third symbol will be decided. Once all 3 symbols have been decided, the 3 symbols will be displayed and you can press/hold the start button to start the spinning process again, and you can repeat this process indefinitely. If the slots ever get "stuck" simply press the reset button. Have fun gambling! (P.S You are gaurenteed to win :D). 

## How to test

You simply have to connect uin_in[0] to a push button, reset_n to another push button, and connect your PMOD accordingly:
red[0] -> uo_out[0];
red[1] -> uo_out[1];
green[0] -> uo_out[2];
green[1] -> uo_out[3];
blue[0] -> uo_out[4];
blue[1] -> uo_out[5];
hsync -> uo_out[6];
vsync -> uo_out[7];
Make sure to also connect both grounds and 3V3 signals to their respective locations as well. 

Then connect the Tiny VGA PMOD to a monitor that supports VGA and you should see the slots beginning to spin. Then press your start button to start the spinning. 

## External hardware

You will need 2 push buttons and the Tiny VGA PMOD
You need a push button for the reset_n signal
You need a push button for the start signal
The Tiny VGA PMOD will display my slot machine
