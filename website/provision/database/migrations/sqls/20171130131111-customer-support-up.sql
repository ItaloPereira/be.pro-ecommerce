CREATE TABLE IF NOT EXISTS `support_type` (
	`id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`languages` JSON NOT NULL,
	`name` JSON NOT NULL,
	`createdAt` DATETIME NOT NULL DEFAULT NOW(),
	`updatedAt` DATETIME NULL DEFAULT NULL ON UPDATE NOW(),
	INDEX `st_createdAt` (`createdAt`),
	INDEX `st_updatedAt` (`updatedAt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `support_contact` (
	`id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`languages` JSON NOT NULL,
	`detail` JSON NOT NULL,
	`createdAt` DATETIME NOT NULL DEFAULT NOW(),
	`updatedAt` DATETIME NULL DEFAULT NULL ON UPDATE NOW(),
	INDEX `st_createdAt` (`createdAt`),
	INDEX `st_updatedAt` (`updatedAt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `support` (
	`id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`region_id` INT(10) UNSIGNED NOT NULL,
	`type_id` INT(11) UNSIGNED NOT NULL,
	`contact_id` INT(11) UNSIGNED NOT NULL,
	`aircraft_id` INT(11) UNSIGNED NOT NULL,
	CONSTRAINT `pk_s_type_id` FOREIGN KEY (`type_id`) REFERENCES `support_type`(`id`) ON DELETE CASCADE,
	CONSTRAINT `pk_s_contact_id` FOREIGN KEY (`contact_id`) REFERENCES `support_contact`(`id`) ON DELETE CASCADE,
	CONSTRAINT `pk_s_aircraft_id` FOREIGN KEY (`aircraft_id`) REFERENCES `aircraft`(`id`) ON DELETE CASCADE,
	CONSTRAINT `pk_s_region_id` FOREIGN KEY (`region_id`) REFERENCES `region`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;