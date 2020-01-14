DROP TABLE heart;
DROP TABLE post;
DROP TABLE msg;

CREATE SEQUENCE meg_seq;
CREATE TABLE heart (
	send_id	varchar2(100)	NOT NULL,
	get_id	varchar2(100)	NOT NULL
);

CREATE TABLE post (
    u_id  varchar2(50) NOT NULL,
    type    varchar2(20) NOT NULL,
	post_no  varchar2(100)	NOT NULL
);

CREATE TABLE msg(
    msg_seg NUMBER(30) PRIMARY KEY,
    send_id VARCHAR2(50) NOT NULL,
    get_id VARCHAR2(50) NOT NULL,
    content VARCHAR2(2000) NOT NULL,
    regdate DATE NOT NULL,
    read_ck NUMBER -- 0이면 안읽은 것 1이면 읽은 것
);
ALTER TABLE post ADD CONSTRAINT PK_POST PRIMARY KEY (
	u_id,
	type,
    post_no
);


select * from heart;
select * from post;

select* from message;

select * from matching_personal; 
delete from matching_personal where personal_seq>41;
COMMIT;

select DISTINCT post_no from post  join matching_personal ON(u_id = user_id) where type='personal' AND u_id='qqq';

ALTER TABLE BEEPRO_USER ADD (skill VARCHAR2(4000));

ALTER TABLE MATCHING_PROJECT RENAME COLUMN PROJECT_SEQ TO PROJECTM_SEQ;
commit;

DEPARTMENT ON(DEPT_CODE = DEPT_ID);
