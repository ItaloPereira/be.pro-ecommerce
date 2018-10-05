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
    delete from block where id in (12132455,12132454,12132453,12132452,12132451,12132450,12132493,12132531,12132585,12132625);
    delete from container where id in (12126486,12126485,12126484,12126483,12126482,12126481,12126516,12126546,12126588,12126619);
    delete from widget where id in (12132570,12132569,12132568,12132567,12132566,12132565,12132608,12132646,12132700,12132740);
  `);
};

exports.down = function(db) {
  return null;
};

exports._meta = {
  "version": 1
};
