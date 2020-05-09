-- Generated by Oracle SQL Developer Data Modeler 4.1.5.907
--   at:        2020-05-04 01:17:27 EEST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g


CREATE
  TABLE City
  (
    City        VARCHAR2 (15 CHAR) NOT NULL ,
    State_State VARCHAR2 (10 CHAR) NOT NULL
  ) ;
ALTER TABLE City ADD CONSTRAINT City_PK PRIMARY KEY ( City ) ;


CREATE
  TABLE Country
  (
    Country VARCHAR2 (10 CHAR) NOT NULL
  ) ;
ALTER TABLE Country ADD CONSTRAINT Country_PK PRIMARY KEY ( Country ) ;


CREATE
  TABLE Incedent
  (
    Incedent_ID       NUMBER (11) NOT NULL ,
    StartTime         TIMESTAMP NOT NULL ,
    EndTime           TIMESTAMP NOT NULL ,
    Distance          NUMBER (9,3) ,
    Street_Street     VARCHAR2 (25 CHAR) NOT NULL ,
    Severity_Severity NUMBER (2) NOT NULL ,
    Side_Side     VARCHAR2 (2) NOT NULL
  ) ;
ALTER TABLE Incedent ADD CONSTRAINT Incedent_PK PRIMARY KEY ( Incedent_ID ) ;
ALTER TABLE Incedent ADD CONSTRAINT Incedent_StartTime_EndTime_UN UNIQUE (
StartTime , EndTime ) ;


CREATE
  TABLE Incedent_Sourcev1
  (
    Incedent_Incedent_ID NUMBER (11) NOT NULL ,
    Source_Source        VARCHAR2 (10 CHAR) NOT NULL
  ) ;


CREATE
  TABLE Severity
  (
    Severity NUMBER (2) NOT NULL
  ) ;
ALTER TABLE Severity ADD CONSTRAINT Severity_PK PRIMARY KEY ( Severity ) ;


CREATE
  TABLE Side
  (
    SIDE VARCHAR2 (2 CHAR) NOT NULL
  ) ;
ALTER TABLE Side ADD CONSTRAINT Side_PK PRIMARY KEY ( SIDE ) ;


CREATE
  TABLE Source
  (
    Source VARCHAR2 (10 CHAR) NOT NULL
  ) ;
ALTER TABLE Source ADD CONSTRAINT Source_PK PRIMARY KEY ( Source ) ;


CREATE
  TABLE State
  (
    State           VARCHAR2 (10 CHAR) NOT NULL ,
    Country_Country VARCHAR2 (10 CHAR) NOT NULL
  ) ;
ALTER TABLE State ADD CONSTRAINT State_PK PRIMARY KEY ( State ) ;


CREATE
  TABLE Street
  (
    Street    VARCHAR2 (25 CHAR) NOT NULL ,
    City_City VARCHAR2 (15 CHAR) NOT NULL
  ) ;
ALTER TABLE Street ADD CONSTRAINT Street_PK PRIMARY KEY ( Street ) ;


ALTER TABLE City ADD CONSTRAINT City_State_FK FOREIGN KEY ( State_State )
REFERENCES State ( State ) ON
DELETE CASCADE ;

ALTER TABLE Incedent ADD CONSTRAINT Incedent_Severity_FK FOREIGN KEY (
Severity_Severity ) REFERENCES Severity ( Severity ) ON
DELETE CASCADE ;

ALTER TABLE Incedent ADD CONSTRAINT Incedent_Side_FK FOREIGN KEY (
Side_Side ) REFERENCES Side ( Side ) ON
DELETE CASCADE ;

ALTER TABLE Incedent_Sourcev1 ADD CONSTRAINT Incedent_Sourcev1_Incedent_FK
FOREIGN KEY ( Incedent_Incedent_ID ) REFERENCES Incedent ( Incedent_ID ) ON
DELETE CASCADE ;

ALTER TABLE Incedent_Sourcev1 ADD CONSTRAINT Incedent_Sourcev1_Source_FK
FOREIGN KEY ( Source_Source ) REFERENCES Source ( Source ) ON
DELETE CASCADE ;

ALTER TABLE Incedent ADD CONSTRAINT Incedent_Street_FK FOREIGN KEY (
Street_Street ) REFERENCES Street ( Street ) ON
DELETE CASCADE ;

ALTER TABLE State ADD CONSTRAINT State_Country_FK FOREIGN KEY ( Country_Country
) REFERENCES Country ( Country ) ON
DELETE CASCADE ;

ALTER TABLE Street ADD CONSTRAINT Street_City_FK FOREIGN KEY ( City_City )
REFERENCES City ( City ) ;


-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             9
-- CREATE INDEX                             0
-- ALTER TABLE                             17
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
