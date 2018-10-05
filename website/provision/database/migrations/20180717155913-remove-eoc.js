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
    ALTER TABLE \`eoc_participant\` DROP FOREIGN KEY \`eoc_participant_ibfk_1\`;
  `);
  db.runSql(`
    ALTER TABLE eoc_participant DROP COLUMN eoc_id
  `);
  return db.runSql(`
    DROP TABLE eoc
  `);
};

exports.down = function(db) {
  return null;
};

exports._meta = {
  "version": 1
};
