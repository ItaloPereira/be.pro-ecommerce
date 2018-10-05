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
  db.runSql('DELETE FROM support WHERE region_id = 5');
  return db.runSql(`
    INSERT INTO support (id, region_id, contact_id, aircraft_id, type_id)
    SELECT null as id, 5 as region_id, contact_id, aircraft_id, type_id FROM support WHERE region_id = 90 AND type_id IN (1,2)`); 
};

exports.down = function(db) {
  return null;
};

exports._meta = {
  "version": 1
};
