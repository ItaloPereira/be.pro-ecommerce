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
    INSERT INTO \`page\` SELECT CONCAT((select id from region where code = 'global' and business_unit = 'executive'), id) as id, title, tags, slug, (select id from region where code = 'global' and business_unit = 'executive') as region_id, parent_id, user_id, 0, type, NOW(), NOW(), media, infiniteScroll, description, locked, floodlight_id, review_accepted, messages FROM \`page\` WHERE JSON_EXTRACT(title, '$.text._text') LIKE '%magazine%' AND status = 2 AND region_id = (SELECT id FROM region WHERE code = 'global' AND business_unit = 'corporate')
  `);
  db.runSql(`
    INSERT INTO \`container\` SELECT CONCAT((select id from region where code = 'global' and business_unit = 'executive'), id) as id, position, (SELECT CONCAT((select id from region where code = 'global' and business_unit = 'executive'),id) FROM page WHERE JSON_EXTRACT(title, '$.text._text') LIKE '%magazine%' AND status = 2 AND region_id = (SELECT id FROM \`region\` WHERE code = 'global' AND business_unit = 'corporate')) as page_id, type, infinity_scroll, subtype, desktop, tablet, mobile, tabs, NOW(), NOW() FROM container WHERE page_id = (SELECT id FROM \`page\` WHERE JSON_EXTRACT(title, '$.text._text') LIKE '%magazine%' AND region_id = (SELECT id FROM \`region\` WHERE code = 'global' AND business_unit = 'corporate') LIMIT 1)
  `);
  return db.runSql(`
    UPDATE \`menu\` SET data = JSON_SET(data, '$[10].items[3]', JSON_OBJECT('page_id',(SELECT id FROM \`page\` WHERE id = (SELECT id FROM page WHERE JSON_EXTRACT(title, '$.text._text') LIKE '%magazine%' AND status = 0 AND region_id = (SELECT id FROM \`region\` WHERE code = 'global' AND business_unit = 'executive'))))) WHERE region_id = (SELECT id FROM \`region\` WHERE code = 'global' AND business_unit = 'executive')
  `);
};

exports.down = function(db) {
  db.runSql(`
    DELETE FROM \`container\` WHERE page_id = (SELECT id FROM \`page\` WHERE JSON_EXTRACT(title, '$.text._text') LIKE '%magazine%' AND region_id = (SELECT id FROM \`region\` WHERE code = 'global' AND business_unit = 'executive'))
  `);
  db.runSql(`
    DELETE FROM \`page\` WHERE JSON_EXTRACT(title, '$.text._text') LIKE '%magazine%' AND status = 0 AND region_id = (SELECT id FROM region WHERE code = 'global' AND business_unit = 'executive') LIMIT 1
  `);
  return db.runSql(`
    UPDATE \`menu\` SET data = JSON_REMOVE(data, '$[10].items[3].page_id') WHERE region_id = (SELECT id FROM region WHERE code = 'global' AND business_unit = 'executive');
  `);
};

exports._meta = {
  "version": 1
};
