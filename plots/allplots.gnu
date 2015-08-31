
#set terminal svg size 480,360 fname 'Verdana, Helvetica, Arial, sans-serif' \
#fsize '10'

set terminal png size 720, 540

# color definitions
set border linewidth 1.5
set style line 1 lc rgb '#0000ff' lt 1 lw 2 pt 7 ps 1.5 # --- blue
set style line 2 lc rgb '#ff0000' lt 1 lw 2 pt 3 ps 1.5 # --- red
set style line 3 lc rgb '#00ff00' lt 1 lw 2 pt 5 ps 1.5 # --- green

unset key

set title "Impacto del parámetro divisor de movimientos"
set ytics 2
set tics scale 1
set offsets 0.5, 0.5, 0.5, 0.5

set key autotitle columnhead left


set output 'dpedivs.png'
plot 'dpediv.dat' using 2:xticlabel(1) index 0 with linespoints ls 1, \
     ''           using 2:xticlabel(1) index 1 with linespoints ls 2, \
     ''           using 2:xticlabel(1) index 2 with linespoints ls 3

set ytics 5
set output 'randoors.png'
plot 'randoors.dat' using 2:xticlabel(1) index 0 with linespoints ls 1, \
     ''             using 2:xticlabel(1) index 1 with linespoints ls 2, \
     ''             using 2:xticlabel(1) index 2 with linespoints ls 3

set output 'refresher.png'
plot 'refresher.dat' using 2:xticlabel(1) index 0 with linespoints ls 1, \
     ''              using 2:xticlabel(1) index 1 with linespoints ls 2, \
     ''              using 2:xticlabel(1) index 2 with linespoints ls 3


set xtics 5
set grid

#set contour base
#set nosurface

set xlabel "Instancias / modelo"
set ylabel "Num. modelos"
set zlabel "Tiempo" rotate by 90

set ztics 150


set style line 1 lc rgb '#0000ff' lt 1 lw 1 pt 7 ps 1.5 # --- blue
set style line 2 lc rgb '#ff0000' lt 1 lw 1 pt 3 ps 1.5 # --- red
set style line 3 lc rgb '#008800' lt 1 lw 1 pt 5 ps 1.5 # --- green





set output 'comp-all.png'
splot 'comp.dat' index 2 matrix nonuniform with lines ls 3 title "Opt", \
'' index 1 matrix nonuniform with lines ls 2 title "Always", \
'' index 0 matrix nonuniform with lines ls 1 title "NoCache"


set output 'comp-nc-alw.png'
splot 'comp.dat' index 1 matrix nonuniform with lines ls 2 title "Always", \
'' index 0 matrix nonuniform with lines ls 1 title "NoCache"

set output 'comp-nc-opt.png'
splot 'comp.dat' index 2 matrix nonuniform with lines ls 3 title "Opt", \
'' index 0 matrix nonuniform with lines ls 1 title "NoCache"

set output 'comp-alw-opt.png'
splot 'comp.dat' index 2 matrix nonuniform with lines ls 3 title "Opt", \
'' index 1 matrix nonuniform with lines ls 2 title "Always"



set dgrid3d 10,10 splines

set output 'comp-all-spl.png'
splot 'comp.dat' index 2 matrix nonuniform with lines ls 3 title "Opt", \
'' index 1 matrix nonuniform with lines ls 2 title "Always", \
'' index 0 matrix nonuniform with lines ls 1 title "NoCache"


set output 'comp-nc-alw-spl.png'
splot 'comp.dat' index 1 matrix nonuniform with lines ls 2 title "Always", \
'' index 0 matrix nonuniform with lines ls 1 title "NoCache"

set output 'comp-nc-opt-spl.png'
splot 'comp.dat' index 2 matrix nonuniform with lines ls 3 title "Opt", \
'' index 0 matrix nonuniform with lines ls 1 title "NoCache"

set output 'comp-alw-opt-spl.png'
splot 'comp.dat' index 2 matrix nonuniform with lines ls 3 title "Opt", \
'' index 1 matrix nonuniform with lines ls 2 title "Always"
