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
  INSERT INTO \`portal_news\` VALUES (1206338,1208,1206335),(1206339,1208,1206336),(1206340,1208,1206337),(1206341,1208,1206338),(1206342,1208,1206339),(1206343,1208,1206340),(1206344,1208,1206341),(1206345,1208,1206342),(1206346,1208,1206343),(1206347,1208,1206344),(1206348,1208,1206345),(1206349,1208,1206346);
  `);
};

exports.down = function(db) {
  return db.runSql(`
    DELETE FROM \`portal_news\` WHERE id IN (1206338,1206339,1206340,1206341,1206342,1206343,1206344,1206345,1206346,1206347,1206348,1206349)
  `);
};

exports._meta = {
  "version": 1
};
