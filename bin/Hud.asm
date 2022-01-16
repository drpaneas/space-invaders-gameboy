;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module Hud
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _DrawText
	.globl _set_bkg_tile_xy
	.globl _DrawNumber
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Hud.c:4: void DrawNumber(UINT8 x,UINT8 y, UINT16 number,UINT8 digits){
;	---------------------------------
; Function DrawNumber
; ---------------------------------
_DrawNumber::
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Hud.c:6: if(digits>=5)set_bkg_tile_xy(x++,y,(number/10000)%10+spaceInvadersFontCurrentStart+26);
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, #0x05
	jr	C, 00102$
	dec	hl
	dec	hl
	ld	de, #0x2710
	push	de
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	__divuint
	add	sp, #4
	ld	bc, #0x000a
	push	bc
	push	de
	call	__moduint
	add	sp, #4
	ld	a, e
	ld	hl, #_spaceInvadersFontCurrentStart
	add	a, (hl)
	add	a, #0x1a
	ld	b, a
	ldhl	sp,	#2
	ld	d, (hl)
	ld	a, d
	inc	a
	ld	(hl+), a
	ld	c, (hl)
	push	bc
	push	de
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
00102$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Hud.c:7: if(digits>=4)set_bkg_tile_xy(x++,y,(number/1000)%10+spaceInvadersFontCurrentStart+26);
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, #0x04
	jr	C, 00104$
	dec	hl
	dec	hl
	ld	de, #0x03e8
	push	de
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	__divuint
	add	sp, #4
	ld	bc, #0x000a
	push	bc
	push	de
	call	__moduint
	add	sp, #4
	ld	a, e
	ld	hl, #_spaceInvadersFontCurrentStart
	add	a, (hl)
	add	a, #0x1a
	ld	b, a
	ldhl	sp,	#2
	ld	d, (hl)
	ld	a, d
	inc	a
	ld	(hl+), a
	ld	c, (hl)
	push	bc
	push	de
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
00104$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Hud.c:8: if(digits>=3)set_bkg_tile_xy(x++,y,(number/100)%10+spaceInvadersFontCurrentStart+26);
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, #0x03
	jr	C, 00106$
	dec	hl
	dec	hl
	ld	de, #0x0064
	push	de
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	__divuint
	add	sp, #4
	ld	bc, #0x000a
	push	bc
	push	de
	call	__moduint
	add	sp, #4
	ld	a, e
	ld	hl, #_spaceInvadersFontCurrentStart
	add	a, (hl)
	add	a, #0x1a
	ld	b, a
	ldhl	sp,	#2
	ld	d, (hl)
	ld	a, d
	inc	a
	ld	(hl+), a
	ld	c, (hl)
	push	bc
	push	de
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
00106$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Hud.c:9: if(digits>=2)set_bkg_tile_xy(x++,y,(number/10)%10+spaceInvadersFontCurrentStart+26);
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, #0x02
	jr	C, 00108$
	dec	hl
	dec	hl
	ld	de, #0x000a
	push	de
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	__divuint
	add	sp, #4
	ld	bc, #0x000a
	push	bc
	push	de
	call	__moduint
	add	sp, #4
	ld	a, e
	ld	hl, #_spaceInvadersFontCurrentStart
	add	a, (hl)
	add	a, #0x1a
	ld	b, a
	ldhl	sp,	#2
	ld	d, (hl)
	ld	a, d
	inc	a
	ld	(hl+), a
	ld	c, (hl)
	push	bc
	push	de
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
00108$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Hud.c:10: set_bkg_tile_xy(x,y,number%10+spaceInvadersFontCurrentStart+26);
	ld	de, #0x000a
	push	de
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	__moduint
	add	sp, #4
	ld	a, e
	ld	hl, #_spaceInvadersFontCurrentStart
	add	a, (hl)
	add	a, #0x1a
	push	af
	inc	sp
	ldhl	sp,	#4
	ld	a, (hl-)
	ld	d, a
	ld	e, (hl)
	push	de
	call	_set_bkg_tile_xy
	add	sp, #3
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Hud.c:11: }
	ret
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Hud.c:13: void DrawText(UINT8 x, UINT8 y, unsigned char *text){
;	---------------------------------
; Function DrawText
; ---------------------------------
_DrawText::
	dec	sp
	dec	sp
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Hud.c:17: while(text[i]!='\0'){
	ldhl	sp,	#1
	ld	(hl), #0x00
00124$:
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#1
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	e, a
	or	a, a
	jp	Z, 00127$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Hud.c:19: if(text[i]>='A'&&text[i]<='Z')set_bkg_tile_xy(x+i,y,spaceInvadersFontCurrentStart+(text[i]-'A'));
	ldhl	sp,	#4
	ld	a, (hl)
	ldhl	sp,	#1
	add	a, (hl)
	dec	hl
	ld	(hl), a
	ld	a, e
	sub	a, #0x41
	jr	C, 00102$
	ld	a, #0x5a
	sub	a, e
	jr	C, 00102$
	ld	a, e
	add	a, #0xbf
	ld	hl, #_spaceInvadersFontCurrentStart
	ld	e, (hl)
	add	a, e
	push	af
	inc	sp
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
00102$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Hud.c:20: if(text[i]>='a'&&text[i]<='z')set_bkg_tile_xy(x+i,y,spaceInvadersFontCurrentStart+(text[i]-'a'));
	ld	a, (bc)
	ld	e, a
	sub	a, #0x61
	jr	C, 00105$
	ld	a, #0x7a
	sub	a, e
	jr	C, 00105$
	ld	a, e
	add	a, #0x9f
	ld	hl, #_spaceInvadersFontCurrentStart
	ld	e, (hl)
	add	a, e
	push	af
	inc	sp
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
00105$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Hud.c:21: if(text[i]>='0'&&text[i]<='9')set_bkg_tile_xy(x+i,y,spaceInvadersFontCurrentStart+26+(text[i]-'0'));
	ld	a, (bc)
	ld	e, a
	sub	a, #0x30
	jr	C, 00108$
	ld	a, #0x39
	sub	a, e
	jr	C, 00108$
	ld	a, (#_spaceInvadersFontCurrentStart)
	add	a, #0x1a
	ld	d, a
	ld	a, e
	add	a, #0xd0
	add	a, d
	push	af
	inc	sp
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
00108$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Hud.c:22: if(text[i]=='.')set_bkg_tile_xy(x+i,y,spaceInvadersFontCurrentStart+36);
	ld	a, (bc)
	sub	a, #0x2e
	jr	NZ, 00111$
	ld	a, (#_spaceInvadersFontCurrentStart)
	add	a, #0x24
	push	af
	inc	sp
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
00111$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Hud.c:23: if(text[i]=='-')set_bkg_tile_xy(x+i,y,spaceInvadersFontCurrentStart+37);
	ld	a, (bc)
	sub	a, #0x2d
	jr	NZ, 00113$
	ld	a, (#_spaceInvadersFontCurrentStart)
	add	a, #0x25
	push	af
	inc	sp
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
00113$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Hud.c:24: if(text[i]=='=')set_bkg_tile_xy(x+i,y,spaceInvadersFontCurrentStart+38);
	ld	a, (bc)
	sub	a, #0x3d
	jr	NZ, 00115$
	ld	a, (#_spaceInvadersFontCurrentStart)
	add	a, #0x26
	push	af
	inc	sp
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
00115$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Hud.c:25: if(text[i]=='*')set_bkg_tile_xy(x+i,y,spaceInvadersFontCurrentStart+39);
	ld	a, (bc)
	sub	a, #0x2a
	jr	NZ, 00117$
	ld	a, (#_spaceInvadersFontCurrentStart)
	add	a, #0x27
	push	af
	inc	sp
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
00117$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Hud.c:26: if(text[i]=='?')set_bkg_tile_xy(x+i,y,spaceInvadersFontCurrentStart+40);
	ld	a, (bc)
	sub	a, #0x3f
	jr	NZ, 00119$
	ld	a, (#_spaceInvadersFontCurrentStart)
	add	a, #0x28
	push	af
	inc	sp
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
00119$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Hud.c:27: if(text[i]=='!')set_bkg_tile_xy(x+i,y,spaceInvadersFontCurrentStart+41);
	ld	a, (bc)
	sub	a, #0x21
	jr	NZ, 00121$
	ld	a, (#_spaceInvadersFontCurrentStart)
	add	a, #0x29
	push	af
	inc	sp
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
00121$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Hud.c:28: if(text[i]==' ')set_bkg_tile_xy(x+i,y,0);
	ld	a, (bc)
	sub	a, #0x20
	jr	NZ, 00123$
	xor	a, a
	push	af
	inc	sp
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
00123$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Hud.c:30: i++;
	ldhl	sp,	#1
	inc	(hl)
	jp	00124$
00127$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Hud.c:32: }
	inc	sp
	inc	sp
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
