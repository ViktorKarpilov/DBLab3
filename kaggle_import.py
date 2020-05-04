import cx_Oracle
import pandas as pd  
import numpy as np

con = cx_Oracle.connect('viktor/password@localhost:1522') 
cursor = con.cursor() 
dataset = pd.read_csv(r'../incedents.csv')


Country = dataset['Country']
Country = pd.unique(Country)

for el in Country:
    try:
        cursor.execute("INSERT INTO COUNTRY(COUNTRY)VALUES ('{}')".format(el))
    except :
        pass

con.commit()

Severity = dataset["Severity"]
Severity = pd.unique(Severity)

for el in Severity:
    try:
        cursor.execute("INSERT INTO severity(severity) VALUES ({})".format(el))
    except:
        pass

Severity = dataset[["City",'State','Country']]
Severity = Severity.drop_duplicates()
Severity = Severity.to_numpy()
for el in Severity:
    try:
        command = "INSERT INTO STATE(STATE,COUNTRY_country) VALUES ('{}','{}')".format(el[1],el[2])
        cursor.execute(command)
    except cx_Oracle.DatabaseError as e:
    	pass

con.commit()

for el in Severity:
    try:
        command = "INSERT INTO CITY(CITY,STATE_state) VALUES ('{}','{}')".format(el[0],el[1])
        cursor.execute(command)
    except cx_Oracle.DatabaseError as e:
    	pass

con.commit()

Streets = dataset[["Street","City",'State','Country']]
Streets = Streets.dropna(subset=['City']).drop_duplicates()
Streets = Streets.to_numpy()

for el in Streets:
    try:
        command = """insert into street(street,city_city)
                    VALUES ('{}','{}')""".format(el[0],el[1])
        cursor.execute(command)
    except Exception as e:
    	pass

con.commit()

Incedents = dataset[["Street",'Severity','Side','Start_Time', 'End_Time','Distance(mi)']]
Incedents = Incedents.dropna().drop_duplicates()
Incedents = Incedents.to_numpy()

for el in Incedents:
    try:
        command = """insert into incedent(starttime,endtime,distance,street_street,severity_severity,side_side)
                    VALUES (TIMESTAMP'{}',TIMESTAMP'{}',{},'{}',{},'{}')
                    """.format(el[3],el[4],el[5],el[0],el[1],el[2])
        cursor.execute(command)
    except Exception as e:
        pass

con.commit()

try:
    command = """insert into source(source)
                values ('MapQuest');
                    """
    cursor.execute(command)
except:
    pass

for i in range(3000000):
    try:
        command = """insert into incedent_sourcev1(incedent_incedent_id,source_source)
                    values ({},'MapQuest')
                    """.format(i)
        cursor.execute(command)
    except Exception as e:
        pass
