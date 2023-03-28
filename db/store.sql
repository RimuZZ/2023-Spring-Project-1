CREATE TABLE STORE(
    store_snum NUMBER(5) not null,
    seller_id VARCHAR2(200) not null,
    store_sname VARCHAR2(200) not null,
    store_product_count NUMBER(5) DEFAULT 0,
    store_sellcount NUMBER(10) DEFAULT 0,
    store_sales NUMBER(15) DEFAULT 0,
    PRIMARY KEY(store_snum)  
);

CREATE SEQUENCE STORE_SNUM_SEQ
START WITH 1
INCREMENT BY 1
MINVALUE 1;
--초기값을 임의로 넣기 위함
--INSERT INTO STORE(store_snum, seller_id, store_sname) VALUES(STORE_SNUM_SEQ.nextval, 'korea', '종근당');