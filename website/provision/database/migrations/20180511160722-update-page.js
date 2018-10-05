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
    ALTER TABLE \`page\` ADD COLUMN \`description_backup\` JSON
  `);
  db.runSql(`
    UPDATE page SET description_backup = JSON_SET(title, '$.text._text', JSON_OBJECT(JSON_UNQUOTE(JSON_EXTRACT(JSON_KEYS(title ->> "$[0].text._text"), '$[0]')), description))
  `);
  db.runSql(`
    ALTER TABLE page DROP COLUMN \`description\`
  `);
  db.runSql(`
    ALTER TABLE page ADD COLUMN \`description\` JSON
  `)
  db.runSql(`
    UPDATE page SET description = \`description_backup\`
  `);
  return db.runSql(`
    ALTER TABLE page DROP COLUMN description_backup
  `);
};

exports.down = function(db) {
  db.runSql(`
    ALTER TABLE \`page\` ADD COLUMN \`description_backup\` text
  `);
  db.runSql(`
    UPDATE \`page\` SET \`description_backup\` = JSON_UNQUOTE(JSON_EXTRACT(\`description\`, JSON_UNQUOTE(JSON_SEARCH(\`description\` ->> '$', 'one', '%'))))
  `);
  db.runSql(`
    ALTER TABLE \`page\` DROP COLUMN \`description\`
  `);
  db.runSql(`
    ALTER TABLE \`page\` ADD COLUMN \`description\` text
  `);
  db.runSql(`
    UPDATE \`page\` SET \`description\` = \`description_backup\`
  `);
  return db.runSql(`
    ALTER TABLE \`page\` DROP COLUMN \`description_backup\`
  `);
};

exports._meta = {
  "version": 1
};
