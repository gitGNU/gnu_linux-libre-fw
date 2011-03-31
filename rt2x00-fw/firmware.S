;
; * (c) Copyright 2011, Felipe Correa da Silva Sanches                    *
; * (c) Copyright 2002-2010, Ralink Technology, Inc.                      *
; *                                                                       *
; * This program is free software; you can redistribute it and/or modify  *
; * it under the terms of the GNU General Public License as published by  *
; * the Free Software Foundation; either version 2 of the License, or     *
; * (at your option) any later version.                                   *
; *                                                                       *
; * This program is distributed in the hope that it will be useful,       *
; * but WITHOUT ANY WARRANTY; without even the implied warranty of        *
; * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
; * GNU General Public License for more details.                          *
; *                                                                       *
; * You should have received a copy of the GNU General Public License     *
; * along with this program; if not, write to the                         *
; * Free Software Foundation, Inc.,                                       *
; * 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.             *
; *                                                                       *
;
;  D52 V3.4.1 8052 Disassembly of fw.bin
;  2011/02/05 00:04
;
	org	3
;
	ljmp	startup_r1
;
	ljmp	startup_r2
;
	ljmp	startup_r3
;
	ljmp	startup_r4
;
	ljmp	X13bc
;
	ljmp	X13db
;
	ljmp	X13e0
;
	lcall	X13dc
	ret	
;
	ljmp	X18da
;
	ljmp	X1a1a
;
	ljmp	X153c
;
	ljmp	X1477
;
	jnb	20h.5,X0031
	jb	21h.5,X0031
	lcall	X1aff
X0031:	ret	
;
	mov	dptr,#X018c
	movx	a,@dptr
	jnb	acc.3,X0059
	mov	a,58h
	jnb	acc.0,X004e
	mov	a,4ch
	jnb	acc.0,X0047
	mov	r7,#40h
	sjmp	X0049
;
X0047:	mov	r7,#0
X0049:	mov	dptr,#X102f
	mov	a,r7
	movx	@dptr,a
X004e:	mov	dptr,#X018c
X0051:	mov	a,#8
	movx	@dptr,a
	clr	a
	mov	dptr,#X01a7
	movx	@dptr,a
X0059:	mov	dptr,#X018c
	movx	a,@dptr
	jnb	acc.0,X007c
	mov	dptr,#X0180
	movx	a,@dptr
	cjne	a,#2,X007c
	inc	dptr
	movx	a,@dptr
	cjne	a,#1,X007c
	mov	dptr,#X0184
	movx	a,@dptr
	cjne	a,#81h,X007c
	mov	dptr,#X018c
	mov	a,#1
	movx	@dptr,a
	lcall	X0dc8
X007c:	ret	
;
	mov	dptr,#X0414
	movx	a,@dptr
	jb	acc.7,X0087
	ljmp	X13ba
;
X0087:	mov	dptr,#X7012
	movx	a,@dptr
	mov	56h,a
	mov	dptr,#X0404
	movx	a,@dptr
	lcall	X0a9d
	jbc	acc.1,X00c8
	jbc	0c0h.5,X00d0
	acall	X000a
	jnc	X00af
	ajmp	X0251
;
	acall	X004a
	anl	rb2r1,a
	orl	a,r2
	anl	rb2r1,#4ah
	anl	a,#11h
	mov	55h,r3
	acall	X00da
	anl	a,@r0
X00af:	lcall	X3870
	lcall	X6371
	lcall	X9172
	rrc	a
	addc	a,r4
	jmp	@a+dptr
;
	rrc	a
	anl	a,r5
	sjmp	X00d2
;
	sjmp	X0051
;
	org	0c3h
;
	rrc	a
	cjne	r2,#90h,X0137
	acall	X00e0
	mov	3ch,a
	clr	a
	mov	dptr,#X7013
	movx	@dptr,a
X00d0:	mov	dptr,#X0414
	mov	a,#80h
	movx	@dptr,a
	mov	a,56h
	cpl	a
	jnz	X00de
	ljmp	X13ba
;
X00de:	ljmp	X13b3
;
	jb	20h.2,X00e7
	jnb	20h.3,X0104
X00e7:	mov	r5,#2
	mov	r7,56h
	lcall	X0b91
	mov	dptr,#X0414
	mov	a,#80h
	movx	@dptr,a
	clr	a
	mov	dptr,#X7013
	movx	@dptr,a
	mov	a,56h
	cpl	a
	jnz	X0101
	ljmp	X13ba
;
X0101:	ljmp	X13b3
;
X0104:	mov	41h,56h
	setb	20h.2
	ret	
;
	mov	dptr,#X7010
	movx	a,@dptr
	anl	a,#7fh
	mov	r7,a
	cjne	r7,#0ah,X0121
	mov	dptr,#X7011
	movx	a,@dptr
	cjne	a,#8,X0121
	mov	4eh,#1
	mov	4fh,#84h
X0121:	mov	dptr,#X7010
	movx	a,@dptr
	anl	a,#7fh
	mov	r7,a
	cjne	r7,#2,X013d
	mov	dptr,#X7011
	movx	a,@dptr
	xrl	a,#8
	jz	X0137
	movx	a,@dptr
	cjne	a,#20h,X013d
X0137:	mov	4eh,#3
	mov	4fh,#20h
X013d:	clr	a
	mov	27h,a
	ret	
;
	mov	dptr,#X7011
	movx	a,@dptr
	add	a,#0ffh
	mov	28h.7,c
	ret	
;
	mov	dptr,#X0404
	movx	a,@dptr
	add	a,acc
	add	a,#5dh
	mov	57h,a
	mov	dptr,#X7010
	movx	a,@dptr
	mov	r7,a
	mov	a,#47h
	add	a,57h
	mov	r0,a
	xch	a,@r0
	mov	a,r7
	xch	a,@r0
	mov	dptr,#X7011
	movx	a,@dptr
	mov	r7,a
	mov	a,#48h
	add	a,57h
	mov	r0,a
	xch	a,@r0
	mov	a,r7
	xch	a,@r0
	clr	a
	mov	r5,a
	mov	r7,56h
	lcall	X0b91
	mov	dptr,#X0414
	mov	a,#80h
	movx	@dptr,a
	clr	a
	mov	dptr,#X7013
	movx	@dptr,a
X0180:	mov	a,56h
	cpl	a
	jnz	X0188
	ljmp	X13ba
;
X0188:	ljmp	X13b3
;
	mov	a,47h
	xrl	a,#7
	jz	X01ae
	mov	a,47h
	xrl	a,#8
	jz	X01ae
	mov	a,47h
	xrl	a,#9
	jz	X01ae
	mov	a,47h
	xrl	a,#0ah
	jz	X01ae
	mov	a,47h
	xrl	a,#0bh
X01a7:	jz	X01ae
	mov	a,47h
	cjne	a,#0ch,X01b6
X01ae:	mov	dptr,#X7011
	movx	a,@dptr
	anl	a,#0fh
	mov	3ah,a
X01b6:	mov	a,47h
	cjne	a,#9,X01c3
	mov	a,3ah
	cjne	a,#3,X01c3
	clr	a
	mov	46h,a
X01c3:	mov	a,47h
	cjne	a,#0ah,X01d0
	mov	a,3ah
	cjne	a,#1,X01d0
	clr	a
	mov	46h,a
X01d0:	clr	a
	mov	r5,a
	mov	r7,56h
	lcall	X0b91
	setb	20h.4
	ret	
;
	mov	dptr,#X7011
	movx	a,@dptr
	cpl	a
	mov	r7,a
	mov	dptr,#X7010
	movx	a,@dptr
	anl	a,r7
	mov	r7,a
	mov	dptr,#X7011
	movx	a,@dptr
	anl	a,27h
	orl	a,r7
	mov	dptr,#X7018
	movx	@dptr,a
	mov	dptr,#X7011
	movx	a,@dptr
	mov	dptr,#X7019
	movx	@dptr,a
	clr	a
	mov	r5,a
	mov	r7,56h
	lcall	X0b91
	jnb	22h.5,X0207
	setb	22h.4
	sjmp	X022d
;
X0207:	mov	dptr,#X7018
	movx	a,@dptr
	mov	27h,a
	mov	dptr,#X0229
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#X7019
	movx	a,@dptr
	mov	r6,a
	mov	a,r7
	anl	a,r6
	mov	dptr,#X0229
	movx	@dptr,a
	jnb	28h.7,X0224
	mov	r7,27h
	sjmp	X0228
;
X0224:	mov	a,27h
	cpl	a
	mov	r7,a
X0228:	mov	dptr,#X0228
	mov	a,r7
	movx	@dptr,a
X022d:	mov	a,56h
	cpl	a
	jnz	X0235
	ljmp	X13ba
;
X0235:	ljmp	X13b3
;
	mov	dptr,#X7010
	movx	a,@dptr
	mov	r6,a
	mov	dptr,#X7011
	movx	a,@dptr
	mov	r5,a
	mov	a,r5
	mov	r0,a
	mov	a,@r0
	mov	57h,a
	mov	r5,a
	mov	r7,56h
	lcall	X0b91
	mov	dptr,#X0414
	mov	a,#80h
	movx	@dptr,a
	clr	a
	mov	dptr,#X7013
	movx	@dptr,a
	mov	a,56h
	cpl	a
	jnz	X0260
	ljmp	X13ba
;
X0260:	ljmp	X13b3
;
	mov	dptr,#X7010
	movx	a,@dptr
	mov	r6,a
	mov	dptr,#X7011
	movx	a,@dptr
	mov	r5,a
	mov	a,r5
	mov	dpl,a
	mov	dph,r6
	movx	a,@dptr
	mov	57h,a
	mov	r5,a
	mov	r7,56h
	lcall	X0b91
	mov	dptr,#X0414
	mov	a,#80h
	movx	@dptr,a
	clr	a
	mov	dptr,#X7013
	movx	@dptr,a
	mov	a,56h
	cpl	a
	jnz	X028e
	ljmp	X13ba
;
X028e:	ljmp	X13b3
;
	mov	dptr,#X1000
	movx	a,@dptr
	mov	57h,a
	clr	a
	mov	58h,a
	mov	59h,a
	mov	dptr,#X1003
	movx	a,@dptr
	cjne	a,#28h,X02a8
X02a3:	mov	58h,#1
	sjmp	X02e4
;
X02a8:	mov	dptr,#X1003
	movx	a,@dptr
	cjne	a,#30h,X02b4
	mov	58h,#2
	sjmp	X02e4
;
X02b4:	mov	dptr,#X1003
	movx	a,@dptr
	cjne	a,#33h,X02c0
	mov	58h,#4
	sjmp	X02e4
