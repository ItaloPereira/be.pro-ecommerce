UPDATE `aircraft_airport` SET `range_circle` = REPLACE(`range_circle`, '"lng"', '"y"');
UPDATE `aircraft_airport` SET `range_circle` = REPLACE(`range_circle`, '"lat"', '"x"');