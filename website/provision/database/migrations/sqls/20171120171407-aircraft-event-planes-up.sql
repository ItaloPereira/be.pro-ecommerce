CREATE TABLE IF NOT EXISTS `aircraft_event_plane` (
      `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
      `region_id` INT(10) UNSIGNED NOT NULL,
      `aircraft_id` INT(11) UNSIGNED NOT NULL,
      `event_id` INT(11) UNSIGNED NOT NULL,
      `created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
      `updated` DATETIME NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
      PRIMARY KEY(`id`),
      INDEX(`region_id`),
      INDEX(`aircraft_id`),
      INDEX(`event_id`),
      INDEX(`created`),
      INDEX(`updated`),
      CONSTRAINT pk_pevtplanes_regid FOREIGN KEY (`region_id`) REFERENCES `region`(`id`),
      CONSTRAINT pk_pevtplanes_airid FOREIGN KEY (`aircraft_id`) REFERENCES `aircraft`(`id`),
      CONSTRAINT pk_pevtplanes_eveid FOREIGN KEY (`event_id`) REFERENCES `aircraft_event`(`id`)
) AUTO_INCREMENT=1 ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
