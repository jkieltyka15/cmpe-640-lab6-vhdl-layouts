NCVHDL = /afs/umbc.edu/users/j/k/jkielty1/home/cmpe-640/cadence/run_ncvhdl.bash
NCELAB = /afs/umbc.edu/users/j/k/jkielty1/home/cmpe-640/cadence/run_ncelab.bash
NCSIM = /afs/umbc.edu/users/j/k/jkielty1/home/cmpe-640/cadence/run_ncsim.bash

CDSLIB = /afs/umbc.edu/users/j/k/jkielty1/home/cmpe-640/cadence/cds.lib
HDLVAR = /afs/umbc.edu/users/j/k/jkielty1/home/cmpe-640/cadence/hdl.var

COMPILE = $(NCVHDL) -messages -linedebug -cdslib $(CDSLIB) -hdlvar $(HDLVAR) -smartorder
ELABORATE = $(NCELAB) -messages -access rwc -cdslib $(CDSLIB) -hdlvar $(HDLVAR)
SIMULATE = $(NCSIM) -input ncsim.run -messages -cdslib $(CDSLIB) -hdlvar $(HDLVAR)

all:

# build commands
inv:
	$(COMPILE) inv.vhd

and3:
	$(COMPILE) and3.vhd

encoder:
	$(COMPILE) encoder.vhd inv.vhd and3.vhd

dlatch:
	$(COMPILE) Dlatch.vhd

encoder_test:
	$(COMPILE) encoder_test.vhd encoder.vhd inv.vhd and3.vhd

dlatch_test:
	$(COMPILE) Dlatch_test.vhd Dlatch.vhd

# elaborate commands
encoder_test_elaborate:
	$(ELABORATE) encoder_test

dlatch_test_elaborate:
	$(ELABORATE) Dlatch_test

# simulate commands
encoder_test_simulate:
	$(SIMULATE) encoder_test

dlatch_test_simulate:
	$(SIMULATE) Dlatch_test
