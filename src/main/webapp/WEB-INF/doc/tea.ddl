DROP TABLE reply;
DROP TABLE board;
DROP TABLE categrp;
DROP TABLE member_word;
DROP TABLE crawling_data;
DROP TABLE word;
DROP TABLE log;
DROP TABLE member;

/**********************************/
/* Table Name: ȸ�� */
/**********************************/
CREATE TABLE member(
		memberno INT NOT NULL AUTO_INCREMENT,
		id VARCHAR(15) NOT NULL,
		name VARCHAR(15) NOT NULL,
		passwd VARCHAR(15) NOT NULL,
		phone VARCHAR(15),
		email VARCHAR(25) NOT NULL,
		birth VARCHAR(20) NOT NULL,
		sex CHAR(1) NOT NULL,
		grade CHAR(1) NOT NULL,
		PRIMARY KEY(memberno)
);


/********************* DML ���� *********************/

/* �� ���� ���ڵ� ��� */
INSERT INTO member(id, name, passwd, phone, email, birth, sex, grade) 
VALUES('admin', '������', '1234', '01021205548', 'ultimate1994@naver.com', '1994-03-17', 'M', 'A');

INSERT INTO member(id, name, passwd, phone, email, birth, sex, grade) 
VALUES('root', '�ڿ���', '1234', '01000000000', 'park@naver.com', '1993-00-00', 'M', 'A');

INSERT INTO member(id, name, passwd, phone, email, birth, sex, grade) 
VALUES('root2', 'girl', '1234', '01000000000', 'girl@gmail.com', '1993-00-00', 'F', 'A');

/* ��� ���ڵ� �˻� */
SELECT memberno, id, name, passwd, phone, email, birth, sex, grade
FROM member;

/* �˻� */
SELECT memberno, id, name, passwd, phone, email, birth, sex, grade
FROM member
WHERE email like "%naver%";

SELECT memberno, id, name, passwd, phone, email, birth, sex, grade
FROM member
WHERE name like "��%";

/* ����¡ */
SELECT memberno, id, name
FROM member
ORDER BY memberno ASC
LIMIT 0, 10;

SELECT memberno, id, name
FROM member
ORDER BY memberno ASC
LIMIT 10, 10;

/* �� �� ��ȸ */
SELECT memberno, id, name, passwd, phone, email, birth, sex, grade
FROM member
WHERE memberno=1;

/* ��ü ���ڵ� �� */
SELECT COUNT(*) as cnt
FROM member;

/* ���� */
UPDATE member
SET member.email='GPARK@naver.com'
WHERE memberno=2;

SELECT memberno, id, name, passwd, phone, email, birth, sex, grade
FROM member;

/* �� �� ���� */
DELETE FROM member
WHERE memberno=3;

SELECT memberno, id, name, passwd, phone, email, birth, sex, grade
FROM member;

---------������ ���̺� ����-----------
DELETE FROM log
WHERE memberno=3;

DELETE FROM member_word
WHERE memberno=3;

DELETE FROM reply
WHERE memberno=3;

DELETE FROM board
WHERE memberno=3;
---------������ ���̺� ����-----------

/********************* DML ���� *********************/


ALTER TABLE member COMMENT = 'ȸ��';
ALTER TABLE member MODIFY memberno INT COMMENT '�����ȣ';
ALTER TABLE member MODIFY id VARCHAR(15) COMMENT '���̵�';
ALTER TABLE member MODIFY name VARCHAR(15) COMMENT '�̸�';
ALTER TABLE member MODIFY passwd VARCHAR(15) COMMENT '��й�ȣ';
ALTER TABLE member MODIFY phone VARCHAR(15) COMMENT '��ȭ��ȣ';
ALTER TABLE member MODIFY email VARCHAR(25) COMMENT '�̸���';
ALTER TABLE member MODIFY birth VARCHAR(20) COMMENT '�������';
ALTER TABLE member MODIFY sex CHAR(1) COMMENT '����';
ALTER TABLE member MODIFY grade CHAR(1) COMMENT '���';

SHOW FULL COLUMNS FROM member;

/**********************************/
/* Table Name: �α��� ���� */
/**********************************/
CREATE TABLE log(
		logno INT NOT NULL AUTO_INCREMENT,
		ip VARCHAR(20),
		rdate DATETIME NOT NULL,
		sf CHAR(1) NOT NULL,
		memberno INT NOT NULL, 
		PRIMARY KEY(logno),
    FOREIGN KEY(memberno) REFERENCES member(memberno)
);


/********************* DML ���� *********************/

/* �� ���� ���ڵ� ��� */
INSERT INTO log(ip, rdate, sf, memberno) 
VALUES('172.16.12.17', now(), 'T', 1);

