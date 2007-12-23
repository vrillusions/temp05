#!/usr/bin/env python
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

# load everything we need
import sys
from inc import temp05, RRD   # custom functions and vars
import serial
import MySQLdb
import time
import string


if string.find(sys.argv[0], 'pydoc') <> -1:
  """if this is called from pydoc, just print a message and exit since pydoc
  will hang if it runs"""
  print "This file does not support pydoc, please open the file file to view comments"
  sys.exit("Unsupported command")

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
# it will never get to this since the above is an infinite loop.  perhaps somehow be able to read a request to end it?
db.commit()
ser.close()

