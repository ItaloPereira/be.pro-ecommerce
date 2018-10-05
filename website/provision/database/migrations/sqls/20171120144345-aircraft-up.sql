CREATE TABLE IF NOT EXISTS `aircraft` (
      `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
      `name` VARCHAR(50) NOT NULL,
      `active` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
      `slug` VARCHAR(50) NOT NULL,
      `data` JSON NOT NULL,
      `created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
      `updated` DATETIME NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
      PRIMARY KEY(`id`),
      INDEX(`active`),
      INDEX(`name`),
      UNIQUE INDEX(`slug`),
      INDEX(`created`),
      INDEX(`updated`)
) AUTO_INCREMENT=1 ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT IGNORE INTO `aircraft` VALUES (1,'Phenom 300E',0,'phenom-300e','{\"file\": {\"bynderId\": \"E3ADA3A6-B7A3-4392-95DD95F3D49DA995\"}, \"photo\": [{\"bynderId\": \"E3ADA3A6-B7A3-4392-95DD95F3D49DA995\"}], \"description\": {\"_text\": {\"en\": \"This is the Airplane\'s description.\"}}}','2017-11-20 17:18:56','2017-11-20 17:25:06'),(2,'Phenom 100',0,'phenom-100','{\"file\": {\"bynderId\": \"E3ADA3A6-B7A3-4392-95DD95F3D49DA995\"}, \"photo\": [{\"bynderId\": \"E3ADA3A6-B7A3-4392-95DD95F3D49DA995\"}], \"description\": {\"_text\": {\"en\": \"This is the Airplane\'s description.\"}}}','2017-11-20 17:18:56','2017-11-20 17:25:06'),(3,'Legacy 650E',0,'legacy-650e','{\"file\": {\"bynderId\": \"E3ADA3A6-B7A3-4392-95DD95F3D49DA995\"}, \"photo\": [{\"bynderId\": \"E3ADA3A6-B7A3-4392-95DD95F3D49DA995\"}], \"description\": {\"_text\": {\"en\": \"This is the Airplane\'s description.\"}}}','2017-11-20 17:21:26','2017-11-20 17:25:06'),(4,'Legacy 500',0,'legacy-500','{\"file\": {\"bynderId\": \"E3ADA3A6-B7A3-4392-95DD95F3D49DA995\"}, \"photo\": [{\"bynderId\": \"E3ADA3A6-B7A3-4392-95DD95F3D49DA995\"}], \"description\": {\"_text\": {\"en\": \"This is the Airplane\'s description.\"}}}','2017-11-20 17:21:54','2017-11-20 17:25:06'),(5,'Legacy 450',0,'legacy-450','{\"file\": {\"bynderId\": \"E3ADA3A6-B7A3-4392-95DD95F3D49DA995\"}, \"photo\": [{\"bynderId\": \"E3ADA3A6-B7A3-4392-95DD95F3D49DA995\"}], \"description\": {\"_text\": {\"en\": \"This is the Airplane\'s description.\"}}}','2017-11-20 17:22:30','2017-11-20 17:25:06'),(6,'Lineage 1000E',0,'lineage-1000e','{\"file\": {\"bynderId\": \"E3ADA3A6-B7A3-4392-95DD95F3D49DA995\"}, \"photo\": [{\"bynderId\": \"E3ADA3A6-B7A3-4392-95DD95F3D49DA995\"}], \"description\": {\"_text\": {\"en\": \"This is the Airplane\'s description.\"}}}','2017-11-20 17:22:55','2017-11-20 17:25:06');