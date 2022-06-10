cmake_minimum_required(VERSION 3.23 FATAL_ERROR)
project(first-cpp-program CXX)


set(CMAKE_INSTALL_PREFIX ${CMAKE_CURRENT_BINARY_DIR}/dist)


add_executable(first-cpp-program)
target_sources(first-cpp-program
    PRIVATE
        first_cpp.cpp
)


install(TARGETS first-cpp-program DESTINATION bin)