;
X02c0:	mov	dptr,#X1003
	movx	a,@dptr
	cjne	a,#35h,X02d3
	mov	dptr,#X1002
	movx	a,@dptr
	cjne	a,#72h,X02d3
	mov	58h,#8
	sjmp	X02e4
;
X02d3:	mov	dptr,#X1003
	movx	a,@dptr
	cjne	a,#35h,X02e4
	mov	dptr,#X1002
	movx	a,@dptr
	cjne	a,#93h,X02e4
	mov	58h,#10h
X02e4:	mov	a,58h
	jnb	acc.1,X0302
	mov	dptr,#X0508
	movx	a,@dptr
	orl	a,#1
	movx	@dptr,a
	mov	r5,a
	mov	dptr,#X0505
	movx	a,@dptr
	anl	a,#0fbh
	movx	@dptr,a
	orl	a,#4
	movx	@dptr,a
	mov	a,r5
	anl	a,#0feh
	mov	dptr,#X0508
	movx	@dptr,a
X0302:	clr	a
	mov	4eh,a
	mov	4fh,a
	mov	3ah,#0ffh
	mov	3ch,#0ffh
	mov	r5,57h
	mov	r7,56h
	lcall	X0b91
	clr	a
	mov	dptr,#X7032
	movx	@dptr,a
	clr	22h.6
	mov	5ch,a
	mov	5ah,a
	mov	5bh,a
	mov	dptr,#X7030
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#X0414
	mov	a,#80h
	movx	@dptr,a
	clr	a
	mov	dptr,#X7013
	movx	@dptr,a
	mov	a,56h
	cpl	a
	jnz	X033a
	ljmp	X13ba
;
X033a:	sjmp	X03b3
;
	mov	dptr,#X7010
	movx	a,@dptr
	add	a,#0ffh
	mov	p1.3,c
	clr	a
	mov	r5,a
	mov	r7,56h
	lcall	X0b91
	mov	dptr,#X0414
	mov	a,#80h
	movx	@dptr,a
	clr	a
	mov	dptr,#X7013
	movx	@dptr,a
	mov	a,56h
	cpl	a
	jz	X03ba
	sjmp	X03b3
;
	mov	dptr,#X7010
	movx	a,@dptr
	add	a,#0ffh
	mov	29h.2,c
	setb	20h.5
	mov	r5,57h
	mov	r7,56h
	lcall	X0b91
	mov	dptr,#X0414
	mov	a,#80h
	movx	@dptr,a
	clr	a
	mov	dptr,#X7013
	movx	@dptr,a
	mov	a,56h
	cpl	a
	jz	X03ba
	sjmp	X03b3
;
	mov	dptr,#X7010
	movx	a,@dptr
	add	a,#0ffh
	mov	22h.6,c
	mov	dptr,#X7011
	movx	a,@dptr
	mov	5ch,a
	mov	r5,57h
	mov	r7,56h
	lcall	X0b91
	mov	dptr,#X0414
	mov	a,#80h
	movx	@dptr,a
	mov	dptr,#X7030
	mov	a,5ah
	movx	@dptr,a
	inc	dptr
	mov	a,5bh
	movx	@dptr,a
	clr	a
	mov	5ah,a
	mov	5bh,a
	mov	dptr,#X7013
	movx	@dptr,a
	mov	a,56h
	cpl	a
	jz	X03ba
X03b3:	mov	dptr,#X7025
	movx	a,@dptr
	orl	a,#1
	movx	@dptr,a
X03ba:	ret	
;
	ret	
;
	mov	a,53h
	jnz	X03da
	jnb	2ch.0,X03cc
	cpl	29h.5
	jnb	29h.5,X03cc
	inc	46h
	clr	20h.4
X03cc:	mov	a,4fh
	orl	a,4eh
	jz	X03da
	mov	a,4fh
	dec	4fh
	jnz	X03da
	dec	4eh
X03da:	ret	
;
	ret	
;
	clr	28h.2
	setb	c
	ret	
;
	jnb	22h.4,X0413
	mov	dptr,#X7019
	movx	a,@dptr
	anl	a,27h
	mov	r7,a
	mov	dptr,#X7018
	movx	a,@dptr
	orl	a,r7
	mov	27h,a
	mov	dptr,#X0229
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#X7019
	movx	a,@dptr
	mov	r6,a
	mov	a,r7
	anl	a,r6
	mov	dptr,#X0229
	movx	@dptr,a
X0401:	jnb	28h.7,X0408
X0404:	mov	r7,27h
	sjmp	X040c
;
X0408:	mov	a,27h
	cpl	a
	mov	r7,a
X040c:	mov	dptr,#X0228
	mov	a,r7
	movx	@dptr,a
	clr	22h.4
X0413:	jnb	22h.6,X0476
	clr	ea
	mov	dptr,#X1004
	movx	a,@dptr
	mov	57h,a
	mov	dptr,#X0228
	movx	a,@dptr
	anl	a,#5
	mov	57h,a
	mov	a,5ch
	xrl	a,#1
	jnz	X044d
	mov	a,57h
	mov	dptr,#X1004
	jnb	acc.0,X043a
X0434:	movx	a,@dptr
X0435:	anl	a,#0fbh
X0437:	movx	@dptr,a
	sjmp	X043e
;
X043a:	movx	a,@dptr
X043b:	orl	a,#4
	movx	@dptr,a
X043e:	mov	a,57h
	jnb	acc.2,X0474
	inc	5bh
	mov	a,5bh
	jnz	X0474
	inc	5ah
	sjmp	X0474
;
X044d:	mov	a,57h
	jnb	acc.0,X046d
	mov	a,5ch
	mov	dptr,#X1004
	jnz	X045f
	movx	a,@dptr
	anl	a,#0fbh
	movx	@dptr,a
	sjmp	X0463
;
X045f:	movx	a,@dptr
	orl	a,#4
	movx	@dptr,a
X0463:	inc	5bh
	mov	a,5bh
	jnz	X0474
	inc	5ah
	sjmp	X0474
;
X046d:	mov	dptr,#X1004
	movx	a,@dptr
	orl	a,#4
	movx	@dptr,a
X0474:	setb	ea
X0476:	ret	
;
	clr	29h.3
	clr	29h.4
	mov	a,44h
	lcall	X0a9d
	dec	a
	subb	a,r1
	nop	
	dec	27h
	inc	a
	dec	23h
	inc	r0
	dec	rb0r3
	jbc	22h.4,X043b
	jb	22h.4,X045e
	jz	X04a7
	djnz	r6,X0435
	nop	
;
	org	497h
;
	dec	29h
	mov	43h,48h
	mov	42h,4ah
	mov	5eh,4ch
	mov	a,47h
	xrl	a,#6
	jz	X04ab
	ljmp	X1529
;
X04ab:	sjmp	X04c8
;
	mov	a,48h
	swap	a
	anl	a,#0fh
	mov	43h,a
	mov	a,4ah
	swap	a
	anl	a,#0fh
	mov	42h,a
	mov	a,4ch
	swap	a
	anl	a,#0fh
	mov	5eh,a
	mov	a,47h
	xrl	a,#6
	jnz	X0529
X04c8:	anl	43h,#0fh
	sjmp	X0529
;
	mov	43h,49h
	mov	42h,4bh
	mov	5eh,4dh
	mov	a,47h
	xrl	a,#6
	jnz	X0529
	sjmp	X04f9
;
	mov	a,49h
	swap	a
	anl	a,#0fh
	mov	43h,a
	mov	a,4bh
	swap	a
	anl	a,#0fh
	mov	42h,a
	mov	a,4dh
	swap	a
	anl	a,#0fh
	mov	5eh,a
	mov	a,47h
	xrl	a,#6
	jnz	X0529
X04f9:	mov	a,43h
	anl	a,#0fh
	orl	a,#10h
	mov	43h,a
	sjmp	X0529
;
	mov	a,47h
X0505:	xrl	a,#4
	jz	X050e
	mov	a,47h
	cjne	a,#5,X0514
X050e:	orl	5eh,#4
	mov	42h,#9
X0514:	mov	a,47h
	cjne	a,#6,X0529
	mov	a,43h
	anl	a,#0fh
	orl	a,#30h
	mov	43h,a
	sjmp	X0529
;
	setb	29h.3
	sjmp	X0529
;
	setb	29h.4
X0529:	clr	a
	mov	25h,a
	mov	a,42h
	swap	a
	anl	a,#0f0h
	mov	r7,a
	mov	a,43h
	anl	a,#0fh
	orl	a,r7
	mov	5fh,a
	setb	2ch.0
	ret	
;
	setb	22h.5
	mov	a,47h
	add	a,#0f5h
	jz	X054f
	add	a,#0cbh
	jz	X054f
	add	a,#40h
	jnz	X0552
	clr	22h.5
	ret	
;
X054f:	lcall	X18a5
X0552:	lcall	X155e
	clr	22h.5
	clr	ea
	clr	20h.4
	setb	ea
	ret	
;
	clr	ea
	mov	dptr,#X0414
	movx	a,@dptr
	anl	a,#0eh
	jz	X056c
	setb	23h.0
	sjmp	X0574
;
X056c:	mov	a,4eh
	orl	a,4fh
	add	a,#0ffh
	mov	23h.0,c
X0574:	setb	ea
	mov	dptr,#X0414
	movx	a,@dptr
	mov	c,acc.4
	mov	23h.1,c
	mov	a,#1eh
	movx	@dptr,a
	mov	a,5fh
	anl	a,#0fh
	mov	2dh,a
	mov	a,25h
	jnz	X059e
	jnb	23h.0,X0593
	mov	a,5fh
	jb	acc.5,X059e
X0593:	jnb	23h.1,X05af
	mov	a,5fh
	anl	a,#30h
	mov	r7,a
	cjne	r7,#30h,X05af
X059e:	mov	a,25h
	jnz	X05a7
	mov	25h,#0ch
	sjmp	X05a9
;
X05a7:	dec	25h
X05a9:	setb	2dh.4
	setb	2dh.5
	sjmp	X05be
;
X05af:	mov	a,5fh
	jnb	acc.6,X05ba
	clr	2dh.4
	setb	2dh.5
	sjmp	X05be
;
X05ba:	setb	2dh.4
	clr	2dh.5
X05be:	mov	a,47h
	xrl	a,#3
	jnz	X05e5
	jnb	29h.3,X05cd
	clr	2dh.4
	setb	2dh.5
	sjmp	X05e5
;
X05cd:	mov	a,25h
	jnz	X05d4
	jnb	29h.4,X05e5
