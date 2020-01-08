add_executable(tests test_truth.cpp)
target_link_libraries(tests PUBLIC ejson_lib PRIVATE CONAN_PKG::GTest)

include(GoogleTest)
gtest_discover_tests(tests)
