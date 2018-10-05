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
  db.runSql('ALTER TABLE `app_quote` ADD COLUMN `role` JSON');
  return db.runSql('ALTER TABLE `app_quote` MODIFY COLUMN `type` ENUM(\'text\',\'image\', \'video\', \'customer\')');
};

exports.down = function(db) {
  db.runSql('ALTER TABLE `app_quote` DROP COLUMN `role`');
  return db.runSql('ALTER TABLE `app_quote` MODIFY COLUMN `type` ENUM(\'text\',\'image\', \'video\')');
};

exports._meta = {
  "version": 1
};