X05d4:	clr	29h.4
	mov	a,25h
	jnz	X05df
	mov	25h,#7
	sjmp	X05e1
;
X05df:	dec	25h
X05e1:	setb	2dh.4
	setb	2dh.5
X05e5:	mov	a,47h
	cjne	a,#9,X05fe
	mov	a,44h
	jb	acc.3,X05fa
	mov	a,3ah
	xrl	a,#2
	jz	X05fa
	mov	a,3ah
	cjne	a,#3,X05fe
X05fa:	clr	2dh.4
	setb	2dh.5
X05fe:	mov	a,47h
	cjne	a,#0ah,X0616
	mov	a,3ah
	cjne	a,#1,X060e
	clr	2dh.4
	setb	2dh.5
	sjmp	X0616
;
X060e:	mov	a,3ah
	jnz	X0616
	setb	2dh.4
	clr	2dh.5
X0616:	jb	2dh.1,X0620
	mov	a,5eh
	jb	acc.0,X0620
	cpl	2dh.0
X0620:	jb	2dh.3,X062a
	mov	a,5eh
	jb	acc.1,X062a
	cpl	2dh.2
X062a:	jb	2dh.5,X0634
	mov	a,5eh
	jb	acc.2,X0634
	cpl	2dh.4
X0634:	mov	2eh,#40h
	jb	2dh.1,X063e
	mov	c,2dh.0
	sjmp	X0664
;
X063e:	jnb	2dh.0,X0647
	mov	a,46h
	mov	c,acc.2
	sjmp	X0664
;
X0647:	mov	a,5eh
	jb	acc.0,X0650
	mov	r7,#1
	sjmp	X0652
;
X0650:	mov	r7,#0
X0652:	mov	a,46h
	anl	a,#0f0h
	mov	r6,a
	cjne	r6,#0f0h,X065e
	mov	r6,#1
	sjmp	X0660
;
X065e:	mov	r6,#0
X0660:	mov	a,r6
	xrl	a,r7
	add	a,#0ffh
X0664:	mov	2eh.3,c
	mov	2eh.2,c
	jb	2dh.3,X066f
	mov	c,2dh.2
	sjmp	X0695
;
X066f:	jnb	2dh.2,X0678
	mov	a,46h
	mov	c,acc.2
	sjmp	X0695
;
X0678:	mov	a,5eh
	jb	acc.1,X0681
	mov	r7,#1
	sjmp	X0683
;
X0681:	mov	r7,#0
X0683:	mov	a,46h
	anl	a,#0f0h
	mov	r6,a
	cjne	r6,#0f0h,X068f
	mov	r6,#1
	sjmp	X0691
;
X068f:	mov	r6,#0
X0691:	mov	a,r6
	xrl	a,r7
	add	a,#0ffh
X0695:	mov	2eh.5,c
	mov	2eh.4,c
	jb	2dh.5,X06a0
	mov	c,2dh.4
	sjmp	X06c6
;
X06a0:	mov	a,47h
	xrl	a,#0ah
	jnz	X06c8
	jnb	2dh.4,X06af
	mov	a,46h
	mov	c,acc.3
	sjmp	X06c6
;
X06af:	mov	a,3ah
	cjne	a,#1,X06ba
	mov	a,46h
	mov	c,acc.3
	sjmp	X06ee
;
X06ba:	mov	a,46h
	jb	acc.4,X06c2
	jnb	acc.5,X06c5
X06c2:	setb	c
	sjmp	X06c6
;
X06c5:	clr	c
X06c6:	sjmp	X06ee
;
X06c8:	jnb	2dh.4,X06d1
	mov	a,46h
	mov	c,acc.2
	sjmp	X06ee
;
X06d1:	mov	a,5eh
	jb	acc.2,X06da
	mov	r7,#1
	sjmp	X06dc
;
X06da:	mov	r7,#0
X06dc:	mov	a,46h
	anl	a,#0f0h
	mov	r6,a
	cjne	r6,#0f0h,X06e8
	mov	r6,#1
	sjmp	X06ea
;
X06e8:	mov	r6,#0
X06ea:	mov	a,r6
	xrl	a,r7
	add	a,#0ffh
X06ee:	mov	2eh.1,c
	mov	2eh.0,c
	mov	dptr,#X1000
	movx	a,@dptr
	mov	dptr,#X102c
	movx	@dptr,a
	mov	dptr,#X1003
	movx	a,@dptr
	clr	c
	subb	a,#30h
	jc	X0717
	mov	c,2eh.1
	mov	2eh.7,c
	mov	c,2eh.0
	mov	2eh.6,c
	mov	a,2eh
	rrc	a
	rrc	a
	anl	a,#3fh
	mov	2eh,a
	clr	2eh.7
	setb	2eh.6
X0717:	mov	dptr,#X102f
	mov	a,2eh
	movx	@dptr,a
	mov	a,47h
	xrl	a,#6
	jnz	X076a
	mov	dptr,#X0228
	movx	a,@dptr
	jnb	28h.7,X072d
	mov	r7,a
	sjmp	X072f
;
X072d:	cpl	a
	mov	r7,a
X072f:	mov	27h,r7
	mov	dptr,#X0229
	movx	a,@dptr
	anl	a,#0feh
	movx	@dptr,a
	mov	a,43h
	swap	a
	anl	a,#0fh
	dec	a
	jz	X074c
	add	a,#0feh
	jz	X0750
	add	a,#3
	jnz	X075b
	clr	27h.0
	sjmp	X075b
;
X074c:	setb	27h.0
	sjmp	X075b
;
X0750:	mov	a,46h
	jnb	acc.2,X0758
	setb	c
	sjmp	X0759
;
X0758:	clr	c
X0759:	mov	27h.0,c
X075b:	jnb	28h.7,X0763
	mov	r7,27h
	ljmp	X189f
;
X0763:	mov	a,27h
	cpl	a
	mov	r7,a
	ljmp	X189f
;
X076a:	mov	a,47h
	xrl	a,#7
	jz	X077f
	mov	a,47h
	xrl	a,#8
	jz	X077f
	mov	a,47h
	xrl	a,#9
	jz	X077f
	ljmp	X180d
;
X077f:	mov	dptr,#X0228
	movx	a,@dptr
	jnb	28h.7,X0789
	mov	r7,a
	sjmp	X078b
;
X0789:	cpl	a
	mov	r7,a
X078b:	mov	27h,r7
	mov	dptr,#X0229
	movx	a,@dptr
	anl	a,#0fch
	movx	@dptr,a
	mov	a,3ah
	dec	a
	jz	X07bb
	dec	a
	jz	X07c1
	dec	a
	jz	X07cc
	add	a,#0fch
	jz	X07ec
	add	a,#0f9h
	jz	X07bb
	add	a,#0eh
	jnz	X07fb
	mov	a,46h
	rrc	a
	rrc	a
	anl	a,#3fh
	mov	b,#3
	div	ab
	mov	a,b
	add	a,#0ffh
	sjmp	X07f5
;
X07bb:	setb	27h.1
	clr	27h.0
	sjmp	X07ff
;
X07c1:	mov	a,46h
	jnb	acc.2,X07c9
	setb	c
	sjmp	X07e6
;
X07c9:	clr	c
	sjmp	X07e6
;
X07cc:	mov	a,46h
	jnb	acc.2,X07de
	anl	a,#38h
	clr	c
	subb	a,#30h
	jnc	X07de
	mov	r6,#0
	mov	r7,#1
	sjmp	X07e2
;
X07de:	mov	r6,#0
	mov	r7,#0
X07e2:	mov	a,r6
	orl	a,r7
	add	a,#0ffh
X07e6:	mov	27h.0,c
	clr	27h.1
	sjmp	X07ff
;
X07ec:	mov	a,46h
	jnb	acc.2,X07f4
	setb	c
	sjmp	X07f5
;
X07f4:	clr	c
X07f5:	mov	27h.1,c
	clr	27h.0
	sjmp	X07ff
;
X07fb:	clr	27h.0
	clr	27h.1
X07ff:	jnb	28h.7,X0806
	mov	r7,27h
	sjmp	X080a
;
X0806:	mov	a,27h
	cpl	a
	mov	r7,a
X080a:	ljmp	X189f
;
	mov	a,47h
	xrl	a,#0ch
	jz	X081c
	mov	a,47h
	xrl	a,#0bh
	jz	X081c
	ljmp	X18a4
;
X081c:	mov	dptr,#X0228
	movx	a,@dptr
	jnb	28h.7,X0826
	mov	r7,a
	sjmp	X0828
;
X0826:	cpl	a
	mov	r7,a
X0828:	mov	27h,r7
	mov	dptr,#X0229
	movx	a,@dptr
	anl	a,#0fdh
	movx	@dptr,a
	mov	a,3ah
	dec	a
	jz	X0856
	dec	a
	jz	X085a
	dec	a
	jz	X0867
	add	a,#0fch
	jz	X0885
	add	a,#0f9h
	jz	X0856
	add	a,#0eh
	jnz	X0892
	mov	a,46h
	rrc	a
	rrc	a
	anl	a,#3fh
	mov	b,#3
	div	ab
	mov	a,b
	sjmp	X087f
;
X0856:	setb	27h.1
	sjmp	X0894
;
X085a:	mov	a,46h
	jnb	acc.2,X0862
	setb	c
	sjmp	X0863
;
X0862:	clr	c
X0863:	mov	27h.1,c
	sjmp	X0894
;
X0867:	mov	a,46h
	jnb	acc.2,X0879
	anl	a,#38h
	clr	c
	subb	a,#30h
	jnc	X0879
	mov	r6,#0
	mov	r7,#1
	sjmp	X087d
;
X0879:	mov	r6,#0
	mov	r7,#0
X087d:	mov	a,r6
	orl	a,r7
X087f:	add	a,#0ffh
	mov	27h.1,c
	sjmp	X0894
;
X0885:	mov	a,46h
	jnb	acc.2,X088d
	setb	c
	sjmp	X088e
;
X088d:	clr	c
X088e:	mov	27h.1,c
	sjmp	X0894
;
X0892:	clr	27h.1
X0894:	jnb	28h.7,X089b
	mov	r7,27h
	sjmp	X089f
;
X089b:	mov	a,27h
	cpl	a
	mov	r7,a
X089f:	mov	dptr,#X0228
	mov	a,r7
	movx	@dptr,a
	ret	
;
	mov	a,47h
	cjne	a,#0bh,X08ba
	mov	dptr,#X0229
	movx	a,@dptr
	anl	a,#0ebh
	movx	@dptr,a
	mov	a,27h
	anl	a,#0ebh
	orl	a,45h
	mov	27h,a
	ret	
