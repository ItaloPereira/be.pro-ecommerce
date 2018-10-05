'use strict';

var dbm;
var type;
var seed;

/**
  * We receive the dbmigrate dependency from dbmigrate initially.
  * This enables us to not have to rely on NODE_PATH.
  */
exports.setup = function(options, seedLink) {
  dbm = options.dbmigrate;
  type = dbm.dataType;
  seed = seedLink;
};

exports.up = function(db) {
    db.runSql('ALTER TABLE `event` RENAME `event_participant`');
    return db.runSql(`
        CREATE TABLE IF NOT EXISTS \`event\` (
            \`id\` int(10) unsigned NOT NULL AUTO_INCREMENT primary key,
            \`bu\` VARCHAR(30) NOT NULL,
            \`title\` VARCHAR(50) NOT NULL,
            \`status\` enum('active', 'disabled') not null default 'active',
            \`created\` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
            \`updated\` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
        ) ENGINE=InnoDB
    `);
};

exports.down = function(db) {
    db.runSql('DROP TABLE `event`');
    return db.runSql('ALTER TABLE `event_participant` RENAME `event`');
};

exports._meta = {
  "version": 1
};
