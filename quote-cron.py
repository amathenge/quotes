'''
    NOTE: we did not include python shebang because this should be run by the venv python

    should be run by cron at intervals (e.g., 2 times per day)
    example:
        0 8,18 * * * /home/andrew/src/python/macdisk/quote-cron.py

    This module will send an SMS to the recipients with the disk utilization
    on the server. Disk utilization is stored in a sqlite3 database (quotes.db).
    The database is normally in the folder /home/andrew/src/python/disk
    The database has a table: disk (see quotes.py for table structure)

    NOTE: if crontab is not running this file, it may be due to the python path
    best to use the virtual environment, so the crontab should look like:
        0 8,18 * * * /home/andrew/src/python/.venv/bin/python /home/andrew/src/python/macdisk/disk-cron.py
    using that path, all additional modules (like request) will be included.
'''

import sqlite3
from datetime import datetime
import cred
import json
import http.client
import urllib.parse
import cred
from sms import sendSMS
import random

now = datetime.now()

db = sqlite3.connect(cred.db_path + cred.db_name)
db.row_factory = sqlite3.Row
cur = db.cursor()
# get a list of all quotes already sent
sql = 'select quote_id from quotes_sent'
cur.execute(sql)
data = cur.fetchall()
quotes_sent = []
for item in data:
    quotes_sent.append(item['quote_id'])

# get all id's in the quotes db that have not yet been sent
sql = 'select id from quotes where id not in '+str(tuple(quotes_sent))
# if there's only one item, a tuple() returns something like (44,) and so the sql statement
# needs to be fixed to only have (44)
sql = sql.replace(',)',')')

cur.execute(sql)
data = cur.fetchall()
quote_ids = []
# if nothing, then clear quotes_sent table
if len(data) == 0:
    sql = 'delete from quotes_sent'
    cur.execute(sql)
    db.commit()
    sql = 'select id from quotes'
    cur.execute(sql)
    data = cur.fetchall()
    for item in data:
        quote_ids.append(item['id'])
else:
    for item in data:
        quote_ids.append(item['id'])


# pick a random quote
quote_id = random.choice(quote_ids)

sql = 'select author, quote from quotes where id = ?'
cur.execute(sql, [quote_id])
data = cur.fetchone()
author = data['author']
quote = data['quote']

# clean up the quote for SMS
quote = quote.replace('\r\n', '<br>')
quote = quote.replace('""', '"')

# I've also noticed something that looks like '/n' in the SMS - maybe needs cleaning up
# at the database level, but let me add some code to see if we can do anything here.
# quote = quote.replace('/n','')
quote = quote.replace('\\n','\n')

message = f'{quote}\n--{author}'
# 16APR2023@09:46 - if no data returned, do not error out.

# worth mentioning again - cur.fetchone() returns None if there is no data
# but cur.fetchall() returns an empty set [] if there is no data.

response = sendSMS(message, cred.recipients)

# 16APR2023@09:32 - logging success/failure of SMS
# sql = 'insert into log (logtime, message) values (?, ?)'
# cur.execute(sql, [now, response])
# db.commit()

# close the database END OF PROGRAM

# log this quote as sent
sql = 'insert into quotes_sent (quote_id) values (?)'
cur.execute(sql, [quote_id])
db.commit()


# close database
db.close()
