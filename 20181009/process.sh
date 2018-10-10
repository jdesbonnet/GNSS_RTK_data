#!/bin/bash
rm *.obs *.nav *.pos
convbin -od -os -oi -ot -f 1  base-20181009-1220.ubx
convbin -od -os -oi -ot -f 1  rover-20181009-1221.ubx
rnx2rtkp rover-20181009-1221.obs  base-20181009-1220.obs  base-20181009-1220.nav  > t.pos

