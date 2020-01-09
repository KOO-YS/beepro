-- DROP 쿼리 3번 실행해야 모든 테이블이 삭제됨


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
DROP TABLE volunteer;
DROP TABLE post;
DROP TABLE msg;


DROP SEQUENCE ISSUE_SEQ;
DROP SEQUENCE PROJECT_SEQ;
DROP SEQUENCE TODO_SEQ;
DROP SEQUENCE MESSAGE_SEQ;
DROP SEQUENCE COMMENTS_SEQ;
DROP SEQUENCE PROJECTM_SEQ;
DROP SEQUENCE MSG_SEQ;
-- #####################################################################################################################################

CREATE SEQUENCE PROJECTM_SEQ -- 프로젝트 매칭 글에 대한 시퀀스번호
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

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
  
CREATE SEQUENCE personal_SEQ
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

CREATE SEQUENCE TODO_SEQ
	START WITH 1
	INCREMENT BY 1
	MAXVALUE 10000
	MINVALUE 1
	NOCYCLE;

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
	
    
-- #####################################################################################################################################


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

ALTER TABLE BEEPRO_USER ADD (naver_ck VARCHAR2(6)); 

SELECT * FROM BEEPRO_USER;

CREATE TABLE message (
	message_seq	number	PRIMARY KEY,
    send_id	varchar2(100)	NOT NULL,
	get_id	varchar2(100)	NOT NULL,
	content	varchar2(4000)	NOT NULL,
	regdate	DATE	NOT NULL,
	read_ck number
);


CREATE TABLE heart (
	send_id	varchar2(100)	NOT NULL,
	get_id	varchar2(100)	NOT NULL
);



CREATE TABLE project_member ( /* 프로젝트 구성원 = pm이 프로젝트 지원자들 중 수락한 회원들이 담기는 곳 */
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

CREATE TABLE matching_project ( /* 프로젝트 매칭 공고글 */
	projectM_seq	number	PRIMARY KEY,
	pm_id	varchar2(100)	NOT NULL,
	title	varchar2(300)	NOT NULL, 
	content	varchar2(4000)	NOT NULL,
	skill	varchar2(4000),
	need_person	varchar2(200)	NOT NULL,
	location	varchar2(300),	
	startdate	varchar2(100),
	enddate		varchar2(100)
);

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

CREATE TABLE project ( /* 프로젝트 생성할 때 사용하는 테이블  */
	project_seq	number	PRIMARY KEY, /* 프로젝트 시퀀스 번호 */
	startdate	varchar2(600)	NOT NULL,
	enddate	varchar2(600)	NOT NULL,
	finish_ck	varchar2(6)	NOT NULL, /* 프로젝트 진행 여부 y:종료 n:진행중 */
	project_name varchar2(4000), /* 프로젝트 명 */
	project_content varchar2(4000), /* 프로젝트 개요 */
	member_id	varchar2(1000)	NOT NULL, /* 구성원들 */
	pm_ck	varchar2(6)	NOT NULL, /* 피엠인지 아닌지 */
	CONSTRAINT pm_ck_chk CHECK(pm_ck IN('Y','N')),
	CONSTRAINT finish_ch_chk CHECK(finish_ck IN('Y','N'))
);

select * from issue;

CREATE TABLE issue (
	issue_seq	number	NOT NULL,
	project_seq	number	NOT NULL,
	title	varchar2(500)	NOT NULL,
	writer	varchar2(30)	NOT NULL,
	issue_level	varchar2(50)	NOT NULL,
	regdate	Date	NOT NULL,
	issue_category	varchar2(150)	NOT NULL,
	content	varchar2(4000)	NOT NULL,
	responsibility varchar2(3000) NOT NULL -- 담당자
);

CREATE TABLE comments (
    project_seq number NOT NULL,
	comments_seq	number,
	issue_seq	number	NOT NULL,
	writer	varchar2(30)	NOT NULL,
	content	varchar2(2000)	NOT NULL,
	regdate	DATE	NOT NULL
);

CREATE TABLE skill (
	personal_seq	number	NOT NULL,
	user_id     varchar2(100)	NOT NULL,
	backend 	varchar2(1000),
	frontend	varchar2(1000)	
);

CREATE TABLE volunteer ( /* 지원자 테이블 */
    projectM_seq number NOT NULL, /* 프로젝트 매칭 공고 글 시퀀스 번호 */
	user_id varchar2(100) PRIMARY KEY, /* 회원 id */
	accept varchar2(6) NOT NULL, /* 수락 여부  */
	CONSTRAINT accept_chk CHECK(accept IN('Y','N')),
	CONSTRAINT FK_PROJECTM_SEQ_TO_VOL FOREIGN KEY (projectM_seq) REFERENCES matching_project (projectM_seq), 
	CONSTRAINT FK_USER_ID_TO_VOL FOREIGN KEY (user_id) REFERENCES beepro_user (user_id)
);

-- 쪽지 테이블 추가
CREATE SEQUENCE meg_seq;

CREATE TABLE msg(
    msg_seq NUMBER(30) PRIMARY KEY,
    send_id VARCHAR2(50) NOT NULL,
    get_id VARCHAR2(50) NOT NULL,
    content VARCHAR2(2000) NOT NULL,
    regdate DATE NOT NULL,
    read_ck NUMBER, -- 0이면 안읽은 것 1이면 읽은 것
    sdelete_ck varchar2(6)	NOT NULL,  -- 보낸 메세지함에서 지웠는지
	gdelete_ck varchar2(6)	NOT NULL,  -- 받은 메세지함에서 지웠는지
    CONSTRAINT sdelete_ck_chk CHECK(sdelete_ck IN('Y','N')),
    CONSTRAINT gdelete_ck_chk CHECK(gdelete_ck IN('Y','N'))
);

------------------------------------- 관심 게시글 (post) 추가 !!  %제약조건도 추가해주셔야합니다. %----------------------------------
CREATE TABLE post (
	u_id  varchar2(50) NOT NULL,	-- 해당하는 사람의 관심 목록
    type    varchar2(20) NOT NULL,	-- 사람매칭 or 플젝매칭 게시글인지 구분
	post_no  number		NOT NULL	-- 게시글 번호
);
ALTER TABLE post ADD CONSTRAINT PK_POST PRIMARY KEY (
	u_id,
	type,
    post_no
);
------------------------------------------------------------------------------------------------------------

ALTER TABLE heart ADD CONSTRAINT PK_HEART PRIMARY KEY (send_id,get_id);

ALTER TABLE project_member ADD CONSTRAINT PK_PROJECT_MEMBER PRIMARY KEY (project_seq,member_id);

ALTER TABLE issue ADD CONSTRAINT PK_ISSUE PRIMARY KEY (
	issue_seq,
	project_seq
);

ALTER TABLE comments ADD CONSTRAINT PK_COMMENTS PRIMARY KEY (
	comments_seq,
	issue_seq,
	project_seq
);

ALTER TABLE todo ADD CONSTRAINT PK_TODO PRIMARY KEY (
	todo_seq,
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

<!--ALTER TABLE BEEPRO_USER ADD (naver_ck VARCHAR2(6));-->