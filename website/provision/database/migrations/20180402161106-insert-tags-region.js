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
  UPDATE region SET bynder = '{"tags": ["Clientes E-Jets", "Históricas", "E 170", "E 190", "E 195", "Phenom 300", "Phenom 100E", "Legacy 500", "Legacy 650", "Legacy 450", "Lineage 1000E", "Customer Support", "Interior", "Exterior", "A-29 Super Tucano", "KC-390", "Special Missions", "E2 Rollout", "E195-E2 First Flight", "E-Jets E2 Production Line", "E175-wingtips", "E190-E2 First Flight", "E-Jets E2 Interior"]}' WHERE id IN (SELECT id WHERE business_unit = 'corporate');
  `);
};

exports.down = function(db) {
  return db.runSql(`UPDATE region SET bynder = NULL WHERE id IN (SELECT id WHERE  business_unit = 'corporate');`);
};

exports._meta = {
  "version": 1
};
