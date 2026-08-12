create table customers (
customer_id serial primary key,
first_name varchar(50) not null,
last_name varchar(50) not null,
email varchar(50) unique,
phone varchar(10) not null
);
create table products (
product_id serial primary key,
product_name varchar(50) not null,
category varchar(50),
unit_price numeric(10,2) not null
);
create table locations
(
location_id serial primary key,
city varchar(50) not null,
state varchar(50),
country varchar(50) not null
);