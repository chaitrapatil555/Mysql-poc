create database POC4;
use POC4;
create table author (
id int primary key,
name varchar(100)
);

create table post(
id int primary key,
name varchar(100),
authorid int,
createdts datetime,
foreign key(authorid) references author(id) on delete cascade
);

create table comment (
id int primary key,
content varchar(1000),
postid int,
createdts datetime,
userid int,
foreign key(userid) references user(id) on delete cascade,
foreign key(postid) references post(id) on delete cascade
);

create table user (
id int primary key,
name varchar(100)
);

insert into author(id,name)values(1,"James_Bond"),(2,"Chai"),(3,"Renuka");
select * from author;

insert into user(id,name) values(1,"deepa"),(2,"bhavan"),(3,"deepika");
select * from user;

select * from post;
insert into post(id,name,authorid,createdts) values(1,"Post",1,'2021-02-11 01:22:30'),(2,"new_post",2,'2021-03-12 02:30:12'),(3,"another_post",3,'2021-04-13 05:44:03');

insert into comment(id,content,postid,createdts,userid) values
(1,"mycomment",1,'2021-01-20 02:16:18',3),
(2,"mycomment2",1,'2021-02-21 03:17:20',2),
(3,"mycomment3",1,'2020-03-11 02:11:33',1),
(4,"mycomment4",1,'2021-02-21 04:15:15',1),
(5,"mycomment5",1,'2021-05-22 05:10:10',3),
(6,"mycomment6",1,'2021-06-30 06:19:20',2),
(7,"mycomment7",1,'2021-07-31 07:11:50',2),
(8,"mycomment8",1,'2021-08-22 01:44:20',3),
(9,"mycomment9",1,'2021-09-21 02:55:30',1),
(10,"mycomment10",1,'2021-10-03 02:13:43',1),
(11,"mycomment11",2,'2022-01-23 02:55:30',1),
(12,"mycomment12",3,'2021-06-24 05:55:30',1),
(13,"mycomment13",2,'2021-03-25 03:55:30',1),
(14,"mycomment14",3,'2021-09-26 07:55:30',1),
(15,"mycomment15",2,'2021-01-27 01:55:30',1);
select *from comment;

-- QUERY:
select * from 
(select p.id as pid,p.name,p.createdts as pdates,p.authorid,c.id as cid,c.content,c.createdts as cdates,c.userid,row_number() OVER (PARTITION BY p.id Order by p.createdts DESC) AS Sno  from post p left join comment c on c.postid=p.id 
where c.postid in 
(select p.id from post p left join author a on a.id=p.authorid 
where a.name="James_Bond") 
order by c.postid,c.createdts desc)aliasname where Sno<=10;









