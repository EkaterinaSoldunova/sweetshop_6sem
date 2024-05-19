CREATE DATABASE IF NOT EXISTS sweetshop;
CREATE USER IF NOT EXISTS 'user'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'user'@'%';
FLUSH PRIVILEGES;
CREATE TABLE cakes (
                       id SERIAL PRIMARY KEY,
                       name VARCHAR(255) NOT NULL,
                       price INT NOT NULL,
                       being INT NOT NULL
);
CREATE TABLE users (
                       id SERIAL PRIMARY KEY,
                       email VARCHAR(255) NOT NULL,
                       phoneNumber VARCHAR(255) NOT NULL,
                       name VARCHAR(255) NOT NULL,
                       active BOOLEAN NOT NULL,
                       password VARCHAR(255) NOT NULL
);
CREATE TABLE basket (
                        id SERIAL PRIMARY KEY,
                        cakeId INT NOT NULL,
                        userId INT NOT NULL
);
CREATE TABLE orders (
                        id SERIAL PRIMARY KEY,
                        cakeId INT NOT NULL,
                        userId INT NOT NULL,
                        dateOfCreated DATE NOT NULL,
                        active BOOLEAN NOT NULL
);
ALTER TABLE basket ADD FOREIGN KEY (cakeId) REFERENCES cakes(id);
ALTER TABLE basket ADD FOREIGN KEY (userId) REFERENCES users(id);
ALTER TABLE orders ADD FOREIGN KEY (cakeId) REFERENCES cakes(id);
ALTER TABLE orders ADD FOREIGN KEY (userId) REFERENCES users(id);