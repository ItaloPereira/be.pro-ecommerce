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
  UPDATE \`testimonials\` SET \`region_id\` = (SELECT \`region\`.\`id\` FROM \`region\` WHERE \`business_unit\` = 'executive' AND code = 'global' LIMIT 1)
  `);
};

exports.down = function(db) {
  return db.runSql(`
    UPDATE \`testimonials\` SET \`region_id\` = NULL
  `);};

exports._meta = {
  "version": 1
};
