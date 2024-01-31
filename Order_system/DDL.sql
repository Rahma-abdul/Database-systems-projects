Create database Orders ;
Use Orders;

Create table customer(
	customer_id int not null,
	customer_name varchar(255) not null,    
    city varchar(255) not null
);

Create table `order`(
	order_id int not null,
	order_date date not null ,  
    customer_id int not null
);

Create table order_item(
	order_id int not null,
	item_id int not null,
	quantity int not null  
);

Create table item(
	item_id int not null,
	unit_price decimal(10,2) not null
);

Create table shipment(
	order_id int not null,
    warehouse_id int not null,
	ship_date date not null
);

Create table warehouse(
	warehouse_id int not null,
    warehouse_city varchar(255) not null
);

Alter table customer add primary key (customer_id);
Alter table `order` add primary key (order_id);
Alter table item add primary key (item_id);
Alter table warehouse add primary key (warehouse_id);

alter table `order` add foreign key (customer_id) references customer(customer_id);
alter table order_item add foreign key (order_id) references `order`(order_id);
alter table order_item add foreign key (item_id) references item(item_id);
alter table shipment add foreign key (order_id) references `order`(order_id);
alter table shipment add foreign key (warehouse_id) references warehouse(warehouse_id);


alter table order_item add primary key(item_id,order_id)
