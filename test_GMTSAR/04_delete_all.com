#!/bin/csh -f
#
# script to remove all the test case data
#
foreach a (`cat filelist`)
echo $a
rm -r $a
end
