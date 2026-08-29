cmake_minimum_required(VERSION 3.13)
project(test_liblzf LANGUAGES CXX)

find_package(liblzf CONFIG REQUIRED)

add_executable(test_liblzf test.cpp)
target_link_libraries(test_liblzf PRIVATE liblzf::liblzf)
