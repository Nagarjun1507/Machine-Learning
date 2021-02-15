create table customer(cust_name char(20), cust_id int primary key, mobile_no int, location varchar(40), cust_type char(10));
insert into customer values ("Raj", 1001, 87654389, "Bangalore", "Member");
select * from customer;
insert into customer values ("Mike", 1008, 94516754, "Bangalore", "Member");
insert into customer values ("Kumar", 1005, 87654389, "Mysore", "Member");
insert into customer values ("Praveen", 1009, 90215692, "Bangalore", "Member");
update customer set mobile_no = 89723421 where cust_id = 1005;
insert into customer values ("Manoj", 1012, 90892163, "Mysore", "Non-Member");
create table orders (product_line char(40), quantity int, rating int, cust_id int, foreign key (cust_id) references customer (cust_id));
select * from orders;
insert into orders values ("Electronics", 12, 8.2, 1008);
insert into orders values ("Lifestyle", 7, 7.5, 1008);
insert into orders values ("Travel", 1, 9, 1008);
update orders set quantity = 2 where cust_id = 1008;
rollback;
update orders set quantity = 7 where cust_id = 1008 and product_line = "Lifestyle";
update orders set quantity = 1 where cust_id = 1008 and product_line = "Travel";
insert into orders values ("Electronics", 1, 8, 1005);
insert into orders values ("Lifestyle", 12 , 6.8, 1005);
insert into orders values ("Lifestyle", 8 , 7.4, 1001);
insert into orders values ("Sports", 4 , 8.3, 1001);
insert into orders values ("Travel", 2 , 9.1, 1001);
insert into orders values ("Food", 8 , 8.1, 1009);
insert into orders values ("Sports", 3 , 8.5, 1009);
insert into orders values ("Electronics", 1 , 8.1, 1009);
insert into orders values ("Lefestyle", 8 , 7.3, 1009);
insert into orders values ("Food", 12 , 8.5, 1012);
insert into orders values ("Sports", 3 , 9, 1012);
insert into orders values ("Food", 10 , 8, 1005);
insert into orders values ("Food", 9 , 8.7, 1001);
insert into orders values ("Food", 6, 9, 1008);
insert into orders values ("Sports", 1, 8, 1005);
select product_line from orders;
select * from orders where cust_id = 1009;
update orders set product_line = "Lifestyle" where cust_id = 1009 and rating = 7;
commit;
create table payment(Payment_type char(20), Total_ int, cust_id int, foreign key (cust_id) references customer (cust_id));
insert into payment values ("E-Wallet", 23, 1001);
select * from payment;
alter table payment change Total_ Total_items int; 
insert into payment values ("Credit Card", 16, 1008);
insert into payment values ("E-Wallet", 24, 1005);
insert into payment values ("Cash", 20, 1009);
insert into payment values ("E-Wallet", 15, 1012);
select * from customer inner join orders on customer.cust_id=orders.cust_id inner join payment on orders.cust_id = payment.cust_id;

