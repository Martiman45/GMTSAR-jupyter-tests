#
#  script to get and unpack one SAR data set
#
rm -rf $1
wget -q --no-check-certificate https://topex.ucsd.edu/pub/gmtsar/$1.tar.gz
mkdir $1
cd $1
tar xzvf ../$1.tar.gz
cd ..
rm $1.tar.gz
