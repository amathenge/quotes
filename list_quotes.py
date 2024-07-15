'''
    NOTE: we did not include python shebang because this should be run by the venv python

    list all the quotes in the database

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
import sys

#
# check the arguments we have before you do anything
# 

now = datetime.now()

db = sqlite3.connect(cred.db_path + cred.db_name)
db.row_factory = sqlite3.Row
cur = db.cursor()

sql = 'select id, author, quote from quotes order by id asc'
cur.execute(sql)
data = cur.fetchall()

for item in data:
    q_id = item['id']
    q_author = item['author']
    q_quote = item['quote']
    # clean up the quote for SMS
    q_quote = q_quote.replace('\r\n', '<br>')
    q_quote = q_quote.replace('""', '"')

    # I've also noticed something that looks like '/n' in the SMS - maybe needs cleaning up
    # at the database level, but let me add some code to see if we can do anything here.
    # quote = quote.replace('/n','')
    q_quote = q_quote.replace('\\n','\n')

    print(f'id={q_id}')
    print(f'author={q_author}')
    print(f'quote={q_quote}\n')


# close database
db.close()
