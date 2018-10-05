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
    UPDATE \`page\` SET \`media\` = JSON_SET(\`media\`, '$.fallback', JSON_OBJECT("url","https://daflwcl3bnxyt.cloudfront.net/m/04c1782b5431f9d0/original/home-embraer-fallback.gif", "bynderId","D90EDDC8-2964-4393-82C2683E25471A3A", "type", "")) WHERE \`id\` = 132079
  `);

  return db.runSql(`
    UPDATE \`page\` SET \`media\` = JSON_SET(\`media\`, '$.fallback',JSON_OBJECT("url","https://daflwcl3bnxyt.cloudfront.net/m/04c1782b5431f9d0/original/home-embraer-fallback.gif", "bynderId","D90EDDC8-2964-4393-82C2683E25471A3A", "type", "")) WHERE \`id\` = 132080
  `);
};

exports.down = function(db) {
  db.runSql(`
  UPDATE \`page\` SET \`media\` = JSON_SET(\`media\`, '$.fallback', JSON_OBJECT("url","https://daflwcl3bnxyt.cloudfront.net/m/408c17d324317618/original/320x240_home.gif", "bynderId","9F740026-286A-41A2-B431A9881648E2B3", "type", "")) WHERE \`id\` = 132079
`);

return db.runSql(`
  UPDATE \`page\` SET \`media\` = JSON_SET(\`media\`, '$.fallback',JSON_OBJECT("url","https://daflwcl3bnxyt.cloudfront.net/m/408c17d324317618/original/320x240_home.gif", "bynderId","9F740026-286A-41A2-B431A9881648E2B3", "type", "")) WHERE \`id\` = 132080
`);
};

exports._meta = {
  "version": 1
};
