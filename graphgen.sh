#!/bin/sh
date=`date +%c`

# yes I'm copying this all for each graph, if you know how to save that, let me know

rrdtool graph /var/www/temperature/temp05-day.png -s -1d --imgformat PNG -t "Temperatures - by day" \
 -v "Temperature" \
 DEF:outside=temp05.rrd:outside:AVERAGE \
 DEF:basement=temp05.rrd:basement:AVERAGE \
 DEF:todds_room=temp05.rrd:todds_room:AVERAGE \
 LINE2:outside#ff0000:"Outside    " \
 GPRINT:outside:LAST:"Cur\: %6.2lf F ":STACK \
 GPRINT:outside:MIN:"Min\: %6.2lf F ":STACK \
 GPRINT:outside:AVERAGE:"Avg\: %6.2lf F ":STACK \
 GPRINT:outside:MAX:"Max\: %6.2lf F\l":STACK \
 \
 LINE2:basement#00ff00:"Basement   " \
 GPRINT:basement:LAST:"Cur\: %6.2lf F ":STACK \
 GPRINT:basement:MIN:"Min\: %6.2lf F ":STACK \
 GPRINT:basement:AVERAGE:"Avg\: %6.2lf F ":STACK \
 GPRINT:basement:MAX:"Max\: %6.2lf F\l":STACK \
 \
 LINE2:todds_room#0000ff:"Todds Room " \
 GPRINT:todds_room:LAST:"Cur\: %6.2lf F ":STACK \
 GPRINT:todds_room:MIN:"Min\: %6.2lf F ":STACK \
 GPRINT:todds_room:AVERAGE:"Avg\: %6.2lf F ":STACK \
 GPRINT:todds_room:MAX:"Max\: %6.2lf F\l":STACK \
 \
 COMMENT:"Last Update: $date\r"

rrdtool graph /var/www/temperature/temp05-week.png -s -1w --imgformat PNG -t "Temperatures - by week" \
 -v "Temperature" \
 DEF:outside=temp05.rrd:outside:AVERAGE \
 DEF:basement=temp05.rrd:basement:AVERAGE \
 DEF:todds_room=temp05.rrd:todds_room:AVERAGE \
 LINE2:outside#ff0000:"Outside    " \
 GPRINT:outside:LAST:"Cur\: %6.2lf F ":STACK \
 GPRINT:outside:MIN:"Min\: %6.2lf F ":STACK \
 GPRINT:outside:AVERAGE:"Avg\: %6.2lf F ":STACK \
 GPRINT:outside:MAX:"Max\: %6.2lf F\l":STACK \
 \
 LINE2:basement#00ff00:"Basement   " \
 GPRINT:basement:LAST:"Cur\: %6.2lf F ":STACK \
 GPRINT:basement:MIN:"Min\: %6.2lf F ":STACK \
 GPRINT:basement:AVERAGE:"Avg\: %6.2lf F ":STACK \
 GPRINT:basement:MAX:"Max\: %6.2lf F\l":STACK \
 \
 LINE2:todds_room#0000ff:"Todds Room " \
 GPRINT:todds_room:LAST:"Cur\: %6.2lf F ":STACK \
 GPRINT:todds_room:MIN:"Min\: %6.2lf F ":STACK \
 GPRINT:todds_room:AVERAGE:"Avg\: %6.2lf F ":STACK \
 GPRINT:todds_room:MAX:"Max\: %6.2lf F\l":STACK \
 \
 COMMENT:"Last Update: $date\r"

rrdtool graph /var/www/temperature/temp05-month.png -s -1m --imgformat PNG -t "Temperatures - by month" \
 -v "Temperature" \
 DEF:outside=temp05.rrd:outside:AVERAGE \
 DEF:basement=temp05.rrd:basement:AVERAGE \
 DEF:todds_room=temp05.rrd:todds_room:AVERAGE \
 LINE2:outside#ff0000:"Outside    " \
 GPRINT:outside:LAST:"Cur\: %6.2lf F ":STACK \
 GPRINT:outside:MIN:"Min\: %6.2lf F ":STACK \
 GPRINT:outside:AVERAGE:"Avg\: %6.2lf F ":STACK \
 GPRINT:outside:MAX:"Max\: %6.2lf F\l":STACK \
 \
 LINE2:basement#00ff00:"Basement   " \
 GPRINT:basement:LAST:"Cur\: %6.2lf F ":STACK \
 GPRINT:basement:MIN:"Min\: %6.2lf F ":STACK \
 GPRINT:basement:AVERAGE:"Avg\: %6.2lf F ":STACK \
 GPRINT:basement:MAX:"Max\: %6.2lf F\l":STACK \
 \
 LINE2:todds_room#0000ff:"Todds Room " \
 GPRINT:todds_room:LAST:"Cur\: %6.2lf F ":STACK \
 GPRINT:todds_room:MIN:"Min\: %6.2lf F ":STACK \
 GPRINT:todds_room:AVERAGE:"Avg\: %6.2lf F ":STACK \
 GPRINT:todds_room:MAX:"Max\: %6.2lf F\l":STACK \
 \
 COMMENT:"Last Update: $date\r"

rrdtool graph /var/www/temperature/temp05-year.png -s -1y --imgformat PNG -t "Temperatures - by year" \
 -v "Temperature" \
 DEF:outside=temp05.rrd:outside:AVERAGE \
 DEF:basement=temp05.rrd:basement:AVERAGE \
 DEF:todds_room=temp05.rrd:todds_room:AVERAGE \
 LINE2:outside#ff0000:"Outside    " \
 GPRINT:outside:LAST:"Cur\: %6.2lf F ":STACK \
 GPRINT:outside:MIN:"Min\: %6.2lf F ":STACK \
 GPRINT:outside:AVERAGE:"Avg\: %6.2lf F ":STACK \
 GPRINT:outside:MAX:"Max\: %6.2lf F\l":STACK \
 \
 LINE2:basement#00ff00:"Basement   " \
 GPRINT:basement:LAST:"Cur\: %6.2lf F ":STACK \
 GPRINT:basement:MIN:"Min\: %6.2lf F ":STACK \
 GPRINT:basement:AVERAGE:"Avg\: %6.2lf F ":STACK \
 GPRINT:basement:MAX:"Max\: %6.2lf F\l":STACK \
 \
 LINE2:todds_room#0000ff:"Todds Room " \
 GPRINT:todds_room:LAST:"Cur\: %6.2lf F ":STACK \
 GPRINT:todds_room:MIN:"Min\: %6.2lf F ":STACK \
 GPRINT:todds_room:AVERAGE:"Avg\: %6.2lf F ":STACK \
 GPRINT:todds_room:MAX:"Max\: %6.2lf F\l":STACK \
 \
 COMMENT:"Last Update: $date\r"

