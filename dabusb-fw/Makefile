all: 
	asx8051 -lo dabusb_fw.d52 2> dabusb_fw.errors
	echo "dabusb_fw.rel\n-iY" | aslink -c
	perl ezusb_convert.pl dabusb < dabusb_fw.ihx > dabusb_fw.h
	rm -f *.rel *.lst dabusb_fw.errors

clean:
	rm -f *.ihx dabusb_fw.h *.lst *.rel dabusb_fw.errors

