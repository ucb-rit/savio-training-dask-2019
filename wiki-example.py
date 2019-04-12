import os
from dask.distributed import Client
c = Client(address = os.getenv('SCHED') + ':8786')
import dask.bag as db
wiki = db.read_text('/global/scratch/paciorek/wikistats_full/dated/part*')

import re
def find(line, regex = "Obama", language = "en"):
    vals = line.split(' ')
    if len(vals) < 6:
        return(False)
    tmp = re.search(regex, vals[3])
    if tmp is None or (language != None and vals[2] != language):
        return(False)
    else:
        return(True)

    
import time
t0 = time.time()
obama = wiki.filter(find).count().compute()
print(time.time() - t0)   # 236 sec. using 96 cores on Savio
print("obama: ", obama)


