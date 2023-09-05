#
#  clean all the unneded files from the directories
#
cd $1
cleanup.csh all
rm -r F*
cd ..
