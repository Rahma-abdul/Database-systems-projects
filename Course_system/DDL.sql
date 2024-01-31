Create database course_register ;
Use course_register;

Create table department(
	dept_id int primary key,
	dept_name varchar(255) not null
);

Create table student(
	student_id int primary key,
	student_name varchar(255) not null, 
    major varchar(255) not null,
    age int not null,
    level varchar(20) not null
);

Create table professor(
	prof_id int primary key,
	prof_name varchar(255) not null, 
    dept_id int not null
);


Create table course(
	course_code varchar(255) primary key,
	name varchar(255) not null
);

Create table semester_course(
	course_code varchar(255) not null,
   quarter varchar(20) not null,
	year int not null,
    prof_id int not null
);

Create table enrolled(
	student_id int not null,
	course_code varchar(255) not null,
    quarter varchar(20) not null,
	year int not null,
    enrolled_at date not null
);

alter table semester_course add primary key (course_code,quarter,year);
#alter table enrolled add primary key (student_id,course_code,`quarter`,`year`);

#alter table semester_course add unique (quarter, year);
#alter table enrolled add unique (student_id,course_code,quarter,year);


alter table professor add foreign key (dept_id) references department(dept_id);
alter table semester_course add foreign key (prof_id) references professor(prof_id);
alter table semester_course add foreign key (course_code) references course(course_code);
alter table enrolled add foreign key (student_id) references student(student_id);
alter table enrolled add foreign key (course_code,quarter,year) references semester_course(course_code, quarter,year);

#Why year has to be int? when date-->error duplicated??



