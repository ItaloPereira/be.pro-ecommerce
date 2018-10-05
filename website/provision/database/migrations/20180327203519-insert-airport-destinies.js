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
UPDATE airport SET airport.destinies = '
[{"Los Angeles":{"lat":34.0522342,"lng":-118.2436849}},
{"Mexico City":{"lat":19.4326077,"lng":-99.133208}},
{"New York City":{"lat":40.7127753,"lng":-74.0059728}},
{"Tokyo":{"lat":35.6894875,"lng":139.6917064}},
{"Toronto":{"lat":43.653226,"lng":-79.3831843}}]'
WHERE id = 505;

UPDATE airport SET airport.destinies = '
[{"Shanghai":{"lat":31.2303904,"lng":121.4737021}},
{"Tokyo":{"lat":35.6894875,"lng":139.6917064}},
{"Berlin":{"lat":52.5200066,"lng":13.404954}},
{"Singapore":{"lat":1.352083,"lng":103.819836}},
{"Bangkok":{"lat":13.7563309,"lng":100.5017651}}]'
WHERE id = 3;

UPDATE airport SET airport.destinies = '
[{"London":{"lat":51.5073509,"lng":-0.1277583}},
{"Madrid":{"lat":40.4167754,"lng":-3.7037902}},
{"Lagos":{"lat":6.5243793,"lng":3.3792057}},
{"Moscow":{"lat":55.755826,"lng":37.6172999}},
{"New York City":{"lat":40.7127753,"lng":-74.0059728}},
{"Cairo":{"lat":30.0444196,"lng":31.2357116}}]'
WHERE id = 7;

UPDATE airport SET airport.destinies = '
[{"Lagos":{"lat":6.5243793,"lng":3.3792057}},
{"Sao Paulo":{"lat":-23.5505199,"lng":-46.6333094}},
{"Cairo":{"lat":30.0444196,"lng":31.2357116}},
{"Istanbul":{"lat":41.0082376,"lng":28.9783589}},
{"London":{"lat":51.5073509,"lng":-0.1277583}}]'
WHERE id = 337;

UPDATE airport SET airport.destinies = '
[{"Beijing":{"lat":39.9041999,"lng":116.4073963}},
{"Cairo":{"lat":30.0444196,"lng":31.2357116}},
{"Bangkok":{"lat":13.7563309,"lng":100.5017651}},
{"Instanbul":{"lat":41.0082376,"lng":28.9783589}},
{"London":{"lat":51.5073509,"lng":-0.1277583}}]'
WHERE id = 344;

UPDATE airport SET airport.destinies = '
[{"Los Angeles":{"lat":34.0522342,"lng":-118.2436849}},
{"Tokyo":{"lat":35.6894875,"lng":139.6917064}},
{"Sydney":{"lat":-33.8688197,"lng":151.2092955}},
{"Anchorage":{"lat":61.2180556,"lng":-149.9002778}},
{"San Francisco":{"lat":37.7749295,"lng":-122.4194155}}]'
WHERE id = 213;

UPDATE airport SET airport.destinies = '
[{"Mexico City":{"lat":19.4326077,"lng":-99.133208}},
{"Sao Paulo":{"lat":-23.5505199,"lng":-46.6333094}},
{"Buenos Aires":{"lat":-34.6036844,"lng":-58.3815591}},
{"Madrid":{"lat":40.4167754,"lng":-3.7037902}},
{"Bogotá":{"lat":4.7109886,"lng":-74.072092}}]'
WHERE id = 365;

UPDATE airport SET airport.destinies = '
[{"Berlin":{"lat":52.5200066,"lng":13.404954}},
{"Madrid":{"lat":40.4167754,"lng":-3.7037902}},
{"New York City":{"lat":40.7127753,"lng":-74.0059728}},
{"Moscow":{"lat":55.755826,"lng":37.6172999}},
{"Tel Aviv":{"lat":32.0852999,"lng":34.7817676}}]'
WHERE id = 10;

UPDATE airport SET airport.destinies = '
[{"New York City":{"lat":40.7127753,"lng":-74.0059728}},
{"Mexico City":{"lat":19.4326077,"lng":-99.133208}},
{"Dallas":{"lat":32.7766642,"lng":-96.7969879}},
{"Lima":{"lat":-12.0463731,"lng":-77.042754}},
{"Madrid":{"lat":40.4167754,"lng":-3.7037902}}]'
WHERE id = 20;

