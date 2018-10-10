#!/bin/bash
# Test conducted on grounds of National University of Ireland, Galway
# on 4 Oct 2018. This is a static rover test (no movement).
# Tested with RTKlib v2.4.3 b8
# Base .ubx file is a mix of uBlox binary (UBX) and RTCM3 messages
# Rover .ubx file is a mix of uBlox binary (UBX) and NMEA0183
#
rm *.obs *.nav *.pos base?.ubx rover?.ubx
gunzip -c base-20181004-1236.ubx.gz > base1.ubx
gunzip -c rover-20181004-1237.ubx.gz > rover1.ubx
convbin -od -os -oi -ot -f 1  base1.ubx
convbin -od -os -oi -ot -f 1  rover1.ubx
rnx2rtkp rover1.obs  base1.obs  base1.nav -l 53.280449957 -9.057836328  66.8 > rover1.pos

