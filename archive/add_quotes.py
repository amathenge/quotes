# add the quotes in the additional_quotes.txt file

import sqlite3
import cred

f = open('additional_quotes.txt', 'r')
o = open('additional_quotes.sql', 'w')

# table structure:
#   id integer NOT NULL primary key AUTOINCREMENT,
#   author varchar(64) check ( length(author) <= 64 ) DEFAULT NULL,
#   category varchar(32) check ( length(category) <= 64 ) DEFAULT NULL,
#   quote text,
#   rating integer DEFAULT NULL

category = None
quote = None
author = None

sql = ''

db = sqlite3.connect(cred.db_path + cred.db_name)
db.row_factory = sqlite3.Row
cur = db.cursor()

for line in f:
    line = line.strip()
    if len(line) == 0:
        quote = None
        author = None
        continue
    if 'QUOTE' in line:
        category = line[:line.find('QUOTE')-1]
    elif line[0] == '-':
        author = line[3:]
    elif len(line) > 2:
        quote = line
    else:
        quote = None
    if quote is not None and author is not None:
        sql = f'insert into quotes (author, category, quote) values (?, ?, ?)'
        o.write(sql+';\n')
        o.write(f'category={category}\nauthor={author}\nquote={quote}\n\n')
        # add to db
        cur.execute(sql, [author, category, quote])
        db.commit()

f.close()
o.close()

db.close()