UPDATE `aircraft_airport` SET `range_circle` = REPLACE(`range_circle`, '"x"', '"lat"');
UPDATE `aircraft_airport` SET `range_circle` = REPLACE(`range_circle`, '"y"', '"lng"');