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
    INSERT INTO \`container\` (\`id\`, \`position\`, \`page_id\`, \`type\`, \`infinity_scroll\`, \`subtype\`, \`desktop\`, \`tablet\`, \`mobile\`, \`tabs\`, \`created\`, \`updated\`, \`bu\`)
    VALUES
    (null, 0, 130755, 'app', 0, 10, 1, 1, 1, NULL, NOW(), NULL, NULL);
  `);
};

exports.down = function(db) {
    return null;
};

exports._meta = {
  "version": 1
};
