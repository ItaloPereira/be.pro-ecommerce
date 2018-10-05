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
  DELETE FROM aircraft_airport WHERE id = 255;
  DELETE FROM aircraft_airport WHERE id = 248;
  `);
};

exports.down = function(db) {
  db.runSql(`
  INSERT INTO aircraft_airport (id,aircraft_id,airport_id,range_circle) VALUES (248, 2, 213, '[{"x": 38.7505, "y": -156.7625}, {"x": 38.795, "y": -154.4109}, {"x": 38.5837, "y": -152.0472}, {"x": 38.1146, "y": -149.7283}, {"x": 37.4, "y": -147.5036}, {"x": 36.4523, "y": -145.4185}, {"x": 35.2883, "y": -143.5109}, {"x": 33.939, "y": -141.7936}, {"x": 32.4189, "y": -140.2926}, {"x": 30.7506, "y": -139.0195}, {"x": 28.9512, "y": -137.9996}, {"x": 27.0471, "y": -137.2434}, {"x": 25.0654, "y": -136.7726}, {"x": 23.042, "y": -136.547}, {"x": 21.0103, "y": -136.6626}, {"x": 19.0026, "y": -136.9877}, {"x": 17.0465, "y": -137.543}, {"x": 15.1609, "y": -138.2933}, {"x": 13.3713, "y": -139.2382}, {"x": 11.6865, "y": -140.3408}, {"x": 10.1231, "y": -141.5915}, {"x": 8.6788, "y": -142.959}, {"x": 7.3824, "y": -144.4526}, {"x": 6.246, "y": -146.0562}, {"x": 5.2627, "y": -147.7424}, {"x": 4.4575, "y": -149.5078}, {"x": 3.8313, "y": -151.3315}, {"x": 3.3886, "y": -153.1959}, {"x": 3.135, "y": -155.0834}, {"x": 3.0731, "y": -156.9751}, {"x": 3.2011, "y": -158.8513}, {"x": 3.5155, "y": -160.6931}, {"x": 4.009, "y": -162.482}, {"x": 4.6762, "y": -164.2001}, {"x": 5.5005, "y": -165.8339}, {"x": 6.4831, "y": -167.3627}, {"x": 7.6157, "y": -168.7667}, {"x": 8.8679, "y": -170.0423}, {"x": 10.2332, "y": -171.1707}, {"x": 11.6899, "y": -172.1449}, {"x": 13.215, "y": -172.9652}, {"x": 14.7818, "y": -173.6489}, {"x": 16.3853, "y": -174.1819}, {"x": 18.0121, "y": -174.5644}, {"x": 19.6508, "y": -174.7915}, {"x": 21.2911, "y": -174.8313}, {"x": 22.9117, "y": -174.6636}, {"x": 24.4858, "y": -174.2737}, {"x": 25.9952, "y": -173.7086}, {"x": 27.4343, "y": -173.0008}, {"x": 28.8126, "y": -172.1896}, {"x": 30.1569, "y": -171.3138}, {"x": 31.4846, "y": -170.3645}, {"x": 32.7772, "y": -169.2864}, {"x": 34.0349, "y": -168.0661}, {"x": 35.2045, "y": -166.6488}, {"x": 36.273, "y": -165.037}, {"x": 37.19, "y": -163.2188}, {"x": 37.9269, "y": -161.2123}, {"x": 38.4554, "y": -159.0466}]')
  `);
  return db.runSql(`
  INSERT INTO aircraft_airport (id,aircraft_id,airport_id,range_circle) VALUES (255, 1, 213, '[{"x": 51.7066, "y": -155.4633}, {"x": 51.5879, "y": -150.5054}, {"x": 50.9452, "y": -145.6492}, {"x": 49.7945, "y": -141.0873}, {"x": 48.1923, "y": -136.9524}, {"x": 46.1959, "y": -133.327}, {"x": 43.8625, "y": -130.2523}, {"x": 41.2649, "y": -127.699}, {"x": 38.453, "y": -125.641}, {"x": 35.4686, "y": -124.0516}, {"x": 32.3457, "y": -122.9344}, {"x": 29.1277, "y": -122.277}, {"x": 25.8617, "y": -122.0382}, {"x": 22.5986, "y": -122.3006}, {"x": 19.3879, "y": -122.9177}, {"x": 16.256, "y": -123.8169}, {"x": 13.2204, "y": -124.9576}, {"x": 10.3061, "y": -126.3411}, {"x": 7.5244, "y": -127.9345}, {"x": 4.8637, "y": -129.6863}, {"x": 2.354, "y": -131.6269}, {"x": -0.0002, "y": -133.7402}, {"x": -2.1378, "y": -136.0661}, {"x": -4.0607, "y": -138.5683}, {"x": -5.715, "y": -141.2553}, {"x": -7.0917, "y": -144.0939}, {"x": -8.15, "y": -147.065}, {"x": -8.9158, "y": -150.1193}, {"x": -9.3971, "y": -153.2242}, {"x": -9.59, "y": -156.3524}, {"x": -8.7149, "y": -159.4365}, {"x": -8.305, "y": -162.4437}, {"x": -7.5998, "y": -165.3793}, {"x": -6.6138, "y": -168.2138}, {"x": -5.3735, "y": -170.9261}, {"x": -3.8935, "y": -173.4958}, {"x": -2.179, "y": -175.8973}, {"x": -0.2477, "y": -178.1106}, {"x": 1.9004, "y": 179.9034}, {"x": 4.2532, "y": 178.186}, {"x": 6.7442, "y": 176.7149}, {"x": 9.333, "y": 175.4766}, {"x": 12.0011, "y": 174.4862}, {"x": 14.7167, "y": 173.729}, {"x": 17.4721, "y": 173.2631}, {"x": 20.2436, "y": 173.1764}, {"x": 22.9786, "y": 173.551}, {"x": 25.598, "y": 174.4776}, {"x": 28.031, "y": 175.781}, {"x": 30.3321, "y": 177.0316}, {"x": 32.6261, "y": 178.0654}, {"x": 35.01, "y": 178.9396}, {"x": 37.469, "y": 179.9114}, {"x": 39.9145, "y": -178.771}, {"x": 42.2794, "y": -177.0029}, {"x": 44.4906, "y": -174.7132}, {"x": 46.4894, "y": -171.8781}, {"x": 48.1916, "y": -168.481}, {"x": 49.5302, "y": -164.5634}, {"x": 50.4357, "y": -160.2119}]')
  `);
};

exports._meta = {
  "version": 1
};
