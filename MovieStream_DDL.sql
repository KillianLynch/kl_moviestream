-- Create the customer table
CREATE TABLE CUSTOMER 
    ( 
     CUST_ID                NUMBER , 
     LAST_NAME              VARCHAR2 (200) , 
     FIRST_NAME             VARCHAR2 (200) , 
     EMAIL                  VARCHAR2 (500) , 
     STREET_ADDRESS         VARCHAR2 (400) , 
     POSTAL_CODE            VARCHAR2 (10) , 
     CITY                   VARCHAR2 (100) , 
     STATE_PROVINCE         VARCHAR2 (100) , 
     COUNTRY                VARCHAR2 (400) , 
     COUNTRY_CODE           VARCHAR2 (2) , 
     CONTINENT              VARCHAR2 (400) , 
     YRS_CUSTOMER           NUMBER , 
     PROMOTION_RESPONSE     NUMBER , 
     LOC_LAT                NUMBER , 
     LOC_LONG               NUMBER , 
     AGE                    NUMBER , 
     COMMUTE_DISTANCE       NUMBER , 
     CREDIT_BALANCE         NUMBER , 
     EDUCATION              VARCHAR2 (40) , 
     FULL_TIME              VARCHAR2 (40) , 
     GENDER                 VARCHAR2 (20) , 
     HOUSEHOLD_SIZE         NUMBER , 
     INCOME                 NUMBER , 
     INCOME_LEVEL           VARCHAR2 (20) , 
     INSUFF_FUNDS_INCIDENTS NUMBER , 
     JOB_TYPE               VARCHAR2 (200) , 
     LATE_MORT_RENT_PMTS    NUMBER , 
     MARITAL_STATUS         VARCHAR2 (8) , 
     MORTGAGE_AMT           NUMBER , 
     NUM_CARS               NUMBER , 
     NUM_MORTGAGES          NUMBER , 
     PET                    VARCHAR2 (40) , 
     RENT_OWN               VARCHAR2 (40) , 
     SEGMENT_ID             NUMBER , 
     WORK_EXPERIENCE        NUMBER , 
     YRS_CURRENT_EMPLOYER   NUMBER , 
     YRS_RESIDENCE          NUMBER 
    );


CREATE UNIQUE INDEX PK_CUSTOMER_CUST_ID ON CUSTOMER 
    ( 
     CUST_ID ASC 
    );

ALTER TABLE CUSTOMER 
    ADD CONSTRAINT PK_CUSTOMER_CUST_ID PRIMARY KEY ( CUST_ID ) 
    USING INDEX PK_CUSTOMER_CUST_ID;

-----------------------------------------------------

--create the customer_segment table 

CREATE TABLE CUSTOMER_SEGMENT 
    ( 
     SEGMENT_ID NUMBER , 
     NAME       VARCHAR2 (100) , 
     SHORT_NAME VARCHAR2 (100) 
    );


CREATE UNIQUE INDEX PK_CUSTSEGMENT_ID ON CUSTOMER_SEGMENT 
    ( 
     SEGMENT_ID ASC 
    );

ALTER TABLE CUSTOMER_SEGMENT 
    ADD CONSTRAINT PK_CUSTSEGMENT_ID PRIMARY KEY ( SEGMENT_ID ) 
    USING INDEX PK_CUSTSEGMENT_ID ;
---------------------------------------------

--create the custsales table 

CREATE TABLE CUSTSALES 
    ( 
     DAY_ID           TIMESTAMP , 
     GENRE_ID         NUMBER , 
     MOVIE_ID         NUMBER , 
     CUST_ID          NUMBER , 
     APP              VARCHAR2 (100) , 
     DEVICE           VARCHAR2 (100) , 
     OS               VARCHAR2 (100) , 
     PAYMENT_METHOD   VARCHAR2 (100) , 
     LIST_PRICE       BINARY_DOUBLE , 
     DISCOUNT_TYPE    VARCHAR2 (100) , 
     DISCOUNT_PERCENT BINARY_DOUBLE , 
     ACTUAL_PRICE     BINARY_DOUBLE 
    );

