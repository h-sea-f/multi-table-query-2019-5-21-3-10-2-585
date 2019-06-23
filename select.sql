# 1.查询同时存在1课程和2课程的情况
select *
from student_course,student
where student_course.courseId in(select id
from course
where name='1课程') and 
                student_course.courseId in(select id
				from course
				where name='2课程') and student_course.studentId=student.id

# 2.查询同时存在1课程和2课程的情况

# 3.查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩
select id,name,avg(student_course.score) from student,student_course where 
student.id=student_course.studentId group by id  avg(student_course.score) >= 60

# 4.查询在student_course表中不存在成绩的学生信息的SQL语句
select * from student where id not in(
	select studentId from student_course
)

# 5.查询所有有成绩的SQL
select score from student_course

# 6.查询学过编号为1并且也学过编号为2的课程的同学的信息
select *
from student_course,student
where student_course.courseId in(select id
from course
where courseId=1) and 
                student_course.courseId in(select id
				from course
				where courseId=2) and student_course.studentId=student.id;

# 7.检索1课程分数小于60，按分数降序排列的学生信息
select * from student,student_course where student_course.studentId=student.id 
and student_course.courseId=1 and student_course.score<60 order by student_course.score desc

# 8.查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列
select avg(student_course.score) from student_course group by courseId order by avg(student_course.score) desc,courseId asc

# 9.查询课程名称为"数学"，且分数低于60的学生姓名和分数
select name,score from student,student_course,course
where student.id=student_course.studentId
and course.id=student_course.courseId
and course.name='数学'
and student_course.score<60;
