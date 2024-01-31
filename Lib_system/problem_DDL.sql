CREATE DATABASE Library;
Use Library;
Create table category(
	category_id int not null auto_increment,
	name varchar(255) not null unique,
	primary key (category_id)
    
);
Create table publisher(
	pub_id int not null auto_increment,
	name varchar(255) not null unique,
	address varchar(255) not null unique,
    primary key (pub_id)
);

Create table book(
	book_id int not null auto_increment,
    title varchar(255) not null,
    price decimal(10,2) not null,
    pub_id int not null,
    category_id int not null,
    primary key(book_id),
    foreign key (pub_id) references publisher(pub_id),
	foreign key (category_id) references category(category_id)
); 

Create table member(
	member_id int not null auto_increment,
	name varchar(255) not null unique,
	address varchar(255) not null unique,
    join_date date not null,
    primary key (member_id)
);

Create table borrowing_book(
	member_id int not null,
    book_id int not null,
    borrow_date date not null,
    due_date date not null,
	return_date date ,
    foreign key (member_id) references member(member_id),
	foreign key (book_id) references book(book_id),
    Unique(member_id,book_id,borrow_date)
);




