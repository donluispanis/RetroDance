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
;; FILE FOR MACROS AND CONSTANTS FOR OUR GAME
;;====================================================

;;====================================================
;; EXTENDED INSTRUCTIONS
;;====================================================

;; macros

.macro ld_a_iyh			;;macro for undocumented intruction
	.db #0xFD, #0x7c	;; ld a, iyh
.endm 

.macro ld_a_iyl			;;macro for undocumented intruction
	.db #0xFD, #0x7d	;; ld a, iyl
.endm 

.macro dec_iyh			;;macro for undocumented intruction
	.db #0xFD, #0x25	;; dec iyh
.endm 

.macro dec_iyl			;;macro for undocumented intruction
	.db #0xFD, #0x2D	;; dec iyl
.endm 

.macro ld_iyh_nn		;;macro for undocumented intruction
	.db #0xFD, #0x26	;; ld iyh, nn
.endm 

.macro ld_iyl_nn		;;macro for undocumented intruction
	.db #0xFD, #0x2E	;; ld iyl, nn
.endm 

.macro ld_ixh_b			;;macro for undocumented intruction
	.db #0xDD, #0x60	;; ld iyh, b
.endm 

.macro ld_ixl_c			;;macro for undocumented intruction
	.db #0xDD, #0x69	;; ld iyl, c
.endm 

.macro ld_iyl_a			;;macro for undocumented intruction
	.db #0xFD, #0x67	;; ld iyl, c
.endm 

;;====================================================
;; MEMORY ALLOCATION
;;====================================================

.macro allocateMemory pos
	.area _'pos'_ (ABS) 
	.org pos 
.endm

.macro deallocateMemory 
	.area _CSEG
	.area _CODE
.endm

;;====================================================
;; SET BORDER
;;====================================================
.macro setBorder color 
	ld hl, #0x'color'10
	call cpct_setPALColour_asm
.endm
