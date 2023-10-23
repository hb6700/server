--Todo -> script.sql

drop table tblTodo;
drop sequence seqTodo;

--할 일 테이블
create table tblTodo(
    seq number primary key,
    todo varchar2(1000) not null,
    state char(1) default 'n' not null,
    regdate date default sysdate not null
);

create sequence seqTodo;

insert into tblTodo(seq, todo, state, regdate) values(seqTodo.nextVal, '할일입니다.', default, default);

select * from tblTodo order by seq desc;
select * from tblTodo order by state asc, seq desc;

update tblTodo set state = 'y' where seq = 7;

delete from tblTodo where seq = 1;

commit;
