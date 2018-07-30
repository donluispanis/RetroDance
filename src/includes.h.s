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

.include "macros.h.s"

;;=========================================
;; CPCTELERA PUBLIC FUNCTIONS
;;=========================================

;;=========================================
;; VIDEO SECTION
;;=========================================

;;=============================================
;; Changes the hardware palette colour values (selecting new ones).
;; INPUT:		
;;      (2B HL) colour_array	Pointer to a byte array containing new hardware colour values [0 - 31]
;;      (2B DE) size	[1 - 16] Number of colours to change
;; DESTROYS:	AF, BC, DE, HL
;; OUTPUT:		none
;; REQUIREMENTS: This function requires the CPC firmware to be DISABLED.  
;;               Otherwise, it may not work, as firmware tends to restore palette colour values to its own selection.
;;=============================================
.globl cpct_setPalette_asm

;;=============================================
;; Sets the video mode of the CPC Screen, changing resolution and palette size.
;; INPUT:		
;;      (1B C) videoMode	[0-3] Video mode to set
;; DESTROYS:	AF, BC, HL
;; OUTPUT:		none
;; REQUIREMENTS: This function requires the CPC firmware to be DISABLED.  
;;               Otherwise, it may not work, as firmware tends to restore video mode to its own selection.
;;=============================================
.globl cpct_setVideoMode_asm		;;unique use cpct function

;;=============================================
;; Returns a byte-pointer to a screen memory location, given its X, Y coordinates.  (in bytes, NOT in pixels!)
;; INPUT:		
;;      (2B DE) screen_start	Pointer to the start of the screen (or a backbuffer)
;;      (1B C ) x	[0-79] Byte-aligned column starting from 0 (x coordinate,
;;      (1B B ) y	[0-199] row starting from 0 (y coordinate) in bytes)
;; DESTROYS:	AF, BC, DE, HL
;; OUTPUT:
;;      (HL) u8*	Pointer to the (x,*y*) byte in the screen memory that starts at screen_start.
;; RESTRICTIONS:    
;;      >> screen_start will normally be the start of the video memory where you want to draw something.  
;;          However, you may give a pointer to the start of a screen backbuffer located everywhere in memory.
;;  
;;      >> x must be in the range [0-79].  Screen is always 80 bytes wide (unless you change CRTC registers), 
;;          and this function is byte-aligned, so you have to give it a byte coordinate (NOT a pixel one!).
;;
;;      >> y must be in the range [0-199].  Screen is always 200 pixels high (again, unless you change CRTC registers). 
;;           Pixels and bytes always coincide in vertical resolution, so this coordinate is the same in bytes that in pixels.
;;
;;      >> If you give incorrect values to this function, the returned pointer could point anywhere in memory.
;;           This function will not cause any damage by itself, but you may destroy important parts of your memory
;;           if you use its result to write to memory, and you gave incorrect parameters by mistake.  Take always care.
;;
;;      >> This function only works for default screens (80 bytes wide, 200 pixel lines, 25 characters of 8 pixel lines).  
;;          If you change screen configuration by modifying CRTC registers, this function may not work for you.
;;=============================================
.globl cpct_getScreenPtr_asm

;;=========================================
;; FIRMWARE SECTION
;;=========================================
;;=============================================
;; Disables Amstrad CPC firmware, preventing it from being executed at every CPU interrupt.
;; INPUT:		none
;; DESTROYS:	HL
;; OUTPUT:		none
;;=============================================
.globl cpct_disableFirmware_asm		;;unique use cpct function

;;=========================================
;; SPRITE SECTION
;;=========================================
;;=============================================
;; Fills up a rectangle in video memory (or screen buffer) with a given colour data byte.  
;; Could be used for drawing coloured rectangles as well as erasing screen rectangles easily.
;; INPUT:		
;;      (2B DE) memory	Video memory pointer to the upper left box corner byte
;;      (1B A ) colour_pattern	1-byte colour pattern (in screen pixel format) to fill the box with
;;      (1B C ) width	Box width in bytes [1-64] (Beware!  not in pixels!)
;;      (1B B ) height	Box height in bytes (>0)
;; DESTROYS:	AF, BC, DE, HL
;; OUTPUT:		none
;;=============================================
.globl cpct_drawSolidBox_asm

;;=============================================
;; Copies a sprite from an array to video memory (or to a screen buffer).
;; INPUT:		
;;      (2B HL) sprite	Source Sprite Pointer (array with pixel data)
;;      (2B DE) memory	Destination video memory pointer
;;      (1B C ) width	Sprite Width in bytes [1-63] (Beware, not in pixels!)
;;      (1B B ) height	Sprite Height in bytes (>0)
;; DESTROYS:	AF, BC, DE, HL
;; OUTPUT:		none
;;=============================================
.globl cpct_drawSprite_asm
	