;
X08ba:	clr	a
	mov	dptr,#X0229
	movx	@dptr,a
	jnb	28h.7,X08c6
	mov	r7,45h
	sjmp	X08ca
;
X08c6:	mov	a,45h
	cpl	a
	mov	r7,a
X08ca:	mov	dptr,#X0228
	mov	a,r7
	movx	@dptr,a
	ret	
;
	mov	50h,r7
	setb	2bh.1
	ret	
;
	mov	54h,r7
	setb	2bh.0
	ret	
;
	clr	a
	mov	62h,a
	clr	ea
	mov	a,51h
	dec	a
	jz	X092c
	dec	a
	jz	X094d
	add	a,#2
	jz	X08ee
	ljmp	X19fe
;
X08ee:	setb	2bh.1
	mov	55h,#1
	mov	dptr,#X02a2
	movx	a,@dptr
	anl	a,#7fh
	movx	@dptr,a
	inc	dptr
	movx	a,@dptr
	jb	acc.7,X0922
	mov	dptr,#X0434
	movx	a,@dptr
	cjne	a,#2,X0922
	inc	dptr
	movx	a,@dptr
	cjne	a,#2,X0922
	inc	dptr
	movx	a,@dptr
	cjne	a,#2,X0922
	mov	r7,#20h
	lcall	X18d0
	mov	dptr,#X1004
	movx	a,@dptr
	anl	a,#0f3h
	movx	@dptr,a
	mov	51h,#1
	ljmp	X19fe
;
X0922:	mov	a,50h
	jnz	X092c
	mov	62h,#3
	ljmp	X19fe
;
X092c:	mov	dptr,#X1200
	movx	a,@dptr
	anl	a,#3
	jnz	X0946
	mov	r7,#20h
	lcall	X18d0
	mov	dptr,#X02a2
	movx	a,@dptr
	anl	a,#0bfh
	movx	@dptr,a
	mov	51h,#2
	ljmp	X19fe
;
X0946:	mov	a,50h
	jnz	X094d
	ljmp	X19f9
;
X094d:	mov	dptr,#X02a3
	movx	a,@dptr
	jnb	acc.6,X0957
	ljmp	X19f5
;
X0957:	mov	dptr,#X0437
	movx	a,@dptr
	xrl	a,#22h
	jz	X0962
	ljmp	X19f5
;
X0962:	mov	dptr,#X018a
	mov	a,#7eh
	movx	@dptr,a
	mov	dptr,#X0196
	movx	@dptr,a
	mov	dptr,#X1204
	mov	a,#0ah
	movx	@dptr,a
	mov	a,58h
	jnb	acc.3,X098c
	clr	a
	mov	dptr,#X0500
	movx	@dptr,a
	inc	dptr
	mov	a,#8
	movx	@dptr,a
	inc	dptr
	mov	a,#1
	movx	@dptr,a
	mov	a,#3
	movx	@dptr,a
	mov	r7,#1
	lcall	X0d2a
X098c:	mov	dptr,#X1328
	movx	a,@dptr
	mov	dptr,#X701a
	movx	@dptr,a
	mov	dptr,#X1329
	movx	a,@dptr
	mov	dptr,#X701b
	movx	@dptr,a
	mov	dptr,#X132b
	movx	a,@dptr
	mov	dptr,#X7022
	movx	@dptr,a
	mov	dptr,#X1328
	movx	a,@dptr
	anl	a,#0f0h
	movx	@dptr,a
	inc	dptr
	movx	a,@dptr
	anl	a,#0f0h
	movx	@dptr,a
	mov	dptr,#X132b
	movx	a,@dptr
	anl	a,#0cch
	movx	@dptr,a
	mov	a,58h
	jnb	acc.3,X09cf
	mov	a,3ch
	cpl	a
	mov	dptr,#X132a
	jz	X09c9
	movx	a,@dptr
	anl	a,#0f3h
	sjmp	X09da
;
X09c9:	movx	a,@dptr
	anl	a,#0fbh
	movx	@dptr,a
	sjmp	X09e3
;
X09cf:	mov	a,3ch
	cpl	a
	mov	dptr,#X132a
	jz	X09df
	movx	a,@dptr
	anl	a,#0f2h
X09da:	orl	a,3ch
	movx	@dptr,a
	sjmp	X09e3
;
X09df:	movx	a,@dptr
	anl	a,#0fah
	movx	@dptr,a
X09e3:	mov	dptr,#X0401
	movx	a,@dptr
	anl	a,#0fdh
	movx	@dptr,a
	mov	62h,#1
	mov	55h,#2
	clr	a
	mov	51h,a
	sjmp	X09fe
;
	mov	a,50h
	jnz	X09fe
	mov	62h,#3
	mov	51h,a
X09fe:	mov	a,62h
	jz	X0a17
	clr	20h.1
	clr	a
	mov	51h,a
	clr	2bh.1
	mov	r5,62h
	mov	r7,40h
	lcall	X1acb
	mov	a,62h
	cjne	a,#3,X0a17
	setb	20h.3
X0a17:	setb	ea
	ret	
;
	clr	ea
	jnb	20h.1,X0a31
	clr	a
	mov	dptr,#X0196
	movx	@dptr,a
	mov	51h,a
	clr	2bh.1
	clr	20h.1
	mov	r5,#2
	mov	r7,40h
	lcall	X1acb
X0a31:	mov	a,52h
	dec	a
	jz	X0a42
	inc	a
	jz	X0a3c
	ljmp	X1ac8
;
X0a3c:	mov	52h,#1
	mov	55h,#3
X0a42:	mov	dptr,#X0401
	movx	a,@dptr
	orl	a,#0eh
	movx	@dptr,a
	mov	a,58h
	anl	a,#18h
	jz	X0a6d
	mov	dptr,#X701a
	movx	a,@dptr
	mov	dptr,#X1328
	movx	@dptr,a
	mov	dptr,#X701b
	movx	a,@dptr
	mov	dptr,#X1329
	movx	@dptr,a
	inc	dptr
	mov	a,#5
	movx	@dptr,a
	mov	dptr,#X7022
	movx	a,@dptr
	mov	dptr,#X132b
	movx	@dptr,a
	sjmp	X0a7e
;
X0a6d:	mov	dptr,#X1328
	movx	a,@dptr
	orl	a,#0fh
	movx	@dptr,a
	inc	dptr
	movx	a,@dptr
	orl	a,#0fh
	movx	@dptr,a
	inc	dptr
	movx	a,@dptr
	orl	a,#5
	movx	@dptr,a
X0a7e:	mov	dptr,#X1204
	mov	a,#3
	movx	@dptr,a
	mov	a,58h
	jnb	acc.3,X0a9f
	mov	dptr,#X0500
	mov	a,#0e2h
	movx	@dptr,a
	inc	dptr
	mov	a,#8
	movx	@dptr,a
	inc	dptr
	mov	a,#1
	movx	@dptr,a
	mov	a,#3
	movx	@dptr,a
	mov	r7,#1
	lcall	X0d2a
X0a9f:	mov	dptr,#X02a2
	movx	a,@dptr
	orl	a,#0c0h
	movx	@dptr,a
	mov	dptr,#X1004
	movx	a,@dptr
	orl	a,#0ch
	movx	@dptr,a
	clr	a
	mov	52h,a
	mov	55h,a
	jnb	20h.2,X0abe
	clr	20h.2
	mov	r5,#1
	mov	r7,41h
	lcall	X1acb
X0abe:	jnb	20h.3,X0ac3
	clr	20h.3
X0ac3:	clr	a
	mov	dptr,#X0196
	movx	@dptr,a
	setb	ea
	ret	
;
	mov	a,r7
	cpl	a
	jz	X0afc
	clr	a
	mov	r6,a
X0ad1:	mov	a,#14h
	add	a,r6
	mov	dpl,a
	clr	a
	addc	a,#70h
	mov	dph,a
	movx	a,@dptr
	cjne	a,#0ffh,X0af8
	mov	a,#14h
	add	a,r6
	mov	dpl,a
	clr	a
	addc	a,#70h
	mov	dph,a
	mov	a,r7
	movx	@dptr,a
	mov	a,#1ch
	add	a,r6
	mov	dpl,a
	clr	a
	addc	a,#70h
	mov	dph,a
	mov	a,r5
	movx	@dptr,a
	ret	
;
X0af8:	inc	r6
	cjne	r6,#4,X0ad1
X0afc:	ret	
;
	ret	
;
	ret	
;
	mov	dptr,#X702a
	movx	a,@dptr
	jnb	acc.1,X0b53
	clr	ea
	mov	dptr,#X7028
	movx	a,@dptr
	mov	dptr,#X101c
	movx	@dptr,a
	mov	dptr,#X7029
	movx	a,@dptr
	mov	dptr,#X101d
	movx	@dptr,a
	mov	dptr,#X702a
	movx	a,@dptr
	mov	dptr,#X101e
	movx	@dptr,a
X0b20:	mov	dptr,#X101c
	movx	a,@dptr
	mov	62h,a
	mov	dptr,#X101e
	movx	a,@dptr
	jb	acc.1,X0b20
	mov	dptr,#X101c
	movx	a,@dptr
	mov	dptr,#X7028
	movx	@dptr,a
	mov	dptr,#X101d
	movx	a,@dptr
	mov	dptr,#X7029
	movx	@dptr,a
	mov	dptr,#X101e
	movx	a,@dptr
	mov	dptr,#X702a
	movx	@dptr,a
	jnb	29h.2,X0b4f
	mov	dptr,#X7024
	movx	a,@dptr
	orl	a,#1
	movx	@dptr,a
X0b4f:	clr	20h.5
	setb	ea
X0b53:	ret	
;
	ret	
;
	ret	
;
	org	0b91h
;
X0b91:	nop	
;
	org	0baah
;
X0baa:	nop	
;
	org	0d2ah
;
X0d2a:	nop	
;
	org	0d48h
;
X0d48:	nop	
;
	org	0dc8h
;
X0dc8:	nop	
;
	org	0dddh
;
X0ddd:	nop	
;
	org	0ffdh
;
	mov	a,r4
	acall	X174a
X1000:	mov	r7,a
;
	org	1002h
;
X1002:	mov	r7,a
X1003:	ljmp	startup_r1
;
	ljmp	startup_r2
;
	ljmp	startup_r3
;
	ljmp	startup_r4
;
	ljmp	X13bc
;
	ljmp	X13db
;
	ljmp	X13e0
;
	lcall	X13dc
	ret	
;
X101c:	ljmp	X18da
;
	ljmp	X1a1a
