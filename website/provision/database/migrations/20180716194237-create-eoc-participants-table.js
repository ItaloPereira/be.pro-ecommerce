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
  CREATE TABLE \`eoc_participant\` (
    \`id\` int(11) unsigned NOT NULL AUTO_INCREMENT,
    \`eoc_id\` int(10) unsigned DEFAULT NULL,
    \`data\` json DEFAULT NULL,
    \`createdAt\` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    \`updatedAt\` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    \`status\` tinyint(11) DEFAULT NULL,
    PRIMARY KEY (\`id\`),
    KEY \`eoc_id\` (\`eoc_id\`),
    CONSTRAINT \`eoc_participant_ibfk_1\` FOREIGN KEY (\`eoc_id\`) REFERENCES \`eoc\` (\`id\`)
  ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4
  `);
};

exports.down = function(db) {
  db.runSql(`
    ALTER TABLE \`eoc_participant\` DROP FOREIGN KEY \`eoc_participant_ibfk_1\`;
  `);
  return db.runSql(`
    DROP TABLE \`eoc_participant\`
  `);
};

exports._meta = {
  "version": 1
};
