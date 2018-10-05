CREATE TABLE IF NOT EXISTS `sponsor_type` (
	`id` INT(3) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`languages` JSON NOT NULL,
	`name` JSON NOT NULL,
	`createdAt` DATETIME NOT NULL DEFAULT NOW(),
	`updatedAt` DATETIME NULL DEFAULT NULL ON UPDATE NOW()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `sponsor` (
	`id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`type_id` INT(3) UNSIGNED NOT NULL,
	`name` JSON NOT NULL,
	`photo` JSON NOT NULL,
	`createdAt` DATETIME NOT NULL DEFAULT NOW(),
	`updatedAt` DATETIME NULL DEFAULT NULL ON UPDATE NOW(),
	CONSTRAINT `pk_sponsor_type_id` FOREIGN KEY (`type_id`) REFERENCES `sponsor_type`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `conference` (
	`id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`status` INT(3) UNSIGNED NOT NULL DEFAULT 0,
	`startsAt` DATE NOT NULL,
	`endsAt` DATE NOT NULL,
	`coordinator` JSON NULL COMMENT 'Should be an array of users',
	`administrator` JSON NULL COMMENT 'Should be an array of users',
	`planes` JSON NOT NULL,
	`resume` JSON NOT NULL,
	`contact` JSON NULL,
	`location` JSON NULL,
	`options` JSON NOT NULL,
	`createdAt` DATETIME NOT NULL DEFAULT NOW(),
	`updatedAt` DATETIME NULL DEFAULT NULL ON UPDATE NOW(),
	INDEX `start_end_dates` (`startsAt`, `endsAt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `conference_sponsor` (
	`id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`position` SMALLINT(3) UNSIGNED NOT NULL DEFAULT 0,
	`sponsor_type_id` INT(3) UNSIGNED NOT NULL,
	`conference_id` INT(11) UNSIGNED NOT NULL,
	`sponsor_id` INT(11) UNSIGNED NOT NULL,
	CONSTRAINT `pk_cs_conference_id` FOREIGN KEY (`conference_id`) REFERENCES `conference`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `pk_cs_type_id_id` FOREIGN KEY (`sponsor_type_id`) REFERENCES `sponsor_type`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `pk_cs_sponsor_id` FOREIGN KEY (`sponsor_id`) REFERENCES `sponsor`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `portal_conference` (
	`id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`conference_id` INT(11) UNSIGNED NOT NULL,
	`region_id` INT(10) UNSIGNED NOT NULL,
	CONSTRAINT `pk_pc_conference` FOREIGN KEY (`conference_id`) REFERENCES `conference`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `pk_pc_region_id` FOREIGN KEY (`region_id`) REFERENCES `region`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `conference_participant` (
	`id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`conference_id` INT(11) UNSIGNED NOT NULL,
 	`status` INT(3) UNSIGNED NOT NULL DEFAULT 0,
	`paymentType` INT(3) UNSIGNED NOT NULL,
	`subscriptionType` INT(3) UNSIGNED NOT NULL,
	`data` JSON NOT NULL,
	`paidAt` DATETIME NULL DEFAULT NULL,
	`approvedAt` DATETIME NULL DEFAULT NULL,
	`createdAt` DATETIME NOT NULL DEFAULT NOW(),
	`updatedAt` DATETIME NULL DEFAULT NULL ON UPDATE NOW(),
	CONSTRAINT `pk_participant_conference_id` FOREIGN KEY (`conference_id`) REFERENCES `conference`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `conference_activity` (
	`id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`conference_id` INT(11) UNSIGNED NOT NULL,
 	`status` INT(3) UNSIGNED NOT NULL DEFAULT 0,	
	`resume` JSON NOT NULL,
	`createdAt` DATETIME NOT NULL DEFAULT NOW(),
	`updatedAt` DATETIME NULL DEFAULT NULL ON UPDATE NOW(),
	CONSTRAINT `pk_activity_conference_id` FOREIGN KEY (`conference_id`) REFERENCES `conference`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `conference_meeting` (
	`id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`conference_id` INT(11) UNSIGNED NOT NULL,
	`activity_id` INT(11) UNSIGNED NOT NULL,
 	`status` INT(3) UNSIGNED NOT NULL DEFAULT 0,
	`startsAt` DATETIME NOT NULL,
	`endsAt` DATETIME NOT NULL,
	`resume` JSON NOT NULL,
	`createdAt` DATETIME NOT NULL DEFAULT NOW(),
	`updatedAt` DATETIME NULL DEFAULT NULL ON UPDATE NOW(),
	CONSTRAINT `pk_meeting_conference_id` FOREIGN KEY (`conference_id`) REFERENCES `conference`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `pk_meeting_activity_id` FOREIGN KEY (`activity_id`) REFERENCES `conference_activity`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `conference_meeting_participant` (
	`id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`conference_id` INT(11) UNSIGNED NOT NULL,
	`activity_id` INT(11) UNSIGNED NOT NULL,
	`meeting_id` INT(11) UNSIGNED NOT NULL,
	`participant_id` INT(11) UNSIGNED NOT NULL,
	`createdAt` DATETIME NOT NULL DEFAULT NOW(),
	`updatedAt` DATETIME NULL DEFAULT NULL ON UPDATE NOW(),
	CONSTRAINT `pk_cmp_conference_id` FOREIGN KEY (`conference_id`) REFERENCES `conference`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `pk_cmp_activity_id` FOREIGN KEY (`activity_id`) REFERENCES `conference_activity`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `pk_cmp_participant_id` FOREIGN KEY (`participant_id`) REFERENCES `conference_participant`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `pk_cmp_meeting_id` FOREIGN KEY (`meeting_id`) REFERENCES `conference_meeting`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `sponsor_type` VALUES (1, '["en", "pt"]', '{"_text": {"en": "Platinum Sponsors", "pt": "Patrocinadores Platina"}}', default, default);
INSERT INTO `sponsor_type` VALUES (2, '["en", "pt"]', '{"_text": {"en": "Gold Sponsors", "pt": "Patrocinadores Ouro"}}', default, default);
INSERT INTO `sponsor_type` VALUES (3, '["en", "pt"]', '{"_text": {"en": "Silver Sponsors", "pt": "Patrocinadores Prata"}}', default, default);