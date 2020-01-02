DROP TABLE beepro_user;
DROP TABLE message;
DROP TABLE heart;
DROP TABLE comments;
DROP TABLE todo;
DROP TABLE project;
DROP TABLE matching_personal;
DROP TABLE matching_project;
DROP TABLE issue;
DROP TABLE skill;
DROP TABLE project_member;

SELECT * FROM COMMENTS;

DROP SEQUENCE ISSUE_SEQ;
DROP SEQUENCE PROJECT_SEQ;
DROP SEQUENCE TODO_SEQ;

--location, skill 而щ읆�� not null �젣�빟議곌굔 �븞嫄몄뼱 �몺

--CREATE SEQUENCE USER_SEQ
--  START WITH 1
--  INCREMENT BY 1
--  MAXVALUE 10000
--  MINVALUE 1
--  NOCYCLE;

CREATE SEQUENCE ISSUE_SEQ
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;
  
CREATE SEQUENCE PROJECT_SEQ
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

-- 異붽�
CREATE SEQUENCE TODO_SEQ
	START WITH 1
	INCREMENT BY 1
	MAXVALUE 10000
	MINVALUE 1
	NOCYCLE;

--異붽�
CREATE SEQUENCE MESSAGE_SEQ
	START WITH 1
	INCREMENT BY 1
	MAXVALUE 10000
	MINVALUE 1
	NOCYCLE;	

CREATE SEQUENCE COMMENTS_SEQ
	START WITH 1
	INCREMENT BY 1
	MAXVALUE 10000
	MINVALUE 1
	NOCYCLE;
	
CREATE TABLE beepro_user (
    user_id varchar2(100)	PRIMARY KEY,
    pwd	varchar2(100)	NOT NULL,
    name	varchar2(400)	NOT NULL,
	email	varchar2(300)	NOT NULL,
	emailHash	varchar2(300)	NOT NULL,
	location	varchar2(300),
	email_ck	varchar2(6)	NOT NULL,
	userProfile varchar2(1000),
	CONSTRAINT email_ck_chk CHECK(email_ck IN('Y','N'))
);

INSERT INTO BEEPRO_USER VALUES ('bmi6638@naver.com', '1234' , '김보미', 'bmi6638@naver.com', 'null' , '구리', 'Y');

SELECT * FROM BEEPRO_USER;
delete from BEEPRO_USER where user_id = 'test3';
UPDATE BEEPRO_USER SET email_ck = 'Y' WHERE name='예지';




SELECT * FROM beepro_user;

CREATE TABLE message (
	message_seq	number	PRIMARY KEY,
    send_id	varchar2(100)	NOT NULL,
	get_id	varchar2(100)	NOT NULL,
	content	varchar2(4000)	NOT NULL,
	regdate	DATE	NOT NULL
	read_ck number
);

CREATE TABLE heart (
	send_id	varchar2(100)	NOT NULL,
	get_id	varchar2(100)	NOT NULL
);

CREATE TABLE project_member (
	project_seq	number	NOT NULL,
	member_id	varchar2(100)	NOT NULL,
	pm_ck	varchar2(6)	NOT NULL,
	CONSTRAINT pm_ck_chk CHECK(pm_ck IN('Y','N'))
);

CREATE TABLE matching_personal (
	personal_seq	number	NOT NULL,
	user_id	varchar2(100)	NOT NULL,
	skill	varchar2(4000),
	emp_category	varchar2(1000) NOT NULL,
	title	varchar2(500)	NOT NULL,
	content	varchar2(4000)	NOT NULL
);

CREATE TABLE matching_project (
	project_seq	number	PRIMARY KEY,
	pm_id	varchar2(100)	NOT NULL,
	title	varchar2(300)	NOT NULL, 
	content	varchar2(4000)	NOT NULL,
	skill	varchar2(4000),
	need_person	varchar2(200)	NOT NULL,
	location	varchar2(300),	
	startdate	varchar2(100),
	enddate		varchar2(100)
);

INSERT INTO MATCHING_PROJECT VALUES (PROJECT_SEQ.NEXTVAL, 'bmi6638@naver.com', '첫번째 프로젝트입니다.', '프로젝트 테스트입니다', '프론트앤드', '충청도');

SELECT * FROM MATCHING_PROJECT;

CREATE TABLE comments (
	comments_seq	number,
	issue_seq	number	NOT NULL,
	writer	varchar2(30)	NOT NULL,
	content	varchar2(2000)	NOT NULL,
	regdate	DATE	NOT NULL
);


