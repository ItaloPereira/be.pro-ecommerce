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
  INSERT INTO \`menu\` VALUES (1207,'[{\"page_id\": 120527, \"group_id\": 1, \"hasChildren\": false, \"isPrincipal\": true}, {\"page_id\": 120528, \"group_id\": 1, \"hasChildren\": false, \"isPrincipal\": true}, {\"page_id\": 120513, \"group_id\": 1, \"hasChildren\": false, \"isPrincipal\": true}, {\"page_id\": 120535, \"group_id\": 1, \"hasChildren\": false, \"isPrincipal\": true}, {\"page_id\": 120534, \"group_id\": 1, \"hasChildren\": false, \"isPrincipal\": true}, {\"page_id\": 120532, \"group_id\": 1, \"hasChildren\": false, \"isPrincipal\": true}, {\"text\": {\"_text\": {\"en\": \"defense\"}}, \"items\": [{\"page_id\": 120520}, {\"page_id\": 120499, \"group_id\": 1, \"hasChildren\": false, \"isPrincipal\": true}], \"group_id\": 4, \"hasChildren\": true, \"isPrincipal\": false}, {\"text\": {\"_text\": {\"en\": \"media\"}}, \"items\": [{\"page_id\": 120521}, {\"page_id\": 120522}], \"group_id\": 5, \"hasChildren\": true, \"isPrincipal\": false}, {\"text\": {\"_text\": {\"en\": \"hidden\"}}, \"items\": [{\"page_id\": 120196, \"group_id\": 1, \"hasChildren\": false, \"isPrincipal\": true}], \"group_id\": 0, \"hasChildren\": true, \"isPrincipal\": false}]',1208,'2017-11-20 17:30:50','2018-05-11 14:45:30');
  `);
};

exports.down = function(db) {
  return db.runSql(`
    DELETE FROM \`menu\` WHERE id IN (1207)
  `);
};

exports._meta = {
  "version": 1
};
