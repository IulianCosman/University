cmake_minimum_required(VERSION 3.24)
project(Set)

set(CMAKE_CXX_STANDARD 14)

include_directories(Set)

add_executable(Set
        Set/App.cpp
        Set/ExtendedTest.cpp
        Set/ExtendedTest.h
        Set/Set.cpp
        Set/Set.h
        Set/SetIterator.cpp
        Set/SetIterator.h
        Set/ShortTest.cpp
        Set/ShortTest.h)
