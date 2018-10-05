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
  INSERT INTO \`webseries\` VALUES (1,'{\"text\": {\"_text\": {\"en\": \"Testing Webseries\"}}, \"media\": {\"video\": {\"url\": \"https://daflwcl3bnxyt.cloudfront.net/m/082990741b1acbe5/original/Legacy-500-s-quiet-cabin-fly-by-wire-stand-out.mp4\", \"bynderId\": \"46FF4451-6B6E-47A6-9AB867D767F4329E\"}, \"fallback\": {\"url\": \"https://daflwcl3bnxyt.cloudfront.net/m/35f1d67538574dfc/original/Agrishow2018-1.jpg\", \"bynderId\": \"8C6B1897-5B59-4816-B49F4E1F841F8556\"}}, \"title\": {\"_text\": {\"en\": \"S01 E01\"}}, \"author\": \"Embraer\", \"subtitle\": {\"_text\": {\"en\": \"Testing\"}}}','2018-05-04 10:44:33',NULL);
  `);
};

exports.down = function(db) {
  return db.runSql(`
    DELETE FROM \`webseries\` WHERE id IN (1)
  `);
};

exports._meta = {
  "version": 1
};
