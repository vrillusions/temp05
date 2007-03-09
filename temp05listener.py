#!/usr/bin/env python
###
# TEMP05 Reader
#
# This listens on the serial port and will place sensor information into a database
# this requires the pySerial and MySQLdb packages
#
# this should background it properly
# python temp05listner.py &
#
# TODO
# write to log file (can't print if the process is backgrounded)
# write the temperature data to the sensors table as well (since I can't figure out how
#   to get it from the readings table

# load everything we need
import temp05   # custom functions
import serial
import MySQLdb
import time

# ----------------
# Setup Everything
# ----------------
sensorCount = 3  # the number of sensors you have (used in lowering db overhead)
# Serial
ser = serial.Serial() # defaults to 9600 8,N,1
ser.port = 0 # set to first port
# MySQL
dbHost = "localhost"
dbUser = "temp05admin"
dbPasswd = "m13ZnbR0qIdDJMu0"
dbName = "temp05"
db = MySQLdb.connect(host=dbHost, user=dbUser, passwd=dbPasswd, db=dbName)
dbCursor = db.cursor()

# open port
ser.open()
#print "Using port:", ser.portstr
count = 1
while True:
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
    #print "Sensor", num, "with serial", serial, "has the temperature", temperature
    temp05.registerSerial(db, serial, num)

    # insert temperature
    dbCursor.execute("INSERT INTO readings (sensor_id, temperature) VALUES (%s, %s)", (serial, float(temperature)))
    dbCursor.execute("UPDATE sensors SET latest_temperature = %s, latest_reading_at = NOW() WHERE id = %s", (float(temperature), serial))
    
    # commit after one round of sensor readings
    if count >= sensorCount:
      db.commit()
      dbCursor.close()
      dbCursor = db.cursor()
      count = 1
    else:
      count = count + 1
# it will never get to this since the above is an infinite loop.  perhaps somehow be able to read a request to end it?
db.commit()
ser.close()

