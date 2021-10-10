USE custdb;
CREATE TABLE customer_lastmodified as select * from customer;
ALTER TABLE customer_lastmodified add column upddt timestamp;
update customer_lastmodified1 set upddt=CURRENT_TIMESTAMP where custid>0;
