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
  delete from block where id in (12131721,12131722,12131723,12131724,12131725,12131257,12131582,12131430,12131335,12131726);
  delete from container where id in (12125970,12125971,12125972,12125973,12125974,12125599,12125855,12125735,12125660,12125975);
  delete from widget where id in (12131957,12131958,12131959,12131960,12131961,12131666,12131571,12131962);
  `);
};

exports.down = function(db) {
  return null;
};

exports._meta = {
  "version": 1
};
