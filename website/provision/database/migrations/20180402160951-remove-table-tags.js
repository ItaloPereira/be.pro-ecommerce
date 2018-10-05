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
    DROP TABLE tags;
  `);
};

exports.down = function(db) {
  return db.runSql(`
  CREATE TABLE tags (
    id int(10) unsigned NOT NULL AUTO_INCREMENT,
    region_id int(10) unsigned NOT NULL,
    business_unit varchar(30) NOT NULL,
    portal_name varchar(40) DEFAULT NULL,
    data JSON NOT NULL,
    createdAt DATETIME NOT NULL DEFAULT NOW(),
    updatedAt DATETIME NULL DEFAULT NULL ON UPDATE NOW(),
    PRIMARY KEY (id),
    KEY fk_region_tags (region_id),
    CONSTRAINT fk_region_tags FOREIGN KEY (region_id) REFERENCES region (id),
    KEY fk_region_bus (business_unit),
    CONSTRAINT fk_region_bus FOREIGN KEY (business_unit) REFERENCES region (business_unit)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
  `);
};

exports._meta = {
  "version": 1
};
