#! /bin/bash
path="$(date +%Y%m%d-%H%M%S)-hole-c"
result_file="${path}/${path}-result"
filen="${path}-result"
#file_speed="${path}/${path}-result_target_speed"
mkdir $path
#cp -u process-num.awk ${path}
#ns mobile.tcl 100 100 100 10 3 ${result_file} ${file_speed}
if [ x$1 != x ]
then
    count=$1
else
    count=20
fi
for hole_num in $(seq 1 5)
do
    for i in $(seq 1 $count)
    do
        #echo ""
        #now_time="$(date +%H%M%S)"
        ns mobile.tcl 300 0 ${hole_num} 3 ${result_file} 5
    done
done
#cd $path
#awk -f process-num.awk ${result_file} > ${path}/${path}-avg
cp -u process-hole-c.awk ${path}
cd ${path}
awk -f process-hole-c.awk ${filen}
#awk -f process-num.awk ${result_file}
