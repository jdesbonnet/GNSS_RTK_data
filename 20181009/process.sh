#!/bin/bash
rm *.obs *.nav *.pos base.ubx rover.ubx
gunzip -c base-20181009-1220.ubx.gz > base.ubx
gunzip -c rover-20181009-1221.ubx.gz > rover.ubx
convbin -od -os -oi -ot -f 1  base.ubx
convbin -od -os -oi -ot -f 1  rover.ubx
rnx2rtkp rover.obs  base.obs  base.nav  > rover.pos

