cmake_minimum_required(VERSION 3.17.0)
project(quickie_algos VERSION 0.1.0)

INCLUDE(InvokeConan.cmake)
include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup(TARGETS)

set(CMAKE_VERBOSE_MAKEFILE ON)

set(CMAKE_CXX_STANDARD 20) 
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

include_directories(PRIVATE .)

#find_package(benchmark REQUIRED)

add_executable(bench benchmark.cpp)
target_link_libraries(bench CONAN_PKG::benchmark)

### ### ### ### ### ### ### TESTS
include(CTest)
enable_testing()

find_package(GTest REQUIRED) # optional


add_executable(test_graph test/test_graph.cpp)
target_link_libraries(test_graph CONAN_PKG::gtest) # GTest::gmock_main
add_test(graph bin/test_graph)

add_executable(test_topo_s.exe test/test_topo_sort.cpp)
add_test(topo_sort bin/test_topo_s.exe)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
