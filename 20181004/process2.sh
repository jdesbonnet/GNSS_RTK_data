#!/bin/bash
rm *.obs *.nav *.pos base?.ubx rover?.ubx
gunzip -c base-20181004-1452.ubx.gz > base2.ubx
gunzip -c rover-20181004-1532.ubx.gz > rover2.ubx
convbin -od -os -oi -ot -f 1  base2.ubx
convbin -od -os -oi -ot -f 1  rover2.ubx
rnx2rtkp rover2.obs  base2.obs  base2.nav -l 53.280449957 -9.057836328  66.8 > rover2.pos

