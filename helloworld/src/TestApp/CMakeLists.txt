#///////////////////////////////////////////////////////////////////////
#// CMakeList file for Hello World test app
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
project(ProjTestApp)

set(msg "----CMake creating TestApp project ----")
Message(${msg})

# -----------------------------------------------------------------
# Source Files
# -----------------------------------------------------------------
set(SRC 
${CMAKE_CURRENT_SOURCE_DIR}/main.cpp
)

# -----------------------------------------------------------------
# Header files
# -----------------------------------------------------------------


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
${TESTAPP_INCLUDE_PATHS}
)

# -----------------------------------------------------------------
# Below are parameters to build the binary
# -----------------------------------------------------------------
add_executable(TestApp ${SRC} ${HEADERS})

target_link_libraries(TestApp HelloWorld)

#if(DEFINED TESTBAR_POST_BUILD)
	#add_custom_command
#endif()

add_definitions("${DEFAULT_DEFINITIONS} ${TESTAPP_DEFINITIONS}")

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${DEFAULT_CXX_FLAGS} ${TESTAPP_CXX_FLAGS}")
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} ${DEFAULT_CXX_FLAGS_DEBUG} ${TESTAPP_CXX_FLAGS_DEBUG}")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} ${DEFAULT_CXX_FLAGS_RELEASE} ${TESTAPP_CXX_FLAGS_RELEASE}")
