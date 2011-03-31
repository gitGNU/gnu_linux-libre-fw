/*****************************************************************************/
/*  dabusb-fw - dabusb_fw.c                                                  */
/*                                                                           */
/* Copyright (C) 2010 Felipe C. da S. Sanches <juca@members.fsf.org>         */
/* Copyright (C) 1999 BayCom GmbH                                            */
/*                                                                           */
/*  This program is free software, licensed under the terms of the GNU       */
/*  General Public License as published by the Free Software Foundation,     */
/*  either version 2 of the License, or (at your option) any later version.  */
/*  You should have received a copy of the GNU General Public License        */
/*  along with this program.  If not, see <http://www.gnu.org/licenses/>.    */
/*****************************************************************************/

/*
 * Copyright (C) 1999 BayCom GmbH                                          
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that redistributions of source
 * code retain the above copyright notice and this comment without
 * modification.
 *
 */

/* dabusb_fw.c - C code derived from D52 disassembly interpretation */

void dabusb_fpga_load_bitstream(){
	for (idx=4; idx<64; idx++){
		char byte = *(OUT2BUF+idx);
		for (bit=1;bit<256;bit*=2){
			if (byte & bit){
				*OUTA = 0x42;
				*OUTA = 0xc3; 
			} else {
				*OUTA = 0x00;
				*OUTA = 0x81;
			}
		}
	}
}


#define SLEEP\
inline_asm {\
	push r2\
	mov	r2,#0\
SLEEP_LOOP:\
	cjne	r2,#0x28,NAP\
NAP:	jnc	END_SLEEP\
	inc	r2\
	sjmp	SLEEP_LOOP\
END_SLEEP:\
	pop r2\
}

void print_char(){
	*(0x8803)=*(0x6d);
	*(0x39)++;

	SLEEP

	switch(*(0x39)){
		case 0x10:
		  *(0x8802)=0xc0;
			break;
		case 0x20:
		  *(0x8802)=0x80;
		  *(0x39) = 0
  }

	SLEEP
	return;
}	
