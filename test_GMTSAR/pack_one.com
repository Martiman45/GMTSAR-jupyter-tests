#
#  script to pack unpack one SAR data set
#
cd $1
tar czvf ../$1.tar.gz .
cd ..
