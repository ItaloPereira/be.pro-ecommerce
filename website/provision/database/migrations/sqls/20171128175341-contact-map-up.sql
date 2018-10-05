-- Criar a tabela de Contact Information
CREATE TABLE IF NOT EXISTS `contact_map` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`languages` JSON NOT NULL,
	`country` JSON NOT NULL,
	`area` JSON NULL,
	`detail` JSON NOT NULL,
	`createdAt` DATETIME NOT NULL DEFAULT NOW(),
	INDEX `cm_createdAt` (`createdAt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `portal_contact_map` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `region_id` int(10) unsigned NOT NULL,
  `contact_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `pk_pcm_contact_id` FOREIGN KEY (`contact_id`) REFERENCES `contact_map` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pk_pcm_portal_id` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;