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

;;=========================================
;; MAIN FILE
;;=========================================
.area _DATA
.area _CODE

;;=========================================
;; INCLUDE AREA
;;=========================================
.globl cpct_disableFirmware_asm		;;unique use cpct function
.globl cpct_setVideoMode_asm		;;unique use cpct function

.globl cpct_drawSolidBox_asm

;;=========================================
;;=========================================
;; MAIN
;;=========================================
;;=========================================

;;=============================================
;; Main function
;; INPUT:		none
;; DESTROYS:	all
;; OUTPUT:		none
;;=============================================
_main::

	counter: .db #0

	call cpct_disableFirmware_asm	;;disable firmware 

	;ld hl, #isr	;;pointer to function
	;call cpct_setInterruptHandler_asm ;;set interruption handler 

	ld c, #0
	call cpct_setVideoMode_asm	;;set video mode to 0

	;ld hl, #_sprite_palette
	;ld de, #16
	;call cpct_setPalette_asm		;;change the palette

	ld de, #0xC000
	ld a,  #8
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld l, #0



	;;MAIN lOOP
	main_loop::

		;;========================================
		;; ERASE 
		;;========================================
		
		;;========================================
		;; UPDATE
		;;========================================
		push hl
		call draw_all_tiles
		pop hl

			   ld   bc, #0xBC0D  ;; [3] 0xBC = Port for selecting CRTC Register, 0x0D = Selecting R13
   out (c), c        ;; [4] Select the R13 Register (0x0D to port 0xBC)
   inc   b           ;; [1] Change Output port to 0xBD (B = 0xBC + 1 = 0xBD)
   out (c), l        ;; [4] Write Selected Video Memory Offset to R13 (A to port 0xBD)
   
   ld a, (counter)
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

   ld a, (counter)
   xor #1
   ld (counter), a

   try:

   ld a, l
   cp a, #0

   jr nz, main_loop

   ld a, (counter)
   xor #1
   ld (counter), a

   


		;;========================================
		;; DRAW
		;;========================================

	jp main_loop 		;; return to main_loop

hi::
jr hi

draw_all_tiles:
	ld de, #0xC000
	ld a,  #8
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC008
	ld a,  #3
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC010
	ld a,  #8
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC018
	ld a,  #3
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC020
	ld a,  #8
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC028
	ld a,  #3
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC030
	ld a,  #8
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC038
	ld a,  #3
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC040
	ld a,  #8
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC048
	ld a,  #3
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	;;========================================

	ld de, #0xC140
	ld a,  #3
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC148
	ld a,  #8
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC150
	ld a,  #3
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC158
	ld a,  #8
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC160
	ld a,  #3
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC168
	ld a,  #8
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC170
	ld a,  #3
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC178
	ld a,  #8
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC180
	ld a,  #3
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC188
	ld a,  #8
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	;;========================================

	ld de, #0xC280
	ld a,  #8
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC288
	ld a,  #3
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC290
	ld a,  #8
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC298
	ld a,  #3
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC2A0
	ld a,  #8
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC2A8
	ld a,  #3
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC2B0
	ld a,  #8
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC2B8
	ld a,  #3
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC2C0
	ld a,  #8
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC2C8
	ld a,  #3
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	;;========================================

	ld de, #0xC3C0
	ld a,  #3
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC3C8
	ld a,  #8
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC3D0
	ld a,  #3
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC3D8
	ld a,  #8
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC3E0
	ld a,  #3
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC3E8
	ld a,  #8
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC3F0
	ld a,  #3
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC3F8
	ld a,  #8
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC400
	ld a,  #3
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC408
	ld a,  #8
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	;;========================================

	ld de, #0xC500
	ld a,  #8
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC508
	ld a,  #3
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC510
	ld a,  #8
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC518
	ld a,  #3
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC520
	ld a,  #8
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC528
	ld a,  #3
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC530
	ld a,  #8
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC538
	ld a,  #3
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC540
	ld a,  #8
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC548
	ld a,  #3
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	;;========================================

	ld de, #0xC640
	ld a,  #3
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC648
	ld a,  #8
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC650
	ld a,  #3
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC658
	ld a,  #8
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC660
	ld a,  #3
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC668
	ld a,  #8
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC670
	ld a,  #3
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC678
	ld a,  #8
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC680
	ld a,  #3
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC688
	ld a,  #8
	ld bc, #0x2008
	call cpct_drawSolidBox_asm
ret