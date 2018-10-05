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
  return db.runSql(fs.readFileSync(__dirname + '/sqls/20180515174605-insert-defense-news.sql', 'utf8'));
};

exports.down = function(db) {
  return db.runSql(`
    DELETE FROM \`news\` WHERE id IN (1206335,1206336,1206337,1206338,1206339,1206340,1206341,1206342,1206343,1206344,1206345,1206346)
  `);
};

exports._meta = {
  "version": 1
};
