

import io
import csv
import cx_Oracle

con = cx_Oracle.connect('viktor/password@localhost:1522') 
cursor = con.cursor()

cursor.execute("""
SELECT COUNTRY,
		STATE,
		CITY,
		STREET,
		STARTTIME,
		ENDTIME,
		DISTANCE,
		SIDE,
		SEVERITY
from incedent_simple 
""")

with io.open('save.csv', "w", newline='', encoding='utf-8') as file:
	fieldnames = ['COUNTRY', 'STATE','CITY','STREET','STARTTIME','ENDTIME','DISTANCE','SIDE','SEVERITY']
	writer = csv.DictWriter(file, fieldnames=fieldnames)
	writer.writeheader()
	for coun,state,city,street,start,end,dist,side,sever in cursor.fetchall():
		writer.writerow({'COUNTRY':coun, 'STATE':state,'CITY':city,'STREET':street,'STARTTIME':start,'ENDTIME':end,'DISTANCE':dist,'SIDE':side,'SEVERITY':sever})

cursor.close()