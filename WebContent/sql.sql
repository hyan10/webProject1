-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

-- member Table Create SQL
CREATE TABLE t_member
(
    no          NUMBER          NOT NULL, 
    id          VARCHAR2(20)    NOT NULL, 
    password    VARCHAR2(20)    NULL, 
    name        VARCHAR2(20)    NOT NULL, 
    tel         VARCHAR2(20), 
    balance     NUMBER default 0,
    email       VARCHAR2(20),
    CONSTRAINT MEMBER_PK PRIMARY KEY (no)
)

INSERT INTO t_member (no, id, password, name, tel, balance, email) VALUES (01, 'id 01', 'password 01', 'name 01', 'tel 01', 01, 'email 01');
INSERT INTO t_member (no, id, password, name, tel, balance, email) VALUES (02, 'id 02', 'password 02', 'name 02', 'tel 02', 02, 'email 02');
INSERT INTO t_member (no, id, password, name, tel, balance, email) VALUES (03, 'id 03', 'password 03', 'name 03', 'tel 03', 03, 'email 03');
INSERT INTO t_member (no, id, password, name, tel, balance, email) VALUES (04, 'id 04', 'password 04', 'name 04', 'tel 04', 04, 'email 04');
INSERT INTO t_member (no, id, password, name, tel, balance, email) VALUES (05, 'id 05', 'password 05', 'name 05', 'tel 05', 05, 'email 05');
INSERT INTO t_member (no, id, password, name, tel, balance, email) VALUES (06, 'id 06', 'password 06', 'name 06', 'tel 06', 06, 'email 06');
INSERT INTO t_member (no, id, password, name, tel, balance, email) VALUES (07, 'id 07', 'password 07', 'name 07', 'tel 07', 07, 'email 07');
INSERT INTO t_member (no, id, password, name, tel, balance, email) VALUES (08, 'id 08', 'password 08', 'name 08', 'tel 08', 08, 'email 08');
INSERT INTO t_member (no, id, password, name, tel, balance, email) VALUES (09, 'id 09', 'password 09', 'name 09', 'tel 09', 09, 'email 09');
INSERT INTO t_member (no, id, password, name, tel, balance, email) VALUES (10, 'id 10', 'password 10', 'name 10', 'tel 10', 10, 'email 10');
INSERT INTO t_member (no, id, password, name, tel, balance, email) VALUES (11, 'id 11', 'password 11', 'name 11', 'tel 11', 11, 'email 11');
INSERT INTO t_member (no, id, password, name, tel, balance, email) VALUES (12, 'id 12', 'password 12', 'name 12', 'tel 12', 12, 'email 12');
INSERT INTO t_member (no, id, password, name, tel, balance, email) VALUES (13, 'id 13', 'password 13', 'name 13', 'tel 13', 13, 'email 13');
INSERT INTO t_member (no, id, password, name, tel, balance, email) VALUES (14, 'id 14', 'password 14', 'name 14', 'tel 14', 14, 'email 14');
INSERT INTO t_member (no, id, password, name, tel, balance, email) VALUES (15, 'id 15', 'password 15', 'name 15', 'tel 15', 15, 'email 15');
INSERT INTO t_member (no, id, password, name, tel, balance, email) VALUES (16, 'id 16', 'password 16', 'name 16', 'tel 16', 16, 'email 16');
INSERT INTO t_member (no, id, password, name, tel, balance, email) VALUES (17, 'id 17', 'password 17', 'name 17', 'tel 17', 17, 'email 17');
INSERT INTO t_member (no, id, password, name, tel, balance, email) VALUES (18, 'id 18', 'password 18', 'name 18', 'tel 18', 18, 'email 18');
INSERT INTO t_member (no, id, password, name, tel, balance, email) VALUES (19, 'id 19', 'password 19', 'name 19', 'tel 19', 19, 'email 19');
INSERT INTO t_member (no, id, password, name, tel, balance, email) VALUES (20, 'id 20', 'password 20', 'name 20', 'tel 20', 20, 'email 20');

create sequence t_member_seq start with 20 
drop sequence t_member_seq

insert into member
		(no, id, name) values (t_member_seq.nextVal, 'id21','name21')

-- group Table Create SQL
CREATE TABLE t_group
(
    no              NUMBER           NOT NULL, 
    name            VARCHAR2(20)     NULL, 
    members_list    VARCHAR2(200)    NULL, 
    CONSTRAINT GROUP_PK PRIMARY KEY (no)
)
/

COMMENT ON TABLE t_group IS '그룹별 회원리스트'
/


