CREATE TABLE IF NOT EXISTS `conference_activity_participant` (
	`id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`conference_id` INT(11) UNSIGNED NOT NULL,
	`activity_id` INT(11) UNSIGNED NOT NULL,
	`createdAt` DATETIME NOT NULL DEFAULT NOW(),
	`updatedAt` DATETIME NULL DEFAULT NULL ON UPDATE NOW(),
	CONSTRAINT `pk_cap_cid` FOREIGN KEY (`conference_id`) REFERENCES `conference`(`id`),
	CONSTRAINT `pk_cap_aid` FOREIGN KEY (`activity_id`) REFERENCES `conference_activity`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `conference_sponsor` DROP COLUMN `position`;
ALTER TABLE `conference_participant` DROP COLUMN `paymentType`;