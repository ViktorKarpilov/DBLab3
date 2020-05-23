DECLARE
    rows_num INT NOT NULL DEFAULT 5;
    incedent_id_inside int not null default 0;

    type starttime_ar is varray(5) of DATE;
    type endtime_ar is varray(5) of  Date;
    type distance_ar is varray(5) of  NUMBER(9,3);
    type street_ar is varray(5) of 	VARCHAR2(10 CHAR);
    type severity_ar is varray(5) of  NUMBER(2,0);
    type side_ar is varray(5) of  VARCHAR2(2 CHAR);
    
    
    
    starttime starttime_ar := starttime_ar(); 
    endtime endtime_ar := endtime_ar();
    distance distance_ar := distance_ar();
    street street_ar := street_ar();
    severity severity_ar := severity_ar();
    side side_ar := side_ar();

BEGIN
    starttime := starttime_ar(TIMESTAMP'2016-03-08 12:44:00',TIMESTAMP'2016-04-08 12:12:00',TIMESTAMP'2016-04-08 12:33:00',TIMESTAMP'2016-05-08 12:41:00',TIMESTAMP'2016-05-08 10:00:00');
    endtime := endtime_ar(TIMESTAMP'2016-03-08 12:45:00',TIMESTAMP'2016-04-08 12:13:00',TIMESTAMP'2016-04-08 12:34:00',TIMESTAMP'2016-05-08 12:42:00',TIMESTAMP'2016-05-08 10:01:00');
    distance := distance_ar(1,3,4,3.2,5);
    street := street_ar('first','second','third','fourth','fifth');
    severity := severity_ar(1,1,2,2,3);
    side := side_ar('R','R','R','R','R');
    
    INSERT INTO SEVERITY(SEVERITY)
    VALUES (1);
    INSERT INTO SEVERITY(SEVERITY)
    VALUES (2);
    INSERT INTO SEVERITY(SEVERITY)
    VALUES (3);
    
    INSERT INTO COUNTRY(COUNTRY)
    VALUES ('USA');
    insert into STATE(state,country_country)
    values ('colorado','USA');
    insert into city(city,state_state)
    values ('LA','colorado');
    insert into street(street,city_city)
    values ('a','LA');
    insert into source(source)
    values ('bin');
    
    insert into side(side)
    values ('R');
    insert into side(side)      
    values ('L');

    
    FOR j in 1..rows_num LOOP
    

        insert into street(street,city_city)
        values (street(j),'LA');
        
        
        insert into incedent(incedent_id,starttime,endtime,distance,street_street,severity_severity,side_side)
        VALUES (j,starttime(j),endtime(j),distance(j),street(j),severity(j),side(j));
        
        select incedent.incedent_id into incedent_id_inside
                                from incedent 
                                where starttime = starttime(j) 
                                    and endtime = endtime(j) 
                                    and distance = distance(j) 
                                    and street_street = street(j)
                                    and severity_severity = severity(j)
                                    and side_side = side(j);
        
        insert into incedent_sourcev1(incedent_incedent_id,source_source)
        values (incedent_id_inside,'bin');
    end loop;
    
    
END;