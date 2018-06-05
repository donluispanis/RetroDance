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

	;ld hl, #_sprite_palette
	;ld de, #16
	;call cpct_setPalette_asm		;;change the palette

	;;MAIN lOOP
	main_loop::

		;;========================================
		;; ERASE 
		;;========================================
		
	
		;;========================================
		;; UPDATE
		;;========================================
		;;
	
		;;========================================
		;; DRAW
		;;========================================

	jr main_loop 		;; return to main_loop