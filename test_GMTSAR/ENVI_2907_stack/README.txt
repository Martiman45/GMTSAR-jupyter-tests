#
#   This is an example of aligning 3 Envisat SAR images for forming an interferograms to test for phase closure
#
# David Sandwell - January 19, 2016
#
# 1) do the pre processing
#
cd raw
pre_proc_batch.csh ENVI data.in batch.config
#
#  you can look at the baseline versus time plot
#
open stacktable_all.ps
cd ..
#
# 2) now align the images
#
ln -s raw/data.in .
align_batch.csh RAW 0 data.in
#
# 3) now make the interferograms and unwrap the phase, don't detrend
#
intf_batch.csh ENVI intf.in intf.config
#
#
# 4) sum the LOS data to look at the residuals
#
cd intf
gmt grdmath 2003251_2005325/los.grd 2004201_2003251/los.grd ADD 2005325_2004201/los.grd ADD = los_sum_3ADD.grd
gmt grdmath 2003251_2005325/los.grd 2004201_2003251/los.grd ADD 2004201_2005325/los.grd SUB = los_sum_2ADD_1SUB.grd
#
