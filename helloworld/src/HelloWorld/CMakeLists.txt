#///////////////////////////////////////////////////////////////////////
#// CMakeList file for Hello World lib
#//
#///////////////////////////////////////////////////////////////////////

# -----------------------------------------------------------------
# This file is intended to be used with the CMakeLists.txt 
# file located at the root of the repository checkout.
# -----------------------------------------------------------------


# -----------------------------------------------------------------
# For Linux, the project name needs to be different from the source
# directory and the output. 
# -----------------------------------------------------------------
project(ProjHelloWorld)

set(msg "----CMake creating HelloWorld project ---")
Message(${msg})

# -----------------------------------------------------------------
# Source Files
# -----------------------------------------------------------------
set(SRC 
${CMAKE_CURRENT_SOURCE_DIR}/HelloWorld.cpp
)

# -----------------------------------------------------------------
# Header files
# -----------------------------------------------------------------
set(HEADERS 
${CMAKE_CURRENT_SOURCE_DIR}/HelloWorld.h
${CMAKE_CURRENT_SOURCE_DIR}/HelloWorldExports.h
)


# -----------------------------------------------------------------
# grouping of files for project organization
# -----------------------------------------------------------------
#file(GLOB test_group_files
#${CMAKE_CURRENT_SOURCE_DIR}/SubDir/*.h
#)

# this creates filters in the visual studio
#source_group(GroupName FILES ${test_group_files})

# -----------------------------------------------------------------
# Includes
# -----------------------------------------------------------------
include_directories(${INCLUDE_PATHS} 
${HELLOWORLD_INCLUDE_PATHS}
)

# -----------------------------------------------------------------
# Below are parameters to build the binary
# -----------------------------------------------------------------
add_library(HelloWorld SHARED ${SRC} ${HEADERS})

target_link_libraries(HelloWorld ${TLSCLIENT_LINK_LIBRARIES})

#if(DEFINED TESTBAR_POST_BUILD)
	#add_custom_command
#endif()

add_definitions("${DEFAULT_DEFINITIONS} ${HELLOWORLD_DEFINITIONS}")

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${DEFAULT_CXX_FLAGS} ${HELLOWORLD_CXX_FLAGS}")
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} ${DEFAULT_CXX_FLAGS_DEBUG} ${HELLOWORLD_CXX_FLAGS_DEBUG}")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} ${DEFAULT_CXX_FLAGS_RELEASE} ${HELLOWORLD_CXX_FLAGS_RELEASE}")
