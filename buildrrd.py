#!/usr/bin/env python
"""Initialize a RRD database

This will create the initial rrd database using settings you have defined
This should only be run the first time you setup everything

@todo more error checks
"""

import sys
from inc import temp05
from inc.RRD import *

rrd = RRD(temp05.rrdfile)

# you need to manually type the names in here they should be in the same
# order as they are read from the console.  The name cannot have spaces
values = (
    ('basement', 'GAUGE', 'U', 'U'), 
    ('todds_room', 'GAUGE', 'U', 'U'),
    ('outside', 'GAUGE', 'U', 'U'),
  )

rrd.create_rrd(60, values)