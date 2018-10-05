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
    ALTER TABLE eoc_participant ADD COLUMN page_id int(10) unsigned
  `);

  db.runSql(`
    ALTER TABLE eoc_participant ALTER status SET DEFAULT 5
  `);

  return db.runSql(`
    ALTER TABLE \`eoc_participant\`
    ADD CONSTRAINT \`fk_participant_page\`
    FOREIGN KEY (\`page_id\`) REFERENCES \`page\`(\`id\`);
  `);
};

exports.down = function(db) {
  db.runSql(`
    ALTER TABLE eoc_participant DROP COLUMN page_id
  `);

  return db.runSql(`
  ALTER TABLE \`eoc_participant\` DROP FOREIGN KEY \`fk_participant_page\`;

  `);
};

exports._meta = {
  "version": 1
};
