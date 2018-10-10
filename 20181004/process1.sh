#!/bin/bash
rm *.obs *.nav *.pos base?.ubx rover?.ubx
gunzip -c base-20181004-1236.ubx.gz > base1.ubx
gunzip -c rover-20181004-1237.ubx.gz > rover1.ubx
convbin -od -os -oi -ot -f 1  base1.ubx
convbin -od -os -oi -ot -f 1  rover1.ubx
rnx2rtkp rover1.obs  base1.obs  base1.nav  > rover1.pos

