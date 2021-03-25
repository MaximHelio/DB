-- 한줄 주석
/* 
    여러줄 주석
*/ 

/* SELECT 구문 순서

    SELECT 컬럼 목록
    FROM 테이블명
    WHERE 로우 필터링 조건
    ORDER BY 컬럼 ASC|DESC
    LIMIT 카운트 OFFSET 카운트
    GROUP BY 컬럼
    HAVING 그룹 필터링 조건;
*/

-- SELECT
SELECT * FROM examples;

-- CREATE TABLE
CREATE TABLE classmates (
    id INTEGER PRIMARY KEY,
    name TEXT
);

-- DROP TABLE : 테이블 지우기
-- 주의! 
-- 이 명령어를 치기 전에는 반드시 3번 스스로에게 
-- 이 명령어를 쳐도 되는지 되묻습니다!
DROP TABLE classmates;

CREATE TABLE classmates (
    name TEXT,
    age INT,
    address TEXT
);


INSERT INTO classmates(name, age)
    VALUES('홍길동', 23);

INSERT INTO classmates
VALUES('홍길동', 30, '서울');

--CREATE TABLE with NOT NULL
DROP TABLE classmates;
CREATE TABLE classamtes (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    age INT NOT NULL,
    address TEXT NOT NULL
);


-- INSERT(errors)
INSERT INTO classamtes (name, age)
VALUES ('홍길동', 23);

INSERT INTO classamtes
VALUES (1, '홍길동', 23, '서울');

-- INSERT(correct)
INSERT INTO classamtes(name, age, address)
VALUES ('홍길동', 23, '서울');


-- CREATE TABLE(without id)
DROP TABLE classmates;
CREATE TABLE classmates (
    name TEXT NOT NULL,
    age INT NOT NULL,
    address TEXT NOT NULL
);

INSERT INTO classmates (name, age, address)
VALUES ('용재', 19, '광주');

-- SELECT (특정 컬럼)
SELECT rowid, name FROM classmates;

-- SELECT with LLIMIT
SELECT rowid, name 
FROM classmates
LIMIT 1;


INSERT INTO classmates (name, age, address)
VALUES ('혜은', 19, '광주');
INSERT INTO classmates (name, age, address)
VALUES ('도연', 50, '광주');
INSERT INTO classmates (name, age, address)
VALUES ('수현', 19, '광주');

-- 세번째 column의 값 가져오기 
SELECT rowid, name
FROM classmates
LIMIT 1 OFFSET 2;

-- DATA 조회(SELECT)
-- table에서 id, name column 값 중에 주소가 서울인 사람만 가져온다면?
SELECT rowid, name, address 
FROM classmates
WHERE address='서울';

-- SELECT with DISTINCT
SELECT DISTINCT age
FROM classmates;

SELECT DISTINCT name, age
FROM classmates;


-- id가 4인 레코드 테이블을 삭제
-- SELECT로 정확한 값이 갖고와지는지 확인 후 지웁ㅂ니다.
DELETE FROM classmates
WHERE rowid=3;


-- AUTOINCREMENT(참고)
CREATE TABLE tests (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL
);

INSERT INTO tests (name)
VALUES ('태현');

DELETE FROM tests
WHERE name="태현";


-- id를 AUTOINCREMENT와같이 정의하면
-- 이전 id 값을 재활용하지 않습니다.
INSERT INTO tests (name)
VALUES ('세희');


-- UPDATE
INSERT INTO classmates (name, age, address)
VALUES ('혜은', 19, '광주');
INSERT INTO classmates (name, age, address)
VALUES ('도연', 50, '광주');
INSERT INTO classmates (name, age, address)
VALUES ('수현', 19, '광주');

SELECT rowid, name address
FROM classmates
WHERE rowid = 4;

UPDATE classmates
SET name='홍길동', address='제주도'
WHERE rowid=4;

-- WHERE 심화
SELECT rowid, first_name, age
FROM users
WHERE age >= 30;

SELECT first_name, last_name
FROM users
WHERE age >= 30;

SELECT last_name, age
FROM users
WHERE age >= 30;

-- COUNT
SELECT COUNT(*)
FROM users;

-- AVG
SELECT AVG(age) as average_age
FROM users
WHERE age >= 30;


--MAX
SELECT MAX(balance)
FROM users
GROUP BY first_name;

--users 30살 이상인 사람의 평균 잔액?
SELECT AVG(balance)
FROM users
WHERE age >= 30;

--LIKE(wild cards)
SELECT first_name
FROM users
WHERE age LIKE '2_';


SELECT first_name, age
FROM users
WHERE age LIKE '2_%'


SELECT first_name, phone
FROM users
WHERE phone LIKE '02-%';


SELECT first_name
FROM users
WHERE first_name LIKE '%준';


SELECT first_name, phone
FROM users
WHERE phone LIKE '%-5114-%';

--ORDER BY
SELECT first_name, age
FROM users
ORDER BY age
LIMIT 10;

SELECT age, last_name
FROM users
ORDER BY age, last_name
LIMIT 10;


SELECT last_name, first_name, balance
FROM users
ORDER BY balance DESC
LIMIT 10;


--GROUP BY
SELECT last_name, first_name, COUNT(*)
FROM users
GROUP BY last_name, first_name;


-- ALTER
CREATE TABLE article(
    title TEXT NOT NULL,
    content TEXT NOT NULL
);

INSERT INTO article (title, content)
VALUES ('1번 제목', '1번 내용');

ALTER TABLE article
RENAME TO news;

ALTER TABLE news
ADD COLUMN created_at TEXT NOT NULL DEFAULT 1;


SELECT AVG(balance)
FROM users
WHERE age >= 30;


SELECT COUNT(*)
FROM users
GROUP BY age
HAVING age >= 40;


--JOIN
