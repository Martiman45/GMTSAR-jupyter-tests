#!/bin/csh -f
#
# Script to create time series 
#  
#   Xiaohua(Eric) Xu
#   June 2016
#
#
# First, prepare the input files needed for sbas
#
rm -f SBAS
mkdir SBAS
cd SBAS
#
# based on baseline_table.dat create the intf.tab and scene.tab for sbas
#
# phase  corherence  ref_id  rep_id  baseline
echo "../intf_all/2015020_2015068/unwrap.grd ../intf_all/2015020_2015068/corr.grd 2015020 2015068 -90.333" > intf.tab
echo "../intf_all/2015020_2015092/unwrap.grd ../intf_all/2015020_2015092/corr.grd 2015020 2015092 -52.6118" >> intf.tab
echo "../intf_all/2015020_2015116/unwrap.grd ../intf_all/2015020_2015116/corr.grd 2015020 2015116 -83.0324" >> intf.tab
echo "../intf_all/2015068_2015092/unwrap.grd ../intf_all/2015068_2015092/corr.grd 2015068 2015092 37.7213" >> intf.tab
echo "../intf_all/2015068_2015116/unwrap.grd ../intf_all/2015068_2015116/corr.grd 2015068 2015116 7.30062" >> intf.tab
echo "../intf_all/2015068_2015140/unwrap.grd ../intf_all/2015068_2015140/corr.grd 2015068 2015140 -13.2457" >> intf.tab
echo "../intf_all/2015092_2015116/unwrap.grd ../intf_all/2015092_2015116/corr.grd 2015092 2015116 -30.4207" >> intf.tab
echo "../intf_all/2015092_2015140/unwrap.grd ../intf_all/2015092_2015140/corr.grd 2015092 2015140 -50.967" >> intf.tab
echo "../intf_all/2015116_2015140/unwrap.grd ../intf_all/2015116_2015140/corr.grd 2015116 2015140 -20.5463" >> intf.tab
#
# scene_id  day
echo "2015092 448" > scene.tab
echo "2015020 376" >> scene.tab 
echo "2015068 424" >> scene.tab
echo "2015116 472" >> scene.tab
echo "2015140 496" >> scene.tab
set xdim = `gmt grdinfo -C ../intf_all/2015068_2015092/unwrap.grd | awk '{print $10}'`
set ydim = `gmt grdinfo -C ../intf_all/2015068_2015092/unwrap.grd | awk '{print $11}'`
#
# run sbas
#
sbas intf.tab scene.tab 9 5 $xdim $ydim -smooth 1.0 -wavelength 0.0554658 -incidence 30 -range 800184.946186 -rms -dem
#
# project the velocity to Geocooridnates
#
ln -s ../topo/trans.dat .
proj_ra2ll.csh trans.dat vel.grd vel_ll.grd
gmt grd2cpt vel_ll.grd -T= -Z -Cjet > vel_ll.cpt
grd2kml.csh vel_ll vel_ll.cpt

cd ..
