#!/bin/bash

function unit_test() {

    echo "Performing Unit testing"
    .build/bin/calculator_tests
}

function code_coverage() {
    echo "Performing code coverage"

    cd build/CMakeFiles/calculator_tests.dir/

    lcov --directory . --capture -o coverage.info
    lcov -r coverage.info */build/* */tests/* */c++/* -o coverageFiltered.info
    lcov --list coverageFiltered.info
}

unit_test
code_coverage
