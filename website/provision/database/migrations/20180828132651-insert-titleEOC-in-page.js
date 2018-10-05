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
  db.runSql(`UPDATE page SET title = '{"text": {"_text": {"en": "operators conference: Legacy 600, Legacy 650"}}, "eventTitle": "2018 EEOC Indonesia"}' WHERE id = 132199
  `);
  return db.runSql(`UPDATE page SET title = '{"text": {"_text": {"en": "conference operators: Phenom 100 & 300 and Legacy 600 & 650"}}, "eventTitle": "2018 EEOC India"}' WHERE id = 122020
  `);
};

exports.down = function(db) {
  db.runSql(`UPDATE page SET title = '{"text": {"_text": {"en": "operators conference: Legacy 600, Legacy 650"}}}' WHERE id = 132199
  `);
  return db.runSql(`UPDATE page SET title = '{"text": {"_text": {"en": "conference operators: Phenom 100 & 300 and Legacy 600 & 650"}}}' WHERE id = 122020
  `);
};

exports._meta = {
  "version": 1
};
