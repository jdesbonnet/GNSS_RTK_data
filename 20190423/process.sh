#!/bin/bash
../../GNSS_RTK/src/ubx/ubx_rxm_rawx < baseA-20190423-2003.ubx  | grep "gnssId=6 sigId=0 svId=7" > sv7_A.dat
../../GNSS_RTK/src/ubx/ubx_rxm_rawx < baseB-20190423-2003.ubx  | grep "gnssId=6 sigId=0 svId=7" > sv7_B.dat
../../GNSS_RTK/src/ubx/ubx_rxm_rawx < baseA-20190423-2003.ubx  | grep "gnssId=0 sigId=0 svId=1 " > sv1_A.dat
../../GNSS_RTK/src/ubx/ubx_rxm_rawx < baseB-20190423-2003.ubx  | grep "gnssId=0 sigId=0 svId=1 " > sv1_B.dat

