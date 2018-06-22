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

ret