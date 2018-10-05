UPDATE `aircraft` SET `data` = JSON_REMOVE(`data`, '$.photo');
UPDATE `aircraft` SET `data` = JSON_REMOVE(`data`, '$.file');