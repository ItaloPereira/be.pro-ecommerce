'use strict';

const fs = require('fs');

let dbm;
let type;
let seed;

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
  db.runSql('UPDATE `container` SET `type` = \'app\', `subtype` = 12 WHERE `id` = 12138103');
  db.runSql('UPDATE `container` SET `type` = \'app\', `subtype` = 15 WHERE `id` = 12139096');
  db.runSql('UPDATE `container` SET `position` = `position` + 1 WHERE `page_id` = 121880 AND `position` > 0');
  db.runSql(`INSERT INTO \`container\` (\`id\`, \`position\`, \`page_id\`, \`type\`, \`infinity_scroll\`, \`subtype\`, \`desktop\`, \`tablet\`, \`mobile\`, \`tabs\`, \`created\`, \`updated\`, \`bu\`)
  VALUES
    (null, 1, 121880, 'app', 0, 28, 1, 1, 1, NULL, NOW(), NULL, NULL)`
  );
  db.runSql('UPDATE `container` SET `type` = \'app\', `subtype` = 30 WHERE `id` = 12139255');
  db.runSql('UPDATE `container` SET `type` = \'app\', `subtype` = 29 WHERE `id` = 12139561');
  db.runSql(fs.readFileSync(__dirname + '/sqls/20180906123644-insert-service-apps.sql', 'utf8'));
  db.runSql(`INSERT INTO aircraft_event SELECT concat('5',id), 5,data,startsAt,endsAt,created,updated FROM aircraft_event WHERE region_id = 90`);
  return db.runSql(`INSERT INTO aircraft_event_plane SELECT null as id,5 as region_id,aircraft_id,concat('5',event_id) as event_id,created,updated FROM aircraft_event_plane WHERE region_id = 90`);
};

exports.down = function(db) {
  db.runSql('DELETE FROM `support_contact` WHERE `id` IN (1,2)');
  return db.runSql('DELETE FROM `support` WHERE `contact_id` IN (1,2)');
};

exports._meta = {
  "version": 1
};
