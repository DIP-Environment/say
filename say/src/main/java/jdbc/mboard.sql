create table member1(
memberid varchar(50) primary key,
name varchar(50) not null,
password varchar(10) not null,
regdate datetime not null
)DEFAULT CHARSET=utf8;

select * from member1;

create table say_article(
	article_no int auto_increment primary key,
	writer_id varchar(50) not null,
	writer_name varchar(50) not null,
	title varchar(255) not null,
	regdate datetime not null,
	moddate datetime not null
);

create table say_article_content(
	article_no int primary key,
	content text
);

select * from say_article;

select * from say_article_content

select last_insert_id() from say_article;

//limit ���۹�ȣ(0����), size
select * from article order by article_no desc limit 0,2;

select * from article_content where article_no = 7;

select now();


// 댓글기능구현테이블
// 작성자 이름, 내용, 날짜
create table ajax_comment(
	num int auto_increment primary key,
	writer varchar(50),
	content varchar(500),
	write_date datetime not null
)

INSERT INTO ajax_comment VALUES("김태우","안녕하세요",now())
UPDATE ajax_comment set writer="김태우", content="안녕하세세세요?" where num=1;
DELETE FROM ajax_comment where num=1;




