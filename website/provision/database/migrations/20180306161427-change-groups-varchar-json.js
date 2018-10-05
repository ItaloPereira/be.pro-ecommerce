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
  ALTER TABLE conference_activities_groups MODIFY COLUMN conference_activities_groups.title JSON;
  `)
};

exports.down = function(db) {
  return db.runSql(`
  ALTER TABLE conference_activities_groups MODIFY COLUMN conference_activities_groups.title VARCHAR;
  `);
};

exports._meta = {
  "version": 1
};
