CREATE TABLE user_info (
    user_info_num INT auto_increment PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(255) NOT NULL,
    users_num INT,
    type_num INT,
    FOREIGN KEY (users_num) REFERENCES users(users_num),
    FOREIGN KEY (type_num) REFERENCES user_type(type_num)
);

CREATE TABLE users (
    users_num INT AUTO_INCREMENT PRIMARY KEY,
    pw VARCHAR(255) NOT NULL,
    user_id VARCHAR(45) UNIQUE NOT NULL
);

CREATE TABLE user_type (
    type_num INT AUTO_INCREMENT PRIMARY KEY,
    nickname VARCHAR(255) NOT NULL,
    role_type INT NOT NULL,
    user_id VARCHAR(45)
);
