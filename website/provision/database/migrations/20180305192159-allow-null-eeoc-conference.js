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
  db.runSql(`
  ALTER TABLE \`conference\` MODIFY \`planes\` JSON NULL;
  `);
  return db.runSql(`
  ALTER TABLE \`conference\` MODIFY \`options\` JSON NULL;

  `);
};

exports.down = function(db) {
  return null;
};

exports._meta = {
  "version": 1
};
