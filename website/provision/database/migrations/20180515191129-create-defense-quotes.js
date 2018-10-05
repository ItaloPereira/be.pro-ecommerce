'use strict';
const fs = require('fs');


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
  return db.runSql(fs.readFileSync(__dirname + '/sqls/20180515174020-insert-defense-quotes.sql', 'utf8'));
};

exports.down = function(db) {
  return db.runSql(`
    DELETE FROM \`app_quote\` WHERE id IN (12036,12037,12038,12039,12040,12041)
  `);
};

exports._meta = {
  "version": 1
};
