'use strict';

var dbm;
var type;
var seed;

/**
 * We receive the dbmigrate dependency from dbmigrate initially.
 * This enables us to not have to rely on NODE_PATH.
 */
exports.setup = function (options, seedLink) {
    dbm = options.dbmigrate;
    type = dbm.dataType;
    seed = seedLink;
};

exports.up = function (db) {
    db.runSql(`
        INSERT INTO \`event\` (bu, title) VALUES (
          "corporate",
          "E1 Contact Form"
        );
    `);

    db.runSql('ALTER TABLE `event_participant` ADD COLUMN `event_id` INT(10) UNSIGNED NULL AFTER `id`');
    db.runSql('ALTER TABLE `event_participant` ADD CONSTRAINT `pk_event_participant_event_id` FOREIGN KEY (`event_id`) REFERENCES `event`(`id`)');
    return db.runSql('UPDATE `event_participant` SET `event_id` = 1');
};

exports.down = function (db) {
    db.runSql('ALTER TABLE `event_participant` DROP FOREIGN KEY `pk_event_participant_event_id`');
    db.runSql('ALTER TABLE `event_participant` DROP COLUMN event_id');
    db.runSql('DELETE FROM event');
    return db.runSql('ALTER TABLE `event` AUTO_INCREMENT = 1');
};

exports._meta = {
    "version": 1
};
