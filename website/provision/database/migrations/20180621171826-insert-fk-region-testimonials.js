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
  ALTER TABLE \`testimonials\`
  ADD CONSTRAINT \`fk_testimonials_region\`
  FOREIGN KEY (\`region_id\`) REFERENCES \`region\`(\`id\`);
  `);
};

exports.down = function(db) {
  return db.runSql(`
  ALTER TABLE \`testimonials\` DROP FOREIGN KEY \`fk_testimonials_region\`;
`);
};

exports._meta = {
  "version": 1
};
