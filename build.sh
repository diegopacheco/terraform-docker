#!/bin/bash

gcc src/money.h src/money.c tests/check_money.c -lcheck -lsubunit -lm -lrt -lpthread -o check_unit_tests
chmod +x check_unit_tests
./check_unit_tests
rm -rf check_unit_tests
