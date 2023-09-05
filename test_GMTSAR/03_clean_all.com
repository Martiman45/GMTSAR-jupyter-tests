#!/bin/csh -f
#
#   script to cleanup all the results from all the GMT5SAR test cases
#
foreach a (`cat filelist`)
echo $a
clean_one.com $a
end
cd ALOS2_SCAN_SSAF
rm -r F*
cd ../S1A_Stack_CPGF_T173
rm -r intf_all intf SBAS raw intf.in
cd ../S1A_SLC_TOPS_LA
rm -r merge
