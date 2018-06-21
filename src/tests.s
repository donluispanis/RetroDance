;;-----------------------------LICENSE NOTICE-----------------------------------------------------
;;  This file is part of Amstrad CPC videogame "RetroDance"
;;  Copyright (C) 2018 WastedHorchata / Luis Gonzalez Aracil
;;  Copyright (C) 2015-2016 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
;;
;;  This program is free software: you can redistribute it and/or modify
;;  it under the terms of the GNU Lesser General Public License as published by
;;  the Free Software Foundation, either version 3 of the License, or
;;  (at your option) any later version.
;;
;;  This program is distributed in the hope that it will be useful,
;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;  GNU Lesser General Public License for more details.
;;
;;  You should have received a copy of the GNU Lesser General Public License
;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;-----------------------------LICENSE NOTICE-----------------------------------------------------


;;====================================================
;; TEST FOR HARDWARE SCROLLING
;;====================================================
vertical_and_horizontal_scrolling:

    ld   bc, #0xBC0D  ;; [3] 0xBC = Port for selecting CRTC Register, 0x0D = Selecting R13
   out (c), c        ;; [4] Select the R13 Register (0x0D to port 0xBC)
   inc   b           ;; [1] Change Output port to 0xBD (B = 0xBC + 1 = 0xBD)
   out (c), l        ;; [4] Write Selected Video Memory Offset to R13 (A to port 0xBD)
   
   ld a, l
   sla a

   ld   bc, #0xBC05  
   out (c), c        
   inc   b           
   out (c), a        

   ;ld a, (counter)
   cp #0

   jr nz, resta

	inc l
	jr end

   resta:
	dec l

	end:
 
   ld a, l
   cp a, #40

   jr nz, try

   ;ld a, (counter)
   xor #1
   ;ld (counter), a

   try:

   ld a, l
   cp a, #0

   ;jr nz, main_loop

   ;ld a, (counter)
   xor #1
   ;ld (counter), a

ret