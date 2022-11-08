create database online_pizza_orders;


-- TABLES SECTION
CREATE TABLE `online_pizza_orders`.`menu` (
    `menu_id` INT NOT NULL,
    `pizza` VARCHAR(100) NULL,
    `price` DECIMAL(6 , 2 ) NULL,
    PRIMARY KEY (`menu_id`)
);

select * from menu;

-- ADDING DATA TO THE  MENU TABLE
insert into menu (menu_id,pizza,price)
values (1,"Pepperoni & Cheese",7.99);
select * from menu;
insert into menu (menu_id,pizza,price)
values(2,"Vegetarian",9.99);
select * from menu;
insert into menu (menu_id,pizza,price)
values(3,"Meat Lovers",14.99);
insert into menu (menu_id,pizza,price)
values(4,"Hawaiian",12.99);
select * from menu;








create table `online_pizza_orders`.`customers`(
`customer_id` INT NOT NULL,
`first_name` VARCHAR(45) NULL,
`last_name` VARCHAR(45) NULL,
`phone_number` VARCHAR(45) NULL,
PRIMARY KEY(`customer_id`)
);

-- ADD DATA INTO THE CUSTOMERS TABLE
insert into customers(customer_id,first_name,last_name,phone_number)
values(1,"Trevor","Page", "226-555-4982");
insert into customers(customer_id,first_name,last_name,phone_number)
values(2,"John","Doe","555-555-9498");
select * from customers;


CREATE TABLE `online_pizza_orders`.`transactions` (
    `transaction_id` INT NOT NULL,
    `pizza` VARCHAR(45) NULL,
    `date` DATE NULL,
    `time` TIME NULL,
    `total` DECIMAL(6 , 2 ) NULL,
    PRIMARY KEY (`transaction_id`)
);

ALTER TABLE `online_pizza_orders`.`transactions` 
CHANGE COLUMN `pizza` `pizza` VARCHAR(45) NULL DEFAULT NULL AFTER `time`;

select * from transactions;
-- ADD DATA TO TRANSACTIONS TABLE
insert into transactions(transaction_id,date,time,pizza,total)
values(1,"2014-09-10","09:47:00","Pepperoni & Cheese, Meat Lovers",22.98);
insert into transactions(transaction_id,date,time,pizza,total)
values(2,"2014,09,10","13:20:00","Vegetarian,Meat Lovers(2)", 39.97);
select * from transactions;
insert into transactions(transaction_id,date,time,pizza,total)
values(3,"2014-09-10","9:47:00","Meat Lovers, Hawaiian",27.98);


CREATE TABLE `menu_transactions` (
    `menu_id` INT NOT NULL,
    `transaction_id` INT NOT NULL,
    FOREIGN KEY (menu_id)
        REFERENCES menu (menu_id),
    FOREIGN KEY (transaction_id)
        REFERENCES transactions (transaction_id)
);

alter table transactions
add column customer_id INT NOT NULL;

alter table transactions
add foreign key(customer_id) references customers(customer_id);

update `online_pizza_orders`.`transactions` set `customer_id` = 1 where (`transaction_id` = "1");
update `online_pizza_orders`.`transactions` set `customer_id` = 2 where (`transaction_id` = "2");
update `online_pizza_orders`.`transactions` set `customer_id` = 1 where (`transaction_id` = "3");

select customer_id,sum(total) from transactions
group by customer_id;

select customer_id, count(transaction_id),date,sum(total) from transactions
group by customer_id,date;

