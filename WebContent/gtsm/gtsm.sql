DROP TABLE gtsm;

CREATE TABLE gtsm(
gtsm_seq INT PRIMARY KEY AUTO_INCREMENT,
gtsm_name VARCHAR(20) NOT NULL,
gtsm_email VARCHAR(100) NOT NULL,
gtsm_pwd VARCHAR(41) NOT NULL,
gtsm_regdate DATETIME NOT NULL
);

INSERT INTO gtsm(gtsm_seq, gtsm_name, gtsm_email, gtsm_pwd, gtsm_regdate)
VALUES (NULL,'test','test@test.com',PASSWORD('test'),NOW());