;
	ljmp	X153c
;
	ljmp	X1477
;
startup_r1:
	jnb	20h.5,X1031
	jb	21h.5,X1031
	lcall	X1aff
X1031:	ret	
;
startup_r2:	
	mov	dptr,#X018c
	movx	a,@dptr
	jnb	acc.3,X1059
	mov	a,58h
	jnb	acc.0,X104e
	mov	a,4ch
	jnb	acc.0,X1047
	mov	r7,#40h
	sjmp	X1049
;
X1047:	mov	r7,#0
X1049:	mov	dptr,#X102f
	mov	a,r7
	movx	@dptr,a
X104e:	mov	dptr,#X018c
X1051:	mov	a,#8
	movx	@dptr,a
	clr	a
	mov	dptr,#X01a7
	movx	@dptr,a
X1059:	mov	dptr,#X018c
	movx	a,@dptr
	jnb	acc.0,X107c
	mov	dptr,#X0180
	movx	a,@dptr
	cjne	a,#2,X107c
	inc	dptr
	movx	a,@dptr
	cjne	a,#1,X107c
	mov	dptr,#X0184
	movx	a,@dptr
	cjne	a,#81h,X107c
	mov	dptr,#X018c
	mov	a,#1
	movx	@dptr,a
	lcall	X0ddd
X107c:	ret	
;
startup_r3:	
	mov	dptr,#X0414
	movx	a,@dptr
	jb	acc.7,X1087
	ljmp	X13ba
;
X1087:	mov	dptr,#X7012
	movx	a,@dptr
	mov	56h,a
	mov	dptr,#X0404
	movx	a,@dptr
	lcall	X0ab6
	jbc	acc.1,X10c8
	jbc	0c0h.5,X10d0
	acall	X100a
	jnc	X10af
	ajmp	X1251
;
	acall	X104a
	anl	rb2r1,a
	orl	a,r2
	anl	rb2r1,#4ah
	anl	a,#11h
	mov	55h,r3
	acall	X10da
	anl	a,@r0
X10af:	lcall	X3870
	lcall	X6371
	lcall	X9172
	rrc	a
	addc	a,r4
	jmp	@a+dptr
;
	rrc	a
	anl	a,r5
	sjmp	X10d2
;
	sjmp	X1051
;
	org	10c3h
;
	rrc	a
	cjne	r2,#90h,X1137
	acall	X10e0
	mov	3ch,a
	clr	a
	mov	dptr,#X7013
	movx	@dptr,a
X10d0:	mov	dptr,#X0414
	mov	a,#80h
	movx	@dptr,a
	mov	a,56h
	cpl	a
	jnz	X10de
	ljmp	X13ba
;
X10de:	ljmp	X13b3
;
	jb	20h.2,X10e7
	jnb	20h.3,X1104
X10e7:	mov	r5,#2
	mov	r7,56h
	lcall	X0baa
	mov	dptr,#X0414
	mov	a,#80h
	movx	@dptr,a
	clr	a
	mov	dptr,#X7013
	movx	@dptr,a
	mov	a,56h
	cpl	a
	jnz	X1101
	ljmp	X13ba
;
X1101:	ljmp	X13b3
;
X1104:	mov	41h,56h
	setb	20h.2
	ret	
;
	mov	dptr,#X7010
	movx	a,@dptr
	anl	a,#7fh
	mov	r7,a
	cjne	r7,#0ah,X1121
	mov	dptr,#X7011
	movx	a,@dptr
	cjne	a,#8,X1121
	mov	4eh,#1
	mov	4fh,#84h
X1121:	mov	dptr,#X7010
	movx	a,@dptr
	anl	a,#7fh
	mov	r7,a
	cjne	r7,#2,X113d
	mov	dptr,#X7011
	movx	a,@dptr
	xrl	a,#8
	jz	X1137
	movx	a,@dptr
	cjne	a,#20h,X113d
X1137:	mov	4eh,#3
	mov	4fh,#20h
X113d:	clr	a
	mov	27h,a
	ret	
;
	mov	dptr,#X7011
	movx	a,@dptr
	add	a,#0ffh
	mov	28h.7,c
	ret	
;
	mov	dptr,#X0404
	movx	a,@dptr
	add	a,acc
	add	a,#5dh
	mov	57h,a
	mov	dptr,#X7010
	movx	a,@dptr
	mov	r7,a
	mov	a,#47h
	add	a,57h
	mov	r0,a
	xch	a,@r0
	mov	a,r7
	xch	a,@r0
	mov	dptr,#X7011
	movx	a,@dptr
	mov	r7,a
	mov	a,#48h
	add	a,57h
	mov	r0,a
	xch	a,@r0
	mov	a,r7
	xch	a,@r0
	clr	a
	mov	r5,a
	mov	r7,56h
	lcall	X0baa
	mov	dptr,#X0414
	mov	a,#80h
	movx	@dptr,a
	clr	a
	mov	dptr,#X7013
	movx	@dptr,a
	mov	a,56h
	cpl	a
	jnz	X1188
	ljmp	X13ba
;
X1188:	ljmp	X13b3
;
	mov	a,47h
	xrl	a,#7
	jz	X11ae
	mov	a,47h
	xrl	a,#8
	jz	X11ae
	mov	a,47h
	xrl	a,#9
	jz	X11ae
	mov	a,47h
	xrl	a,#0ah
	jz	X11ae
	mov	a,47h
	xrl	a,#0bh
	jz	X11ae
	mov	a,47h
	cjne	a,#0ch,X11b6
X11ae:	mov	dptr,#X7011
	movx	a,@dptr
	anl	a,#0fh
	mov	3ah,a
X11b6:	mov	a,47h
	cjne	a,#9,X11c3
	mov	a,3ah
	cjne	a,#3,X11c3
	clr	a
	mov	46h,a
X11c3:	mov	a,47h
	cjne	a,#0ah,X11d0
	mov	a,3ah
	cjne	a,#1,X11d0
	clr	a
	mov	46h,a
X11d0:	clr	a
	mov	r5,a
	mov	r7,56h
	lcall	X0baa
	setb	20h.4
	ret	
;
	mov	dptr,#X7011
	movx	a,@dptr
	cpl	a
	mov	r7,a
	mov	dptr,#X7010
	movx	a,@dptr
	anl	a,r7
	mov	r7,a
	mov	dptr,#X7011
	movx	a,@dptr
	anl	a,27h
	orl	a,r7
	mov	dptr,#X7018
	movx	@dptr,a
	mov	dptr,#X7011
	movx	a,@dptr
	mov	dptr,#X7019
	movx	@dptr,a
	clr	a
	mov	r5,a
	mov	r7,56h
	lcall	X0baa
X1200:	jnb	22h.5,X1207
	setb	22h.4
	sjmp	X122d
;
X1207:	mov	dptr,#X7018
	movx	a,@dptr
	mov	27h,a
	mov	dptr,#X0229
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#X7019
	movx	a,@dptr
	mov	r6,a
	mov	a,r7
	anl	a,r6
	mov	dptr,#X0229
	movx	@dptr,a
	jnb	28h.7,X1224
	mov	r7,27h
	sjmp	X1228
;
X1224:	mov	a,27h
	cpl	a
	mov	r7,a
X1228:	mov	dptr,#X0228
	mov	a,r7
	movx	@dptr,a
X122d:	mov	a,56h
	cpl	a
	jnz	X1235
	ljmp	X13ba
;
X1235:	ljmp	X13b3
;
	mov	dptr,#X7010
	movx	a,@dptr
	mov	r6,a
	mov	dptr,#X7011
	movx	a,@dptr
	mov	r5,a
	mov	a,r5
	mov	r0,a
	mov	a,@r0
	mov	57h,a
	mov	r5,a
	mov	r7,56h
	lcall	X0baa
	mov	dptr,#X0414
	mov	a,#80h
	movx	@dptr,a
	clr	a
	mov	dptr,#X7013
	movx	@dptr,a
	mov	a,56h
	cpl	a
	jnz	X1260
	ljmp	X13ba
;
X1260:	ljmp	X13b3
;
	mov	dptr,#X7010
	movx	a,@dptr
	mov	r6,a
	mov	dptr,#X7011
	movx	a,@dptr
	mov	r5,a
	mov	a,r5
	mov	dpl,a
	mov	dph,r6
	movx	a,@dptr
	mov	57h,a
	mov	r5,a
	mov	r7,56h
	lcall	X0baa
	mov	dptr,#X0414
	mov	a,#80h
	movx	@dptr,a
	clr	a
	mov	dptr,#X7013
	movx	@dptr,a
	mov	a,56h
	cpl	a
	jnz	X128e
	ljmp	X13ba
;
X128e:	ljmp	X13b3
;
	mov	dptr,#X1000
	movx	a,@dptr
	mov	57h,a
	clr	a
	mov	58h,a
	mov	59h,a
	mov	dptr,#X1003
	movx	a,@dptr
	cjne	a,#28h,X12a8
	mov	58h,#1
	sjmp	X12e4
;
X12a8:	mov	dptr,#X1003
	movx	a,@dptr
	cjne	a,#30h,X12b4
	mov	58h,#2
	sjmp	X12e4
;
X12b4:	mov	dptr,#X1003
	movx	a,@dptr
	cjne	a,#33h,X12c0
	mov	58h,#4
	sjmp	X12e4
;
X12c0:	mov	dptr,#X1003
	movx	a,@dptr
	cjne	a,#35h,X12d3
	mov	dptr,#X1002
	movx	a,@dptr
	cjne	a,#72h,X12d3
	mov	58h,#8
	sjmp	X12e4
;
X12d3:	mov	dptr,#X1003
	movx	a,@dptr
	cjne	a,#35h,X12e4
	mov	dptr,#X1002
	movx	a,@dptr
	cjne	a,#93h,X12e4
	mov	58h,#10h
X12e4:	mov	a,58h
	jnb	acc.1,X1302
	mov	dptr,#X0508
	movx	a,@dptr
	orl	a,#1
	movx	@dptr,a
	mov	r5,a
	mov	dptr,#X0505
	movx	a,@dptr
	anl	a,#0fbh
	movx	@dptr,a
	orl	a,#4
	movx	@dptr,a
	mov	a,r5
	anl	a,#0feh
	mov	dptr,#X0508
	movx	@dptr,a
