#January 14, 2015
#David T. Sandwell

#This is an example set of ALOS-2 PALSAR data to make an interferogram of an area in Brazil starting with L1.1 (SLC) images.

#The /raw directory should contain 4 files.
#IMG-HH-ALOS2011986990-140813-HBQR1.1__A	LED-ALOS2011986990-140813-HBQR1.1__A
#IMG-HH-ALOS2014056990-140827-HBQR1.1__A	LED-ALOS2014056990-140827-HBQR1.1__A

#Note the /topo directory already contains a file dem.grd that is needed for removal of the topographic phase.  There is a web site http://topex.ucsd.edu/gmtsar that will generate a dem.grd file for a selected area based on the best available data (SRTM or ASTER).

############## Command for GMTSAR ##################
pop_config.csh ALOS2 > config.txt
p2p_processing.csh ALOS2 IMG-HH-ALOS2011986990-140813-HBQR1.1__A IMG-HH-ALOS2014056990-140827-HBQR1.1__A config.txt
#
# Note you can edit the config.txt file to change parameters such as whether to unwrap the phase 
# threshold_snaphu = 0.05
#
