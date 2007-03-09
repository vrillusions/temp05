# registers the serial number in db if not set already
# todo: should write this to a variable so it's not polling the database as much
def registerSerial(db, serial, num):
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
