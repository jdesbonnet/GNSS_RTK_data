#!/bin/bash
# Attempt to use GNSS reference station at NUIG. Doesn't work :-/
rm *.obs *.nav *.pos base?.ubx rover?.ubx
gunzip -c rover-20181004-1532.ubx.gz > rover2.ubx
convbin -od -os -oi -ot -f 1  rover2.ubx
unzip osi_gnss_download_20181005055005.zip glw1277p.18o glw1277p.18n glw1277p.18g
rnx2rtkp rover2.obs  glw1277p.18o glw1277p.18n glw1277p.18g -l 53.280449957 -9.057836328  66.8 > rover2b.pos