-- friend Table Create SQL
CREATE TABLE t_friend
(
    member_no    NUMBER    NOT NULL, 
    friend_no    NUMBER    NOT NULL, 
    CONSTRAINT t_FRIEND_PK PRIMARY KEY (member_no, friend_no)
)
/


ALTER TABLE t_friend
    ADD CONSTRAINT FK_friend_member_no_member_no FOREIGN KEY (member_no)
        REFERENCES t_member (no)
/

ALTER TABLE t_friend
    ADD CONSTRAINT FK_friend_friend_no_member_no FOREIGN KEY (friend_no)
        REFERENCES t_member (no)
/

INSERT INTO t_friend (member_no, friend_no) VALUES (01, 02);
INSERT INTO t_friend (member_no, friend_no) VALUES (01, 03);
INSERT INTO t_friend (member_no, friend_no) VALUES (01, 04);
INSERT INTO t_friend (member_no, friend_no) VALUES (02, 01);
INSERT INTO t_friend (member_no, friend_no) VALUES (02, 03);
INSERT INTO t_friend (member_no, friend_no) VALUES (02, 04);
INSERT INTO t_friend (member_no, friend_no) VALUES (02, 05);
INSERT INTO t_friend (member_no, friend_no) VALUES (01, 06);

-- deal_list Table Create SQL
CREATE TABLE t_deal_list
(
    no             NUMBER           NOT NULL, 
    comment        VARCHAR2(100)    NOT NULL, 
    sender_no      NUMBER           NOT NULL, 
    receiver_no    NUMBER           NOT NULL, 
    money          NUMBER           NOT NULL, 
    start_date     DATE             NOT NULL, 
    CONSTRAINT t_DEAL_LIST_PK PRIMARY KEY (no)
)
/

COMMENT ON TABLE t_deal_list IS '미완료된 거래내역(현재 진행)'
/

ALTER TABLE t_deal_list
    ADD CONSTRAINT FK_deal_list_sender_no_member_ FOREIGN KEY (sender_no)
        REFERENCES t_member (no)
/

ALTER TABLE t_deal_list
    ADD CONSTRAINT FK_deal_list_receiver_no_membe FOREIGN KEY (receiver_no)
        REFERENCES t_member (no)
/


-- deal_history Table Create SQL
CREATE TABLE t_deal_history
(
    no             NUMBER           NOT NULL, 
    sender_no      NUMBER           NOT NULL, 
    receiver_no    NUMBER           NOT NULL, 
    money          NUMBER           NOT NULL, 
    start_date     DATE             NOT NULL, 
    end_date       DATE             NOT NULL, 
    comments        VARCHAR2(100)    NOT NULL, 
    CONSTRAINT t_DEAL_HISTORY_PK PRIMARY KEY (no)
)
/

COMMENT ON TABLE t_deal_history IS '완료된 거래내역'
/

create sequence t_deal_history_seq


-- m_group_list Table Create SQL
CREATE TABLE t_m_group_list
(
    no            NUMBER          NOT NULL, 
    member_no     NUMBER          NULL, 
    group_list    VARCHAR2(20)    NULL, 
    CONSTRAINT t_M_GROUP_LIST_PK PRIMARY KEY (no)
)
/

COMMENT ON TABLE t_m_group_list IS '회원별 그룹리스트'
/

ALTER TABLE t_m_group_list
    ADD CONSTRAINT FK_m_group_list_member_no_memb FOREIGN KEY (member_no)
        REFERENCES t_member (no)
/


-- chat Table Create SQL
CREATE TABLE t_chat
(
    group_no     NUMBER            NOT NULL, 
    member_no    NUMBER            NOT NULL, 
    message      VARCHAR2(1000)    NOT NULL, 
    chat_date    DATE              NOT NULL
)
/

ALTER TABLE t_chat
    ADD CONSTRAINT FK_chat_group_no_group_no FOREIGN KEY (group_no)
        REFERENCES t_group (no)
/

select * from t_member
select * from t_deal_history
select * from t_friend
select * from t_deal_list

select * from t_member where no in
		(select friend_no from t_friend
		where member_no=1)
		
select *
from t_member m join t_friend f on m.no=f.member_no and f.member_no=m.no
where m.no=1

delete from t_member where no=23

update t_member set balance=0 where no=25;
update t_member set name='김하얀' where no=25;

insert into t_friend values(25, 1)
insert into t_friend values(25, 2)
insert into t_friend values(25, 4)

create sequence t_deal_list_seq