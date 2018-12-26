
set title 'GPS Selective Available (SA) switch off, 2 May 2000' textcolor rgb 'white'
set xlabel 'Latitude' textcolor rgb 'white'
set ylabel 'Longitude' textcolor rgb 'white'

#set xrange [-1.4:1.5]

set style fill transparent solid 0.3 noborder
set style fill noborder

set style line 1 linecolor rgb "green"
set style line 2 linecolor rgb "blue"


set terminal pngcairo size 1024,600 background rgb 'black'
set output "sa_off.png"
set border lc rgb 'white'
set key tc rgb 'white'

set grid lc rgb 'white'

set label "Joe Desbonnet" at graph -0.05,-0.07 font ",8" tc rgb "white"
set label "http://jdesbonnet.blogspot.com" at graph -0.05,-0.10 font ",8" tc rgb "white"


# Small random offset added to points

#plot "< gunzip -c gps_sa_off_pre_transition.dat.gz" using 5:4:(0.005) with circles linecolor rgb "green" fs transparent solid 0.8 noborder \
#title 'with SA on' \
#,"< gunzip -c gps_sa_off_pre_transition.dat.gz" using 5:4:(0.005) with circles linecolor rgb "yellow" fs transparent solid 0.8 noborder \
#title 'with SA off' 

plot "< gunzip -c gps_sa_off_pre_transition.dat.gz" using 5:4 linecolor rgb "blue"  \
title 'with SA on' \
,"< gunzip -c gps_sa_off_post_transition.dat.gz" using 5:4 linecolor rgb "red"  \
title 'with SA off' 

#pause -1 
