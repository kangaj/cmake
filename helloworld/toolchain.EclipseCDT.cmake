#//////////////////////////////////////////////////////////
#// This file contains parameters specific for Linux and
#// EclipseCDT
#//////////////////////////////////////////////////////////


#---------------------------------------------------------
# External lib declarations
# 
# if we define the libs here, it'll be available by
# any of the other CMakeLists.txt
#
# TODO: this may be more tedious with multiple platforms,
# need to see if there is a better way to do this
#---------------------------------------------------------

#---------------------------------------------------------
# Static Libs
#---------------------------------------------------------
#add_library(mylib STATIC IMPORTED)


#---------------------------------------------------------
# Shared Libs
#---------------------------------------------------------
#add_library(mylib SHARED IMPORTED)

#---------------------------------------------------------
# Library paths
#---------------------------------------------------------
#set_property(TARGET mylib PROPERTY IMPORTED_LOCATION_DEBUG ${OPENSSL_LIB}/mylibD.lib)
#set_property(TARGET mylib PROPERTY IMPORTED_LOCATION_RELEASE ${OPENSSL_LIB}/mylib.lib)
#set_property(TARGET mylib PROPERTY IMPORTED_IMPLIB_DEBUG ${OPENSSL_LIB}/mylibD.lib)
#set_property(TARGET mylib PROPERTY IMPORTED_IMPLIB_RELEASE ${OPENSSL_LIB}/mylib.lib)

#---------------------------------------------------------
# Default include paths

# These paths are added to the projects settings / makefile to indicate the
# location of referenced header files. All paths use the CMAKE_SOURCE_DIR
#---------------------------------------------------------
set(INCLUDE_PATHS
"${CMAKE_SOURCE_DIR}/src"
)
message(cmakesourcedir)
message(${CMAKE_SOURCE_DIR})
#---------------------------------------------------------
# Default project variable declarations
#---------------------------------------------------------
set(DEFAULT_DEFINITIONS "-D_LINUX")
set(DEFAULT_C_FLAGS "-fPIC")
set(DEFAULT_CXX_FLAGS "-Wall -Wno-unused-but-set-variable -fmessage-length=0 -fPIC -m32")
set(DEFAULT_CXX_FLAGS_DEBUG "-D_DEBUG -O0 -g3")
set(DEFAULT_CXX_FLAGS_DEBUG_STATIC ${DEFAULT_CXX_FLAGS_DEBUG})
set(DEFAULT_CXX_FLAGS_RELEASE "-O3")
set(DEFAULT_CXX_FLAGS_RELEASE_STATIC ${DEFAULT_CXX_FLAGS_RELEASE})

#---------------------------------------------------------
# Project specific definitions
#---------------------------------------------------------
set(HELLOWORLD_INCLUDE_PATHS "")
set(HELLOWORLD_DEFINITIONS "-D_CONSOLE")
set(HELLOWORLD_LINK_LIBRARIES)
set(HELLOWORLD_POST_BUILD)

set(TESTAPP_INCLUDE_PATHS "")
set(TESTAPP_DEFINITIONS "-D_CONSOLE")
set(TESTAPP_LINK_LIBRARIES)
set(TESTAPP_POST_BUILD)

