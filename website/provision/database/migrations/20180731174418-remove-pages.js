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
  DELETE FROM block WHERE container_id IN (SELECT id FROM container WHERE page_id IN (120750,120672,121903,122029))`);
  db.runSql(`
  DELETE FROM widget WHERE id IN (SELECT widget_id FROM block WHERE container_id IN (SELECT id FROM container WHERE page_id IN (120750,120672,121903,122029)))`);
  db.runSql(`
  DELETE FROM container WHERE page_id IN (120750,120672,121903,122029)`);
  db.runSql(`
  UPDATE page SET parent_id = NULL WHERE id IN  (120750,120672,121903,122029)
  `);
  return db.runSql(`
  DELETE FROM page WHERE id IN (120750,120672,121903,122029)
  `);
};

exports.down = function(db) {
  return null;
};

exports._meta = {
  "version": 1
};
