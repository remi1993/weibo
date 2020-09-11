DROP DATABASE IF EXISTS ssm;
CREATE DATABASE ssm CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE ssm;
CREATE TABLE todo
(
    `id`      INT          NOT NULL AUTO_INCREMENT,
    `content`   VARCHAR(255) NOT NULL,
    `userId`     INT(11) NOT NULL,
    `createdTime` BIGINT(20) NOT NULL,
    PRIMARY KEY (`id`)
);



CREATE TABLE `ssm`.`weibo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` VARCHAR(100) NULL,
  `userId` INT(11) NOT NULL ,
  `createdTime` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`)
);



CREATE TABLE `ssm`.`topic` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(200) NOT NULL,
  `content` VARCHAR(1000) NOT NULL,
  `userId` INT NOT NULL,
  `boardId` INT(11) NOT NULL ,
  `createdTime` BIGINT(20) NOT NULL,
  `updatedTime` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`));




CREATE TABLE `ssm`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `role` ENUM('admin', 'guest', 'normal') NOT NULL,
  `avatar` VARCHAR(500) NULL,
  `email` VARCHAR(100) NULL,
  `createdTime` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));



CREATE TABLE `ssm`.`TopicComment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` VARCHAR(200) NOT NULL,
  `userId` INT NOT NULL,
  `topicId` INT NOT NULL,
  `createdTime` BIGINT(20) NOT NULL,
  `updatedTime` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`));



# //帖子与帖子评论外键联动
ALTER TABLE `ssm`.`TopicComment`
    ADD INDEX `topicId_fk_topic_id_idx` (`topicId` ASC);
;
ALTER TABLE `ssm`.`TopicComment`
    ADD CONSTRAINT `topicId_fk_topic_id`
        FOREIGN KEY (`topicId`)
            REFERENCES `ssm`.`Topic` (`id`)
            ON DELETE CASCADE
            ON UPDATE CASCADE;


# topic与user外键
ALTER TABLE `ssm`.`topic`
    ADD INDEX `userId_fk_user_id_idx_idx` (`userId` ASC);
;
ALTER TABLE `ssm`.`topic`
    ADD CONSTRAINT `userId_fk_user_id_idx`
        FOREIGN KEY (`userId`)
            REFERENCES `ssm`.`User` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION;

