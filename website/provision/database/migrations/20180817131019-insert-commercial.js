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
    INSERT \`region\` (id,name,languages,code,social,search_filters,color,created,updated,is_default,business_unit,portal_name,bynder,portal_shortname) VALUES (200,"global",'[{"code": "en", "description": {"_text": {"en": "english", "pt": "inglês"}}}]',"global",'{"twitter": "embraer", "youtube": "embraer", "facebook": "embraer", "instagram": "4116605238.b7df0f6.38bbdb66f53244c7b36a0bd9467fa4f9"}','["news", "blog", "press"]',NULL,NOW(),NOW(),1,"commercial","commercial",'{"tags": ["Landing/Take off", "paris air show", "issueCN", "Phenom 100", "KCSweden", "Phenom 300", "FIA18"], "collections": [{"name": "Facilities", "collectionId": "12AFE555-E9FC-435C-B6E321E0A332B785"}, {"name": "Dubai Airshow", "collectionId": "FAE7AF4F-CF62-4DB3-9BBAECA8D737E367"}, {"name": "Singapore Air Show", "collectionId": "2A582141-9D3C-41C3-A3DD2B8EA814EF7E"}, {"name": "Paris Airshow", "collectionId": "D8A71D2C-B85E-478D-AC7AEE86297AC4CF"}, {"name": "Commercial Customers", "collectionId": "11EF8582-E3A8-4DB3-B06DF5BC2C1AF4F8"}, {"name": "Innovation", "collectionId": "1597C447-01E4-4255-B86887F6D0F7EB26"}, {"name": "Services & Support", "collectionId": "F69F7FD4-1A77-4B97-9E125EC66929B400"}, {"name": "E 175", "collectionId": "2385CF22-F26E-44AE-950C2BE56B5D8C03"}, {"name": "E 190 E2", "collectionId": "7BEB97BF-E5C5-424F-B93BF33A076DE112"}, {"name": "Agricultural Aviation", "collectionId": "A33661C1-468F-4A98-88CB7954173BFE60"}, {"name": "Historical", "collectionId": "20A04FA2-F4EB-478D-A60E6BCED6BF6228"}, {"name": "E 195 E2", "collectionId": "29869113-82C1-4DCF-94483566EA2BBA60"}, {"name": "Lineage 1000E", "collectionId": "FE2C0AAE-1C20-4D93-B3811EF9EFB4342D"}, {"name": "Legacy 650", "collectionId": "6FFE2863-5266-4214-84CF07A9FB3A36D9"}, {"name": "Legacy 500", "collectionId": "5B1F5346-CC09-4F02-BE443F876E995A46"}, {"name": "E 190", "collectionId": "7D4C3B62-F8AE-4495-A3DAF386C1985F68"}, {"name": "Phenom 300", "collectionId": "51F0EDFB-62D8-43B5-B8606F5871B2E3B7"}, {"name": "Phenom 100E", "collectionId": "B7E742FC-4BFA-4492-98FFCDE42B4FEF07"}, {"name": "E 170", "collectionId": "8DFF09C7-F884-4982-A5D8864563EEAF8F"}, {"name": "KC 390", "collectionId": "4F96B353-4DA8-4270-A73A745753ECD4EF"}, {"name": "Super Tucano", "collectionId": "0313B0B4-034A-4BD9-A109E92920631506"}, {"name": "Legacy 450", "collectionId": "CAB154D1-7A86-4CE2-A49A9D38BA8AE25E"}, {"name": "E 195", "collectionId": "0FF6D84B-3EF4-439E-ACFFF5135E341AD0"}, {"name": "Lineage 1000 E", "collectionId": "FE2C0AAE-1C20-4D93-B3811EF9EFB4342D"}, {"name": "FIA18", "collectionId": "0ACC33AD-E5E4-401F-8CD728E1FCA51931"}]}',"commercial aviation")
  `);
  db.runSql(`
    INSERT \`page\` SELECT 20012 as id,	'{"text": {"_text": {"en": "Welcome to Embraer"}}}' as title, '["Embraer", "Aircraft", "Aviation", "Commercial Aviation", "Executive Aviation", "Defense", "Aerospace", "Embraer", "Aeronaves", "Aviação", "Comercial", "Executiva", "Defesa e Segurança"]' as tags, '{"text": {"_text": {"en": "home"}}}' as slug,	200 as region_id,	null as parent_id,	1 as user_id, 	2 as status,	1 as type,	NOW() as created, NOW() as updated,	'{"url": "https://daflwcl3bnxyt.cloudfront.net/m/5b66858f31776f6b/original/video-background-home-embraer.mp4", "type": "video", "thumb": "https://d3cy9zhslanhfa.cloudfront.net/media/592A4778-B008-4791-8B34AA56BBFCA3C5/2A25A7CE-301F-4948-B71E795B00959732/webimage-54F1DCFC-AB7D-4865-9BEE7C7394B757D2.jpg", "title": {"_text": {"en": "Challenge. Create. Outperform."}}, "mobile": {"url": "https://daflwcl3bnxyt.cloudfront.net/m/760b6e9223c82339/original/video-background-home-embraer.mp4", "type": "video", "bynderId": "AF2CFD7C-147E-4D47-A26DC19EB938C711"}, "bynderId": "2A25A7CE-301F-4948-B71E795B00959732", "fallback": {"url": "https://daflwcl3bnxyt.cloudfront.net/m/04c1782b5431f9d0/original/home-embraer-fallback.gif", "type": "", "bynderId": "D90EDDC8-2964-4393-82C2683E25471A3A"}, "parallax": 0, "subtitle": {"_text": {"en": ""}}}' as media, 1 as infiniteScroll,	0 as locked, 'newem0' as floodlight_id,	NULL as review_accepted, null as messages,	'{"text": {"_text": {"en": "Welcome to Embraer"}}}' as description,	NULL as shortSlug, NULL as has_submenu
  `);
  db.runSql(`
    INSERT \`page\` SELECT 20013 as id,	'{"text": {"_text": {"en": "Welcome to Embraer"}}}' as title, '["Embraer", "Aircraft", "Aviation", "Commercial Aviation", "Executive Aviation", "Defense", "Aerospace", "Embraer", "Aeronaves", "Aviação", "Comercial", "Executiva", "Defesa e Segurança"]' as tags, '{"text": {"_text": {"en": "home"}}}' as slug,	200 as region_id,	20012 as parent_id,	1 as user_id, 	0 as status,	1 as type,	NOW() as created, NOW() as updated,	'{"url": "https://daflwcl3bnxyt.cloudfront.net/m/5b66858f31776f6b/original/video-background-home-embraer.mp4", "type": "video", "thumb": "https://d3cy9zhslanhfa.cloudfront.net/media/592A4778-B008-4791-8B34AA56BBFCA3C5/2A25A7CE-301F-4948-B71E795B00959732/webimage-54F1DCFC-AB7D-4865-9BEE7C7394B757D2.jpg", "title": {"_text": {"en": "Challenge. Create. Outperform."}}, "mobile": {"url": "https://daflwcl3bnxyt.cloudfront.net/m/760b6e9223c82339/original/video-background-home-embraer.mp4", "type": "video", "bynderId": "AF2CFD7C-147E-4D47-A26DC19EB938C711"}, "bynderId": "2A25A7CE-301F-4948-B71E795B00959732", "fallback": {"url": "https://daflwcl3bnxyt.cloudfront.net/m/04c1782b5431f9d0/original/home-embraer-fallback.gif", "type": "", "bynderId": "D90EDDC8-2964-4393-82C2683E25471A3A"}, "parallax": 0, "subtitle": {"_text": {"en": ""}}}' as media, 1 as infiniteScroll,	0 as locked, 'newem0' as floodlight_id,	NULL as review_accepted, null as messages,	'{"text": {"_text": {"en": "Welcome to Embraer"}}}' as description,	NULL as shortSlug, NULL as has_submenu
  `);
  return db.runSql(`
    INSERT \`menu\` (id,data,region_id,created,updated)
    VALUES (200,'[{"page": {"type": 2, "status": 2, "review_accepted": null}, "text": {"_text": {"en": "home"}}, "page_id": 20012, "group_id": 1, "hasChildren": false, "isPrincipal": true}, {"text": {"_text": {"en": "compaigns"}}, "items": [], "group_id": 2, "hasChildren": true, "isPrincipal": false}, {"text": {"_text": {"en": "fleet smart"}}, "items": [], "group_id": 3, "hasChildren": true, "isPrincipal": false}, {"text": {"_text": {"en": "aviation trends"}}, "items": [], "group_id": 4, "hasChildren": true, "isPrincipal": false}, {"text": {"_text": {"en": "media"}}, "items": [], "group_id": 5, "hasChildren": true, "isPrincipal": false}, {"text": {"_text": {"en": "hidden"}}, "items": [], "group_id": 0, "hasChildren": true, "isPrincipal": false}]',200,NOW(), NOW())
  `);
};

exports.down = function(db) {
  db.runSql(`DELETE FROM \`page\` WHERE JSON_EXTRACT(\`slug\`, '$.text._text.en') = "home" AND \`region_id\` = 200`);
  db.runSql(`DELETE FROM \`menu\` WHERE \`region_id\` = 200`);
  return db.runSql(`DELETE FROM \`region\` WHERE \`id\`= 200`);
};

exports._meta = {
  "version": 1
};