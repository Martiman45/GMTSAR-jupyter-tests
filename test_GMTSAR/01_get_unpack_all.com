#!/bin/csh -f
#
# script to gather and unpack all the GMT5SAR test cases
#
foreach a (`cat filelist`)
echo $a
./get_unpack_one.com $a
end
