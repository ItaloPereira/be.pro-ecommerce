#!/bin/bash

ssh -i ../provision/keys/qa embraer@flag-embraer.qa.nodo.cc 'mysqldump -uembraer -pZTBlYmJkNGU5N2U3Y2Y0Mwo embraer --opt > dump.sql'
scp -i ../provision/keys/qa embraer@flag-embraer.qa.nodo.cc:dump.sql .
