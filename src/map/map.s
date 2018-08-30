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
				

;;=========================================
;;=========================================
;; PUBLIC FUNCTIONS
;;=========================================
;;=========================================

;;=========================================
;; Sets the map space to a given value
;; Input: 	HL - Start of the map (memory)
;;		    BC - Number of tiles
;; 		    A  - Value to clear with
;; DESTROYS: AF, BC, DE, HL
;; OUTPUT - None
;;=========================================
map_clear::

    ld (hl), a  ;put the value at the start of the memory
    ld d, h     ;copy hl into de and increment by 1
    ld e, l
    inc de 

    ldir        ;set the given number of tiles to the given value

ret

;;=========================================
;; Autogenerates a map given a seed
;; Input: 	HL - Start of the map (memory)
;;		    BC - Height / Width
;; 		    A  - Seed value
;; DESTROYS: AF, BC, DE, HL
;; OUTPUT - None
;;=========================================
map_generate::

ret

;;=========================================
;; Shows in screen a little square per painted tile
;; Input: 	HL - Start of the map (memory)
;;		    BC - Height / Width
;; DESTROYS: AF, BC, DE, HL
;; OUTPUT - None
;;=========================================
map_debug::

    ld   de, #0x0000        ;;intialize de to 0

    for_dx:

    ;for_dy:

        ld   a, (hl)
        inc  hl             ;;load byte value and inc hl

        push hl
        push bc
        push de
        push af

        ld  b, d
        ld  c, e            ;;copy de into bc

        ld  de, #0xC000     ;;screen start
        sla b
        sla b               ;;multiply y coordinate by 4

        call cpct_getScreenPtr_asm

        pop  af         ;;a contains the byte value of the current tile
                        ;;hl contains the direction in which we want to draw

        ;;we should call draw solid box with a value
        ex   de, hl     ;;put were to draw in de
        ld   bc, #0x0401;;draw a little square

        cp   #0x00              ;;if tile is 0, paint with color palette 0
        jr   nz, debug_next

            ld  a, #0x00
            call cpct_drawSolidBox_asm
            jr  end_dy

        debug_next:

        cp   #0x01              ;;if tile is 1, paint with color palette 1
        jr  nz, end_dy

            ld  a, #0xC0
            call cpct_drawSolidBox_asm
            jr  end_dy

    end_dy:

        pop de           
        pop bc           ;;restore current height / witdh value
        pop hl           ;;restore max height / witdh value
        inc e            ;;increase witdh
        ld  a, c         
        cp  a, e         ;;compare if we continue looping witdh
        jr  nz, for_dx

        ;;if we have to go to a new line

        ld  a, #0
        ld  e, a         ;;set e to 0
        inc d            ;;increase height
        ld  a, b   
        cp  a, d         ;;compare if we continue looping height
        jr nz, for_dx

    ;end_dx:

ret

;;=========================================
;; Fills the floor with a chess like pattern
;; Input: 	HL - Start of the map (memory)
;;		    BC - Height / Width
;; DESTROYS: AF, BC, DE, HL
;; OUTPUT - None
;;=========================================
map_floorFill::

    dec c
    dec c               ;;decrease c in 2 units

    for_fx:

    ;for_fy:

        dec  b           ;;decrease height value
        push bc          ;;save height / width value

        ld  a, b         ;;load height into a
        and #0x0001      ;;check if heigth is pair
        jr  nz, is_not_pair

        ;is_pair:

            ld  a, #0x00    ;;put a 0 in the memory
            ld  (hl), a

            ld  b, a        ;;put a 0 in b (so bc has only witdh value)

            inc hl          ;go to the next memory value

            ld  a, #0x01    ;;put a 1 in the memory
            ld  (hl), a

            dec hl          ;;restore hl to its original value

            ld  d, h
            ld  e, l
            inc de
            inc de          ;;copy hl into de and increase it 2 units

            ldir

            jr  end_fy

        is_not_pair:

            ld  a, #0x01    ;;put a 0 in the memory
            ld  (hl), a

            inc hl          ;go to the next memory value

            ld  a, #0x00    ;;put a 1 in the memory
            ld  (hl), a

            ld  b, a        ;;put a 0 in b (so bc has only witdh value)

            dec hl          ;;restore hl to its original value

            ld  d, h
            ld  e, l
            inc de
            inc de          ;;copy hl into de and increase it 2 units

            ldir

    end_fy:

        ex  de, hl       ;;put memory value for next row in hl

        pop bc           ;;restore height / witdh value

        ld  a, b         ;;load height into a
        cp  #0           ;;check if 0
        jr  nz, for_fx    ;;if not 0, repeat loop

    ;end_fx:

ret

;;=========================================
;; Fills the map with squared rooms
;; Input:   HL - Start of the map (memory)
;;          BC - Height / Width
;;           A - Tile separation
;; DESTROYS: AF, BC, DE, HL
;; OUTPUT - None
;;=========================================
map_wallsFill::

ret