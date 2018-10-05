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
  return db.runSql(`
  CREATE TABLE \`eoc\` (
    \`id\` int(11) unsigned NOT NULL AUTO_INCREMENT,
    \`region_id\` int(10) unsigned NOT NULL,
    \`createdAt\` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    \`updatedAt\` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    \`language\` json DEFAULT NULL,
    \`title\` json DEFAULT NULL,
    PRIMARY KEY (\`id\`)
  ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4
  `);
};

exports.down = function(db) {
  return db.runSql(`
    DROP TABLE \`eoc\`
  `);
};

exports._meta = {
  "version": 1
};
