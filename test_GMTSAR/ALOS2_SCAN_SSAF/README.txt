#February 6, 2019
#
#This is an example data set that computes a ScanSAR interferogram of the San Andreas Fault in Southern California using ALOS2 data. This example employs new scripts available only in the latest version of the GMTSAR trunk.
#
#Before running this example, make sure that the following files are in the /raw directory:
#
#IMG-HH-ALOS2022872950-141025-WBDR1.1__D-F1 IMG-HH-ALOS2029082950-141206-WBDR1.1__D-F1
#IMG-HH-ALOS2022872950-141025-WBDR1.1__D-F2 IMG-HH-ALOS2029082950-141206-WBDR1.1__D-F2
#IMG-HH-ALOS2022872950-141025-WBDR1.1__D-F3 IMG-HH-ALOS2029082950-141206-WBDR1.1__D-F3
#IMG-HH-ALOS2022872950-141025-WBDR1.1__D-F4 IMG-HH-ALOS2029082950-141206-WBDR1.1__D-F4
#IMG-HH-ALOS2022872950-141025-WBDR1.1__D-F5 IMG-HH-ALOS2029082950-141206-WBDR1.1__D-F5
#LED-HH-ALOS2022872950-141025-WBDR1.1__D    LED-HH-ALOS2029082950-141206-WBDR1.1__D
#
pop_config.csh ALOS2_SCAN > config.txt
p2p_ALOS2_SCAN_Frame.csh IMG-HH-ALOS2022872950-141025-WBDR1.1__D IMG-HH-ALOS2029082950-141206-WBDR1.1__D config.txt 0
#
#The options modifying this command are the roots of the raw data files, the config file, and a processing factor.
#If the processing factor is equal to 1, than the ScanSAR frames will process in parallel.
#If the processing factor is equal to 0, than the ScanSAR frames will process sequentially. This is better for machines with less memory.
