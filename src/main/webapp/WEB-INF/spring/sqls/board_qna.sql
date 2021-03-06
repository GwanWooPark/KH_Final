DROP TABLE BOARDQNA;

CREATE SEQUENCE BQNUMSEQ;
CREATE SEQUENCE BQGROUPNUMSEQ;


DROP SEQUENCE BQNUMSEQ;
DROP SEQUENCE BQGROUPNUMSEQ;



CREATE TABLE BOARDQNA (
	BQ_NUM	NUMBER	PRIMARY KEY,
	BQ_TITLE	VARCHAR2(1000)	NOT NULL,
	BQ_CONTENT	VARCHAR2(4000)	NOT NULL,
	BQ_REGDATE	DATE	NOT NULL,
	MEMBER_ID	VARCHAR2(500)	NOT NULL,
	BQ_GROUPNO NUMBER NOT NULL,
	BQ_GROUPSEQ NUMBER NOT NULL,
	BQ_TITLETAB NUMBER NOT NULL
);


SELECT * FROM BOARDQNA ORDER BY  BQ_GROUPNO DESC, BQ_TITLETAB ASC ;