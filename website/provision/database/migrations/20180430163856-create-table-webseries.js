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
  CREATE TABLE \`webseries\` (
    \`id\` int(10) unsigned NOT NULL AUTO_INCREMENT,
    \`data\` json NOT NULL,
    \`createdAt\` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    \`updatedAt\` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (\`id\`)
  ) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4
  `);
};

exports.down = function(db) {
  return db.runSql(`
    DROP TABLE \`webseries\`
  `);
};

exports._meta = {
  "version": 1
};
