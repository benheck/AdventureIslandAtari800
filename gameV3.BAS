10 REM ADVENTURE ISLAND REBIRTH: RISE OF DAWN, BY OLDER BEN HECK
20 DIM LOC$(80),RE$(80),P$(100),O$(100),WORD$(10),DA(255),LASTNOUN$(3)
30 DIM NOUN$(3),VERB$(3),I$(50),PREFACE$(20)
40 MATCHLOC=99:LEVERLOC=36:DYNAMITELOC=27:KNIFELOC=99:VINELOC=99:GREASELOC=99:OARSLOC=31
50 WCOUNT=0:CUR=0:T=0
60 CLEARLIST=5500:APPENDLIST=5600:SHOWEXITS=5000:SHOWOBJECTS=5100:SHOWINVENTORY=5200
70 ROOM=1
80 TREESTATE=0:BOULDERSTATE=0:CANVASSTATE=0:LEVERSTATE=0:MATCHES=4:OARSSTATE=0
90 WETBOMB=1:FUSE=0:KILN=0:BOARDS=0:CHUTE=0:VINESTATE=0:VINEHOOK=0:WHALESTATE=0
95 CARTSTATE=0
99 GR.0:GOTO 1000
100 LOC$="You find yourself shipwrecked on the shores of a desolate island"
101 RE$="The sea is vast"
102 NO=2:RETURN
110 LOC$="You are further up shore"
111 RE$="The sand glitters in the sunlight"
112 SO=1:NO=3:RETURN
120 LOC$="You are on a path"
121 RE$="To the east you hear the animalistic sounds of a jungle"
123 EA=4:SO=2:RETURN
130 LOC$="You are at the edge of a jungle"
131 IF TREESTATE=0 THEN RE$="A fallen, dried-up tree blocks the east path":WE=3:NO=6:RETURN
132 IF TREESTATE=1 THEN RE$="A path leads east.":EA=5:NO=6:WE=3:RETURN
140 LOC$="You are inside the steamy jungle"
141 IF VINESTATE=0 THEN RE$="Vines hang from the canopy":GOTO 149
142 RE$=""
149 WE=4:NO=7:RETURN
150 LOC$="You are in an old lean-to":SO=4:LASTNOUN$="BOA"
151 IF BOARDS=0 THEN RE$="The boards are loose":RETURN
152 RE$="The boards lay in splinters on the foor":RETURN
160 LOC$="You are at a wall":RE$="It appears man-made"
161 SO=5:DO=26:RETURN
170 LOC$="You are at the north side of the wall":RE$=" "
171 EA=19:NO=9:RETURN
180 LOC$="You are in a swamp"
181 RE$=" "
182 NO=10:SO=8:RETURN
190 LOC$="You are on a path"
191 RE$="Vines lead down into a hole"
192 WE=11:SO=9:DO=15:RETURN
200 LOC$="You are at the base of an inactive volcano"
201 IF BOULDERSTATE=0 THEN GOTO 205
202 RE$="A tunnel leads west into it"
203 WE=29:EA=10:NO=12:RETURN
205 RE$="A boulder blocks a tunnel":EA=10:NO=12:RETURN
210 LOC$="You are at the north side of the volcano"
211 RE$="A passage leads down"
212 DO=13:SO=11:RETURN
220 LOC$="You are in a chamber filled with strange machinery"
221 IF LEVERSTATE=0 THEN GOTO 225
222 RE$="The open panel reveals a passage to the east":EA=14:UP=12:RETURN
225 RE$="There is a closed panel here, with a rusty hole next to it":UP=12:RETURN
230 LOC$="You are in a tunnel leading outside"
231 RE$="The sun shines from the north"
232 WE=13:NO=37:RETURN
240 LOC$="You are at a dead end, with an opening above you":SO=17
241 IF VINEHOOK=1 THEN GOTO 245
242 RE$="It is too far up to reach, but there is a hook near it":RETURN
245 RE$="Vines hanging from the hook provide a path up":UP=10:RETURN
250 LOC$="You are in a curve in the passage"
251 RE$=" "
252 EA=17:SO=18:RETURN
260 LOC$="You are in an old underground crypt"
261 RE$="A decayed human is laying on the ground":LASTNOUN$="HUM"
262 WE=16:NO=15:RETURN
270 LOC$="You are under the wall's foundation"
271 RE$="You see some light to the north"
272 SO=26:NO=16:RETURN
280 LOC$="You are on a path next to the north side of the wall"
281 RE$=" "
282 EA=20:WE=8:RETURN
290 LOC$="You are on a path leading to the ocean"
291 RE$="Next to the east side of the wall"
299 WE=19:SO=21:RETURN
300 LOC$="You are on the eastern shore"
301 IF WHALESTATE=0 THEN RE$="A bloated whale corpse lays in the sun":GOTO 309
302 RE$="Someone has harvested the whale for grease. How barbaric"
309 EA=22:NO=20:RETURN
310 LOC$="You are at the bottom of a hill"
311 RE$="You see a building at the top of it"
312 WE=21:NO=23:RETURN
320 LOC$="You are outside a two-story hut"
321 RE$="It looks ready to collapse"
322 NO=24:SO=22:RETURN
330 LOC$="You are inside the old, smelly hut":SO=23:UP=25
331 IF KILN=0 THEN RE$="There's a pottery kiln here, with dry firewood in it"
332 IF KILN=1 THEN RE$="The pottery kiln is active"
339 RETURN
340 I$="You climb the ladder, and the entire hut collapses around you!":GOTO 8000
350 LOC$="You are in a cave system under the jungle"
351 RE$="Water drips all around you"
352 NO=18:SO=27:UP=7:RETURN
360 LOC$="You are on a path underground"
361 RE$="You hear dripping water to the south"
362 NO=26:SO=28:RETURN
370 LOC$="You are in a small recess in the ground"
371 RE$="A plug is on the ceiling"
372 NO=27:RETURN
380 LOC$="You are in a mining tunnel inside the volcano"
381 RE$="Looks like it hasn't been used in a century"
382 WE=32:EA=11:RETURN
390 LOC$="You are at a dead-end in the south tunnel. A large hole is above you":NO=32
391 IF CARTSTATE<2 THEN RE$="An old mining cart is here":RETURN
392 RE$="With the cart gone, a hole under the track is revealed":DO=31:RETURN
400 LOC$="You are in a dark, damp hole":UP=30
405 RE$="You are likely to be eaten by a grue":RETURN
410 LOC$="You are in a sharp turn of the corridor. Mine cart tracks lead south"
411 IF CARTSTATE=2 THEN RE$="The mining cart is here, you could stand on it to proceed up":UP=33
412 IF CARTSTATE<>2 THEN RE$="A path leads up, but it is beyond your reach"
419 EA=29:SO=30:RETURN
420 LOC$="You are on a musty platform"
421 IF CANVASSTATE=0 THEN GOTO 425
422 RE$="The canvas is ripped open enough for you to crawl past":UP=34:DO=32:RETURN
425 RE$="A piece of thick, oily canvas blocks the upper exit":DO=32:RETURN
430 LOC$="You are in the huge hollow in the volcano"
432 RE$="A crumbling path leads precariously west":WE=35
439 DO=33:RETURN
440 LOC$="You are on a cliff outside the volcano":SO=36:EA=34
445 RE$="It's a LONG WAY DOWN!":RETURN
450 LOC$="You are in a hollowed-out room off the edge of the cliff"
451 RE$="A cord dangles from the ceiling"
455 NO=35:RETURN
460 LOC$="You're on the north shore of the island":SO=14
461 IF OARSSTATE=0 THEN RE$="There's a small boat here, but it has no oars"
462 IF OARSSTATE=1 THEN RE$="The boat has oars, allowing an escape north":NO=38
469 RETURN
470 ? "You row the boat out to sea and...":GOTO 8500
1000 POKE 82,0:SETCOLOR 2,12,7:SETCOLOR 4,12,7:SETCOLOR 1,0,0
1020 WE=0:EA=0:SO=0:NO=0:UP=0:DO=0
1030 U=(ROOM*10)+90:GOSUB U
1040 ? :? LOC$:? RE$
1050 GOSUB SHOWEXITS:T=ROOM:PREFACE$="You see: ":GOSUB SHOWOBJECTS
1100 TRAP 1100:SOUND 0,0,0,0:?:?">";:INPUT I$
1101 FOR G=1 TO LEN(I$)
1102 CHAR = ASC(I$(G,G))
1103 IF CHAR>95 THEN CHAR=CHAR-32:I$(G,G)=CHR$(CHAR)
1104 NEXT G
1109 SOUND 0,255,2,1
1110 REM SINGLE WORD COMMANDS
1120 IF I$="L" OR I$="LOOK" THEN GOTO 1000
1130 IF I$="I" OR I$="INVENTORY" THEN GOSUB SHOWINVENTORY:GOTO 1100
1140 IF I$="N" AND NO>0 THEN ROOM=NO:GOTO 1000
1145 IF I$="N" AND NO=0 THEN GOTO 1990
1150 IF I$="S" AND SO>0 THEN ROOM=SO:GOTO 1000
1155 IF I$="S" AND SO=0 THEN GOTO 1990
1160 IF I$="E" AND EA>0 THEN ROOM=EA:GOTO 1000
1165 IF I$="E" AND EA=0 THEN GOTO 1990
1170 IF I$="W" AND WE>0 THEN ROOM=WE:GOTO 1000
1175 IF I$="W" AND WE=0 THEN GOTO 1990
1180 IF I$="U" AND UP>0 THEN ROOM=UP:GOTO 1000
1185 IF I$="U" AND UP=0 THEN GOTO 1990
1190 IF I$="D" AND DO>0 THEN ROOM=DO:GOTO 1000
1195 IF I$="D" AND DO=0 THEN GOTO 1990
1199 IF I$="HELP" OR I$="VERBS" OR I$="VERB" THEN ? "Verb list: ";:GOTO 1989
1200 REM NOT A SINGLE WORD COMMAND? PARSE NOUN
1210 L=LEN(I$):L=L+1:I$(L,L)=" "
1220 LET VERB$=I$(1,3):S=4
1230 IF I$(S,S)=" " THEN GOTO 1300
1240 S=S+1:IF S=L THEN ? "I don't understand":GOTO 1100
1250 GOTO 1230
1300 LET NOUN$=I$(S+1,S+3)
1310 IF NOUN$="IT " OR NOUN$="THI" OR NOUN$="THA" OR NOUN$="THE" THEN NOUN$=LASTNOUN$:GOTO 1400
1320 LASTNOUN$=NOUN$
1400 IF VERB$="GET" THEN 2000
1410 IF VERB$="TAK" THEN 2000
1420 IF VERB$="DRO" THEN 2100
1430 IF VERB$="EXA" THEN 2200
1450 IF VERB$="PUS" THEN 2600
1460 IF VERB$="PUL" THEN 2700
1470 IF VERB$="CUT" THEN 2800
1480 IF VERB$="BUR" THEN 3000
1490 IF VERB$="PUT" THEN 3100
1599 GOTO 1988
1979 ? "Invalid noun":GOTO 1100
1988 ? "Invalid verb, use ";
1989 ?"N S E W U D LOOK L INVENTORY I GET TAKE DROP EXAMINE PUSH PULL PUT CUT BURN":GOTO 1100
1990 ? "You can't go that way":GOTO 1100
2000 REM TAKE---------------
2010 IF NOUN$="MAT" AND MATCHLOC=ROOM THEN MATCHLOC=0:GOTO 2099
2015 IF NOUN$="VIN" AND VINELOC=ROOM THEN VINELOC=0:GOTO 2099
2016 IF NOUN$="VIN" THEN GOTO 2050
2020 IF NOUN$="LEV" AND LEVERLOC=ROOM THEN LEVERLOC=0:GOTO 2099
2025 IF NOUN$="GRE" AND GREASELOC=ROOM THEN GREASELOC=0:GOTO 2099
2030 IF NOUN$="DYN" AND DYNAMITELOC=ROOM THEN DYNAMITELOC=0:GOTO 2099
2035 IF NOUN$="OAR" AND OARSLOC=ROOM THEN OARSLOC=0:GOTO 2099
2040 IF NOUN$="KNI" AND KNIFELOC=ROOM THEN KNIFELOC=0:GOTO 2099
2049 ? "Can't take that":GOTO 1100
2050 IF ROOM<>5 THEN GOTO 2049
2051 IF VINESTATE=0 THEN ? "They're firmly attached. You need to cut them loose":GOTO 1100
2052 ? "You've already contributed to the defoliation of this rainforest":GOTO 1100
2099 ? "Taken":GOTO 1100
2100 REM DROP---------------
2110 IF NOUN$="MAT" AND MATCHLOC=0 THEN MATCHLOC=ROOM:GOTO 2199
2120 IF NOUN$="LEV" AND LEVERLOC=0 THEN LEVERLOC=ROOM:GOTO 2199
2125 IF NOUN$="OAR" AND OARSLOC=0 THEN OARSLOC=ROOM:GOTO 2199
2130 IF NOUN$="DYN" AND DYNAMITELOC=0 THEN DYNAMITELOC=ROOM:GOTO 2199
2135 IF NOUN$="GRE" AND GREASELOC=0 THEN GREASELOC=ROOM:GOTO 2199
2140 IF NOUN$="KNI" AND KNIFELOC=0 THEN KNIFELOC=ROOM:GOTO 2199
2145 IF NOUN$="VIN" AND VINELOC=0 THEN VINELOC=ROOM:GOTO 2199
2198 ? "Can't drop that":GOTO 1100
2199 ? "Dropped":GOTO 1100
2200 REM EXAMINE------------
2210 IF NOUN$="MAT" AND (MATCHLOC=0 OR MATCHLOC=ROOM) THEN GOTO 2215
2211 GOTO 2220
2215 IF MATCHES=4 THEN ? "The book contains 4 matches":GOTO 1100
2216 IF MATCHES=3 THEN ? "There's 3 left":GOTO 1100
2217 IF MATCHES=2 THEN ? "There's 2 left":GOTO 1100
2218 IF MATCHES=1 THEN ? "Only 1 left":GOTO 1100
2219 ? "The matchbook is empty":GOTO 1100
2220 IF NOUN$="LEV" AND (LEVERLOC=0 OR LEVERLOC=ROOM) THEN ? "Looks like it was taken from a machine":GOTO 1100
2221 IF NOUN$="TRE" AND ROOM=4 THEN ? "It's very old, musty and dry looking":GOTO 1100
2222 IF NOUN$="SEA" AND ROOM=1 THEN ? "You've no chance of escape without a boat":GOTO 1100
2230 IF NOUN$="DYN" AND (DYNAMITELOC=0 OR DYNAMITELOC=ROOM) THEN GOTO 2235
2231 GOTO 2240
2235 IF WETBOMB=1 THEN ? "The dynamite is damp. It won't function in this state":GOTO 1100
2236 ? "The dynamite has been dried out and is now likely dangerous":GOTO 1100
2240 IF NOUN$="KNI" AND (KNIFELOC=0 OR KNIFELOC=ROOM) THEN ? "It's still sharp":GOTO 1100
2245 IF NOUN$="OAR" AND (OARSLOC=0 OR OARSLOC=ROOM) THEN ? "Put these on a boat!":GOTO 1100
2245 IF NOUN$="VIN" AND (VINELOC=0 OR VINELOC=ROOM) THEN ? "Quite strong and rope-like":GOTO 1100
2246 IF NOUN$="VIN" AND ROOM=5 AND VINESTATE=0 THEN ? "Looks useful, if you could cut them down":GOTO 1100
2250 IF NOUN$="CAN" AND ROOM=33 THEN ? "It's quite thick and oily":GOTO 1100
2255 IF NOUN$="GRE" AND (GREASELOC=0 OR GREASELOC=ROOM) THEN ? "Would make a good lubricant":GOTO 1100
2260 IF NOUN$="ROC" AND ROOM=30 THEN ? "It's covering something":GOTO 1100
2270 IF NOUN$="BOU" AND ROOM=11 THEN ? "Could be destroyed with dynamite":GOTO 1100
2280 IF NOUN$="HAN" AND ROOM=17 THEN ? "Looks like it wants something":GOTO 1100
2290 IF NOUN$="COR" AND ROOM=36 THEN ? "Part of some contraption":GOTO 1100
2300 IF NOUN$="PLU" AND ROOM=28 THEN ? "Water seeps from behind it":GOTO 1100
2305 IF NOUN$="WHA" AND ROOM=21 THEN ? "Probably contains useful resources":GOTO 1100
2310 IF NOUN$="WAL" AND ROOM=7 THEN ? "It's made of stone":GOTO 1100
2320 IF NOUN$="HUT" AND (ROOM=23 OR ROOM=24) THEN ? "Looks pretty old":GOTO 1100
2330 IF NOUN$="DEC" AND ROOM=1 THEN ? "Nothing special":GOTO 1100
2340 IF NOUN$="KIL" AND ROOM=24 THEN GOTO 2345
2341 GOTO 2350
2345 IF KILN=0 THEN ? "Looks functional.The firewood is already loaded":GOTO 1100
2346 ? "The firewood is burning, the kiln is operational":GOTO 1100
2350 IF NOUN$="FIR" AND ROOM=24 THEN GOTO 2355
2351 GOTO 2360
2355 IF KILN=0 THEN ? "The firewood is dry as a bone. It would burn easily":GOTO 1100
2356 ? "The firewood is burning":GOTO 1100
2360 IF NOUN$="HUM" AND ROOM=17 THEN GOTO 2400
2370 IF NOUN$="CAR" AND ROOM=30 AND CARTSTATE=0 THEN ? "The wheels are seized with rust":GOTO 1100
2399 ? "You can't examine that":GOTO 1100
2400 IF KNIFELOC<>99 THEN ? "There's a dry, gaping hole in their chest":GOTO 1100
2405 ? "A knife is plunged into their chest":LASTNOUN$="KNI":KNIFELOC=ROOM:GOTO 1100
2600 REM PUSH---------------
2610 IF NOUN$="ROC" AND ROOM=30 THEN GOTO 2690
2615 IF NOUN$="BOA" AND ROOM=6 AND BOARDS=0 THEN GOTO 2695
2620 IF NOUN$="CAR" THEN GOTO 2680
2649 ? "You can't push that":GOTO 1100
2680 IF ROOM=30 AND CARTSTATE=0 THEN ? "The wheels are seized with rust. They need lubricant":GOTO 1100
2681 IF ROOM=30 AND CARTSTATE=1 THEN GOTO 2690
2682 IF ROOM=32 AND CARTSTATE=2 THEN ? "You can't push it any further. But you could pull it back":GOTO 1100
2689 ? "There's no cart here":GOTO 1100
2690 ? "The cart rolls into the room north of you. A hole under the cart is revealed, leading down"
2691 DO=31:CARTSTATE=2:GOTO 1100
2695 ? "The boards fall apart, revealing a book of matches"
2696 LASTNOUN$="MAT":BOARDS=1:MATCHLOC=ROOM:GOTO 1100
2700 REM PULL---------------
2710 IF NOUN$="PLU" AND ROOM=28 THEN I$="The ocean pours in on you...":GOTO 8000
2715 IF NOUN$="CAR" THEN GOTO 2780
2720 IF NOUN$="BOA" AND ROOM=6 THEN GOTO 2600
2725 IF NOUN$="COR" AND ROOM=36 THEN GOTO 2730
2729 ? "You can't pull that":GOTO 1100
2730 ? "A trapdoor opens, you fall into a chute!":CHUTE=1:ROOM=30:GOTO 1000
2780 IF ROOM=32 AND CARTSTATE=2 THEN ? "The cart rolls back south":CARTSTATE=1:GOTO 1100
2781 IF ROOM=30 AND CARTSTATE=1 THEN ? "Can't pull it any further, but you could push":GOTO 1100
2789 GOTO 2729
2800 REM CUT----------------
2801 IF KNIFELOC<>0 THEN ? "You have nothing to cut with. Find a knife":GOTO 1100
2810 IF NOUN$="CAN" AND ROOM=33 AND CANVASSTATE=0 THEN GOTO 2820
2812 IF NOUN$="WHA" AND ROOM=21 THEN GOTO 2840
2815 IF NOUN$="VIN" AND ROOM=5 THEN GOTO 2830
2819 ? "You can't cut that":GOTO 1100
2820 ? "You slice open the canvas, making a pathway up":CANVASSTATE=1:UP=34:GOTO 1100
2830 IF VINESTATE=0 THEN VINESTATE=1:VINELOC=ROOM:? "The vines fall to the ground":GOTO 1100
2839 GOTO 2052
2840 IF WHALESTATE=0 THEN GREASELOC=ROOM:WHALESTATE=1:GOTO 2849
2841 ? "Better not risk it again, the Red Hot Chili Peppers might see you":GOTO 1100
2849 ? "You slice open the whale, revealing grease.":LASTNOUN$="GRE":GOTO 1100
3000 REM BURN---------------
3005 IF MATCHLOC<>0 THEN ? "You have no source of fire":GOTO 1100
3006 IF MATCHES=0 THEN ? "No matches left. You are probably going to die now":GOTO 1100
3009 IF NOUN$="DYN" THEN ? "To use dynamite: PUT DYNAMITE, consumes 1 match":GOTO 1100
3010 IF NOUN$="FIR" AND ROOM=24 AND KILN=0 THEN GOTO 3050
3020 IF NOUN$="CAN" AND ROOM=33 THEN GOTO 3060
3040 IF TREESTATE=0 AND ROOM=4 THEN GOTO 3070
3049 ? "You can't burn that":GOTO 1100
3050 ? "The firewood is now burning, the kiln is heating up"
3051 MATCHES=MATCHES-1:KILN=1:GOTO 1100
3060 ? "The oily canvas erupts into flames! It falls over you, burning you to a crisp!":GOTO 8000
3070 ? "The tree burns to ash, opening a path east":MATCHES=MATCHES-1:TREESTATE=1:EA=5:GOTO 1100
3100 REM PUT----------------
3110 IF NOUN$="DYN" THEN GOTO 3200
3120 IF NOUN$="LEV" AND ROOM=13 AND LEVERSTATE=0 THEN GOTO 3300
3130 IF NOUN$="VIN" THEN GOTO 3400
3140 IF NOUN$="GRE" THEN GOTO 3500
3150 IF NOUN$="OAR" THEN GOTO 3600
3199 ? "Can't put that there":GOTO 1100
3200 IF DYNAMITELOC<>0 THEN ? "You don't have any dynamite":GOTO 1100 
3210 ? "Put dynamite where";:INPUT P$
3220 IF P$(1,3)="BOU" AND ROOM=11 THEN GOTO 3290
3230 IF P$(1,3)="KIL" AND ROOM=24 THEN GOTO 3280
3240 IF P$(1,3)="FIR" AND ROOM=24 THEN GOTO 3270
3249 ? "That would be a waste of dynamite":GOTO 1100
3270 IF KILN=0 THEN ? "Don't put that there! What if someone lights a fire later?":GOTO 1100
3275 ? "The dynamite blows up, sending you and the hut sky-high!":GOTO 8000
3280 IF KILN=0 THEN ? "The kiln isn't active. The firewood isn't burning":GOTO 1100
3285 IF WETBOMB=1 THEN ? "The kiln dries out the dynamite, making it useable":WETBOMB=0:GOTO 1100
3286 ? "The dynamite is already dried. At this point you're literally playing with fire":GOTO 1100
3290 IF WETBOMB=1 THEN ? "The dynamite is damp and cannot be lit":GOTO 1100
3291 ? "The blouder is blown to smithereens, revealing a path west"
3292 BOULDERSTATE=1:MATCHES=MATCHES-1:WE=29:EA=10:NO=12:DYNAMITELOC=99:GOTO 1100
3300 IF LEVERLOC<>0 THEN ? "You don't have a lever":GOTO 1100
3310 ? "Put lever where";:INPUT P$
3320 IF P$(1,3)="HOL" THEN GOTO 3390
3349 ? "No reason to put lever there":GOTO 1100
3390 ? "The lever causes the panel to slide open, revealing an eastern passage"
3391 EA=14:LEVERLOC=ROOM:LEVERSTATE=1:GOTO 1100
3400 IF VINELOC<>0 THEN ? "You don't have any vines":GOTO 1100
3410 ? "Put vines where";:INPUT P$
3415 IF ROOM=15 AND P$(1,3)="HOO" THEN GOTO 3490
3420 ? "That would be a waste of perfectly good vines":GOTO 1100
3490 ? "The vines connect to the hook, allowing a passage up"
3495 VINEHOOK=1:VINELOC=99:UP=10:GOTO 1100
3500 IF GREASELOC<>0 THEN ? "You don't have any grease, and what's in your hair doesn't count":GOTO 1100
3510 ? "Put grease where";:INPUT P$
3515 IF ROOM=30 AND CARTSTATE=0 AND P$(1,3)="CAR" THEN GOTO 3520
3516 IF ROOM=30 AND CARTSTATE=0 AND P$(1,3)="WHE" THEN GOTO 3520
3519 ? "Don't waste your precious, illegal whale grease on that!":GOTO 1100
3520 ? "You grease up the cart's wheels, you should be able to push or pull it now"
3521 GREASELOC=99:CARTSTATE=1:GOTO 1100
3600 IF OARLOC<>0 THEN ? "You don't have any oars":GOTO 1100
3610 ? "Put oars where";:INPUT P$
3615 IF P$(1,3)<>"BOA" THEN GOTO 3649
3620 IF ROOM<>37 THEN GOTO 3649
3630 IF OARSSTATE=0 THEN GOTO 3650
3635 ? "They're already installed. Go north, young man"
3649 ? "Why put oars there?":GOTO 1100
3650 OARSLOC=99:OARSSTATE=1:NO=38:? "You install the oars on the boat, you can now row north":GOTO 1100
5000 REM SHOW EXITS SUBROUTINES
5001 GOSUB CLEARLIST
5010 ? "Exits lead: ";
5012 IF NO>0 THEN WORD$="north":GOSUB APPENDLIST
5014 IF SO>0 THEN WORD$="south":GOSUB APPENDLIST
5015 IF EA>0 THEN WORD$="east":GOSUB APPENDLIST
5016 IF WE>0 THEN WORD$="west":GOSUB APPENDLIST
5017 IF UP>0 THEN WORD$="up":GOSUB APPENDLIST
5018 IF DO>0 THEN WORD$="down":GOSUB APPENDLIST
5019 ? O$
5099 RETURN 
5100 REM SHOW OBJECTS SUBROUTINES
5101 GOSUB CLEARLIST
5110 IF MATCHLOC=T THEN WORD$="matches":GOSUB APPENDLIST
5120 IF LEVERLOC=T THEN WORD$="lever":GOSUB APPENDLIST
5130 IF DYNAMITELOC=T THEN WORD$="dynamite":GOSUB APPENDLIST
5140 IF KNIFELOC=T THEN WORD$="knife":GOSUB APPENDLIST
5145 IF OARSLOC=T THEN WORD$="oars":GOSUB APPENDLIST
5150 IF VINELOC=T THEN WORD$="vines":GOSUB APPENDLIST
5155 IF GREASELOC=T THEN WORD$="grease":GOSUB APPENDLIST
5190 IF WCOUNT>0 THEN ? PREFACE$;:? O$
5199 RETURN 
5200 REM SHOW INVENTORY set T as 0 (inventory) and call showobjects
5210 PREFACE$="You're holding: "
5220 T=0:GOSUB SHOWOBJECTS
5225 IF WCOUNT=0 THEN ? "Nothing held"
5299 RETURN 
5500 REM CLEARLIST
5510 O$=" ":WCOUNT=0:CUR=1
5599 RETURN 
5600 REM APPENDLIST 
5605 IF WCOUNT>0 THEN O$(CUR,CUR+2)=", ":CUR=CUR+2
5610 WCOUNT=WCOUNT+1
5620 O$(CUR)=WORD$:CUR=CUR+(LEN(WORD$))
5621 IF LEN(WORD$)<3 THEN RETURN
5622 LASTNOUN$=WORD$(1,3)
5623 FOR G=1 TO LEN(LASTNOUN$)
5624 CHAR = ASC(LASTNOUN$(G,G))
5625 IF CHAR>95 THEN CHAR=CHAR-32:LASTNOUN$(G,G)=CHR$(CHAR)
5626 NEXT G
5630 RETURN 
8000 REM YOU HAVE DIED A PEASANT'S DEATH!
8005 SETCOLOR 1,15,14:SETCOLOR 2,0,0:SETCOLOR 4,0,0
8010 FOR U=1 TO 10:? " ":NEXT U
8020 ? " ";I$
8030 ? :? :? "         YOU HAVE DIED!":FOR G=1 TO 500:NEXT G
8040 GOTO 10:REM START OVER!
8500 REM A WINNER IS YOU--------------
8510 SETCOLOR 1,0,0:SETCOLOR 2,7,8:SETCOLOR 4,15,14
8520 FOR U=1 TO 15:? " ":NEXT U
8530 ? " You get picked up by the crew of Whale Wars"
8540 ? " (You don't tell them where you got the grease)"
8550 ? " They take your back home"
8050 FOR G=1 TO 1000:NEXT G:END
9999 END
