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
.include "map/map.h.s"
.include "map/tiles.h.s"
.include "includes.h.s"

;;=========================================
;; SPRITE PALETTE
;;=========================================
sprite_palette: .db #0x58	
				.db #0x44	
				.db #0x55	
				.db #0x5c	
				.db #0x54	
				.db #0x4c	
				.db #0x56	
				.db #0x57	
				.db #0x5e	
				.db #0x40	
				.db #0x4e	
				.db #0x47	
				.db #0x53	
				.db #0x5a	
				.db #0x4a	
				.db #0x4b	

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

	call cpct_disableFirmware_asm	;;disable firmware 

	;ld hl, #isr	;;pointer to function
	;call cpct_setInterruptHandler_asm ;;set interruption handler 

	ld c, #0
	call cpct_setVideoMode_asm	;;set video mode to 0

	ld hl, #sprite_palette
	ld de, #16
	call cpct_setPalette_asm		;;change the palette

	ld hl, #0xA000
	ld bc, #0x2832
	call map_floorFill

	ld hl, #0xA000
	ld bc, #0x2832
	call map_debug

	ld hl, #0xC000
	call tiles_drawFloor0

	ld hl, #0xC008
	call tiles_drawFloor0

	ld hl, #0xC140
	call tiles_drawFloor0

	ld hl, #0xC148
	call tiles_drawFloor0

	;;MAIN lOOP
	main_loop::

		;;========================================
		;; ERASE 
		;;========================================
		
		;;========================================
		;; UPDATE
		;;========================================
		;call draw_all_tiles

		;;========================================
		;; DRAW
		;;========================================

	jp main_loop 		;; return to main_loop

ret

draw_all_tiles:
	ld de, #0xC000
	ld a,  #0x00
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC008
	ld a,  #0xFF
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC010
	ld a,  #0x00
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC018
	ld a,  #0xFF
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC020
	ld a,  #0x00
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC028
	ld a,  #0xFF
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	;ld de, #0xC030
	;ld a,  #0x00
	;ld bc, #0x2008
	;call cpct_drawSolidBox_asm
	;
	;ld de, #0xC038
	;ld a,  #0xFF
	;ld bc, #0x2008
	;call cpct_drawSolidBox_asm
	;
	;ld de, #0xC040
	;ld a,  #0x00
	;ld bc, #0x2008
	;call cpct_drawSolidBox_asm
	;
	;ld de, #0xC048
	;ld a,  #0xFF
	;ld bc, #0x2008
	;call cpct_drawSolidBox_asm

	;;========================================

	ld de, #0xC140
	ld a,  #0xFF
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC148
	ld a,  #0x00
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC150
	ld a,  #0xFF
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC158
	ld a,  #0x00
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC160
	ld a,  #0xFF
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC168
	ld a,  #0x00
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	;ld de, #0xC170
	;ld a,  #0xFF
	;ld bc, #0x2008
	;call cpct_drawSolidBox_asm

	;ld de, #0xC178
	;ld a,  #0x00
	;ld bc, #0x2008
	;call cpct_drawSolidBox_asm

	;ld de, #0xC180
	;ld a,  #0xFF
	;ld bc, #0x2008
	;call cpct_drawSolidBox_asm

	;ld de, #0xC188
	;ld a,  #0x00
	;ld bc, #0x2008
	;call cpct_drawSolidBox_asm

	;;========================================

	ld de, #0xC280
	ld a,  #0x00
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC288
	ld a,  #0xFF
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC290
	ld a,  #0x00
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC298
	ld a,  #0xFF
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC2A0
	ld a,  #0x00
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC2A8
	ld a,  #0xFF
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	;ld de, #0xC2B0
	;ld a,  #0x00
	;ld bc, #0x2008
	;call cpct_drawSolidBox_asm
	;
	;ld de, #0xC2B8
	;ld a,  #0xFF
	;ld bc, #0x2008
	;call cpct_drawSolidBox_asm
	;
	;ld de, #0xC2C0
	;ld a,  #0x00
	;ld bc, #0x2008
	;call cpct_drawSolidBox_asm
	;
	;ld de, #0xC2C8
	;ld a,  #0xFF
	;ld bc, #0x2008
	;call cpct_drawSolidBox_asm

	;;========================================

	ld de, #0xC3C0
	ld a,  #0xFF
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC3C8
	ld a,  #0x00
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC3D0
	ld a,  #0xFF
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC3D8
	ld a,  #0x00
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC3E0
	ld a,  #0xFF
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC3E8
	ld a,  #0x00
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	;ld de, #0xC3F0
	;ld a,  #0xFF
	;ld bc, #0x2008
	;call cpct_drawSolidBox_asm
	;
	;ld de, #0xC3F8
	;ld a,  #0x00
	;ld bc, #0x2008
	;call cpct_drawSolidBox_asm
	;
	;ld de, #0xC400
	;ld a,  #0xFF
	;ld bc, #0x2008
	;call cpct_drawSolidBox_asm
	;
	;ld de, #0xC408
	;ld a,  #0x00
	;ld bc, #0x2008
	;call cpct_drawSolidBox_asm

	;;========================================

	ld de, #0xC500
	ld a,  #0x00
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC508
	ld a,  #0xFF
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC510
	ld a,  #0x00
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC518
	ld a,  #0xFF
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC520
	ld a,  #0x00
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC528
	ld a,  #0xFF
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	;ld de, #0xC530
	;ld a,  #0x00
	;ld bc, #0x2008
	;call cpct_drawSolidBox_asm
	;
	;ld de, #0xC538
	;ld a,  #0xFF
	;ld bc, #0x2008
	;call cpct_drawSolidBox_asm
	;
	;ld de, #0xC540
	;ld a,  #0x00
	;ld bc, #0x2008
	;call cpct_drawSolidBox_asm
	;
	;ld de, #0xC548
	;ld a,  #0xFF
	;ld bc, #0x2008
	;call cpct_drawSolidBox_asm

	;;========================================

	ld de, #0xC640
	ld a,  #0xFF
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC648
	ld a,  #0x00
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC650
	ld a,  #0xFF
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC658
	ld a,  #0x00
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC660
	ld a,  #0xFF
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	ld de, #0xC668
	ld a,  #0x00
	ld bc, #0x2008
	call cpct_drawSolidBox_asm

	;ld de, #0xC670
	;ld a,  #0xFF
	;ld bc, #0x2008
	;call cpct_drawSolidBox_asm
	;
	;ld de, #0xC678
	;ld a,  #0x00
	;ld bc, #0x2008
	;call cpct_drawSolidBox_asm
	;
	;ld de, #0xC680
	;ld a,  #0xFF
	;ld bc, #0x2008
	;call cpct_drawSolidBox_asm
	;
	;ld de, #0xC688
	;ld a,  #0x00
	;ld bc, #0x2008
	;call cpct_drawSolidBox_asm

	;;=======================================

	;; Byte color interlacing: 4 D 3 C 2 B 1 A
	;; Dark blue : 1		 : 1 1 0 0 0 0 0 0

	ld de, #0xC780
	ld a,  #0xC0
	ld bc, #0x0828
	call cpct_drawSolidBox_asm

	ld de, #0xC7A8
	ld a,  #0xC0
	ld bc, #0x0828
	call cpct_drawSolidBox_asm

	;;=======================================

	ld de, #0xC030
	ld a,  #0x30
	ld bc, #0xC020
	call cpct_drawSolidBox_asm





ret