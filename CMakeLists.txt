cmake_minimum_required(VERSION 3.0.0)
project(color_game VERSION 0.1.0)

include(CTest)
enable_testing()

add_library(color_game color_game.cpp)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
