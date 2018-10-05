UPDATE `aircraft_event` SET `data` = JSON_INSERT(`data`, '$.date', CAST('{"_text":{"en":"November XX to YY, ZZZZ", "pt":"XX à YY de Novembro, ZZZZ"}}' AS JSON)) WHERE JSON_EXTRACT(`data`, '$.date') IS NULL;