INSERT INTO log(ip, rdate, sf, memberno)
VALUES('172.16.12.116', now(), 'F', 2);

/* ��� ���ڵ� �˻� */
SELECT logno, ip, rdate, sf, memberno
FROM log;

/* �˻� */ -- ������ �˻� �� ���� ���, ���̳� ��¥�� �˻� �����ϰ� ������ ����
SELECT logno, ip, rdate, sf, memberno
FROM log
WHERE YEAR(rdate) = '2017';

-- 2018-12-03 ~ 2018-12-31 ������ �α� �˻�
SELECT logno, ip, rdate, sf, memberno
FROM log
WHERE DATE(rdate) BETWEEN '2018-12-03' AND '2018-12-31';

SELECT logno, ip, rdate, sf, memberno
FROM log
WHERE DATE(rdate) BETWEEN '2018-12-01' AND '2018-12-02';

/* ����¡ */

/* �� �� ��ȸ */
SELECT logno, ip, rdate, sf, memberno
FROM log
WHERE logno=1;

/* ��ü ���ڵ� �� */
SELECT COUNT(*) as cnt
FROM log

/* FK�� ���� ���ڵ� �� */
SELECT COUNT(*) as cnt_fk
FROM log
WHERE memberno=1

/* ���� */ -- �α׿��� ���� ��� ���� X
UPDATE log
SET ip='172.16.12.255'
WHERE memberno=1

/* �� �� ���� */ -- �α׿��� ���� ��� ���� X
DELETE FROM log
WHERE logno=1

/* FK�� ���� ���� */ -- �α׿��� ���� ��� ���� X
DELETE FROM log
WHERE memberno=1

/********************* DML ���� *********************/


ALTER TABLE log COMMENT = '�α��� ����';
ALTER TABLE log MODIFY logno INT COMMENT '�α��ι�ȣ';
ALTER TABLE log MODIFY ip VARCHAR(20) COMMENT '������';
ALTER TABLE log MODIFY rdate DATETIME COMMENT '�α��νð�';
ALTER TABLE log MODIFY sf CHAR(1) COMMENT '��������';
ALTER TABLE log MODIFY memberno INT COMMENT '�����ȣ';

SHOW FULL COLUMNS FROM log;





/**********************************/
/* Table Name: �˻��� */
/**********************************/
CREATE TABLE word(
		wordno INT NOT NULL AUTO_INCREMENT,
		word VARCHAR(20) NOT NULL,
		rdate DATETIME NOT NULL,
		PRIMARY KEY(wordno)
);


/********************* DML ���� *********************/

/* �� ���� ���ڵ� ��� */
INSERT INTO word(word, rdate) 
VALUES('����', now());

INSERT INTO word(word, rdate)
VALUES('����', now());

INSERT INTO word(word, rdate) 
VALUES('�Ļ�', now());

INSERT INTO word(word, rdate)
VALUES('����', now());

INSERT INTO word(word, rdate) 
VALUES('ģ��', now());

INSERT INTO word(word, rdate)
VALUES('��', now());

INSERT INTO word(word, rdate) 
VALUES('�', now());

INSERT INTO word(word, rdate)
VALUES('Ű����', now());


/* ��� ���ڵ� �˻� */
SELECT wordno, word, rdate
FROM word;

/* �˻� */ 
SELECT wordno, word, rdate
FROM word
WHERE word like "%����%";

/* ����¡ */
SELECT wordno, word, rdate
FROM word
ORDER BY wordno ASC
LIMIT 0, 10;

SELECT wordno, word, rdate
FROM word
ORDER BY wordno ASC
LIMIT 10, 10;

/* �� �� ��ȸ */
SELECT wordno, word, rdate
FROM word
WHERE wordno=1;

/* ��ü ���ڵ� �� */
SELECT COUNT(*) as cnt
FROM word

/* ���� */ -- �˻���� ���� ��� ���� X
UPDATE word
SET word='�Ļ�'
WHERE wordno=1

/* �� �� ���� */ -- �˻���� ���� ��� ���� X
DELETE FROM word
WHERE wordno=1

/* FK�� ���� ���� */ -- �˻���� ���� ��� ���� X
 
---------������ ���̺� ����----------- 
DELETE FROM member_word
WHERE wordno=1;

DELETE FROM crawling_data
WHERE wordno=1;
---------������ ���̺� ����-----------

DELETE FROM word
WHERE wordno=1;

/********************* DML ���� *********************/