X1302:	clr	a
	mov	4eh,a
	mov	4fh,a
	mov	3ah,#0ffh
	mov	3ch,#0ffh
	mov	r5,57h
	mov	r7,56h
	lcall	X0baa
	clr	a
	mov	dptr,#X7032
	movx	@dptr,a
	clr	22h.6
	mov	5ch,a
	mov	5ah,a
	mov	5bh,a
	mov	dptr,#X7030
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#X0414
X132a:	mov	a,#80h
	movx	@dptr,a
	clr	a
	mov	dptr,#X7013
	movx	@dptr,a
	mov	a,56h
	cpl	a
	jnz	X133a
	ljmp	X13ba
;
X133a:	sjmp	X13b3
;
	mov	dptr,#X7010
	movx	a,@dptr
	add	a,#0ffh
	mov	p1.3,c
	clr	a
	mov	r5,a
	mov	r7,56h
	lcall	X0baa
	mov	dptr,#X0414
	mov	a,#80h
	movx	@dptr,a
	clr	a
	mov	dptr,#X7013
	movx	@dptr,a
	mov	a,56h
	cpl	a
	jz	X13ba
	sjmp	X13b3
;
	mov	dptr,#X7010
	movx	a,@dptr
	add	a,#0ffh
	mov	29h.2,c
	setb	20h.5
	mov	r5,57h
	mov	r7,56h
	lcall	X0baa
	mov	dptr,#X0414
	mov	a,#80h
	movx	@dptr,a
	clr	a
	mov	dptr,#X7013
	movx	@dptr,a
	mov	a,56h
	cpl	a
	jz	X13ba
	sjmp	X13b3
;
	mov	dptr,#X7010
	movx	a,@dptr
	add	a,#0ffh
	mov	22h.6,c
	mov	dptr,#X7011
	movx	a,@dptr
	mov	5ch,a
	mov	r5,57h
	mov	r7,56h
	lcall	X0baa
	mov	dptr,#X0414
	mov	a,#80h
	movx	@dptr,a
	mov	dptr,#X7030
	mov	a,5ah
	movx	@dptr,a
	inc	dptr
	mov	a,5bh
	movx	@dptr,a
	clr	a
	mov	5ah,a
	mov	5bh,a
	mov	dptr,#X7013
	movx	@dptr,a
	mov	a,56h
	cpl	a
	jz	X13ba
X13b3:	mov	dptr,#X7025
	movx	a,@dptr
	orl	a,#1
	movx	@dptr,a
X13ba:	ret	
;
startup_r4:	ret	
;
X13bc:	mov	a,53h
	jnz	X13da
	jnb	2ch.0,X13cc
	cpl	29h.5
	jnb	29h.5,X13cc
	inc	46h
	clr	20h.4
X13cc:	mov	a,4fh
	orl	a,4eh
	jz	X13da
	mov	a,4fh
	dec	4fh
	jnz	X13da
	dec	4eh
X13da:	ret	
;
X13db:	ret	
;
X13dc:	clr	28h.2
	setb	c
	ret	
;
X13e0:	jnb	22h.4,X1413
	mov	dptr,#X7019
	movx	a,@dptr
	anl	a,27h
	mov	r7,a
	mov	dptr,#X7018
	movx	a,@dptr
	orl	a,r7
	mov	27h,a
	mov	dptr,#X0229
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#X7019
	movx	a,@dptr
	mov	r6,a
	mov	a,r7
	anl	a,r6
	mov	dptr,#X0229
	movx	@dptr,a
	jnb	28h.7,X1408
	mov	r7,27h
	sjmp	X140c
;
X1408:	mov	a,27h
	cpl	a
	mov	r7,a
X140c:	mov	dptr,#X0228
	mov	a,r7
	movx	@dptr,a
	clr	22h.4
X1413:	jnb	22h.6,X1476
	clr	ea
	mov	dptr,#X1004
	movx	a,@dptr
	mov	57h,a
	mov	dptr,#X0228
	movx	a,@dptr
	anl	a,#5
	mov	57h,a
	mov	a,5ch
	xrl	a,#1
	jnz	X144d
	mov	a,57h
	mov	dptr,#X1004
	jnb	acc.0,X143a
	movx	a,@dptr
X1435:	anl	a,#0fbh
	movx	@dptr,a
	sjmp	X143e
;
X143a:	movx	a,@dptr
X143b:	orl	a,#4
	movx	@dptr,a
X143e:	mov	a,57h
	jnb	acc.2,X1474
	inc	5bh
	mov	a,5bh
	jnz	X1474
	inc	5ah
	sjmp	X1474
;
X144d:	mov	a,57h
	jnb	acc.0,X146d
	mov	a,5ch
	mov	dptr,#X1004
	jnz	X145f
	movx	a,@dptr
	anl	a,#0fbh
	movx	@dptr,a
	sjmp	X1463
;
X145f:	movx	a,@dptr
	orl	a,#4
	movx	@dptr,a
X1463:	inc	5bh
	mov	a,5bh
	jnz	X1474
	inc	5ah
	sjmp	X1474
;
X146d:	mov	dptr,#X1004
	movx	a,@dptr
	orl	a,#4
	movx	@dptr,a
X1474:	setb	ea
X1476:	ret	
;
X1477:	clr	29h.3
	clr	29h.4
	mov	a,44h
	lcall	X0ab6
	dec	a
	subb	a,r1
	nop	
	dec	27h
	inc	a
	dec	23h
	inc	r0
	dec	rb0r3
	jbc	22h.4,X143b
	jb	22h.4,X145e
	jz	X14a7
	djnz	r6,X1435
	nop	
;
	org	1497h
;
	dec	29h
	mov	43h,48h
	mov	42h,4ah
	mov	5eh,4ch
	mov	a,47h
	xrl	a,#6
	jz	X14ab
	ljmp	X1529
;
X14ab:	sjmp	X14c8
;
	mov	a,48h
	swap	a
	anl	a,#0fh
	mov	43h,a
	mov	a,4ah
	swap	a
	anl	a,#0fh
	mov	42h,a
	mov	a,4ch
	swap	a
	anl	a,#0fh
	mov	5eh,a
	mov	a,47h
	xrl	a,#6
	jnz	X1529
X14c8:	anl	43h,#0fh
	sjmp	X1529
;
	mov	43h,49h
	mov	42h,4bh
	mov	5eh,4dh
	mov	a,47h
	xrl	a,#6
	jnz	X1529
	sjmp	X14f9
;
	mov	a,49h
	swap	a
	anl	a,#0fh
	mov	43h,a
	mov	a,4bh
	swap	a
	anl	a,#0fh
	mov	42h,a
	mov	a,4dh
	swap	a
	anl	a,#0fh
	mov	5eh,a
	mov	a,47h
	xrl	a,#6
	jnz	X1529
X14f9:	mov	a,43h
	anl	a,#0fh
	orl	a,#10h
	mov	43h,a
	sjmp	X1529
;
	mov	a,47h
	xrl	a,#4
	jz	X150e
	mov	a,47h
	cjne	a,#5,X1514
X150e:	orl	5eh,#4
	mov	42h,#9
X1514:	mov	a,47h
	cjne	a,#6,X1529
	mov	a,43h
	anl	a,#0fh
	orl	a,#30h
	mov	43h,a
	sjmp	X1529
;
	setb	29h.3
	sjmp	X1529
;
	setb	29h.4
X1529:	clr	a
	mov	25h,a
	mov	a,42h
	swap	a
	anl	a,#0f0h
	mov	r7,a
	mov	a,43h
	anl	a,#0fh
	orl	a,r7
	mov	5fh,a
	setb	2ch.0
	ret	
;
X153c:	setb	22h.5
	mov	a,47h
	add	a,#0f5h
	jz	X154f
	add	a,#0cbh
	jz	X154f
	add	a,#40h
	jnz	X1552
	clr	22h.5
	ret	
;
X154f:	lcall	X18a5
X1552:	lcall	X155e
	clr	22h.5
	clr	ea
	clr	20h.4
	setb	ea
	ret	
;
X155e:	clr	ea
	mov	dptr,#X0414
	movx	a,@dptr
	anl	a,#0eh
	jz	X156c
	setb	23h.0
	sjmp	X1574
;
X156c:	mov	a,4eh
	orl	a,4fh
	add	a,#0ffh
	mov	23h.0,c
X1574:	setb	ea
	mov	dptr,#X0414
	movx	a,@dptr
	mov	c,acc.4
	mov	23h.1,c
	mov	a,#1eh
	movx	@dptr,a
	mov	a,5fh
	anl	a,#0fh
	mov	2dh,a
	mov	a,25h
	jnz	X159e
	jnb	23h.0,X1593
	mov	a,5fh
	jb	acc.5,X159e
X1593:	jnb	23h.1,X15af
	mov	a,5fh
	anl	a,#30h
	mov	r7,a
	cjne	r7,#30h,X15af
X159e:	mov	a,25h
	jnz	X15a7
	mov	25h,#0ch
	sjmp	X15a9
;
X15a7:	dec	25h
X15a9:	setb	2dh.4
	setb	2dh.5
	sjmp	X15be
;
X15af:	mov	a,5fh
	jnb	acc.6,X15ba
	clr	2dh.4
	setb	2dh.5
	sjmp	X15be
;
X15ba:	setb	2dh.4
	clr	2dh.5
X15be:	mov	a,47h
	xrl	a,#3
	jnz	X15e5
	jnb	29h.3,X15cd
	clr	2dh.4
	setb	2dh.5
	sjmp	X15e5
;
X15cd:	mov	a,25h
	jnz	X15d4
	jnb	29h.4,X15e5
X15d4:	clr	29h.4
	mov	a,25h
	jnz	X15df
	mov	25h,#7
	sjmp	X15e1
;
X15df:	dec	25h
X15e1:	setb	2dh.4
	setb	2dh.5
X15e5:	mov	a,47h
	cjne	a,#9,X15fe
	mov	a,44h
	jb	acc.3,X15fa
	mov	a,3ah
	xrl	a,#2
	jz	X15fa
	mov	a,3ah
	cjne	a,#3,X15fe
X15fa:	clr	2dh.4
	setb	2dh.5
X15fe:	mov	a,47h
	cjne	a,#0ah,X1616
	mov	a,3ah
	cjne	a,#1,X160e
	clr	2dh.4
	setb	2dh.5
	sjmp	X1616
;
X160e:	mov	a,3ah
	jnz	X1616
	setb	2dh.4
	clr	2dh.5
X1616:	jb	2dh.1,X1620
	mov	a,5eh
	jb	acc.0,X1620
	cpl	2dh.0
X1620:	jb	2dh.3,X162a
	mov	a,5eh
	jb	acc.1,X162a
	cpl	2dh.2
X162a:	jb	2dh.5,X1634
	mov	a,5eh
	jb	acc.2,X1634
	cpl	2dh.4
