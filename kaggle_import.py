import cx_Oracle
import pandas as pd  
import numpy as np

con = cx_Oracle.connect('viktor/password@localhost:1522') 
cursor = con.cursor() 
dataset = pd.read_csv(r'../incedents.csv')


Country = dataset['Country']
Country = pd.unique(Country)
print("Insert countryes...")
for el in Country:
    try:
        cursor.execute("INSERT INTO COUNTRY(COUNTRY)VALUES ('{}')".format(el))
    except :
        pass

con.commit()

Severity = dataset["Severity"]
Severity = pd.unique(Severity)
print("Insert severityes...")
for el in Severity:
    try:
        cursor.execute("INSERT INTO severity(severity) VALUES ({})".format(el))
    except:
        pass

Severity = dataset[["City",'State','Country']]
Severity = Severity.drop_duplicates()
Severity = Severity.to_numpy()
print("Insert states...")
for el in Severity:
    try:
        command = "INSERT INTO STATE(STATE,COUNTRY_country) VALUES ('{}','{}')".format(el[1],el[2])
        cursor.execute(command)
    except cx_Oracle.DatabaseError as e:
    	pass

con.commit()
print("Insert cityes...")
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
print("Insert streets...")
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

log = {'success':0,'invalid':0}
target_number= int(input("Enter please a wish number of inserts (max is 3 000 000):"))
Incedents = Incedents.tail(target_number)
Incedents = Incedents.to_numpy()
print("Insert incedents...")
i =0

for el in Incedents:
    try:
        command = """insert into incedent(incedent_id,starttime,endtime,distance,street_street,severity_severity,side_side)
                        VALUES ({},TIMESTAMP'{}',TIMESTAMP'{}',{},'{}',{},'{}')
                        """.format(i,el[3],el[4],el[5],el[0],el[1],el[2])
        i+=1
        cursor.execute(command)
        log['success'] += 1
    except Exception as e:
        log['invalid'] += 1
        
print(log)

con.commit()


try:
    command = """insert into source(source)
                values ('MapQuest');
                    """
    cursor.execute(command)
except:
    pass


print("Insert incedents and sources...")
for i in range(target_number):
    try:
        command = """insert into incedent_sourcev1(incedent_incedent_id,source_source)
                    values ({},'MapQuest')
                    """.format(i)
        cursor.execute(command)
    except Exception as e:
        pass

con.commit()
