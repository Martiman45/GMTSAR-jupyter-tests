#!/bin/csh -f
#
# script to execute all the GMT5SAR test cases
#
cd ALOS2_Brazil
./README.txt >& log.txt
cd ..
#
cd ALOS2_SCAN_SSAF
./README.txt >& log.txt
cd ..
#
cd ALOS_Baja_EQ
./README.txt >& log.txt
cd ..
#
cd ALOS_ERSDAC_L1.0
./README.txt >& log.txt
cd ..
#
cd ALOS_Indio_SBAS
./runSBAS.csh >& log.txt
cd ..
#
cd ALOS_SLC_L1.1
./README.txt >& log.txt
cd ..
#
cd CSK_RAW_Hawaii
./README.txt >& log.txt
cd ..
#
cd CSK_SLC_Italy
./README.txt >& log.txt
cd ..
#
cd ENVI_2907_stack
./README.txt >& log.txt
cd ..
#
cd ENVI_Baja_EQ
./README.txt >& log.txt
cd ..
#
cd ENVI_Baja_EQ_SLC
./README.txt >& log.txt
cd ..
#
cd ERS_Hector_EQ
./README.txt >& log.txt
cd ..
#
cd RS2_SLC_Hawaii
./README.txt >& log.txt
cd ..
#
cd S1A_SLC_TOPS_LA
./README.txt >& log.txt
cd  ..
#
cd S1_Ridgecrest_EQ
./README.txt
cd ..
#
cd S1A_Stack_CPGF_T173
./README_prep.txt >& log_prep.txt
./README_proc.txt >& log_proc.txt
./README_sbas.txt >& log_sbas.txt
cd ..
#
cd TSX_SLC_Hawaii
./README.txt >& log.txt
cd ..
#
