'use strict';
const fs = require('fs');

var dbm;
var type;
var seed;

exports.setup = function(options, seedLink) {
  dbm = options.dbmigrate;
  type = dbm.dataType;
  seed = seedLink;
};

exports.up = function(db) {
  return db.runSql(fs.readFileSync(__dirname + '/sqls/20180515171517-insert-defense-widgets.sql', 'utf8'));
};

exports.down = function(db) {
  return db.runSql(` 
    DELETE FROM \`widget\` WHERE id IN (1204003,12012250,12012251,12012669,12012670,12012671,12012672,12012673,12012674,12012675,12012676,12012677,12012889,12012890,12012891,12012892,12012893,12012894,12012895,12012896,12012897,12012900,12012901,12012902,12012903,12012904,12012905,12012911,12012912,12012913,12012914,12012915,12012976,12012977,12012978,12012979,12012980,12012981,12012982,12012983,12012984,12012985,12012986,12012987,12012988,12012989,12012990,12013089,12013090,12013091,12013092,12013093,12013094,12013095,12013096,12013097,12013098,12013099,12013100,12013101,12013102,12013103,12013104,12013105,12013106,12013107,12013108,12013128,12013129,12013130,12013131,12013132,12013133,12013134,12013135,12013136,12013137,12013138,12013139,12013140,12013141,12013142,12013143,12013144,12013145,12013146,12013197,12013198,12013199,12013200,12013201,12013202,12013203,12013204,12013277,12013278,12013279,12013280,12013281,12013282,12013283,12013284,1201)
  `);
};

exports._meta = {
  "version": 1
};