ALTER TABLE word COMMENT = '�˻���';
ALTER TABLE word MODIFY wordno INT COMMENT '�˻����ȣ';
ALTER TABLE word MODIFY word VARCHAR(20) COMMENT '�˻���';
ALTER TABLE word MODIFY rdate DATETIME COMMENT '�˻����Ͻð�';

SHOW FULL COLUMNS FROM word;




/**********************************/
/* Table Name: ũ�Ѹ������� */
/**********************************/
CREATE TABLE crawling_data(
		crno INT NOT NULL AUTO_INCREMENT,
		content VARCHAR(280) NOT NULL,
		rdate DATETIME NOT NULL,
		wordno INT NOT NULL,
		PRIMARY KEY(crno),
		FOREIGN KEY(wordno) REFERENCES word(wordno)
);



/********************* DML ���� *********************/

/* �� ���� ���ڵ� ��� */
INSERT INTO crawling_data(content, rdate, wordno)
VALUES('�����Դϴ�', now(), 1);


/* ��� ���ڵ� �˻� */
SELECT crno, content, rdate, wordno
FROM crawling_data;

/* �˻� */ 
SELECT crno, content, rdate, wordno
FROM crawling_data
WHERE content like "%����%";

/* �� �� ��ȸ */
SELECT wordno, word, rdate
FROM word
WHERE wordno=1;

/* ��ü ���ڵ� �� */
SELECT COUNT(*) as cnt
FROM crawling_data

/* �� �� ���� */ -- �˻���� ���� ��� ���� X
DELETE FROM crawling_data
WHERE crno=1;

/* FK�� ���� ���� */ -- �˻���� ���� ��� ���� X
DELETE FROM word
WHERE wordno=1;

DELETE FROM crawling_data
WHERE wordno=1;

/********************* DML ���� *********************/



ALTER TABLE crawling_data COMMENT = 'ũ�Ѹ�������';
ALTER TABLE crawling_data MODIFY crno INT COMMENT 'ũ�Ѹ���ȣ';
ALTER TABLE crawling_data MODIFY content VARCHAR(280) COMMENT '����';
ALTER TABLE crawling_data MODIFY rdate DATETIME COMMENT '�ð�';
ALTER TABLE crawling_data MODIFY wordno INT COMMENT '�˻����ȣ';

SHOW FULL COLUMNS FROM crawling_data;




/**********************************/
/* Table Name: ȸ��_�˻� */
/**********************************/
CREATE TABLE member_word(
		mwno INT NOT NULL AUTO_INCREMENT,
		memberno INT NOT NULL,
		wordno INT NOT NULL,
		PRIMARY KEY(mwno),
    FOREIGN KEY(memberno) REFERENCES member(memberno),
    FOREIGN KEY(wordno) REFERENCES word(wordno)
);


/********************* DML ���� *********************/

/* �� ���� ���ڵ� ��� */
INSERT INTO member_word(memberno, wordno) 
VALUES(1, 2);

INSERT INTO member_word(memberno, wordno)
VALUES(2, 1);

/* ��� ���ڵ� �˻� */
SELECT mwno, memberno, wordno
FROM member_word;

/* �˻� */ -- ȸ��_�˻����� �˻� ��� X
SELECT mwno, memberno, wordno
FROM member_word
WHERE mwno=1;

/* �� �� ��ȸ */
SELECT mwno, memberno, wordno
FROM member_word
WHERE mwno=1;

/* ��ü ���ڵ� �� */
SELECT COUNT(*) as cnt
FROM member_word

/* FK�� ���� ���ڵ� �� */
SELECT COUNT(*) as cnt_fk
FROM member_word
WHERE memberno=1

SELECT COUNT(*) as cnt_fk
FROM member_word
WHERE wordno=1

/* �� �� ���� */ -- ���_�˻����� ���� ��� ���� X
DELETE FROM word
WHERE mwno=1

/* FK�� ���� ���� */ -- ���_�˻����� ���� ��� ���� X
DELETE FROM member_word
WHERE memberno=1

DELETE FROM member_word
WHERE wordno=1

/********************* DML ���� *********************/


ALTER TABLE member_word COMMENT = 'ȸ��_�˻�';
ALTER TABLE member_word MODIFY mwno INT COMMENT 'ȸ���˻���ȣ';
ALTER TABLE member_word MODIFY memberno INT COMMENT 'ȸ����ȣ';
ALTER TABLE member_word MODIFY wordno INT COMMENT '�˻����ȣ';

SHOW FULL COLUMNS FROM member_word;





/**********************************/
/* Table Name: ī�װ� �׷� */
/**********************************/
CREATE TABLE categrp(
		categrpno INT NOT NULL AUTO_INCREMENT,
		class INT NOT NULL,
		name VARCHAR(50) NOT NULL,
		rdate DATETIME NOT NULL,
		PRIMARY KEY(categrpno)
);


