"""Custom functions and initial config settings"""

import sys

# database settings
dbHost = "localhost"
dbUser = "temp05admin"
dbPasswd = "m13ZnbR0qIdDJMu0"
dbName = "temp05"

# the number of sensors you have
sensorCount = 3

# the logfile to write to, setting to /dev/null effectively disables it
logfile = 'log.txt'

# the path and filename of rrd database
rrdfile = 'temp05.rrd'

# --- end configuration ---
fsock = open(logfile, 'w')
sys.stdout = fsock


def registerSerial(db, serial, num):
  """Registers the serial number in the db if not set already
  
  todo: should write this to a variable so it's not polling the database as much
  """
  cursor = db.cursor()
  
  # see if it's already in there
  cursor.execute("SELECT COUNT(*) FROM sensors WHERE id = %s", (serial));
  recordCount = cursor.fetchone()
  #print "the count:", recordCount[0]
  if recordCount[0] == 0:
    #they are not in there, register them
    #print "  Sensor now registered in database, creating now"
    cursor.execute("INSERT INTO sensors (id, number_ref) VALUES (%s, %s)", (serial, int(num)))
    # todo: error handling
