"converter.py" converts Atari BASIC listing line endings to PC format and vice-versa.

Atari Emulator:
LIST "X:PROGRAM.BAS" to virtual disk/PC system

Convert the Atari line ending listing to CR LF version
converter.py PROGRAM.BAS programPC.BAS --toPC

Edit programPC.BAS on PC

Convert CR LF to Atari line endings:
converter.py programPC.BAS PROGAM.BAS --toAtari

Atari Emulator:
ENTER "X:PROGRAM.BAS"

Save and run
