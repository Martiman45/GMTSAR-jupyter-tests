#!/bin/csh -f
#
# script to pack all the GMT5SAR test cases
#
foreach a (`cat filelist`)
echo $a
pack_one.com $a
end
