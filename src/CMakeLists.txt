add_library(ejson_lib ejson.cpp)

target_include_directories(ejson_lib
        PUBLIC
        $<INSTALL_INTERFACE:include>
        $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/include>
        PRIVATE
        ${CMAKE_SOURCE_DIR}/src)
