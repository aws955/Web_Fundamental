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

SELECT gtsm_seq, gtsm_name, gtsm_email, gtsm_pwd, gtsm_regdate
FROM gtsm
ORDER BY gtsm_seq DESC
LIMIT 0,100;

DELETE FROM gtsm
WHERE gtsm_seq =1;