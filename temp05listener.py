#!/usr/bin/env python
# vim:ts=4:sw=4:ft=python:fileencoding=utf-8
"""TEMP05 Reader

This listens on the serial port and will place sensor information into a database
this requires the pySerial and MySQLdb packages

this should background it properly
python temp05listner.py &

TODO
write to log file (can't print if the process is backgrounded)
write the temperature data to the sensors table as well (since I can't figure out how
  to get it from the readings table

"""

# $Id$
__version__ = "$Rev$"

# load everything we need
import sys
import serial
import MySQLdb
import time
import string
import traceback

from inc import temp05, RRD   # custom functions and vars


if __name__ == "__main__":
    try:
        # ----------------
        # Setup Everything
        # ----------------
        # Serial
        ser = serial.Serial() # defaults to 9600 8,N,1
        ser.port = 0 # set to first port
        # MySQL
        db = MySQLdb.connect(host=temp05.dbHost, user=temp05.dbUser, 
            passwd=temp05.dbPasswd, db=temp05.dbName)
        dbCursor = db.cursor()
        # RRD
        rrd = RRD.RRD(temp05.rrdfile)
        
        # open port
        ser.open()
        #print "Using port:", ser.portstr
        count = 1
        while True:
            """Start infinite loop that processes serial content"""
            line = ser.readline()
            line = line.strip()
            if line[0:6] == "Sensor":
                # Sensor lines are always in the following fixed format (up to the = at least)
                #Sensor #01[3E00080023BBC510]=72.60F
                #sensor number is irrelevant, going by the sensor id, which should theoretically be unique.
                #you can set a more descriptive name in the database.  I still set it just for reference
                num = line[8:10]
                serial = line[11:27]
                temperature = line[29:-1]  # don't want the F or C at the end, but you then have to remember which it is
                print "Sensor", num, "with serial", serial, "has the temperature", temperature
                temp05.registerSerial(db, serial, num)
                
                # there must be an easier way to do this    
                if num == '01':
                    tempValue1 = temperature
                elif num == '02':
                    tempValue2 = temperature
                elif num == '03':
                    tempValue3 = temperature
                
                # insert temperature
                #don't update the readings table any more (will probably delete all the sql stuff eventually
                #dbCursor.execute("INSERT INTO readings (sensor_id, temperature) VALUES (%s, %s)", (serial, float(temperature)))
                dbCursor.execute("UPDATE sensors SET latest_temperature = %s, latest_reading_at = NOW() WHERE id = %s", (float(temperature), serial))
                
                # commit after one round of sensor readings
                if count >= temp05.sensorCount:
                    db.commit()
                    dbCursor.close()
                    dbCursor = db.cursor()
                    
                    # update rrd
                    rrd.update(tempValue1, tempValue2, tempValue3)
                    count = 1
                else:
                    count = count + 1
    
    except KeyboardInterrupt, e:
        # Ctrl-c
        print "User abort, cleaning up before quiting."
        print
        db.commit()
        ser.close()
    except SystemExit, e:
        print "System exit, cleaning up before quiting."
        print
        db.commit()
        ser.close()
    except Exception, e:
        print "ERROR, UNEXPECTED EXCEPTION"
        print str(e)
        traceback.print_exc()
        sys.exit(1)
    else:
        # Main function is done, exit cleanly
        sys.exit(0)
