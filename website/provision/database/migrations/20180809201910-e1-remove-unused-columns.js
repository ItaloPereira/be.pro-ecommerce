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
    db.runSql('ALTER TABLE `event_participant` DROP FOREIGN KEY `pk_event_rid`');
    db.runSql('ALTER TABLE `event_participant` DROP COLUMN `region_id`');
    return db.runSql('ALTER TABLE `event_participant` DROP COLUMN `reply`');
};

exports.down = function (db) {
    return db.runSql('ALTER TABLE `event` ADD COLUMN `reply` JSON default NULL');
};

exports._meta = {
    "version": 1
};
