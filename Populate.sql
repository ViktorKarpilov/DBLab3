CREATE SEQUENCE seq_incedents
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10;

CREATE OR REPLACE TRIGGER SEQ_INCEDENTS
BEFORE INSERT ON INCEDENT
FOR EACH ROW

BEGIN
  SELECT SEQ_INCEDENTS.NEXTVAL
  INTO   :new.Incedent_ID
  FROM   dual;
END;

INSERT INTO SEVERITY(SEVERITY)
VALUES (1);
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
insert into incedent(starttime,endtime,distance,street_street,severity_severity,side_side)
VALUES (TIMESTAMP'2016-03-08 12:40:00',TIMESTAMP'2016-03-08 12:41:00',20.1,'a',1,'R');
insert into incedent_sourcev1(incedent_incedent_id,source_source)
values (1,'bin');
