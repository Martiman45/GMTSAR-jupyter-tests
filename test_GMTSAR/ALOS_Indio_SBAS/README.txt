###############
# sbas   v1.0 #
###############

July 25 2014
Xiaopeng Tong

This directory contains the C program sbas.c and a makefile. The method is a modified version of the Small-BAseline Subset method (SBAS). It is developed to improve InSAR time-series analysis. This C program is currently implemented in GMTSAR but need to be compiled separately. Now it can be compiled under OSX. Modifications to compile under linux are underway. If you find a bug or have any questions/suggestions, please contact xitong@uw.edu.

INSTRUCTIONS FOR INSTALLING AND RUNNING SBAS

******************************************************************************************************
To install sbas go into directory $GMTSARHOME/gmtsar/src/sbas and type "make" then "make install". Then open a new terminal, type "sbas"to see if the installation goes well. 

******************************************************************************************************
To run the program, you need to provide into.tab and scene.tab and all the unwrapped phase and correlation grids. Both radar and geographic coordinate can work. You need also provide number of interferograms, number of SAR scenes, and the dimensions of the interferograms. Type "sbas" and the syntax will be printed. 

USAGE: sbas intf.tab scene.tab N S xdim ydim [-smooth sf] [-wavelength wl] [-incidence inc] [-range -rng] [-season] [-rms] [-dem]

 input: 
intf.tab		--  list of unwrapped (filtered) interferograms:
   format:   unwrap.grd  corr.grd  ref_id  rep_id  B_perp 
scene.tab		--  list of the SAR scenes in chronological order
   format:   scene_id   number_of_days 
N             		--  number of the interferograms
S             		--  number of the SAR scenes 
xdim and ydim 		--  dimension of the interferograms
-smooth sf		--  smoothing factors, default=0 
-wavelength wl		--  wavelength of the radar wave (m) default=0.236 
-incidence theta 	--  incidence angle of the radar wave (degree) default=37 
-range rng 		--  range distance from the radar to the center of the interferogram (m) default=866000 
-season 		--  output seasonal terms grids: amp.grd (mm) shift.grd (deg) 
-rms 			--  output RMS of the data misfit grids (mm): rms.grd
-dem 			--  output DEM error (m): dem.grd 

 output: 
disp_##.grd   		--  cumulative displacement time series (mm) grids
vel.grd 		--  mean velocity (mm/yr) grids 

 example:
   sbas intf.tab scene.tab 88 28 700 1000 

******************************************************************************************************
To run sbas on the test data set, go to GMTSAR website to download the test data ALOS_Indio.tar. This data is from ALOS-1 ascending track, T213 F660. The region covers Indio, Coachella in Southern California. Unpack it and go to that directory. Type runSBAS.csh to run. The results will be plotted. If you install ffmpeg, you will be able to make a movie of the displacement time series by modifying slightly runSBAS.csh. The girds are all in radar coordinates. There is a trans.dat file that you can use to transform the radar coordinate to geography coordinate.

runSBAS.csh

******************************************************************************************************

