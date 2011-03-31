##  dabusb-fw - Makefile                                                     */
##                                                                           */
##  Copyright (C) 2010 Felipe Corrêa da Silva Sanches                        */
##                                                                           */
##  This program is free software, licensed under the terms of the GNU       */
##  General Public License as published by the Free Software Foundation,     */
##  either version 2 of the License, or (at your option) any later version.  */
##  You should have received a copy of the GNU General Public License        */
##  along with this program.  If not, see <http://www.gnu.org/licenses/>.    */

all: 
	asx8051 -lo dabusb_fw.d52 2> dabusb_fw.errors
	echo "dabusb_fw.rel\n-iY" | aslink -c
	perl ezusb_convert.pl dabusb < dabusb_fw.ihx > dabusb_fw.h
	rm -f *.rel *.lst dabusb_fw.errors

clean:
	rm -f *.ihx dabusb_fw.h *.lst *.rel dabusb_fw.errors

