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
;; MAP HANDLING FUNCTIONS
;;====================================================
.area _CODE

;;=========================================
;; INCLUDE AREA
;;=========================================
.include "../includes.h.s"		;;file containing cpct includes

;;=========================================
;;=========================================
;; PRIVATE DATA
;;=========================================
;;=========================================
make8array floorBorder, 0xF0, 0xF0, 0xF0, 0xF0, 0xF0, 0xF0, 0xF0, 0xF0	

make8array floorTile0, 0xA0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x50
make8array floorTile0_0, 0xF0, 0xA0, 0x00, 0x00, 0x00, 0x00, 0x50, 0xF0
make8array floorTile0_1, 0xF0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF0


;;=========================================
;;=========================================
;; PUBLIC FUNCTIONS
;;=========================================
;;=========================================

;;=========================================
;; SOME MACROS FOR MAKING WORK EASIER
;;=========================================
.macro add0x0800

	pop hl
    ld bc, #0x0800
    add hl, bc
    push hl

.endm

.macro drawPalette3Line

	ld a, #0xF0
    ld (hl), a

    ld  d, h 
    ld  e, l
    inc de

    ld bc, #0x0007

    ldir

.endm

.macro drawPalette0Line

	ld a, #0xA0
    ld (hl), a
    inc hl

    ld a, #0x00
    ld (hl), a
    inc hl

    ld a, #0x00
    ld (hl), a
    inc hl

    ld a, #0x00
    ld (hl), a
    inc hl

    ld a, #0x00
    ld (hl), a
    inc hl

    ld a, #0x00
    ld (hl), a
    inc hl

    ld a, #0x00
    ld (hl), a
    inc hl

    ld a, #0x50
    ld (hl), a

.endm

.macro drawPalette0Line_0

	ld a, #0xF0
    ld (hl), a
    inc hl

    ld a, #0xA0
    ld (hl), a
    inc hl

    ld a, #0x00
    ld (hl), a
    inc hl

    ld a, #0x00
    ld (hl), a
    inc hl

    ld a, #0x00
    ld (hl), a
    inc hl

    ld a, #0x00
    ld (hl), a
    inc hl

    ld a, #0x50
    ld (hl), a
    inc hl

    ld a, #0xF0
    ld (hl), a

.endm

.macro drawPalette0Line_1

	ld a, #0xF0
    ld (hl), a
    inc hl

    ld a, #0x00
    ld (hl), a
    inc hl

    ld a, #0x00
    ld (hl), a
    inc hl

    ld a, #0x00
    ld (hl), a
    inc hl

    ld a, #0x00
    ld (hl), a
    inc hl

    ld a, #0x00
    ld (hl), a
    inc hl

    ld a, #0x00
    ld (hl), a
    inc hl

    ld a, #0xF0
    ld (hl), a

.endm

;;=========================================
;; Draws the tile corresponding to first floor
;; Input: 	HL - Memory to draw (disible by 8)
;; DESTROYS: AF, BC, DE, HL
;; OUTPUT - None
;;=========================================
tiles_drawFloor0::

    ;;draw first 2 lines
    push hl
    push hl

    drawPalette3Line
    add0x0800

    drawPalette3Line
    add0x0800

    drawPalette0Line_0
    add0x0800

    drawPalette0Line_1
    add0x0800

    drawPalette0Line
    add0x0800

    drawPalette0Line
    add0x0800

    drawPalette0Line
    add0x0800

    drawPalette0Line

    pop hl
    pop hl

    ld  bc, #0x0050
    add hl, bc

    push hl 
    push hl

    drawPalette0Line
    add0x0800

    drawPalette0Line
    add0x0800

    drawPalette0Line
    add0x0800

    drawPalette0Line
    add0x0800

    drawPalette0Line
    add0x0800

    drawPalette0Line
    add0x0800

    drawPalette0Line
    add0x0800

    drawPalette0Line

    pop hl
    pop hl

    ld  bc, #0x0050
    add hl, bc

    push hl 
    push hl

    drawPalette0Line
    add0x0800

    drawPalette0Line
    add0x0800

    drawPalette0Line
    add0x0800

    drawPalette0Line
    add0x0800

    drawPalette0Line
    add0x0800

    drawPalette0Line
    add0x0800

    drawPalette0Line
    add0x0800

    drawPalette0Line

    pop hl
    pop hl

    ld  bc, #0x0050
    add hl, bc

    push hl 
    push hl

    drawPalette0Line
    add0x0800

    drawPalette0Line
    add0x0800

    drawPalette0Line
    add0x0800

    drawPalette0Line
    add0x0800

    drawPalette0Line_1
    add0x0800

    drawPalette0Line_0
    add0x0800

    drawPalette3Line
    add0x0800

    drawPalette3Line

    pop hl
    pop hl

ret

;;=========================================
;; Draws the tile corresponding to second floor
;; Input: 	HL - Memory to draw (disible by 8)
;; DESTROYS: AF, BC, DE, HL
;; OUTPUT - None
;;=========================================
tiles_drawFloor1::

ret