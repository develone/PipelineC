#!/bin/bash
make clean all BOARD=PICO2 PIPELINEC_TOP_FILE=ethernet_top.c PLL_CLK_MHZ=16.0 NEXTPNR_ARGS="--pre-pack eth_clocks.py"
if test -e "gateware.bin"; then
	echo "gateware.bin exits"
	rm -f /media/devel/5221-000/*.bin
	cp gateware.bin /media/devel/5221-0000/
	date
	ls -la /media/devel/5221-0000
	mpremote run pico2_program_ice.py
	mpremote run  test_uart-a-z.py
	cd ../../net
	./compile-work_test.sh
	sudo ./work_test
	cd ../pico-ice/ice_makefile_pipelinec/ 
fi
