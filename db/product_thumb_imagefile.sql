CREATE TABLE PRODUCT_THUMB_IMAGEFILE(
    FILE_NUMBER NUMBER(2) NOT NULL,
    PRODUCT_NUM NUMBER(5) NOT NULL,
    ORIGIN_FILE_NAME VARCHAR2(500),
    STORED_FILE_NAME VARCHAR2(500),
    PRIMARY KEY (FILE_NUMBER, PRODUCT_NUM)
);

CREATE TABLE PRODUCT_DETAIL_IMAGEFILE(
    FILE_NUMBER NUMBER(2) NOT NULL,
    PRODUCT_NUM NUMBER(5) NOT NULL,
    ORIGIN_FILE_NAME VARCHAR2(500),
    STORED_FILE_NAME VARCHAR2(500),
    PRIMARY KEY (FILE_NUMBER, PRODUCT_NUM)
);

select * from product_thumb_imagefile;
select * from product_detail_imagefile;
delete from product_detail_imagefile where origin_file_name is null;
delete from product_thumb_imagefile where origin_file_name is null;
ROLLBACK;