X1634:	mov	2eh,#40h
	jb	2dh.1,X163e
	mov	c,2dh.0
	sjmp	X1664
;
X163e:	jnb	2dh.0,X1647
	mov	a,46h
	mov	c,acc.2
	sjmp	X1664
;
X1647:	mov	a,5eh
	jb	acc.0,X1650
	mov	r7,#1
	sjmp	X1652
;
X1650:	mov	r7,#0
X1652:	mov	a,46h
	anl	a,#0f0h
	mov	r6,a
	cjne	r6,#0f0h,X165e
	mov	r6,#1
	sjmp	X1660
;
X165e:	mov	r6,#0
X1660:	mov	a,r6
	xrl	a,r7
	add	a,#0ffh
X1664:	mov	2eh.3,c
	mov	2eh.2,c
	jb	2dh.3,X166f
	mov	c,2dh.2
	sjmp	X1695
;
X166f:	jnb	2dh.2,X1678
	mov	a,46h
	mov	c,acc.2
	sjmp	X1695
;
X1678:	mov	a,5eh
	jb	acc.1,X1681
	mov	r7,#1
	sjmp	X1683
;
X1681:	mov	r7,#0
X1683:	mov	a,46h
	anl	a,#0f0h
	mov	r6,a
	cjne	r6,#0f0h,X168f
	mov	r6,#1
	sjmp	X1691
;
X168f:	mov	r6,#0
X1691:	mov	a,r6
	xrl	a,r7
	add	a,#0ffh
X1695:	mov	2eh.5,c
	mov	2eh.4,c
	jb	2dh.5,X16a0
	mov	c,2dh.4
	sjmp	X16c6
;
X16a0:	mov	a,47h
	xrl	a,#0ah
	jnz	X16c8
	jnb	2dh.4,X16af
	mov	a,46h
	mov	c,acc.3
	sjmp	X16c6
;
X16af:	mov	a,3ah
	cjne	a,#1,X16ba
	mov	a,46h
	mov	c,acc.3
	sjmp	X16ee
;
X16ba:	mov	a,46h
	jb	acc.4,X16c2
	jnb	acc.5,X16c5
X16c2:	setb	c
	sjmp	X16c6
;
X16c5:	clr	c
X16c6:	sjmp	X16ee
;
X16c8:	jnb	2dh.4,X16d1
	mov	a,46h
	mov	c,acc.2
	sjmp	X16ee
;
X16d1:	mov	a,5eh
	jb	acc.2,X16da
	mov	r7,#1
	sjmp	X16dc
;
X16da:	mov	r7,#0
X16dc:	mov	a,46h
	anl	a,#0f0h
	mov	r6,a
	cjne	r6,#0f0h,X16e8
	mov	r6,#1
	sjmp	X16ea
;
X16e8:	mov	r6,#0
X16ea:	mov	a,r6
	xrl	a,r7
	add	a,#0ffh
X16ee:	mov	2eh.1,c
	mov	2eh.0,c
	mov	dptr,#X1000
	movx	a,@dptr
	mov	dptr,#X102c
	movx	@dptr,a
	mov	dptr,#X1003
	movx	a,@dptr
	clr	c
	subb	a,#30h
	jc	X1717
	mov	c,2eh.1
	mov	2eh.7,c
	mov	c,2eh.0
	mov	2eh.6,c
	mov	a,2eh
	rrc	a
	rrc	a
	anl	a,#3fh
	mov	2eh,a
	clr	2eh.7
	setb	2eh.6
X1717:	mov	dptr,#X102f
	mov	a,2eh
	movx	@dptr,a
	mov	a,47h
	xrl	a,#6
	jnz	X176a
	mov	dptr,#X0228
	movx	a,@dptr
	jnb	28h.7,X172d
	mov	r7,a
	sjmp	X172f
;
X172d:	cpl	a
	mov	r7,a
X172f:	mov	27h,r7
	mov	dptr,#X0229
	movx	a,@dptr
	anl	a,#0feh
	movx	@dptr,a
	mov	a,43h
	swap	a
	anl	a,#0fh
	dec	a
	jz	X174c
	add	a,#0feh
	jz	X1750
	add	a,#3
	jnz	X175b
	clr	27h.0
X174a:	sjmp	X175b
;
X174c:	setb	27h.0
	sjmp	X175b
;
X1750:	mov	a,46h
	jnb	acc.2,X1758
	setb	c
	sjmp	X1759
;
X1758:	clr	c
X1759:	mov	27h.0,c
X175b:	jnb	28h.7,X1763
	mov	r7,27h
	ljmp	X189f
;
X1763:	mov	a,27h
	cpl	a
	mov	r7,a
	ljmp	X189f
;
X176a:	mov	a,47h
	xrl	a,#7
	jz	X177f
	mov	a,47h
	xrl	a,#8
	jz	X177f
	mov	a,47h
	xrl	a,#9
	jz	X177f
	ljmp	X180d
;
X177f:	mov	dptr,#X0228
	movx	a,@dptr
	jnb	28h.7,X1789
	mov	r7,a
	sjmp	X178b
;
X1789:	cpl	a
	mov	r7,a
X178b:	mov	27h,r7
	mov	dptr,#X0229
	movx	a,@dptr
	anl	a,#0fch
	movx	@dptr,a
	mov	a,3ah
	dec	a
	jz	X17bb
	dec	a
	jz	X17c1
	dec	a
	jz	X17cc
	add	a,#0fch
	jz	X17ec
	add	a,#0f9h
	jz	X17bb
	add	a,#0eh
	jnz	X17fb
	mov	a,46h
	rrc	a
	rrc	a
	anl	a,#3fh
	mov	b,#3
	div	ab
	mov	a,b
	add	a,#0ffh
	sjmp	X17f5
;
X17bb:	setb	27h.1
	clr	27h.0
	sjmp	X17ff
;
X17c1:	mov	a,46h
	jnb	acc.2,X17c9
	setb	c
	sjmp	X17e6
;
X17c9:	clr	c
	sjmp	X17e6
;
X17cc:	mov	a,46h
	jnb	acc.2,X17de
	anl	a,#38h
	clr	c
	subb	a,#30h
	jnc	X17de
	mov	r6,#0
	mov	r7,#1
	sjmp	X17e2
;
X17de:	mov	r6,#0
	mov	r7,#0
X17e2:	mov	a,r6
	orl	a,r7
	add	a,#0ffh
X17e6:	mov	27h.0,c
	clr	27h.1
	sjmp	X17ff
;
X17ec:	mov	a,46h
	jnb	acc.2,X17f4
	setb	c
	sjmp	X17f5
;
X17f4:	clr	c
X17f5:	mov	27h.1,c
	clr	27h.0
	sjmp	X17ff
;
X17fb:	clr	27h.0
	clr	27h.1
X17ff:	jnb	28h.7,X1806
	mov	r7,27h
	sjmp	X180a
;
X1806:	mov	a,27h
	cpl	a
	mov	r7,a
X180a:	ljmp	X189f
;
X180d:	mov	a,47h
	xrl	a,#0ch
	jz	X181c
	mov	a,47h
	xrl	a,#0bh
	jz	X181c
	ljmp	X18a4
;
X181c:	mov	dptr,#X0228
	movx	a,@dptr
	jnb	28h.7,X1826
	mov	r7,a
	sjmp	X1828
;
X1826:	cpl	a
	mov	r7,a
X1828:	mov	27h,r7
	mov	dptr,#X0229
	movx	a,@dptr
	anl	a,#0fdh
	movx	@dptr,a
	mov	a,3ah
	dec	a
	jz	X1856
	dec	a
	jz	X185a
	dec	a
	jz	X1867
	add	a,#0fch
	jz	X1885
	add	a,#0f9h
	jz	X1856
	add	a,#0eh
	jnz	X1892
	mov	a,46h
	rrc	a
	rrc	a
	anl	a,#3fh
	mov	b,#3
	div	ab
	mov	a,b
	sjmp	X187f
;
X1856:	setb	27h.1
	sjmp	X1894
;
X185a:	mov	a,46h
	jnb	acc.2,X1862
	setb	c
	sjmp	X1863
;
X1862:	clr	c
X1863:	mov	27h.1,c
	sjmp	X1894
;
X1867:	mov	a,46h
	jnb	acc.2,X1879
	anl	a,#38h
	clr	c
	subb	a,#30h
	jnc	X1879
	mov	r6,#0
	mov	r7,#1
	sjmp	X187d
;
X1879:	mov	r6,#0
	mov	r7,#0
X187d:	mov	a,r6
	orl	a,r7
X187f:	add	a,#0ffh
	mov	27h.1,c
	sjmp	X1894
;
X1885:	mov	a,46h
	jnb	acc.2,X188d
	setb	c
	sjmp	X188e
;
X188d:	clr	c
X188e:	mov	27h.1,c
	sjmp	X1894
;
X1892:	clr	27h.1
X1894:	jnb	28h.7,X189b
	mov	r7,27h
	sjmp	X189f
;
X189b:	mov	a,27h
	cpl	a
	mov	r7,a
X189f:	mov	dptr,#X0228
	mov	a,r7
	movx	@dptr,a
X18a4:	ret	
;
X18a5:	mov	a,47h
	cjne	a,#0bh,X18ba
	mov	dptr,#X0229
	movx	a,@dptr
	anl	a,#0ebh
	movx	@dptr,a
	mov	a,27h
	anl	a,#0ebh
	orl	a,45h
	mov	27h,a
	ret	
;
X18ba:	clr	a
	mov	dptr,#X0229
	movx	@dptr,a
	jnb	28h.7,X18c6
	mov	r7,45h
	sjmp	X18ca
;
X18c6:	mov	a,45h
	cpl	a
	mov	r7,a
X18ca:	mov	dptr,#X0228
	mov	a,r7
	movx	@dptr,a
	ret	
;
X18d0:	mov	50h,r7
	setb	2bh.1
	ret	
;
	mov	54h,r7
	setb	2bh.0
	ret	
;
X18da:	clr	a
	mov	62h,a
	clr	ea
	mov	a,51h
	dec	a
	jz	X192c
	dec	a
	jz	X194d
	add	a,#2
	jz	X18ee
	ljmp	X19fe
;
X18ee:	setb	2bh.1
	mov	55h,#1
	mov	dptr,#X02a2
	movx	a,@dptr
	anl	a,#7fh
	movx	@dptr,a
	inc	dptr
	movx	a,@dptr
	jb	acc.7,X1922
	mov	dptr,#X0434
	movx	a,@dptr
	cjne	a,#2,X1922
	inc	dptr
	movx	a,@dptr
	cjne	a,#2,X1922
	inc	dptr
	movx	a,@dptr
	cjne	a,#2,X1922
	mov	r7,#20h
	lcall	X18d0
	mov	dptr,#X1004
	movx	a,@dptr
	anl	a,#0f3h
	movx	@dptr,a
	mov	51h,#1
	ljmp	X19fe
