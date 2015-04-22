#set terminal pdfcairo enhanced font "Times New Roman, 20"
#set output "20_m_num_vs_vt.pdf"
#set terminal postscript eps color solid font "Times New Roman, 20"
set terminal postscript eps color solid
#set terminal emf color solid enhanced font "Times New Roman, 20"
set output "100_t_speed_vs_vt.eps"
#set terminal qt font "Times New Roman, 20"
#set xlabel "{/SimSun=20 �ն�����}"
set xlabel "Maximum Velocity of the Target"
set xrange [1:7]
set xtics 1
set mxtics 1
#set ylabel "{/SimSun=20 ��Ч���ʱ���� (%)}"
set ylabel "Average Effective Monitoring Ratio (%)"
set yrange [40:65]
set ytics 5
set mytics 1
set format y "%.1f"
set grid
set key box
set key Left
#set key width 10
#set key spacing 10
#set key right top at 6.95, 79.5
plot "t_speed-m-force_vs_vt" w lp lt 1 lw 2 pt 5 ps 2 title "Force", "t_speed-f_vs_vt" w lp lt 2 lw 2 pt 2 ps 2 title "FT", "t_speed-c_vs_vt" w lp lt 3 lw 2 pt 4 ps 2 title "CT"
set output
#!pdftops -eps 20_m_num_vs_vt.pdf