#!/bin/bash
#
# Test run around Tur Uisce, Doughiska, Galway, Ireland.
# on 9 Oct 2018.
# Tested with RTKlib v2.4.3 b8
# Base .ubx file is a mix of uBlox binary (UBX) and RTCM3 messages
# Rover .ubx file is a mix of uBlox binary (UBX) and NMEA0183
#
rm *.obs *.nav *.pos base.ubx rover.ubx
gunzip -c base-20181009-1220.ubx.gz > base.ubx
gunzip -c rover-20181009-1221.ubx.gz > rover.ubx
convbin -od -os -oi -ot -f 1  base.ubx
convbin -od -os -oi -ot -f 1  rover.ubx
rnx2rtkp rover.obs  base.obs  base.nav  > rover.pos

