#n_status char(1) not null 1이면 일반글, 2이면 삭제글
#n_flage varchar(2) not null 1이면 회사공지사항, 2이면 회원공지사항
#n_ip varchar(60) not null

create table notice(
n_num int primary key auto_increment,
n_writer varchar(100) not null,
n_title varchar(200) not null,
n_content varchar(16384) not null,
n_regdate datetime not null
);

INSERT INTO notice(n_num,n_writer,n_title,n_content,n_regdate)
VALUES (null,'writer','title','content',NOW());

#select 할때는 항상 order by 와 date_format 을 해준다.
SELECT n_num, n_writer, n_title, n_content, date_format(n_regdate,'%Y/%m/%d')
FROM notice
ORDER BY n_num DESC;

UPDATE notice
SET n_title='title1', n_content='content1', n_regdate=NOW()
WHERE n_num=2

DELETE FROM notice
WHERE n_num=3;