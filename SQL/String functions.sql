CREATE DATABASE student_detail;
use student_detail;
create table students(id int serial, 
name varchar(50), 
email varchar(20) UNIQUE,
contact_no bigint,
address varchar(50) DEFAULT 'abc colony');

INSERT into students(name, email, contact_no) VALUES
('abc','abc@gmail.com',384748283),
('def','def@gmail.com',384748223),
('qwe','qwe@gmail.com',384748244),
('rty','rty@gmail.com',384748255),
('uio','uio@gmail.com',384748266);

#string function test
select id, name,
upper(name), lower(name),
right(name,3), left(name,2),
trim(name),ltrim(name), rtrim(name),
concat_ws('-',left(name,3),left(id::text,2)),
concat(left(name,3), right(id::text,2)),
replace(name,'n','N'),
substring(name,2,3)
from students;