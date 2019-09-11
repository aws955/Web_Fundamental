DROP TABLE gtsm;

DESC gtsm;

CREATE TABLE gtsm(
gtsm_seq INT PRIMARY KEY AUTO_INCREMENT,
gtsm_name VARCHAR(20) NOT NULL,
gtsm_email VARCHAR(100) NOT NULL,
gtsm_pwd VARCHAR(41) NOT NULL,
gtsm_regdate DATETIME NOT NULL
);

INSERT INTO gtsm(gtsm_seq, gtsm_name, gtsm_email, gtsm_pwd, gtsm_regdate)
VALUES (NULL,'test','test@test.com',PASSWORD('test'),NOW());

UPDATE gtsm
SET gtsm_name ='test1', gtsm_email = 'test1@test.com' , gtsm_regdate=NOW()
WHERE gtsm_seq = 1;

DELETE FROM gtsm
WHERE gtsm_seq =1;

SELECT gtsm_seq, gtsm_name, gtsm_email, DATE_FORMAT(gtsm_regdate,'%Y/%m/%d')
FROM gtsm
ORDER BY gtsm_seq DESC
LIMIT 0,100;

SELECT COUNT(*)
FROM gtsm;

SELECT gtsm_name, gtsm_email, DATE_FORMAT(gtsm_regdate,'%Y/%m/%d')
FROM gtsm
WHERE gtsm_seq=1;

SELECT gtsm_email
FROM gtsm
WHERE gtsm_email='test1@test.com';

#반복문을 이용한 insert 시작
DELIMITER $$
DROP PROCEDURE IF EXISTS loopInsert$$
CREATE PROCEDURE loopInsert()

BEGIN
	DECLARE i INT DEFAULT 1;		
	WHILE i <= 113 DO 
		INSERT INTO gtsm(gtsm_seq, gtsm_name, gtsm_email, gtsm_pwd, gtsm_regdate)
      VALUES (NULL,CONCAT('test',i),CONCAT(CONCAT('test',i),'@test.com'),PASSWORD('test'),NOW());

		SET i = i + 1;

	END WHILE;
END$$
DELIMITER $$

CALL loopInsert;
#반복문을 이용한 insert 끝
