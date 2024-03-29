set terminal pdfcairo enhanced font "Times New Roman, 8"
set output "100_m_num_vs_ee.pdf"
set xlabel "{/SimSun=8 移动节点数量}"
set xrange [0:20]
set xtics 2
set mxtics 2
set ylabel "{/SimSun=8 能量效率 (s/J)}"
set yrange [0:800]
set ytics 200
set mytics 2
#set format y "%.1f%%"
set grid
set key box
set key Left
#set key width 1
set key left top at 0.5, 770
plot "m_num_vs_ee" u 1:($2*1000.0) w lp lt 1 lw 1 pt 2 ps 1 title "MT", "f_vs_ee" u 1:($2*1000.0) w lp lt 2 lw 1 pt 3 ps 1 title "FT", "m_num-c_vs_ee" u 1:($2*1000.0) w lp lt 3 lw 1 pt 4 ps 1 title "CT"
set output
!pdftops -eps 100_m_num_vs_ee.pdf