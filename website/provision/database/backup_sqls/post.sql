-- the tables now should doesn't contains a unique index to code
alter table region drop index code;
ALTER TABLE `region` DROP COLUMN `business_code`;

ALTER TABLE `page` DROP COLUMN `name`;

ALTER TABLE `region` ADD COLUMN `portal_name` VARCHAR(40) NULL AFTER `business_unit`;
UPDATE `region` SET `portal_name` = `business_unit`;

DROP TABLE IF EXISTS `blog`;
CREATE TABLE IF NOT EXISTS `blog` (
    `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `languages` JSON NOT NULL,
    `status` TINYINT(1) NOT NULL DEFAULT 0,
    `data` JSON NOT NULL,
    `scheduledTo` DATETIME NULL,
    `created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated` DATETIME NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `portal_blog`;
CREATE TABLE `portal_blog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `region_id` int(10) unsigned NOT NULL,
  `blog_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_pb_portal_id` (`region_id`),
  KEY `pk_pb_blog_id` (`blog_id`),
  CONSTRAINT `pk_pb_blog_id` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`),
  CONSTRAINT `pk_pb_portal_id` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `app_quote` ADD COLUMN `type` ENUM('text', 'image', 'video') NOT NULL DEFAULT 'text' AFTER `id`;
ALTER TABLE `app_quote` CHANGE COLUMN `updated` `updated` DATETIME NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP;
ALTER TABLE `app_quote` CHANGE COLUMN `text` `data` JSON NOT NULL AFTER `region_id`;
ALTER TABLE `app_quote` DROP COLUMN `type`;
ALTER TABLE `app_quote` ADD COLUMN `type` ENUM('text', 'image', 'video') NOT NULL DEFAULT 'text' AFTER `region_id`;
ALTER TABLE `app_quote` ADD COLUMN `author` JSON NULL AFTER `data`;
ALTER TABLE `app_quote` DROP COLUMN `author_name`;
ALTER TABLE `app_quote` DROP COLUMN `author_image`;
ALTER TABLE `blog` ADD COLUMN `item_datetime` datetime DEFAULT NULL AFTER `languages`;
UPDATE `blog` SET `item_datetime` = `created` WHERE `item_datetime` IS NULL;
