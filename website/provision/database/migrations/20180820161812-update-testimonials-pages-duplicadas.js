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
    update page set status = 7 where id in (132072, 132073, 132074, 132075);
  `);
};

exports.down = function(db) {
  return db.runSql(`
    update page set status = 2 where id in (132072, 132073, 132074, 132075);
  `);
};

exports._meta = {
  "version": 1
};
