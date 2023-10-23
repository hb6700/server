--AuthTest > script.sql

DROP TABLE tblBouns;
DROP TABLE tblUser;

SELECT * FROM user_constraints WHERE table_name = 'TBLUSER';

SELECT constraint_name, table_name, r_constraint_name FROM user_constraints WHERE constraint_name = '';

SELECT * FROM tblUser;

CREATE table tblUser(
	id varchar2(30) PRIMARY KEY,		--아이디(pk)
	pw varchar2(30) NOT NULL,			--암호
	name varchar2(30) NOT NULL,			--이름
	lv number(1) NOT null				--등급(1. 일반, 2. 관리자)
);

INSERT INTO tblUser values('hong', '1111','홍길동', 1);
INSERT INTO tblUser values('test', '1111','테스트', 1);
INSERT INTO tblUser values('admin', '1111','관리자', 2);

commit;

--없는 데이터
select * from tblUser where id = 'aaa' and pw = '1234';
--있는 데이터
select * from tblUser where id = 'hong' and pw = '1111';