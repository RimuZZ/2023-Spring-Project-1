--primary key erd랑 다르게 추가
CREATE TABLE CART(
    cart_num number(5)not null,
    product_num number(5) not null,
    user_id VARCHAR2(200) not null,
    product_count number(3) not null,
    product_check number(1) DEFAULT 1,
    PRIMARY KEY(cart_num)
);
drop table cart;
