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
  INSERT INTO \`region\` VALUES (1208,'Global','[{\"code\": \"en\", \"description\": {\"_text\": {\"cn\": \"英语\", \"es\": \"inglés\", \"pt\": \"english\"}}}]','global','{\"twitter\": \"embraer\", \"youtube\": \"embraer\", \"facebook\": \"embraer\", \"instagram\": \"4116605238.b7df0f6.c0e5da41da444e9380558c8cf1d934ad\", \"twitterTags\": [], \"facebookTags\": [], \"instagramTags\": []}','[]','db6200','2017-11-20 17:30:49','2018-03-27 22:12:06',1,'defense','defense & security')
  `);
};

exports.down = function(db) {
  return db.runSql(`
    DELETE FROM \`region\` WHERE \`id\`.\`1208\`
  `);
};

exports._meta = {
  "version": 1
};