/********************* DML ���� *********************/

/* �� ���� ���ڵ� ��� */
INSERT INTO categrp(class, name, rdate) 
VALUES(1, "��������", now());

INSERT INTO categrp(class, name, rdate)
VALUES(2, "�Խ���", now());

/* ��� ���ڵ� �˻� */
SELECT class, name, rdate
FROM categrp;

/* �˻� */
SELECT class, name, rdate
FROM categrp
WHERE name like "%�Խ���%";

/* �� �� ��ȸ */
SELECT categrpno, class, name, rdate
FROM categrp
WHERE categrpno=1;

/* ��ü ���ڵ� �� */
SELECT COUNT(*) as cnt
FROM categrp

/* ���� */
UPDATE categrp
SET categrp.name="�Խ���"
WHERE categrpno=2

/* �� �� ���� */
DELETE FROM categrp
WHERE categrpno=1


/* FK�� ���� ���� */
------------------������ ���̺� ����--------------------
DELETE FROM board
WHERE categrp=1;
------------------������ ���̺� ����--------------------


DELETE FROM categrp
WHERE categrp=1;

/********************* DML ���� *********************/



ALTER TABLE categrp COMMENT = 'ī�װ� �׷�';
ALTER TABLE categrp MODIFY categrpno INT COMMENT 'ī�װ��׷��ȣ';
ALTER TABLE categrp MODIFY class VARCHAR(50) COMMENT '�з�';
ALTER TABLE categrp MODIFY name VARCHAR(50) COMMENT '�̸�';
ALTER TABLE categrp MODIFY rdate DATETIME COMMENT 'ī�װ������';

SHOW FULL COLUMNS FROM categrp;





/**********************************/
/* Table Name: �Խ��� */
/**********************************/
CREATE TABLE board(
		boardno INT NOT NULL AUTO_INCREMENT,
		name VARCHAR(100) NOT NULL,
		content VARCHAR(1000) NOT NULL,
		size INT DEFAULT 0,
		views INT DEFAULT 0 NOT NULL,
		photo VARCHAR(100),
		thumb VARCHAR(100),
		rdate DATETIME NOT NULL,
		categrpno INT NOT NULL,
		memberno INT NOT NULL,
		PRIMARY KEY(boardno),
    FOREIGN KEY(categrpno) REFERENCES categrp(categrpno),
    FOREIGN KEY(memberno) REFERENCES member(memberno)
);



/********************* DML ���� *********************/

/* �� �� ��� */
INSERT INTO board(name, content, size, views, photo, thumb, rdate, categrpno, memberno)
VALUES("����", "�����ٶ󸶹ٻ�", 10, 1, "photo01.jpg", "photo01_t.jpg", now(), 1, 1);


INSERT INTO board(name, content, size, views, photo, thumb, rdate, categrpno, memberno)
VALUES("����2", "��뵵�θ𺸼�", 10, 1, "photo02.jpg", "photo02_t.jpg", now(), 2, 3); -- �׽�Ʈ��


INSERT INTO board(name, content, size, views, photo, thumb, rdate, categrpno, memberno)
VALUES("����3", "�����ٷθ𺸼�", 10, 1, "photo03.jpg", "photo03_t.jpg", now(), 1, 2); -- �׽�Ʈ��


INSERT INTO board(name, content, size, views, photo, thumb, rdate, categrpno, memberno)
VALUES("����4", "������ɱٰ��", 10, 1, "photo04.jpg", "photo04_t.jpg", now(), 10, 10); -- �׽�Ʈ��


/* ��� ���ڵ� �˻� */
SELECT boardno, name, content, size, views, photo, thumb, rdate, categrpno, memberno
FROM board;

/* �� �� ��ȸ */
SELECT boardno, name, content, size, views, photo, thumb, rdate, categrpno, memberno
FROM board
WHERE boardno=1;

/* �˻� */
SELECT boardno, name, content, size, views, photo, thumb, rdate, categrpno, memberno
FROM board
WHERE name='����';

SELECT boardno, name, content, size, views, photo, thumb, rdate, categrpno, memberno
FROM board
WHERE content like '%������%';

SELECT boardno, name, content, size, views, photo, thumb, rdate, categrpno, memberno
FROM board
WHERE DATE(rdate) BETWEEN '2018-12-03' AND '2018-12-07'; 

/* ��ü ���ڵ� �� */
SELECT COUNT(boardno) as cnt
FROM board

/* FK�� ���� ���ڵ� �� */
SELECT COUNT(categrpno) as cnt
FROM board
WHERE categrpno=1;

