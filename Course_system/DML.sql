#Find the names of students with level “SR” who are enrolled in a class taught by professor whose id=“1”.
select student_name
from student s
join enrolled e
on s.student_id = e.student_id
join semester_course sc
on e.course_code = sc.course_code and e.year =sc.year and e.quarter = sc.quarter
where s.level = 'SR' and sc.prof_id =1
group by student_name;

#Find the names of all students and their courses' name even if they weren’t enrolled in any course.
select student_name, name
from student
left join enrolled 
on student.student_id = enrolled.student_id
left join course 
on enrolled.course_code = course.course_code
#group by student_name,course.name
;

#Find the names of professors whose combined enrollment of all courses that they taught is less than five.
select prof_name , count(sc.course_code) as all_courses
from professor 
left join semester_course sc 
left join enrolled e
on e.course_code = sc.course_code and e.year =sc.year and e.quarter = sc.quarter
on sc.prof_id = professor.prof_id
group by professor.prof_name
having count(sc.course_code)< 5;

#Find students' names enrolled in all courses that professor with id="2" has taught.
select student_name
from student s
join enrolled e
on s.student_id = e.student_id
join semester_course sc
on e.course_code = sc.course_code
where sc.prof_id = 2
group by s.student_name
having count(distinct e.course_code) = 
(select count(distinct course_code)
from semester_course
where prof_id = 2);

#Find the names and ids of the professors that have enrolled in less than 2 courses and whose department is either 1,2,3,4
select p.prof_name ,p.prof_id
from professor p
left join semester_course sc
on sc.prof_id = p.prof_id
where p.dept_id = 1 or p.dept_id = 2 or p.dept_id = 3 or p.dept_id = 4
group by p.prof_id
having count(sc.course_code)< 2;

#Find course name, course code and professor name and id for courses that the same professor taught twice or more.
select c.name ,c.course_code,p.prof_name,p.prof_id
from professor p
join semester_course sc
on sc.prof_id = p.prof_id
join course c
on sc.course_code = c.course_code
group by sc.course_code ,p.prof_id
having count(c.course_code)>=2;

