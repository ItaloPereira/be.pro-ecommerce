'use strict';

const fs = require('fs');
let dbm;
let type;
let seed;

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
  return db.runSql(fs.readFileSync(__dirname + '/sqls/20180809111430-update-testimonials-form-up.sql', 'utf8'));
};

exports.down = function(db) {
  return db.runSql(fs.readFileSync(__dirname + '/sqls/20180809111630-update-testimonials-form-down.sql', 'utf8'));
};

exports._meta = {
  "version": 1
};