ALTER TABLE CUSTSALES 
    ADD PRIMARY KEY ( CUST_ID, MOVIE_ID, DAY_ID ) 
    USING INDEX LOGGING;

ALTER TABLE CUSTSALES 
    ADD CONSTRAINT FK_CUSTSALES_CUST_ID FOREIGN KEY 
    ( 
     CUST_ID
    ) 
    REFERENCES CUSTOMER ( CUST_ID ) 
    NOT DEFERRABLE;

------------------------------------------

--create the genre table

CREATE TABLE GENRE 
    ( 
     GENRE_ID NUMBER , 
     NAME     VARCHAR2 (30) 
    );


CREATE UNIQUE INDEX PK_GENRE_ID ON GENRE 
    ( 
     GENRE_ID ASC 
    );

ALTER TABLE GENRE 
    ADD CONSTRAINT PK_GENRE_ID PRIMARY KEY ( GENRE_ID ) 
    USING INDEX PK_GENRE_ID ;

ALTER TABLE CUSTSALES 
    ADD CONSTRAINT FK_CUSTSALES_GENRE_ID FOREIGN KEY 
    ( 
     GENRE_ID
    ) 
    REFERENCES GENRE ( GENRE_ID ) 
    NOT DEFERRABLE;
-----------------------------

--create the movie table

CREATE TABLE MOVIE 
    ( 
     MOVIE_ID     NUMBER , 
     TITLE        VARCHAR2 (200) , 
     BUDGET       NUMBER , 
     GROSS        NUMBER , 
     LIST_PRICE   NUMBER , 
     GENRES       VARCHAR2 (4000) , 
     SKU          VARCHAR2 (30) , 
     YEAR         NUMBER , 
     OPENING_DATE DATE , 
     VIEWS        NUMBER , 
     CAST         VARCHAR2 (4000) , 
     CREW         VARCHAR2 (4000) , 
     STUDIO       VARCHAR2 (4000) , 
     MAIN_SUBJECT VARCHAR2 (4000) , 
     AWARDS       VARCHAR2 (4000) , 
     NOMINATIONS  VARCHAR2 (4000) , 
     RUNTIME      NUMBER , 
     SUMMARY      VARCHAR2 (16000) 
    );

ALTER TABLE MOVIE 
    ADD CONSTRAINT MOVIE_GENRE_JSON 
    CHECK ( genres IS JSON);
ALTER TABLE MOVIE 
    ADD CONSTRAINT MOVIE_CAST_JSON 
    CHECK ( cast IS JSON);

ALTER TABLE MOVIE 
    ADD CONSTRAINT MOVIE_CREW_JSON 
    CHECK ( crew IS JSON);

ALTER TABLE MOVIE 
    ADD CONSTRAINT MOVIE_STUDIO_JSON 
    CHECK ( studio IS JSON);

ALTER TABLE MOVIE 
    ADD CONSTRAINT MOVIE_AWARDS_JSON 
    CHECK ( awards IS JSON);

ALTER TABLE MOVIE 
    ADD CONSTRAINT MOVIE_NOMINATIONS_JSON 
    CHECK ( nominations IS JSON);


CREATE UNIQUE INDEX PK_MOVIE_ID ON MOVIE 
    ( 
     MOVIE_ID ASC 
    );

ALTER TABLE MOVIE 
    ADD CONSTRAINT PK_MOVIE_ID PRIMARY KEY ( MOVIE_ID ) 
    USING INDEX PK_MOVIE_ID ;

ALTER TABLE CUSTSALES 
    ADD CONSTRAINT FK_CUSTSALES_MOVIE_ID FOREIGN KEY 
    ( 
     MOVIE_ID
    ) 
    REFERENCES MOVIE ( MOVIE_ID ) 
    NOT DEFERRABLE;
