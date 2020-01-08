set(CONAN_CMAKE_RELEASE "https://github.com/conan-io/cmake-conan/raw/v0.14/conan.cmake")
mark_as_advanced(CONAN_CMAKE_RELEASE)

if (NOT EXISTS "${CMAKE_BINARY_DIR}/conan.cmake")
    message(STATUS "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
    file(DOWNLOAD "${CONAN_CMAKE_RELEASE}" "${CMAKE_BINARY_DIR}/conan.cmake")
endif ()

include(${CMAKE_BINARY_DIR}/conan.cmake)

conan_cmake_run(CONANFILE conanfile.txt
        BASIC_SETUP CMAKE_TARGETS
        BUILD missing)

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