SELECT COUNT(memberno) as cnt
FROM board
WHERE memberno=1;

/* ���� */
UPDATE board
SET name="���", content="����Ϲ�", size=20, views=1, photo="photo02.jpg", thumb="photo03_t.jpg"
WHERE boardno=1;
 
/* �� �� ���� */
INSERT INTO board(name, content, size, views, photo, thumb, rdate, categrpno, memberno)
VALUES("����", "�����ٶ󸶹ٻ�", 10, 1, "photo01.jpg", "photo01_t.jpg", now(), 1, 1); -- �׽�Ʈ��



DELETE FROM board
WHERE boardno=1;

DELETE FROM board
WHERE name="���";

 
/* ��ü ��� ���� ���� */
SELECT boardno, name, content, size, views, photo, thumb, rdate, categrpno, memberno
FROM board
ORDER BY boardno ASC;

SELECT boardno, name, content, size, views, photo, thumb, rdate, categrpno, memberno
FROM board
ORDER BY boardno DESC;



/* ����¡ */
SELECT boardno, name, content, size, views, photo, thumb, rdate, categrpno, memberno
FROM board
ORDER BY boardno DESC
LIMIT 0, 10;



/* FK�� ���� ���� */
--------------������ ���̺� ����-----------------
DELETE FROM reply
WHERE boardno=1;
--------------������ ���̺� ����-----------------

DELETE FROM board
WHERE categrpno=1 AND memberno=1;

/********************* DML ���� *********************/



ALTER TABLE board COMMENT = '�Խ���';
ALTER TABLE board MODIFY boardno INT COMMENT '�Խ��ǹ�ȣ';
ALTER TABLE board MODIFY name VARCHAR(100) COMMENT '����';
ALTER TABLE board MODIFY content VARCHAR(1000) COMMENT '����';
ALTER TABLE board MODIFY size INT COMMENT '�뷮';
ALTER TABLE board MODIFY views INT COMMENT '��ȸ��';
ALTER TABLE board MODIFY photo VARCHAR(100) COMMENT '����';
ALTER TABLE board MODIFY thumb VARCHAR(100) COMMENT '�����';
ALTER TABLE board MODIFY rdate DATETIME COMMENT '��Ͻð�';
ALTER TABLE board MODIFY categrpno INT COMMENT 'ī�װ��׷��ȣ';
ALTER TABLE board MODIFY memberno INT COMMENT 'ȸ����ȣ';

SHOW FULL COLUMNS FROM board;





/**********************************/
/* Table Name: ��� */
/**********************************/
CREATE TABLE reply(
		replyno INT NOT NULL AUTO_INCREMENT,
		content VARCHAR(500) NOT NULL,
		boardno INT NOT NULL,
		memberno INT NOT NULL,
		PRIMARY KEY(replyno),
    FOREIGN KEY(memberno) REFERENCES member(memberno),
    FOREIGN KEY(boardno) REFERENCES member(boardno)
);



/********************* DML ���� *********************/

/* �� ���� ���ڵ� ��� */
INSERT INTO reply(content, boardno, memberno)
VALUES('�����Դϴ�', 1, 1);

INSERT INTO categrp(class, name, rdate)
VALUES("�Խ���", "�����Խ���", now());

/* ��� ���ڵ� �˻� */
SELECT replyno, content, boardno, memberno
FROM reply;
ORDER BY replyno ASC;

/* �˻� */
SELECT replyno, content, boardno, memberno
FROM reply
WHERE content like '%����%';

/* �� �� ��ȸ */
SELECT replyno, content, boardno, memberno
FROM reply
WHERE replyno=1;

/* ��ü ���ڵ� �� */
SELECT COUNT(*) as cnt
FROM reply

/* ���� */
UPDATE reply
SET content='���ο� �Է��Դϴ�'
WHERE replyno=1;

/* �� �� ���� */ -- ���_�˻����� ���� ��� ���� X
DELETE FROM reply
WHERE replyno=1;

/* FK�� ���� ���� */
DELETE FROM reply
WHERE boardno=1 AND memberno=1;

/********************* DML ���� *********************/



ALTER TABLE reply COMMENT = '���';
ALTER TABLE reply MODIFY replyno INT COMMENT '��۹�ȣ';
ALTER TABLE reply MODIFY content VARCHAR(500) COMMENT '��۳���';
ALTER TABLE reply MODIFY boardno INT COMMENT '�Խ��ǹ�ȣ';
ALTER TABLE reply MODIFY memberno INT COMMENT 'ȸ����ȣ';

SHOW FULL COLUMNS FROM reply;