INSERT INTO COMMENTS VALUES (COMMENTS_SEQ.NEXTVAL, ISSUE_SEQ.NEXTVAL, '작성자', 'TEST', TO_DATE(SYSDATE,'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO COMMENTS VALUES (COMMENTS_SEQ.NEXTVAL, ISSUE_SEQ.NEXTVAL, 'd', 'werwerwerwerwer', TO_DATE(SYSDATE,'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO COMMENTS VALUES (COMMENTS_SEQ.NEXTVAL, ISSUE_SEQ.NEXTVAL,'ddd','ddd',SYSDATE);

SELECT * FROM COMMENTS;

delete from comments;

drop table comments;
-- 吏꾪뻾�긽�깭, �슦�꽑�닚�쐞 (以묒슂�룄) 異붽�
CREATE TABLE todo (
	todo_seq	number	NOT NULL,
	project_seq	number	NOT NULL,
	manager	varchar2(30)	NOT NULL,
	title	varchar2(500)	NOT NULL,
    content	varchar2(4000)	NOT NULL,
	startdate	DATE	NOT NULL,
	enddate		DATE	NOT NULL,
	category	varchar2(200)	NOT NULL,
	status	varchar2(200)	NOT NULL,
	priority	number NOT NULL,
	finish_ck	varchar2(6)	NOT NULL,
	CONSTRAINT finish_ck_chk CHECK(finish_ck IN('Y','N'))
);
select * from todo;

CREATE TABLE project (
	project_seq	number	PRIMARY KEY,
	startdate	date	NOT NULL,
	enddate	date	NOT NULL,
	finish_ck	varchar2(6)	NOT NULL,
	CONSTRAINT finish_ch_chk CHECK(finish_ck IN('Y','N'))
);

-- 프로젝트 이름 컬럼 추가
ALTER TABLE PROJECT ADD PROJECT_NAME VARCHAR2(4000);

select * from project;

INSERT INTO PROJECT VALUES (PROJECT_SEQ.NEXTVAL, '19/11/12', '19/12/20', 'Y');

delete from project;

CREATE TABLE issue (
	issue_seq	number	NOT NULL,
	project_seq	number	NOT NULL,
	title	varchar2(500)	NOT NULL,
	writer	varchar2(30)	NOT NULL,
	issue_level	varchar2(50)	NOT NULL,
	regdate	Date	NOT NULL,
	issue_category	varchar2(150)	NOT NULL,
	content	varchar2(4000)	NOT NULL
);

SELECT * FROM ISSUE;

INSERT INTO ISSUE VALUES (ISSUE_SEQ.NEXTVAL, '4', '해인 프로젝트', '전해인', '높음','15/11/30','버그', '이슈테스트2입니다.');

INSERT INTO ISSUE VALUES (ISSUE_SEQ.NEXTVAL, '4', '지민', '또나야나', '높음','15/11/30','버그', '이슈테스트2입니다.');

INSERT INTO ISSUE VALUES (ISSUE_SEQ.NEXTVAL, '4', '김봄 프로젝트 ', '김보미', '낮음','15/11/30','테스트케이스', '이슈테스트2');

INSERT INTO ISSUE VALUES (ISSUE_SEQ.NEXTVAL, '4', '얀스 프로젝트 ', '구연수', '높음','15/11/30','요구사항', '이슈테스트2');

INSERT INTO ISSUE VALUES (ISSUE_SEQ.NEXTVAL, '4', '예즤 프로젝트 ', '이예지', '보통','15/11/30','개선', '이슈테스트2');

INSERT INTO ISSUE VALUES (ISSUE_SEQ.NEXTVAL, '4', '유나 프로젝트 ', '추유나', '보통','15/11/30','테스트케이스', '이슈테스트2');

CREATE TABLE skill (
	personal_seq	number	NOT NULL,
	user_id     varchar2(100)	NOT NULL,
	backend 	varchar2(1000),
	frontend	varchar2(1000)	
);



-- 蹂듯빀 湲곕낯�궎 異붽�

ALTER TABLE heart ADD CONSTRAINT PK_HEART PRIMARY KEY (send_id,get_id);

ALTER TABLE project_member ADD CONSTRAINT PK_PROJECT_MEMBER PRIMARY KEY (project_seq,member_id);

ALTER TABLE comments ADD CONSTRAINT PK_COMMENTS PRIMARY KEY (
	comments_seq,
	issue_seq,
	project_seq
);

ALTER TABLE todo ADD CONSTRAINT PK_TODO PRIMARY KEY (
	todo_seq,
	project_seq
);


ALTER TABLE issue ADD CONSTRAINT PK_ISSUE PRIMARY KEY (
	issue_seq,
	project_seq
);

ALTER TABLE matching_personal ADD CONSTRAINT PK_MATCHING_PERSONAL PRIMARY KEY (
	personal_seq,
	user_id
);


ALTER TABLE skill ADD CONSTRAINT PK_SKILL PRIMARY KEY (
	personal_seq,
	user_id
);


-- �쇅�옒�궎 異붽�

ALTER TABLE heart ADD CONSTRAINT FK_beepro_user_TO_heart_1 FOREIGN KEY (send_id) REFERENCES beepro_user (user_id);

ALTER TABLE heart ADD CONSTRAINT FK_beepro_user_TO_heart_2 FOREIGN KEY (get_id) REFERENCES beepro_user (user_id);

ALTER TABLE comments ADD CONSTRAINT FK_issue_TO_comments_1 FOREIGN KEY (issue_seq,project_seq) REFERENCES issue (issue_seq,project_seq);

ALTER TABLE todo ADD CONSTRAINT FK_project_TO_todo_1 FOREIGN KEY (project_seq) REFERENCES project (project_seq);

ALTER TABLE matching_personal ADD CONSTRAINT FK_user_TO_match_personal FOREIGN KEY (user_id) REFERENCES beepro_user (user_id);

ALTER TABLE matching_project ADD CONSTRAINT FK_user_TO_match_project FOREIGN KEY (pm_id) REFERENCES beepro_user (user_id);

ALTER TABLE issue ADD CONSTRAINT FK_project_TO_issue_1 FOREIGN KEY (project_seq) REFERENCES project (project_seq);

ALTER TABLE skill ADD CONSTRAINT FK_match_per_TO_skill_1 FOREIGN KEY (personal_seq,user_id) REFERENCES matching_personal (personal_seq,user_id);

ALTER TABLE project_member ADD CONSTRAINT FK_project_TO_project_mem FOREIGN KEY (project_seq) REFERENCES project (project_seq);

ALTER TABLE project_member ADD CONSTRAINT FK_user_TO_project_mem FOREIGN KEY (member_id) REFERENCES beepro_user (user_id);

COMMIT;


SELECT * FROM matching_project;

SELECT SYSDATE AS BASIC , TO_DATE(SYSDATE, 'YYYY.MM.DD HH24:MI:SS') FROM DUAL;


