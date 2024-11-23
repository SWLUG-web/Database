use test;

-- 0. 기존 테이블 삭제 (초기화)
DROP TABLE IF EXISTS `user_type`;
DROP TABLE IF EXISTS `users`;
DROP TABLE IF EXISTS `user_info`;

-- 1. 사용자 정보 테이블 (기본 테이블)
CREATE TABLE `user_info` (
    `user_id` VARCHAR(255) NOT NULL, -- 사용자 ID
    `email` VARCHAR(255) NOT NULL UNIQUE, -- 이메일 (유일해야 함)
    `phone` VARCHAR(255) NULL, -- 전화번호
    PRIMARY KEY (`user_id`) -- 기본키 설정
);

-- 2. 사용자 로그인 정보 테이블
CREATE TABLE `users` (
    `user_id` VARCHAR(255) NOT NULL, -- 사용자 ID
    `pw` VARCHAR(255) NOT NULL, -- 비밀번호
    PRIMARY KEY (`user_id`), -- 기본키 설정
    FOREIGN KEY (`user_id`) REFERENCES `user_info`(`user_id`) ON DELETE CASCADE ON UPDATE CASCADE -- 외래키 설정
);

-- 3. 사용자 등급 정보 테이블
CREATE TABLE `user_type` (
    `user_id` VARCHAR(255) NOT NULL, -- 사용자 ID
    `nickname` VARCHAR(255) NOT NULL, -- 닉네임
    `ruleType` INT(1) NOT NULL DEFAULT 2 CHECK (`ruleType` IN (0, 1, 2)), -- 회원 등급 (기본값: 2, 0=ADMIN, 1=USER, 2=GUEST)
    PRIMARY KEY (`user_id`), -- 기본키 설정
    FOREIGN KEY (`user_id`) REFERENCES `user_info`(`user_id`) ON DELETE CASCADE ON UPDATE CASCADE -- 외래키 설정
);

-- 4. 기본 데이터 삽입
-- 사용자 정보 삽입
INSERT INTO `user_info` (`user_id`, `email`, `phone`) VALUES
('user001', 'user001@example.com', '010-1234-5678'),
('user002', 'user002@example.com', '010-2345-6789'),
('user003', 'user003@example.com', NULL); -- 전화번호는 NULL 허용

-- 사용자 로그인 정보 삽입
INSERT INTO `users` (`user_id`, `pw`) VALUES
('user001', 'password123'),
('user002', 'password234'),
('user003', 'password345');

-- 사용자 등급 정보 삽입
-- ruleType 기본값 테스트
INSERT INTO `user_type` (`user_id`, `nickname`, `ruleType`) VALUES
('user001', 'JohnDoe', 0), -- Admin 등급
('user002', 'JaneSmith', 1), -- 일반 사용자 등급
('user003', 'GuestUser', DEFAULT); -- 기본값 2 (GUEST) 적용

-- 5. 테이블 데이터 조회
SELECT * FROM `user_info`;
SELECT * FROM `users`;
SELECT * FROM `user_type`;
