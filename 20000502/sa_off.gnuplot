

set terminal pngcairo size 1400,600 background rgb 'black'
set output "sa_off.png"

#set title 'GPS Selective Available (SA) switch off, 2 May 2000' textcolor rgb 'white'

#set multiplot layout 1,2 title 'GPS Selective Available (SA) switch off, 2 May 2000'
set multiplot title 'test'

set style fill transparent solid 0.3 noborder
set style fill noborder

set style line 1 linecolor rgb "green"
set style line 2 linecolor rgb "blue"


set border lc rgb 'white'
set key tc rgb 'white'

set grid lc rgb 'white'

PI = 3.14159265359
ER = 6378137
refLat = 53.325
refLon = -6.2596
klon = 111132.854 * cos(PI*refLat/180) 





## https://stackoverflow.com/questions/639695/how-to-convert-latitude-or-longitude-to-meters
## m_per_deg_lat = 111132.954 - 559.822 * cos( 2 * latMid ) + 1.175 * cos( 4 * latMid);
## m_per_deg_lon = 111132.954 * cos ( latMid );





set origin 0,0
set size 0.5,1

set xlabel "meters W/E"
set ylabel "meters S/N"
plot "< gunzip -c gps_sa_off_pre_transition.dat.gz" using (($5-refLon)*klon):( ($4-refLat) * 111111) linecolor rgb "blue"  \
title 'with SA on' \
,"< gunzip -c gps_sa_off_post_transition.dat.gz" using (($5-refLon)*klon):( ($4-refLat) * 111111) linecolor rgb "red"  \
title 'with SA off' 

unset title
set yrange [-100:100]

set ylabel "S/N meters"
set origin 0.5,0
set size 0.5,0.5
plot "< gunzip -c gps_sa_off_pre_transition.dat.gz" using ($2/3600):( ($4-refLat) * 111111) linecolor rgb "blue"  \
title 'SA on' with lines \
,"< gunzip -c gps_sa_off_post_transition.dat.gz" using ($2/3600):( ($4-refLat) * 111111) linecolor rgb "red"  \
title 'SA off' with lines


set origin 0.5,0.5
set size 0.5,0.5
set ylabel "W/E meters"
plot "< gunzip -c gps_sa_off_pre_transition.dat.gz" using ($2/3600):(($5-refLon)*klon) linecolor rgb "blue"  \
title 'SA on' with lines \
,"< gunzip -c gps_sa_off_post_transition.dat.gz" using ($2/3600):(($5-refLon)*klon) linecolor rgb "red"  \
title 'SA off' with lines


unset muliplot
set label "Joe Desbonnet" at graph -0.05,-0.07 font ",8" tc rgb "white"
set label "http://jdesbonnet.blogspot.com" at graph -0.05,-0.10 font ",8" tc rgb "white"

#pause -1 
