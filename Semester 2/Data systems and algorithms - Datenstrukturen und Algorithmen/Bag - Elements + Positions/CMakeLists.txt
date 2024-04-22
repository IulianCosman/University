cmake_minimum_required(VERSION 3.24)
project(Bag___Elements___Positions)

set(CMAKE_CXX_STANDARD 14)

include_directories(Bag)

add_executable(Bag___Elements___Positions
        Bag/App.cpp
        Bag/Bag.cpp
        Bag/Bag.h
        Bag/BagIterator.cpp
        Bag/BagIterator.h
        Bag/ExtendedTest.cpp
        Bag/ExtendedTest.h
        Bag/ShortTest.cpp
        Bag/ShortTest.h)
