#///////////////////////////////////////////////////////////////////////
#// CMakeList file for project
#//
#///////////////////////////////////////////////////////////////////////

# CMakeLists files in this project can refer to the root source directory 
# of the project as ${CMAKE_SOURCE_DIR} and to the root binary directory 
# of the project as ${CMAKE_BINARY_DIR}.
cmake_minimum_required (VERSION 2.8.11)

set(msg "----CMake creating project ----")
Message(${msg})

set(CMAKE_CONFIGURATION_TYPES Debug Release CACHE TYPE INTERNAL FORCE )

set_property(GLOBAL PROPERTY DEBUG_CONFIGURATIONS Debug)

project(HelloWorldApp)

# By setting these variables, all project output will be placed in common
# folders based on output type.
SET(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
SET(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
SET(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

# add the D suffix to debug
set(CMAKE_DEBUG_POSTFIX "D")

#---------------------------------------------------------
# Project directories to include
#---------------------------------------------------------

if(DEFINED INCLUDE_PATH)
INCLUDE(${INCLUDE_PATH})
endif()

add_subdirectory(src/HelloWorld)

add_subdirectory(src/TestApp)