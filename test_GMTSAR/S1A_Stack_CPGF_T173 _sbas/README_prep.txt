#!/bin/csh -f
#
# Script to batch pre-process a Sentinel-1a TOPS mode data sets.
#  
#   Xiaohua(Eric) Xu
#   June 2016
#
#
# First, prepare the files
rm -rf raw
mkdir raw
cd raw
# in order to correct for Elevation Antenna Pattern Change, cat the manifest and aux files to the xmls
# delete the first line of the manifest file as it's not a typical xml file.
awk 'NR>1 {print $0}' < ../raw_orig/20150121_manifest.safe > tmp_file
cat ../raw_orig/s1a-iw1-slc-vv-20150121t134413-20150121t134424-004270-005317-001.xml tmp_file ../raw_orig/s1a-aux-cal.xml > ./s1a-iw1-slc-vv-20150121t134413-20150121t134424-004270-005317-001.xml
awk 'NR>1 {print $0}' < ../raw_orig/20150310_manifest.safe > tmp_file
cat ../raw_orig/s1a-iw1-slc-vv-20150310t134412-20150310t134424-004970-006386-001.xml tmp_file ../raw_orig/s1a-aux-cal.xml > ./s1a-iw1-slc-vv-20150310t134412-20150310t134424-004970-006386-001.xml
awk 'NR>1 {print $0}' < ../raw_orig/20150403_manifest.safe > tmp_file
cat ../raw_orig/s1a-iw1-slc-vv-20150403t134413-20150403t134424-005320-006bc4-001.xml tmp_file ../raw_orig/s1a-aux-cal.xml > ./s1a-iw1-slc-vv-20150403t134413-20150403t134424-005320-006bc4-001.xml
awk 'NR>1 {print $0}' < ../raw_orig/20150427_manifest.safe > tmp_file
cat ../raw_orig/s1a-iw1-slc-vv-20150427t134414-20150427t134426-005670-00745c-001.xml tmp_file ../raw_orig/s1a-aux-cal.xml > ./s1a-iw1-slc-vv-20150427t134414-20150427t134426-005670-00745c-001.xml
awk 'NR>1 {print $0}' < ../raw_orig/20150521_manifest.safe > tmp_file
cat ../raw_orig/s1a-iw1-slc-vv-20150521t134415-20150521t134427-006020-007c3f-001.xml tmp_file ../raw_orig/s1a-aux-cal.xml > ./s1a-iw1-slc-vv-20150521t134415-20150521t134427-006020-007c3f-001.xml
rm tmp_file
ln -s ../raw_orig/*EOF .
ln -s ../raw_orig/*tiff .
ln -s ../topo/dem.grd .
#
# start batch preprocessing
#
echo "s1a-iw1-slc-vv-20150403t134413-20150403t134424-005320-006bc4-001:S1A_OPER_AUX_POEORB_OPOD_20150424T123026_V20150402T225944_20150404T005944.EOF" > data.in
echo "s1a-iw1-slc-vv-20150121t134413-20150121t134424-004270-005317-001:S1A_OPER_AUX_POEORB_OPOD_20150211T122339_V20150120T225944_20150122T005944.EOF" >> data.in
echo "s1a-iw1-slc-vv-20150310t134412-20150310t134424-004970-006386-001:S1A_OPER_AUX_POEORB_OPOD_20150331T123006_V20150309T225944_20150311T005944.EOF" >> data.in
echo "s1a-iw1-slc-vv-20150427t134414-20150427t134426-005670-00745c-001:S1A_OPER_AUX_POEORB_OPOD_20150518T122528_V20150426T225944_20150428T005944.EOF" >> data.in
echo "s1a-iw1-slc-vv-20150521t134415-20150521t134427-006020-007c3f-001:S1A_OPER_AUX_POEORB_OPOD_20150611T122710_V20150520T225944_20150522T005944.EOF" >> data.in
# get the baseline_time plot first, select the supermaster and mv it to the first line in data.in, save the baseline_table.dat for sbas use.
#preproc_batch_tops.csh data.in dem.grd 1
preproc_batch_tops.csh data.in dem.grd 2
#preproc_batch_tops_esd.csh data.in dem.grd 2
#
# in case there are clear burst boundaries, use preproc_batch_tops_esd.csh instead
#
#mv baseline_table.dat ../
#
cd ..
