cmake_minimum_required(VERSION 3.10)

# set the project name and version
project(Workshop LANGUAGES CXX VERSION 1.0)

# specify the C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# configure file
configure_file(headers/version.hpp.in version.hpp)

# add static library
add_library(header STATIC)

# add sources to the library
target_sources(header
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/headers/header.hpp
    
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/source.cpp
)

target_include_directories(header
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR} # for header.hpp
)

# adding test
enable_testing()
add_executable(basic_test test.cpp)
target_include_directories(basic_test
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR} # for header.hpp
)

target_link_libraries(basic_test
    PUBLIC
        header
)
add_test(BasicTest ./basic_test)

# add the executable
add_executable(workshop main.cpp)

target_include_directories(workshop
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR} # for header.hpp
        ${CMAKE_CURRENT_BINARY_DIR} # for version.hpp
)

target_link_libraries(workshop
    PUBLIC
        header
)

# install library
install(TARGETS header DESTINATION bin)
install(FILES headers/header.hpp DESTINATION include/headers)
# install binary
install(TARGETS workshop DESTINATION bin)
install(FILES "${PROJECT_BINARY_DIR}/version.hpp" DESTINATION include)

target_include_directories( workshop
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/MyPrivateHeader.hpp
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/MyPublicHeader.hpp
    INTERFACE
        ${CMAKE_CURRENT_SOURCE_DIR}/MyInterfaceHeader.hpp
)
