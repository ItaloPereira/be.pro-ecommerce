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
    ALTER TABLE \`blog\` ADD COLUMN \`page_id\` int(10) unsigned NOT NULL
  `);
  db.runSql(`
    ALTER TABLE \`blog\` ADD COLUMN \`publishedAt\` datetime DEFAULT NULL
  `);
  db.runSql(`
    ALTER TABLE \`blog\` DROP COLUMN \`item_datetime\`
  `);
  db.runSql(`
    ALTER TABLE \`blog\` DROP COLUMN \`scheduledTo\`
  `);

  return db.runSql(`
    ALTER TABLE \`blog\`
    ADD CONSTRAINT \`fk_page_blog\`
    FOREIGN KEY (\`page_id\`) REFERENCES \`page\`(\`id\`)
  `);
};

exports.down = function(db) {
  db.runSql(`
    ALTER TABLE \`blog\` DROP FOREIGN KEY \`fk_page_blog\`;
  `);
  db.runSql(`
    ALTER TABLE \`blog\` ADD COLUMN \`scheduledTo\` datetime DEFAULT NULL;
  `);
  db.runSql(`
    ALTER TABLE \`blog\` ADD COLUMN \`item_datetime\` datetime DEFAULT NULL;
  `);
  db.runSql(`
    ALTER TABLE \`blog\` DROP COLUMN \`publishedAt\`;
  `);
  return db.runSql(`
    ALTER TABLE \`blog\` DROP COLUMN \`page_id\`
  `);
};

exports._meta = {
  "version": 1
};