UPDATE airport SET airport.destinies = '
[{"Los Angeles":{"lat":34.0522342,"lng":-118.2436849}},
{"New York City":{"lat":40.7127753,"lng":-74.0059728}},
{"Madrid":{"lat":40.4167754,"lng":-3.7037902}},
{"Sao Paulo":{"lat":-23.5505199,"lng":-46.6333094}},
{"London":{"lat":51.5073509,"lng":-0.1277583}}]'
WHERE id = 23;

UPDATE airport SET airport.destinies = '
[{"Anchorage":{"lat":61.2180556,"lng":-149.9002778}},
{"Los Angeles":{"lat":34.0522342,"lng":-118.2436849}},
{"Madrid":{"lat":40.4167754,"lng":-3.7037902}},
{"New York City":{"lat":40.7127753,"lng":-74.0059728}},
{"London":{"lat":51.5073509,"lng":-0.1277583}}]'
WHERE id = 414;

UPDATE airport SET airport.destinies = '
[{"Berlin":{"lat":52.5200066,"lng":13.404954}},
{"London":{"lat":51.5073509,"lng":-0.1277583}},
{"Istanbul":{"lat":41.0082376,"lng":28.9783589}},
{"Madrid":{"lat":40.4167754,"lng":-3.7037902}},
{"Delhi":{"lat":28.7040592,"lng":77.1024902}}]'
WHERE id = 19;

UPDATE airport SET airport.destinies = '
[{"Sydney":{"lat":-33.8688197,"lng":151.2092955}},
{"Tokyo":{"lat":35.6894875,"lng":139.6917064}},
{"Bangkok":{"lat":13.7563309,"lng":100.5017651}},
{"Beijing":{"lat":39.9041999,"lng":116.4073963}},
{"Lima":{"lat":-12.0463731,"lng":-77.042754}}]'
WHERE id = 6;

UPDATE airport SET airport.destinies = '
[{"Los Angeles":{"lat":34.0522342,"lng":-118.2436849}},
{"New York City":{"lat":40.7127753,"lng":-74.0059728}},
{"Dallas":{"lat":32.7766642,"lng":-96.7969879}},
{"Mexico City":{"lat":19.4326077,"lng":-99.133208}},
{"Madrid":{"lat":40.4167754,"lng":-3.7037902}}]'
WHERE id = 400;

UPDATE airport SET airport.destinies = '
[{"Buenos Aires":{"lat":-34.6036844,"lng":-58.3815591}},
{"Madrid":{"lat":40.4167754,"lng":-3.7037902}},
{"Bogota":{"lat":4.7109886,"lng":-74.072092}},
{"Lagos":{"lat":6.5243793,"lng":3.3792057}},
{"Mexico City":{"lat":19.4326077,"lng":-99.133208}},
{"Cape Town":{"lat":-33.9248685,"lng":18.4240553}}]'
WHERE id = 5;

UPDATE airport SET airport.destinies = '
[{"Syndney":{"lat":-33.8688197,"lng":151.2092955}},
{"Tokyo":{"lat":35.6894875,"lng":139.6917064}},
{"Beijing":{"lat":39.9041999,"lng":116.4073963}},
{"Delhi":{"lat":28.7040592,"lng":77.1024902}},
{"Cairo":{"lat":30.0444196,"lng":31.2357116}}]'
WHERE id = 15;

UPDATE airport SET airport.destinies = '
[{"Perth":{"lat":-31.9505269,"lng":115.8604572}},
{"Jakarta":{"lat":-6.17511,"lng":106.8650395}},
{"Los Angeles":{"lat":34.0522342,"lng":-118.2436849}},
{"Hong Kong":{"lat":22.396428,"lng":114.109497}},
{"Auckland":{"lat":-36.8484597,"lng":174.7633315}}]'
WHERE id = 18;

UPDATE airport SET airport.destinies = '
[{"Beijing":{"lat":39.9041999,"lng":116.4073963}},
{"Hong Kong":{"lat":22.396428,"lng":114.109497}},
{"Los Angeles":{"lat":34.0522342,"lng":-118.2436849}},
{"Moscow":{"lat":55.755826,"lng":37.6172999}},
{"Delhi":{"lat":28.7040592,"lng":77.1024902}}]'
WHERE id = 14;
  `);
};

exports.down = function(db) {
  return db.runSql(`
    UPDATE airport set airport.destinies = NULL WHERE airport.id IN (50,3,7,33,34,21,36,10,20,23,41,19,6,40,5,15,18,14)
  `)
}

exports._meta = {
  "version": 1
}
