 
  create table branch(branch_name varchar2(20) NOT NULL primary key, branch_city varchar2(20),assets number(10,2));
  desc branch;
  
  create table account(acc_no number(8) primary key,branch_name references branch(branch_name),balance number(10,3));
  desc account;
  --references represents foreign key (a foreign key is primary key of other tabel)
  
create table customer(cust_name varchar2(15)primary key,cust_street varchar2(10),cust_city varchar2(10));
desc customer;

create table depositer(cust_name references customer(cust_name),acc_no references account(acc_no) on delete cascade);
desc depositer;
-- here on delete cascade is used to delete secondary key when primary key is deleted
--because first you have to delete foreign key than only you can delete primary key

create table loan(loan_no number(8)primary key,branch_name references branch(branch_name),amount number(10,3));
desc loan;

create table borrower(cust_name varchar2(15) references customer(cust_name),loan_no references loan(loan_no));
desc borrower;
-- alter table table_name drop column column_name
--delete from table_name where condition
--create a function than can change the amount of user 