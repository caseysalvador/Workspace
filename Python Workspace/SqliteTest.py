import sqlite3

#conn = sqlite3.connect('sqlitetest.db')

sqlite_file = 'C:\sqlite\db\sqlitetestdb.sqlite'
table_name = 'memberTable1'
col_fName = 'firstName'
col_sType = 'TEXT'
col_iType = 'INTEGER'

# Connecting to the database file
conn = sqlite3.connect(sqlite_file)
c = conn.cursor()

# Creating a new SQLite table with 1 column
c.execute(f'CREATE TABLE {table_name} ({col_fName} {col_sType})')

# Committing changes and closing the connection to the database file
conn.commit()
conn.close()
