#!/bin/bash
#
# Static test in my garden at Uisce, Doughiska, Galway, Ireland.
# on 15 Oct 2018. Limited sky view. 
# Depite the uBlox M8P reporting a full RTK fix for much of this 
# run, it seems RTKlib can at best get a float fix.
#
# Tested with RTKlib v2.4.3 b8
# Base .ubx file is a mix of uBlox binary (UBX) and RTCM3 messages
# Rover .ubx file is a mix of uBlox binary (UBX) and NMEA0183
#
rm *.obs *.nav *.pos base.ubx rover.ubx
gunzip -c base-20181015-1245.ubx.gz > base.ubx
gunzip -c rover-20181015-1259.ubx.gz > rover.ubx
convbin -od -os -oi -ot -f 1  base.ubx
convbin -od -os -oi -ot -f 1  rover.ubx
rnx2rtkp rover.obs  base.obs  base.nav  > rover.pos

