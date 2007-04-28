#!/bin/sh
#have to escape the \ twice so the result is "\:"
date=`date +%c | sed "s/\:/\\\\\:/g"`
baseDir=/srv/www/default/html/temperature

# yes I'm copying this all for each graph, if you know how to save that, let me know

rrdtool graph ${baseDir}/temp05-day.png --lazy -s -1d --imgformat PNG -t "Temperatures - by day" \
 -v "Temperature" --font LEGEND:7 \
 DEF:outside=temp05.rrd:outside:AVERAGE \
 VDEF:outside_cur=outside,LAST \
 VDEF:outside_min=outside,MINIMUM \
 VDEF:outside_avg=outside,AVERAGE \
 VDEF:outside_max=outside,MAXIMUM \
 LINE2:outside#ff0000:"Outside    " \
 GPRINT:outside_cur:"Cur\: %6.2lf F " \
 GPRINT:outside_min:"Min\: %6.2lf F " \
 GPRINT:outside_avg:"Avg\: %6.2lf F " \
 GPRINT:outside_max:"Max\: %6.2lf F\l" \
 \
 DEF:basement=temp05.rrd:basement:AVERAGE \
 VDEF:basement_cur=basement,LAST \
 VDEF:basement_min=basement,MINIMUM \
 VDEF:basement_avg=basement,AVERAGE \
 VDEF:basement_max=basement,MAXIMUM \
 LINE2:basement#00ff00:"Basement   " \
 GPRINT:basement_cur:"Cur\: %6.2lf F " \
 GPRINT:basement_min:"Min\: %6.2lf F " \
 GPRINT:basement_avg:"Avg\: %6.2lf F " \
 GPRINT:basement_max:"Max\: %6.2lf F\l" \
 \
 DEF:todds_room=temp05.rrd:todds_room:AVERAGE \
 VDEF:todds_room_cur=todds_room,LAST \
 VDEF:todds_room_min=todds_room,MINIMUM \
 VDEF:todds_room_avg=todds_room,AVERAGE \
 VDEF:todds_room_max=todds_room,MAXIMUM \
 LINE2:todds_room#0000ff:"Todds Room " \
 GPRINT:todds_room_cur:"Cur\: %6.2lf F " \
 GPRINT:todds_room_min:"Min\: %6.2lf F " \
 GPRINT:todds_room_avg:"Avg\: %6.2lf F " \
 GPRINT:todds_room_max:"Max\: %6.2lf F\l" \
 \
 COMMENT:"Last Update\: $date\r"

rrdtool graph ${baseDir}/temp05-week.png --lazy -s -1w --imgformat PNG -t "Temperatures - by week" \
 -v "Temperature" --font LEGEND:7 \
 DEF:outside=temp05.rrd:outside:AVERAGE \
 VDEF:outside_cur=outside,LAST \
 VDEF:outside_min=outside,MINIMUM \
 VDEF:outside_avg=outside,AVERAGE \
 VDEF:outside_max=outside,MAXIMUM \
 LINE2:outside#ff0000:"Outside    " \
 GPRINT:outside_cur:"Cur\: %6.2lf F " \
 GPRINT:outside_min:"Min\: %6.2lf F " \
 GPRINT:outside_avg:"Avg\: %6.2lf F " \
 GPRINT:outside_max:"Max\: %6.2lf F\l" \
 \
 DEF:basement=temp05.rrd:basement:AVERAGE \
 VDEF:basement_cur=basement,LAST \
 VDEF:basement_min=basement,MINIMUM \
 VDEF:basement_avg=basement,AVERAGE \
 VDEF:basement_max=basement,MAXIMUM \
 LINE2:basement#00ff00:"Basement   " \
 GPRINT:basement_cur:"Cur\: %6.2lf F " \
 GPRINT:basement_min:"Min\: %6.2lf F " \
 GPRINT:basement_avg:"Avg\: %6.2lf F " \
 GPRINT:basement_max:"Max\: %6.2lf F\l" \
 \
 DEF:todds_room=temp05.rrd:todds_room:AVERAGE \
 VDEF:todds_room_cur=todds_room,LAST \
 VDEF:todds_room_min=todds_room,MINIMUM \
 VDEF:todds_room_avg=todds_room,AVERAGE \
 VDEF:todds_room_max=todds_room,MAXIMUM \
 LINE2:todds_room#0000ff:"Todds Room " \
 GPRINT:todds_room_cur:"Cur\: %6.2lf F " \
 GPRINT:todds_room_min:"Min\: %6.2lf F " \
 GPRINT:todds_room_avg:"Avg\: %6.2lf F " \
 GPRINT:todds_room_max:"Max\: %6.2lf F\l" \
 \
 COMMENT:"Last Update\: $date\r"

