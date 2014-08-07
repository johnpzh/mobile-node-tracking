#! /bin/bash
path="$(date +%Y%m%d-%H%M%S)-m_speed"
result_file="${path}/${path}-result"
filen="${path}-result"
#file_speed="${path}/${path}-result_target_speed"
mkdir $path
#cp -u process-m_speed.awk ${path}
#ns mobile.tcl 100 100 100 10 3 ${result_file} ${file_speed}
if [ x$1 != x ]
then
    count=$1
else
    count=20
fi
for m_speed in $(seq 0.0 0.2 2.0)
do
    for i in $(seq 1 $count)
    do
        #echo ""
        #now_time="$(date +%H%M%S)"
        ns mobile.tcl 100 100 100 10 3 ${result_file} ${m_speed}
    done
done
#cd $path
#awk -f process-m_speed.awk ${result_file} > ${path}/${path}-avg
cp -u process-m_speed.awk ${path}
cd ${path}
awk -f process-m_speed.awk ${filen}
#awk -f process-m_speed.awk ${result_file}
