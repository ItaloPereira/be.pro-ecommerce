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
    ALTER TABLE \`airport\` ADD COLUMN \`centerPoint\` JSON
  `);

  return db.runSql(`
  UPDATE \`airport\` SET \`centerPoint\` = '{"lat": "21.9931013", "lng": "117.7364218.8"}' WHERE \`id\` = 3;
  UPDATE \`airport\` SET \`centerPoint\` = '{"lat": "3.9858932", "lng": "-91.8695412.3"}' WHERE \`id\` = 5;
  UPDATE \`airport\` SET \`centerPoint\` = '{"lat": "-7.8422463", "lng": "94.0864969.4"}' WHERE \`id\` = 6;
  UPDATE \`airport\` SET \`centerPoint\` = '{"lat": "41.9102415", "lng": "12.3959133.11"}' WHERE \`id\` = 7;
  UPDATE \`airport\` SET \`centerPoint\` = '{"lat": "32.1054753", "lng": "-37.0853601.3"}' WHERE \`id\` = 10;
  UPDATE \`airport\` SET \`centerPoint\` = '{"lat": "17.3076963", "lng": "109.6238314.3"}' WHERE \`id\` = 14;
  UPDATE \`airport\` SET \`centerPoint\` = '{"lat": "13.0110319", "lng": "96.9922765.6"}' WHERE \`id\` = 15;
  UPDATE \`airport\` SET \`centerPoint\` = '{"lat": "34.8867484", "lng": "37.6157213.8"}' WHERE \`id\` = 19;
  UPDATE \`airport\` SET \`centerPoint\` = '{"lat": "13.2906626", "lng": "-154.0349417.3"}' WHERE \`id\` = 20;
  UPDATE \`airport\` SET \`centerPoint\` = '{"lat": "21.4653115", "lng": "-84.0592773.6"}' WHERE \`id\` = 23;
  UPDATE \`airport\` SET \`centerPoint\` = '{"lat": "21.3281792", "lng": "-157.8691136.12"}' WHERE \`id\` = 213;
  UPDATE \`airport\` SET \`centerPoint\` = '{"lat": "26.6791495", "lng": "12.7207352.15"}' WHERE \`id\` = 337;
  UPDATE \`airport\` SET \`centerPoint\` = '{"lat": "28.6472799", "lng": "68.128378.5"}' WHERE \`id\` = 344;
  UPDATE \`airport\` SET \`centerPoint\` = '{"lat": "9.0817276", "lng": "-79.5932243.11"}' WHERE \`id\` = 365;
  UPDATE \`airport\` SET \`centerPoint\` = '{"lat": "17.8586727", "lng": "-156.8907282.3"}' WHERE \`id\` = 400;
  UPDATE \`airport\` SET \`centerPoint\` = '{"lat": "21.4653115", "lng": "-115.4362312.3"}' WHERE \`id\` = 414;
  UPDATE \`airport\` SET \`centerPoint\` = '{"lat": "31.6059344", "lng": "-149.4733571.7"}' WHERE \`id\` = 505;
  UPDATE \`airport\` SET \`centerPoint\` = '{"lat": "7.3630095", "lng": "151.6091109.16"}' WHERE \`id\` = 18;
  `);

};

exports.down = function(db) {
  return db.runSql(`
    ALTER TABLE \`airport\` DROP COLUMN \`centerPoint\`
  `);
};

exports._meta = {
  "version": 1
};