rrdtool graph ${baseDir}/temp05-month.png --lazy -s -1m --imgformat PNG -t "Temperatures - by month" \
 -v "Temperature" --font LEGEND:7 \
 DEF:outside=temp05.rrd:outside:AVERAGE \
 VDEF:outside_cur=outside,LAST \
 VDEF:outside_min=outside,MINIMUM \
 VDEF:outside_avg=outside,AVERAGE \
 VDEF:outside_max=outside,MAXIMUM \
 LINE2:outside#ff0000:"Outside    " \
 GPRINT:outside_cur:"Cur\: %6.2lf F " \
 GPRINT:outside_min:"Min\: %6.2lf F " \
 GPRINT:outside_avg:"Avg\: %6.2lf F " \
 GPRINT:outside_max:"Max\: %6.2lf F\l" \
 \
 DEF:basement=temp05.rrd:basement:AVERAGE \
 VDEF:basement_cur=basement,LAST \
 VDEF:basement_min=basement,MINIMUM \
 VDEF:basement_avg=basement,AVERAGE \
 VDEF:basement_max=basement,MAXIMUM \
 LINE2:basement#00ff00:"Basement   " \
 GPRINT:basement_cur:"Cur\: %6.2lf F " \
 GPRINT:basement_min:"Min\: %6.2lf F " \
 GPRINT:basement_avg:"Avg\: %6.2lf F " \
 GPRINT:basement_max:"Max\: %6.2lf F\l" \
 \
 DEF:todds_room=temp05.rrd:todds_room:AVERAGE \
 VDEF:todds_room_cur=todds_room,LAST \
 VDEF:todds_room_min=todds_room,MINIMUM \
 VDEF:todds_room_avg=todds_room,AVERAGE \
 VDEF:todds_room_max=todds_room,MAXIMUM \
 LINE2:todds_room#0000ff:"Todds Room " \
 GPRINT:todds_room_cur:"Cur\: %6.2lf F " \
 GPRINT:todds_room_min:"Min\: %6.2lf F " \
 GPRINT:todds_room_avg:"Avg\: %6.2lf F " \
 GPRINT:todds_room_max:"Max\: %6.2lf F\l" \
 \
 COMMENT:"Last Update\: $date\r"

rrdtool graph ${baseDir}/temp05-year.png --lazy -s -1y --imgformat PNG -t "Temperatures - by year" \
 -v "Temperature" --font LEGEND:7 \
 DEF:outside=temp05.rrd:outside:AVERAGE \
 VDEF:outside_cur=outside,LAST \
 VDEF:outside_min=outside,MINIMUM \
 VDEF:outside_avg=outside,AVERAGE \
 VDEF:outside_max=outside,MAXIMUM \
 LINE2:outside#ff0000:"Outside    " \
 GPRINT:outside_cur:"Cur\: %6.2lf F " \
 GPRINT:outside_min:"Min\: %6.2lf F " \
 GPRINT:outside_avg:"Avg\: %6.2lf F " \
 GPRINT:outside_max:"Max\: %6.2lf F\l" \
 \
 DEF:basement=temp05.rrd:basement:AVERAGE \
 VDEF:basement_cur=basement,LAST \
 VDEF:basement_min=basement,MINIMUM \
 VDEF:basement_avg=basement,AVERAGE \
 VDEF:basement_max=basement,MAXIMUM \
 LINE2:basement#00ff00:"Basement   " \
 GPRINT:basement_cur:"Cur\: %6.2lf F " \
 GPRINT:basement_min:"Min\: %6.2lf F " \
 GPRINT:basement_avg:"Avg\: %6.2lf F " \
 GPRINT:basement_max:"Max\: %6.2lf F\l" \
 \
 DEF:todds_room=temp05.rrd:todds_room:AVERAGE \
 VDEF:todds_room_cur=todds_room,LAST \
 VDEF:todds_room_min=todds_room,MINIMUM \
 VDEF:todds_room_avg=todds_room,AVERAGE \
 VDEF:todds_room_max=todds_room,MAXIMUM \
 LINE2:todds_room#0000ff:"Todds Room " \
 GPRINT:todds_room_cur:"Cur\: %6.2lf F " \
 GPRINT:todds_room_min:"Min\: %6.2lf F " \
 GPRINT:todds_room_avg:"Avg\: %6.2lf F " \
 GPRINT:todds_room_max:"Max\: %6.2lf F\l" \
 \
 COMMENT:"Last Update\: $date\r"

