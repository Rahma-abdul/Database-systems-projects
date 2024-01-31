select name from member
where join_date>='2000-09-01';

select * from member
where join_date>='1995-10-01'AND join_date<'2019-10-01';

select b.book_id,b.title,b.price,b.pub_id,b.category_id from publisher p inner join book b
on b.pub_id= p.pub_id
where name = 'Oxford' or (b.price>15.00 And b.price<20.00)  ;