;
X1922:	mov	a,50h
	jnz	X192c
	mov	62h,#3
	ljmp	X19fe
;
X192c:	mov	dptr,#X1200
	movx	a,@dptr
	anl	a,#3
	jnz	X1946
	mov	r7,#20h
	lcall	X18d0
	mov	dptr,#X02a2
	movx	a,@dptr
	anl	a,#0bfh
	movx	@dptr,a
	mov	51h,#2
	ljmp	X19fe
;
X1946:	mov	a,50h
	jnz	X194d
	ljmp	X19f9
;
X194d:	mov	dptr,#X02a3
	movx	a,@dptr
	jnb	acc.6,X1957
	ljmp	X19f5
;
X1957:	mov	dptr,#X0437
	movx	a,@dptr
	xrl	a,#22h
	jz	X1962
	ljmp	X19f5
;
X1962:	mov	dptr,#X018a
	mov	a,#7eh
	movx	@dptr,a
	mov	dptr,#X0196
	movx	@dptr,a
	mov	dptr,#X1204
	mov	a,#0ah
	movx	@dptr,a
	mov	a,58h
	jnb	acc.3,X198c
	clr	a
	mov	dptr,#X0500
	movx	@dptr,a
	inc	dptr
	mov	a,#8
	movx	@dptr,a
	inc	dptr
	mov	a,#1
	movx	@dptr,a
	mov	a,#3
	movx	@dptr,a
	mov	r7,#1
	lcall	X0d48
X198c:	mov	dptr,#X1328
	movx	a,@dptr
	mov	dptr,#X701a
	movx	@dptr,a
	mov	dptr,#X1329
	movx	a,@dptr
	mov	dptr,#X701b
	movx	@dptr,a
	mov	dptr,#X132b
	movx	a,@dptr
	mov	dptr,#X7022
	movx	@dptr,a
	mov	dptr,#X1328
	movx	a,@dptr
	anl	a,#0f0h
	movx	@dptr,a
	inc	dptr
	movx	a,@dptr
	anl	a,#0f0h
	movx	@dptr,a
	mov	dptr,#X132b
	movx	a,@dptr
	anl	a,#0cch
	movx	@dptr,a
	mov	a,58h
	jnb	acc.3,X19cf
	mov	a,3ch
	cpl	a
	mov	dptr,#X132a
	jz	X19c9
	movx	a,@dptr
	anl	a,#0f3h
	sjmp	X19da
;
X19c9:	movx	a,@dptr
	anl	a,#0fbh
	movx	@dptr,a
	sjmp	X19e3
;
X19cf:	mov	a,3ch
	cpl	a
	mov	dptr,#X132a
	jz	X19df
	movx	a,@dptr
	anl	a,#0f2h
X19da:	orl	a,3ch
	movx	@dptr,a
	sjmp	X19e3
;
X19df:	movx	a,@dptr
	anl	a,#0fah
	movx	@dptr,a
X19e3:	mov	dptr,#X0401
	movx	a,@dptr
	anl	a,#0fdh
	movx	@dptr,a
	mov	62h,#1
	mov	55h,#2
	clr	a
	mov	51h,a
	sjmp	X19fe
;
X19f5:	mov	a,50h
	jnz	X19fe
X19f9:	mov	62h,#3
	mov	51h,a
X19fe:	mov	a,62h
	jz	X1a17
	clr	20h.1
	clr	a
	mov	51h,a
	clr	2bh.1
	mov	r5,62h
	mov	r7,40h
	lcall	X1acb
	mov	a,62h
	cjne	a,#3,X1a17
	setb	20h.3
X1a17:	setb	ea
	ret	
;
X1a1a:	clr	ea
	jnb	20h.1,X1a31
	clr	a
	mov	dptr,#X0196
	movx	@dptr,a
	mov	51h,a
	clr	2bh.1
	clr	20h.1
	mov	r5,#2
	mov	r7,40h
	lcall	X1acb
X1a31:	mov	a,52h
	dec	a
	jz	X1a42
	inc	a
	jz	X1a3c
	ljmp	X1ac8
;
X1a3c:	mov	52h,#1
	mov	55h,#3
X1a42:	mov	dptr,#X0401
	movx	a,@dptr
	orl	a,#0eh
	movx	@dptr,a
	mov	a,58h
	anl	a,#18h
	jz	X1a6d
	mov	dptr,#X701a
	movx	a,@dptr
	mov	dptr,#X1328
	movx	@dptr,a
	mov	dptr,#X701b
	movx	a,@dptr
	mov	dptr,#X1329
	movx	@dptr,a
	inc	dptr
	mov	a,#5
	movx	@dptr,a
	mov	dptr,#X7022
	movx	a,@dptr
	mov	dptr,#X132b
	movx	@dptr,a
	sjmp	X1a7e
;
X1a6d:	mov	dptr,#X1328
	movx	a,@dptr
	orl	a,#0fh
	movx	@dptr,a
	inc	dptr
	movx	a,@dptr
	orl	a,#0fh
	movx	@dptr,a
	inc	dptr
	movx	a,@dptr
	orl	a,#5
	movx	@dptr,a
X1a7e:	mov	dptr,#X1204
	mov	a,#3
	movx	@dptr,a
	mov	a,58h
	jnb	acc.3,X1a9f
	mov	dptr,#X0500
	mov	a,#0e2h
	movx	@dptr,a
	inc	dptr
	mov	a,#8
	movx	@dptr,a
	inc	dptr
	mov	a,#1
	movx	@dptr,a
	mov	a,#3
	movx	@dptr,a
	mov	r7,#1
	lcall	X0d48
X1a9f:	mov	dptr,#X02a2
	movx	a,@dptr
	orl	a,#0c0h
	movx	@dptr,a
	mov	dptr,#X1004
	movx	a,@dptr
	orl	a,#0ch
	movx	@dptr,a
	clr	a
	mov	52h,a
	mov	55h,a
	jnb	20h.2,X1abe
	clr	20h.2
	mov	r5,#1
	mov	r7,41h
	lcall	X1acb
X1abe:	jnb	20h.3,X1ac3
	clr	20h.3
X1ac3:	clr	a
	mov	dptr,#X0196
	movx	@dptr,a
X1ac8:	setb	ea
	ret	
;
X1acb:	mov	a,r7
	cpl	a
	jz	X1afc
	clr	a
	mov	r6,a
X1ad1:	mov	a,#14h
	add	a,r6
	mov	dpl,a
	clr	a
	addc	a,#70h
	mov	dph,a
	movx	a,@dptr
	cjne	a,#0ffh,X1af8
	mov	a,#14h
	add	a,r6
	mov	dpl,a
	clr	a
	addc	a,#70h
	mov	dph,a
	mov	a,r7
	movx	@dptr,a
	mov	a,#1ch
	add	a,r6
	mov	dpl,a
	clr	a
	addc	a,#70h
	mov	dph,a
	mov	a,r5
	movx	@dptr,a
	ret	
;
X1af8:	inc	r6
	cjne	r6,#4,X1ad1
X1afc:	ret	
;
	ret	
;
	ret	
;
X1aff:
	mov	dptr,#X702a
	movx	a,@dptr
	jnb	acc.1,X1b53
	clr	ea
	mov	dptr,#X7028
	movx	a,@dptr
	mov	dptr,#X101c
	movx	@dptr,a
	mov	dptr,#X7029
	movx	a,@dptr
	mov	dptr,#X101d
	movx	@dptr,a
	mov	dptr,#X702a
	movx	a,@dptr
	mov	dptr,#X101e
	movx	@dptr,a
X1b20:	mov	dptr,#X101c
	movx	a,@dptr
	mov	62h,a
	mov	dptr,#X101e
	movx	a,@dptr
	jb	acc.1,X1b20
	mov	dptr,#X101c
	movx	a,@dptr
	mov	dptr,#X7028
	movx	@dptr,a
	mov	dptr,#X101d
	movx	a,@dptr
	mov	dptr,#X7029
	movx	@dptr,a
	mov	dptr,#X101e
	movx	a,@dptr
	mov	dptr,#X702a
	movx	@dptr,a
	jnb	29h.2,X1b4f
	mov	dptr,#X7024
	movx	a,@dptr
	orl	a,#1
	movx	@dptr,a
X1b4f:	clr	20h.5
	setb	ea
X1b53:	ret	
;
	ret	
;
	ret	
;
	org	1ffdh
;
	mov	a,r4
	add	a,r1
	setb	i2sta.7
;
;	Register/Memory Equates
;
rb0r3	equ	3
rb2r1	equ	11h
;
;	Miscellaneous equates
;
;  These are addresses referenced in the code but
;  which are in the middle of a multibyte instruction
;  or are addresses outside the initialized space
;
X000a	equ	0ah
X004a	equ	4ah
X00c8	equ	0c8h
X00d2	equ	0d2h
X00da	equ	0dah
X00e0	equ	0e0h
X0184	equ	184h
X018a	equ	18ah
X018c	equ	18ch
X0196	equ	196h
X0229	equ	229h
X0251	equ	251h
X02a2	equ	2a2h
X0414	equ	414h
X045e	equ	45eh
X04a7	equ	4a7h
X0500	equ	500h
X0508	equ	508h
X0a9d	equ	0a9dh
X0ab6	equ	0ab6h
X1004	equ	1004h
X100a	equ	100ah
X101d	equ	101dh
X101e	equ	101eh
X102c	equ	102ch
X102f	equ	102fh
X104a	equ	104ah
X10c8	equ	10c8h
X10d2	equ	10d2h
X10da	equ	10dah
X10e0	equ	10e0h
X1204	equ	1204h
X1251	equ	1251h
X1328	equ	1328h
X1329	equ	1329h
X132b	equ	132bh
X145e	equ	145eh
X14a7	equ	14a7h
X3870	equ	3870h
X6371	equ	6371h
X7010	equ	7010h
X7011	equ	7011h
X7012	equ	7012h
X7013	equ	7013h
X7018	equ	7018h
X7019	equ	7019h
X701a	equ	701ah
X701b	equ	701bh
X7022	equ	7022h
X7024	equ	7024h
X7025	equ	7025h
X7028	equ	7028h
X7029	equ	7029h
X702a	equ	702ah
X7030	equ	7030h
X7032	equ	7032h
X9172	equ	9172h
;
	end
;

