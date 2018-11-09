#!/bin/bash
#
# Tested with RTKlib v2.4.3 b8
# Base .ubx file is a mix of uBlox binary (UBX) and RTCM3 messages
# Rover .ubx file is a mix of uBlox binary (UBX) and NMEA0183
#
rm *.obs *.nav *.pos base.ubx rover.ubx
gunzip -c base-20181108-0948.ubx.gz > base.ubx
gunzip -c rover-20181108-0930.part?.ubx.gz > rover.ubx
convbin -od -os -oi -ot -f 1  base.ubx
convbin -od -os -oi -ot -f 1  rover.ubx
rnx2rtkp rover.obs  base.obs  base.nav  > rover.pos

