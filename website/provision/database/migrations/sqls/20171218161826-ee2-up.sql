CREATE TABLE IF NOT EXISTS ee2 (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `status` INT(3) UNSIGNED NOT NULL DEFAULT 0,
  `data` JSON NOT NULL,
  `createdAt` DATETIME NOT NULL DEFAULT NOW(),
  `updatedAt` DATETIME NULL DEFAULT NULL ON UPDATE NOW()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS ee2_activity (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `event_id` INT(11) UNSIGNED NOT NULL,
  `status` INT(3) UNSIGNED NOT NULL DEFAULT 0,
  `data` JSON NOT NULL,
  `createdAt` DATETIME NOT NULL DEFAULT NOW(),
  `updatedAt` DATETIME NULL DEFAULT NULL ON UPDATE NOW(),
  CONSTRAINT `pk_ee2_evid` FOREIGN KEY (`event_id`) REFERENCES `ee2`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS ee2_participant (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `event_id` INT(11) UNSIGNED NOT NULL,
  `status` INT(3) UNSIGNED NOT NULL DEFAULT 0,
  `data` JSON NOT NULL,
  `createdAt` DATETIME NOT NULL DEFAULT NOW(),
  `updatedAt` DATETIME NULL DEFAULT NULL ON UPDATE NOW(),
  CONSTRAINT `pk_ee2_part_evid` FOREIGN KEY (`event_id`) REFERENCES `ee2`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS ee2_activity_participant (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `event_id` INT(11) UNSIGNED NOT NULL,
  `activity_id` INT(11) UNSIGNED NOT NULL,
  `participant_id` INT(11) UNSIGNED NOT NULL,
  `status` INT(3) UNSIGNED NOT NULL DEFAULT 0,
  `createdAt` DATETIME NOT NULL DEFAULT NOW(),
  `updatedAt` DATETIME NULL DEFAULT NULL ON UPDATE NOW(),
  CONSTRAINT `pk_ee2_ap_evid` FOREIGN KEY (`event_id`) REFERENCES `ee2`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pk_ee2_ap_part_id` FOREIGN KEY (`participant_id`) REFERENCES `ee2_participant`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pk_ee2_activity_id` FOREIGN KEY (`activity_id`) REFERENCES `ee2_activity`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
);