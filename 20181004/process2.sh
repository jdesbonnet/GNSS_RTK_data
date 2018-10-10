#!/bin/bash
# Test conducted on grounds of National University of Ireland, Galway
# on 4 Oct 2018. In this test the rover moves.
# Tested with RTKlib v2.4.3 b8
# Base .ubx file is a mix of uBlox binary (UBX) and RTCM3 messages
# Rover .ubx file is a mix of uBlox binary (UBX) and NMEA0183
#
rm *.obs *.nav *.pos base?.ubx rover?.ubx
gunzip -c base-20181004-1452.ubx.gz > base2.ubx
gunzip -c rover-20181004-1532.ubx.gz > rover2.ubx
convbin -od -os -oi -ot -f 1  base2.ubx
convbin -od -os -oi -ot -f 1  rover2.ubx
rnx2rtkp rover2.obs  base2.obs  base2.nav -l 53.280449957 -9.057836328  66.8 > rover2.pos

