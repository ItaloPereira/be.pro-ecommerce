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
  INSERT INTO \`blog_category\` VALUES (1203,'[\"en\", \"pt\", \"zh\", \"es\"]',1208,'{\"_text\": {\"en\": \"General\", \"es\": \"Geral\", \"pt\": \"Geral\", \"zh\": \"General\"}}','2017-12-14 19:01:44','2018-05-15 17:43:57');
  `);
};

exports.down = function(db) {
  return db.runSql(`
    DELETE FROM \`app_quote\` WHERE id IN (1203)
  `);
};

exports._meta = {
  "version": 1
};
