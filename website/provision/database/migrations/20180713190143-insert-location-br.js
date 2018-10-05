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
    update location set name = '{"text": {"_text": {"en": "Beijing", "pt": "Pequim"}}}', country =  '{"text": {"_text": {"en": "China", "pt": "China"}}}' where id =	3;

    update location set name = '{"text": {"_text": {"en": "São Paulo", "pt": "São Paulo"}}}' , country =  '{"text": {"_text": {"en": "Brazil", "pt": "Brasil"}}}' where id = 	5;
    
    update location set name = '{"text": {"_text": {"en": "Perth", "pt": "Perth"}}}', country =  '{"text": {"_text": {"en": "Australia", "pt": "Austrália"}}}' where id = 	6;
    
    update location set name = '{"text": {"_text": {"en": "Berlin", "pt": "Berlim"}}}', country =  '{"text": {"_text": {"en": "Germany", "pt": "Alemanha"}}}' where id = 	7;
    
    update location set name = '{"text": {"_text": {"en": "London", "pt": "Londres"}}}', country =  '{"text": {"_text": {"en": "United Kingdom", "pt": "Reino Unido"}}}' where id = 	10;
    
    update location set name = '{"text": {"_text": {"en": "Tokyo", "pt": "Tóquio"}}}', country =  '{"text": {"_text": {"en": "Japan", "pt": "Japão"}}}' where id = 	14;
    
    update location set name = '{"text": {"_text": {"en": "Singapore", "pt": "Singapura"}}}' , country =  '{"text": {"_text": {"en": "Singapore", "pt": "Singapura"}}}' where id = 	15;
    
    update location set name = '{"text": {"_text": {"en": "Sydney", "pt": "Sydney"}}}', country =  '{"text": {"_text": {"en": "Australia", "pt": "Austrália"}}}' where id = 	18;
    
    update location set name = '{"text": {"_text": {"en": "Moscow", "pt": "Moscou"}}}', country =  '{"text": {"_text": {"en": "Russia", "pt": "Rússia"}}}' where id = 	19;
    
    update location set name = '{"text": {"_text": {"en": "Los Angeles", "pt": "Los Angeles"}}}' , country =  '{"text": {"_text": {"en": "United States", "pt": "Estados Unidos"}}}' where id = 	20;
    
    update location set name = '{"text": {"_text": {"en": "Miami", "pt": "Miami"}}}', country =  '{"text": {"_text": {"en": "United States", "pt": "Estados Unidos"}}}' where id = 	23;
    
    update location set name = '{"text": {"_text": {"en": "Honolulu", "pt": "Honolulu"}}}', country =  '{"text": {"_text": {"en": "United States", "pt": "Estados Unidos"}}}' where id = 	213;
    
    update location set name = '{"text": {"_text": {"en": "Cape Town", "pt": "Cidade do Cabo"}}}' , country =  '{"text": {"_text": {"en": "South Africa", "pt": "África do Sul"}}}' where id = 	337;
    
    update location set name = '{"text": {"_text": {"en": "Delhi", "pt": "Déli"}}}', country =  '{"text": {"_text": {"en": "India", "pt": "Índia"}}}' where id = 	344;
    
    update location set name = '{"text": {"_text": {"en": "Lima", "pt": "Lima"}}}', country =  '{"text": {"_text": {"en": "Peru", "pt": "Peru"}}}' where id = 	365;
    
    update location set name = '{"text": {"_text": {"en": "San Francisco", "pt": "São Francisco"}}}' , country =  '{"text": {"_text": {"en": "United States", "pt": "Estados Unidos"}}}' where id = 	400;
    
    update location set name = '{"text": {"_text": {"en": "Montreal", "pt": "Montreal"}}}', country =  '{"text": {"_text": {"en": "Canada", "pt": "Canadá"}}}' where id = 	414;
    
    update location set name = '{"text": {"_text": {"en": "Anchorage", "pt": "Anchorage"}}}' , country =  '{"text": {"_text": {"en": "United States", "pt": "Estados Unidos"}}}' where id = 	505;
  `);
};

exports.down = function(db) {
  return db.runSql(`
    update location set name = json_remove(name, '$.text._text.pt'), country = json_remove(country, '$.text._text.pt');
  `);
};

exports._meta = {
  "version": 1
};
