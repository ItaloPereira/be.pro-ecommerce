UPDATE `aircraft_event` SET `data` = JSON_REMOVE(`data`, '$.date');
