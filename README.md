#C-CPP App

## DEPENDENCIES

* The main requirements are:
    * Ubuntu 16.04
    * `cmake 3.5.1`
        * `g++ 5.4.0` (needed by CMake to compile `CXX` files)
    * `googletest 1.8.1`
        * `git` (for downloading `googletest` within CMake)
        * `libpthread-stubs0-dev 0.3-4` (for linking `pthread`)
    * `lcov 1.12` (for generating code coverage)

## SETUP

* Setup the Local Test Environment
    * Using your own Ubuntu system
        * Install `gcc`, `cmake`, `git`, and `pthread`
            ```
            $ sudo apt-get update
            $ sudo apt-get install g++=4:5.3.1-1ubuntu1
            $ sudo apt-get install lcov=1.12-2
            $ sudo apt-get install cmake=3.5.1-1ubuntu3
            $ sudo apt-get install git
            $ sudo apt-get install libpthread-stubs0-dev=0.3-4

            ```
        * Build the application and the tests
            ```
            $ cd build
            $ cmake ..
            $ make -j8

            ```
    * Using **Docker**
        * Create a Docker image from the [Dockerfile](./Dockerfile)
            ```
            docker build --tag sample-ci-cpp .
            docker run -it sample-ci-cpp:latest /bin/bash

            ```
## USAGE

* Run the Tests on Local
    * Run the tests
        ```
        $ cd build
        $ ./bin/calculator_tests
        [==========] Running 3 tests from 2 test cases.
        [----------] Global test environment set-up.
        [----------] 1 test from AddTest
        [ RUN      ] AddTest.ValidNumbers
        [       OK ] AddTest.ValidNumbers (0 ms)
        [----------] 1 test from AddTest (0 ms total)

        [----------] 2 tests from DivTest
        [ RUN      ] DivTest.ValidNumbers
        [       OK ] DivTest.ValidNumbers (0 ms)
        [ RUN      ] DivTest.InvalidNumbers
        [       OK ] DivTest.InvalidNumbers (0 ms)
        [----------] 2 tests from DivTest (0 ms total)

        [----------] Global test environment tear-down
        [==========] 3 tests from 2 test cases ran. (1 ms total)
        [  PASSED  ] 3 tests.

        ```
    * Check code coverage
        ```
        $ cd build
        $ cd CMakeFiles/calculator_tests.dir/
        $ lcov --directory . --capture -o coverage.info
        $ lcov -r coverage.info */build/* */tests/* */c++/* -o coverageFiltered.info
        $ lcov --list coverageFiltered.info

        ```
## ISSUES

* The tests and the code coverage does not seem to be using latest src and tests
    * Delete the *build* directory then re-create it
        ```
        $ rm -Rf build
        $ mkdir build
        $ touch .gitkeep

        ```
## DOCUMENTATION

* On Setting-Up CMake
    * [Introduction to CMake by Examples](http://derekmolloy.ie/hello-world-introductions-to-cmake/)
* On Setting-Up GoogleTest
    * [GoogleTest Primer](https://github.com/google/googletest/blob/master/googletest/docs/primer.md)
    * [How to start working with GTest and CMake](https://stackoverflow.com/q/8507723/2745495)
* On Setting-Up lcov
    * [Build a C ++ Practical Unit Test Environment with GoogleTest + CMake](https://qiita.com/imasaaki/items/0021d1ef14660184f396)
