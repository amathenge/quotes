'''
    NOTE: we did not include python shebang because this should be run by the venv python

    Send a single quote from the quotes.db database.

    Need to provide the quote_id in the program below.
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
import argparse
import sys

#
# check the arguments we have before you do anything
# 
parser = argparse.ArgumentParser()
group = parser.add_mutually_exclusive_group()
group.add_argument("-q", "--quote", help="ID of the Quote you want to see", type=int)
group.add_argument("-r", "--random", help="Show Random Quote", action="store_true")
# if -h or --help is given, then the script will end on the next line.
args = parser.parse_args()

quote_id = args.quote
quote_random = args.random

now = datetime.now()

db = sqlite3.connect(cred.db_path + cred.db_name)
db.row_factory = sqlite3.Row
cur = db.cursor()

quote_ids = []

if quote_random:
    sql = 'select id from quotes'
    cur.execute(sql)
    data = cur.fetchall()
    for item in data:
        quote_ids.append(item['id'])

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

# close database
db.close()
