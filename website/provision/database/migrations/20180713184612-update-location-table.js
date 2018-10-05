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
    set @object = json_object('text', json_object('_text', json_object('en',''))); 
  
    alter table location add namejson json; 
    alter table location add countryjson json; 
    
    update location set namejson = json_set(@object, '$.text._text.en', name), countryjson = json_set(@object, '$.text._text.en', country); 
    
    alter table location drop name; 
    alter table location drop country; 
    
    alter table location add column name json; 
    alter table location add column country json; 
    
    update location set name = namejson, country = countryjson; 
    
    alter table location drop namejson; 
    alter table location drop countryjson; 
  `);
};

exports.down = function(db) {
  return db.runSql(`
    alter table location add column nameT varchar(120);
    alter table location add column countryT varchar(50);

    update location set nameT = json_unquote(json_extract(name, '$.text._text.en')), countryT = json_unquote(json_extract(country, '$.text._text.en'));

    alter table location drop column name;
    alter table location drop column country;

    alter table location add column name varchar(120);
    alter table location add column country varchar(50);

    update location set name = nameT, country = countryT;

    alter table location drop column nameT;
    alter table location drop column countryT;
  `);
};

exports._meta = {
  "version": 1
};
