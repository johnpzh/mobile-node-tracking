#set terminal pdfcairo enhanced font "Times New Roman, 20"
#set output "20_hole_vs_vt.pdf"
#set terminal postscript eps color solid font "Times New Roman, 20"
set terminal postscript eps color solid
#set terminal emf color solid enhanced font "Times New Roman, 20"
set output "100_hole_vs_vt.eps"
#set terminal qt font "Times New Roman, 20"
#set xlabel "{/SimSun=20 空洞数量}"
set xlabel "Number of Holes"
set xrange [1:5]
set xtics 1
set mxtics 1
#set ylabel "{/SimSun=20 有效监测时间率 (%)}"
set ylabel "Average Effective Monitoring Ratio (%)"
set yrange [20:60]
set ytics 10
set mytics 1
set format y "%.1f"
set grid
set key box
set key Left
#set key width 10
#set key spacing 10
#set key right top at 4.93, 78.2
plot "hole-m-force_vs_vt" w lp lt 1 lw 2 pt 5 ps 2 title "Force", "hole-f_vs_vt" w lp lt 2 lw 2 pt 2 ps 2 title "FT"
set output
#!pdftops -eps 20_hole_vs_vt.pdf