use Food_Stall;

show tables;

select * from stall_29;

CREATE TABLE stall_29 (
  bill_no int PRIMARY KEY AUTO_INCREMENT,
  name varchar(30) NOT NULL,
  quantity int DEFAULT NULL,
  price int DEFAULT NULL
);

show create table stall_29;

select name as Name, sum(price) as Amount, count(quantity) as Quantity from stall_29 group by name;