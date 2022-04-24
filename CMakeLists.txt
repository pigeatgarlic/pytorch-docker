cmake_minimum_required(VERSION 3.0 FATAL_ERROR)
project(pytorch)

find_package(Torch REQUIRED)

add_executable(pytorch main.cpp)
target_link_libraries(pytorch "${TORCH_LIBRARIES}")
set_property(TARGET pytorch PROPERTY CXX_STANDARD 14)